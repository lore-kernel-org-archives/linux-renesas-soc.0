Return-Path: <kieranbingham.mailinglists+caf_=kieranbingham=gmail.com@gmail.com>
Return-Path: <linux-kernel-owner@vger.kernel.org>
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Mark Brown <broonie@kernel.org>, Mark Brown <broonie@kernel.org>,
	David Airlie <airlied@linux.ie>,
	Russell King <rmk+kernel@arm.linux.org.uk>,
	Fabio Estevam <fabio.estevam@freescale.com>,
	Daniel Vetter <daniel.vetter@ffwll.ch>,
	Koji Matsuoka <koji.matsuoka.xm@renesas.com>,
	Thierry Reding <treding@nvidia.com>,
	Linux-ALSA <alsa-devel@alsa-project.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, Simon <horms@verge.net.au>
In-Reply-To: <871t3nxq9t.wl%kuninori.morimoto.gx@renesas.com>
Message-Id: <E1bHalg-0007Tm-D3@debutante>
Date: Mon, 27 Jun 2016 18:56:20 +0100
Subject: Applied "ASoC: hdmi-codec: callback function will be called with private data" to the asoc tree
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

The patch

   ASoC: hdmi-codec: callback function will be called with private data

has been applied to the asoc tree at

   git://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git 

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.  

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

>From efc9194bcff84666832c6493bafa92029ac6634c Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Fri, 24 Jun 2016 02:47:55 +0000
Subject: [PATCH] ASoC: hdmi-codec: callback function will be called with
 private data

Current hdmi-codec driver is assuming that it will be registered
from HDMI driver. Because of this assumption, each callback function
has struct device pointer which is parent device (= HDMI).
Then, it can use dev_get_drvdata() to get private data.

OTOH, on some SoC/HDMI case, SoC has VIDEO/SOUND and HDMI IPs.
This case, it needs SoC VIDEO, SoC SOUND and HDMI video, HDMI codec
driver. In DesignWare HDMI IP case, SoC VIDEO (= DRM/KMS) driver tries
to bind DesignWare HDMI video driver, and HDMI codec driver
(= hdmi-codec). This case, above "parent device" of HDMI codec driver
is DRM/KMS driver and its "device" already has private data.

And, from DT and ASoC CPU/Codec/Card binding point of view, HDMI codec
(= hdmi-codec) needs to have "parent device" (= DRM/KMS), otherwise,
it never detect sound card.

Because of these reasons, some driver can't use dev_get_drvdata() to
get private data on hdmi-codec driver. This patch add new void pointer
on hdmi_codec_pdata for private data, and callback function will be
called with it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 include/sound/hdmi-codec.h    | 13 ++++++++-----
 sound/soc/codecs/hdmi-codec.c | 15 ++++++++-------
 2 files changed, 16 insertions(+), 12 deletions(-)

diff --git a/include/sound/hdmi-codec.h b/include/sound/hdmi-codec.h
index fc3a481ad91e..530c57bdefa0 100644
--- a/include/sound/hdmi-codec.h
+++ b/include/sound/hdmi-codec.h
@@ -53,18 +53,19 @@ struct hdmi_codec_params {
 	int channels;
 };
 
+struct hdmi_codec_pdata;
 struct hdmi_codec_ops {
 	/*
 	 * Called when ASoC starts an audio stream setup.
 	 * Optional
 	 */
-	int (*audio_startup)(struct device *dev);
+	int (*audio_startup)(struct device *dev, void *data);
 
 	/*
 	 * Configures HDMI-encoder for audio stream.
 	 * Mandatory
 	 */
-	int (*hw_params)(struct device *dev,
+	int (*hw_params)(struct device *dev, void *data,
 			 struct hdmi_codec_daifmt *fmt,
 			 struct hdmi_codec_params *hparms);
 
@@ -72,19 +73,20 @@ struct hdmi_codec_ops {
 	 * Shuts down the audio stream.
 	 * Mandatory
 	 */
-	void (*audio_shutdown)(struct device *dev);
+	void (*audio_shutdown)(struct device *dev, void *data);
 
 	/*
 	 * Mute/unmute HDMI audio stream.
 	 * Optional
 	 */
-	int (*digital_mute)(struct device *dev, bool enable);
+	int (*digital_mute)(struct device *dev, void *data, bool enable);
 
 	/*
 	 * Provides EDID-Like-Data from connected HDMI device.
 	 * Optional
 	 */
-	int (*get_eld)(struct device *dev, uint8_t *buf, size_t len);
+	int (*get_eld)(struct device *dev, void *data,
+		       uint8_t *buf, size_t len);
 };
 
 /* HDMI codec initalization data */
@@ -93,6 +95,7 @@ struct hdmi_codec_pdata {
 	uint i2s:1;
 	uint spdif:1;
 	int max_i2s_channels;
+	void *data;
 };
 
 #define HDMI_CODEC_DRV_NAME "hdmi-audio-codec"
diff --git a/sound/soc/codecs/hdmi-codec.c b/sound/soc/codecs/hdmi-codec.c
index 8e36e883e453..f27d115626db 100644
--- a/sound/soc/codecs/hdmi-codec.c
+++ b/sound/soc/codecs/hdmi-codec.c
@@ -112,7 +112,7 @@ static int hdmi_codec_startup(struct snd_pcm_substream *substream,
 		return ret;
 
 	if (hcp->hcd.ops->audio_startup) {
-		ret = hcp->hcd.ops->audio_startup(dai->dev->parent);
+		ret = hcp->hcd.ops->audio_startup(dai->dev->parent, hcp->hcd.data);
 		if (ret) {
 			mutex_lock(&hcp->current_stream_lock);
 			hcp->current_stream = NULL;
@@ -122,8 +122,8 @@ static int hdmi_codec_startup(struct snd_pcm_substream *substream,
 	}
 
 	if (hcp->hcd.ops->get_eld) {
-		ret = hcp->hcd.ops->get_eld(dai->dev->parent, hcp->eld,
-					    sizeof(hcp->eld));
+		ret = hcp->hcd.ops->get_eld(dai->dev->parent, hcp->hcd.data,
+					    hcp->eld, sizeof(hcp->eld));
 
 		if (!ret) {
 			ret = snd_pcm_hw_constraint_eld(substream->runtime,
@@ -144,7 +144,7 @@ static void hdmi_codec_shutdown(struct snd_pcm_substream *substream,
 
 	WARN_ON(hcp->current_stream != substream);
 
-	hcp->hcd.ops->audio_shutdown(dai->dev->parent);
+	hcp->hcd.ops->audio_shutdown(dai->dev->parent, hcp->hcd.data);
 
 	mutex_lock(&hcp->current_stream_lock);
 	hcp->current_stream = NULL;
@@ -195,8 +195,8 @@ static int hdmi_codec_hw_params(struct snd_pcm_substream *substream,
 	hp.sample_rate = params_rate(params);
 	hp.channels = params_channels(params);
 
-	return hcp->hcd.ops->hw_params(dai->dev->parent, &hcp->daifmt[dai->id],
-				       &hp);
+	return hcp->hcd.ops->hw_params(dai->dev->parent, hcp->hcd.data,
+				       &hcp->daifmt[dai->id], &hp);
 }
 
 static int hdmi_codec_set_fmt(struct snd_soc_dai *dai,
@@ -280,7 +280,8 @@ static int hdmi_codec_digital_mute(struct snd_soc_dai *dai, int mute)
 	dev_dbg(dai->dev, "%s()\n", __func__);
 
 	if (hcp->hcd.ops->digital_mute)
-		return hcp->hcd.ops->digital_mute(dai->dev->parent, mute);
+		return hcp->hcd.ops->digital_mute(dai->dev->parent,
+						  hcp->hcd.data, mute);
 
 	return 0;
 }
-- 
2.8.1
