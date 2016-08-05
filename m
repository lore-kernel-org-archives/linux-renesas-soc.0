Return-Path: <kieranbingham.mailinglists+caf_=kieranbingham=gmail.com@gmail.com>
Return-Path: <linux-kernel-owner@vger.kernel.org>
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Mark Brown <broonie@kernel.org>, Mark Brown <broonie@kernel.org>,
	David Airlie <airlied@linux.ie>,
	Russell King <rmk+kernel@arm.linux.org.uk>,
	Fabio Estevam <fabio.estevam@freescale.com>,
	Linux-ALSA <alsa-devel@alsa-project.org>,
	Daniel Vetter <daniel.vetter@ffwll.ch>,
	Koji Matsuoka <koji.matsuoka.xm@renesas.com>,
	dri-devel@lists.freedesktop.org,
	Liam Girdwood <lgirdwood@gmail.com>,
	linux-renesas-soc@vger.kernel.org, Simon <horms@verge.net.au>,
	Thierry Reding <treding@nvidia.com>,
	linux-kernel@vger.kernel.org
In-Reply-To: <871t27iux9.wl%kuninori.morimoto.gx@renesas.com>
Message-Id: <E1bVdw6-0002gH-MQ@debutante>
Date: Fri, 05 Aug 2016 13:09:10 +0100
Subject: Applied "ASoC: hdmi-codec: enable multi probe for same device" to the asoc tree
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

The patch

   ASoC: hdmi-codec: enable multi probe for same device

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

>From db838d6a8a14d9910d5fc288aadab8c518de0913 Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Wed, 3 Aug 2016 02:08:41 +0000
Subject: [PATCH] ASoC: hdmi-codec: enable multi probe for same device

hdmi-codec driver is common HDMI sound driver,
but it doesn't care about multi sound ports.
For example, hdmi-codec driver is supporting 1 I2S and 1 SPDIF ports,
so, we can't use this driver if HDMI has 2 or more I2S ports.

And we would like to use multi detection.
For example, DesignWare HDMI driver is providing dw_hdmi_bind() to
DRM/KMS driver, and it will setups HDMI video/sound.
Note is that it will be called under for_each loop of ports.

int dw_hdmi_bind(xxx)
{
        /* register hdmi-codec driver here */
}

static int xxx_probe(struct platform_device *pdev)
{
        for_each_xxx(xx) {
                ...
                dw_hdmi_bind(xxx);
                ...
        }
}

This case, dw_hdmi_bind() would like to use hdmi-codec,
and it will be called multiple times for each ports.

Here, ASoC's CPU/Codec/Card bind will checks each "of_node" on DT,
and hdmi-codec driver is assuming its parent device for it.
But it doesn't care about case.
Thus, ASoC never detect correct sound card in this case.

To solve this issue, this patch checks each parent device,
and names "hdmi-hifi.x" in order to each ports.
And uses struct snd_soc_component_driver :: of_xlate_dai_name
for snd_soc_get_dai_name().

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/hdmi-codec.c | 67 +++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 64 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/hdmi-codec.c b/sound/soc/codecs/hdmi-codec.c
index f27d115626db..f64ecaa0141a 100644
--- a/sound/soc/codecs/hdmi-codec.c
+++ b/sound/soc/codecs/hdmi-codec.c
@@ -24,6 +24,15 @@
 
 #include <drm/drm_crtc.h> /* This is only to get MAX_ELD_BYTES */
 
+struct hdmi_device {
+	struct device *dev;
+	struct list_head list;
+	int cnt;
+};
+#define pos_to_hdmi_device(pos)	container_of((pos), struct hdmi_device, list)
+LIST_HEAD(hdmi_device_list);
+
+#define DAI_NAME_SIZE 16
 struct hdmi_codec_priv {
 	struct hdmi_codec_pdata hcd;
 	struct snd_soc_dai_driver *daidrv;
@@ -320,7 +329,6 @@ static const struct snd_soc_dai_ops hdmi_dai_ops = {
 			 SNDRV_PCM_FMTBIT_S32_LE | SNDRV_PCM_FMTBIT_S32_BE)
 
 static struct snd_soc_dai_driver hdmi_i2s_dai = {
-	.name = "i2s-hifi",
 	.id = DAI_ID_I2S,
 	.playback = {
 		.stream_name = "Playback",
@@ -334,7 +342,6 @@ static struct snd_soc_dai_driver hdmi_i2s_dai = {
 };
 
 static const struct snd_soc_dai_driver hdmi_spdif_dai = {
-	.name = "spdif-hifi",
 	.id = DAI_ID_SPDIF,
 	.playback = {
 		.stream_name = "Playback",
@@ -346,6 +353,27 @@ static const struct snd_soc_dai_driver hdmi_spdif_dai = {
 	.ops = &hdmi_dai_ops,
 };
 
+static char hdmi_dai_name[][DAI_NAME_SIZE] = {
+	"hdmi-hifi.0",
+	"hdmi-hifi.1",
+	"hdmi-hifi.2",
+	"hdmi-hifi.3",
+};
+
+static int hdmi_of_xlate_dai_name(struct snd_soc_component *component,
+				  struct of_phandle_args *args,
+				  const char **dai_name)
+{
+	int id = args->args[0];
+
+	if (id < ARRAY_SIZE(hdmi_dai_name)) {
+		*dai_name = hdmi_dai_name[id];
+		return 0;
+	}
+
+	return -EAGAIN;
+}
+
 static struct snd_soc_codec_driver hdmi_codec = {
 	.controls = hdmi_controls,
 	.num_controls = ARRAY_SIZE(hdmi_controls),
@@ -353,6 +381,9 @@ static struct snd_soc_codec_driver hdmi_codec = {
 	.num_dapm_widgets = ARRAY_SIZE(hdmi_widgets),
 	.dapm_routes = hdmi_routes,
 	.num_dapm_routes = ARRAY_SIZE(hdmi_routes),
+	.component_driver = {
+		.of_xlate_dai_name	= hdmi_of_xlate_dai_name,
+	},
 };
 
 static int hdmi_codec_probe(struct platform_device *pdev)
@@ -360,6 +391,8 @@ static int hdmi_codec_probe(struct platform_device *pdev)
 	struct hdmi_codec_pdata *hcd = pdev->dev.platform_data;
 	struct device *dev = &pdev->dev;
 	struct hdmi_codec_priv *hcp;
+	struct hdmi_device *hd;
+	struct list_head *pos;
 	int dai_count, i = 0;
 	int ret;
 
@@ -381,6 +414,31 @@ static int hdmi_codec_probe(struct platform_device *pdev)
 	if (!hcp)
 		return -ENOMEM;
 
+	hd = NULL;
+	list_for_each(pos, &hdmi_device_list) {
+		struct hdmi_device *tmp = pos_to_hdmi_device(pos);
+
+		if (tmp->dev == dev->parent) {
+			hd = tmp;
+			break;
+		}
+	}
+
+	if (!hd) {
+		hd = devm_kzalloc(dev, sizeof(*hd), GFP_KERNEL);
+		if (!hd)
+			return -ENOMEM;
+
+		hd->dev = dev->parent;
+
+		list_add_tail(&hd->list, &hdmi_device_list);
+	}
+
+	if (hd->cnt >= ARRAY_SIZE(hdmi_dai_name)) {
+		dev_err(dev, "too many hdmi codec are deteced\n");
+		return -EINVAL;
+	}
+
 	hcp->hcd = *hcd;
 	mutex_init(&hcp->current_stream_lock);
 
@@ -393,11 +451,14 @@ static int hdmi_codec_probe(struct platform_device *pdev)
 		hcp->daidrv[i] = hdmi_i2s_dai;
 		hcp->daidrv[i].playback.channels_max =
 			hcd->max_i2s_channels;
+		hcp->daidrv[i].name = hdmi_dai_name[hd->cnt++];
 		i++;
 	}
 
-	if (hcd->spdif)
+	if (hcd->spdif) {
 		hcp->daidrv[i] = hdmi_spdif_dai;
+		hcp->daidrv[i].name = hdmi_dai_name[hd->cnt++];
+	}
 
 	ret = snd_soc_register_codec(dev, &hdmi_codec, hcp->daidrv,
 				     dai_count);
-- 
2.8.1
