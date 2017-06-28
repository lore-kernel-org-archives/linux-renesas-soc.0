Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:60600 "EHLO
        mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751505AbdF1TtJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 28 Jun 2017 15:49:09 -0400
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Archit Taneja <architt@codeaurora.org>,
        Mark Brown <broonie@kernel.org>,
        Mark Brown <broonie@kernel.org>,
        Archit Taneja <architt@codeaurora.org>,
        Jose Abreu <joabreu@synopsys.com>,
        Linux-ALSA <alsa-devel@alsa-project.org>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        Russell King <rmk+kernel@armlinux.org.uk>,
        Simon <horms@verge.net.au>, alsa-devel@alsa-project.org
In-Reply-To: <877f1fosji.wl%kuninori.morimoto.gx@renesas.com>
Message-Id: <E1dQIxG-0005oq-0a@finisterre>
Date: Wed, 28 Jun 2017 20:48:50 +0100
Subject: Applied "drm: dw-hdmi-i2s: add .get_dai_id callback for ALSA SoC" to the asoc tree
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

The patch

   drm: dw-hdmi-i2s: add .get_dai_id callback for ALSA SoC

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

>From e3839bd6f56a291f00a4c3737eb15ca0344a82a9 Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Mon, 19 Jun 2017 00:39:29 +0000
Subject: [PATCH] drm: dw-hdmi-i2s: add .get_dai_id callback for ALSA SoC

ALSA SoC needs to know connected DAI ID for probing.
It is not a big problem if device/driver was only for sound,
but getting DAI ID will be difficult if device includes both
Video/Sound, like HDMI.
To solve this issue, this patch adds new .get_dai_id callback
on hdmi_codec_ops.
dw-hdmi-i2s will assume that HDMI sound will be connected
to reg = <2>. Then, ALSA SoC side will recognized it as DAI 0

	ports {
		#address-cells = <1>;
		#size-cells = <0>;
		port@0 {
			reg = <0>;
			/* HDMI Video IN */
		};
		port@1 {
			reg = <1>;
			/* HDMI OUT */
		};
		port@2 {
			reg = <2>;
			/* HDMI Sound IN */
		};
	};

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Acked-by: Archit Taneja <architt@codeaurora.org>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 .../bindings/display/bridge/renesas,dw-hdmi.txt     |  9 ++++++++-
 drivers/gpu/drm/bridge/synopsys/dw-hdmi-i2s-audio.c | 21 +++++++++++++++++++++
 2 files changed, 29 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/bridge/renesas,dw-hdmi.txt b/Documentation/devicetree/bindings/display/bridge/renesas,dw-hdmi.txt
index f6b3f36d422b..81b68580e199 100644
--- a/Documentation/devicetree/bindings/display/bridge/renesas,dw-hdmi.txt
+++ b/Documentation/devicetree/bindings/display/bridge/renesas,dw-hdmi.txt
@@ -25,7 +25,8 @@ Required properties:
 - clock-names: Shall contain "iahb" and "isfr" as defined in dw_hdmi.txt.
 - ports: See dw_hdmi.txt. The DWC HDMI shall have one port numbered 0
   corresponding to the video input of the controller and one port numbered 1
-  corresponding to its HDMI output. Each port shall have a single endpoint.
+  corresponding to its HDMI output, and one port numbered 2 corresponding to
+  sound input of the controller. Each port shall have a single endpoint.
 
 Optional properties:
 
@@ -59,6 +60,12 @@ Example:
 					remote-endpoint = <&hdmi0_con>;
 				};
 			};
+			port@2 {
+				reg = <2>;
+				rcar_dw_hdmi0_sound_in: endpoint {
+					remote-endpoint = <&hdmi_sound_out>;
+				};
+			};
 		};
 	};
 
diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-i2s-audio.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-i2s-audio.c
index aaf287d2e91d..b2cf59f54c88 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-i2s-audio.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-i2s-audio.c
@@ -82,9 +82,30 @@ static void dw_hdmi_i2s_audio_shutdown(struct device *dev, void *data)
 	hdmi_write(audio, HDMI_AUD_CONF0_SW_RESET, HDMI_AUD_CONF0);
 }
 
+static int dw_hdmi_i2s_get_dai_id(struct snd_soc_component *component,
+				  struct device_node *endpoint)
+{
+	struct of_endpoint of_ep;
+	int ret;
+
+	ret = of_graph_parse_endpoint(endpoint, &of_ep);
+	if (ret < 0)
+		return ret;
+
+	/*
+	 * HDMI sound should be located as reg = <2>
+	 * Then, it is sound port 0
+	 */
+	if (of_ep.port == 2)
+		return 0;
+
+	return -EINVAL;
+}
+
 static struct hdmi_codec_ops dw_hdmi_i2s_ops = {
 	.hw_params	= dw_hdmi_i2s_hw_params,
 	.audio_shutdown	= dw_hdmi_i2s_audio_shutdown,
+	.get_dai_id	= dw_hdmi_i2s_get_dai_id,
 };
 
 static int snd_dw_hdmi_probe(struct platform_device *pdev)
-- 
2.13.2
