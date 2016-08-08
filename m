Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:53684 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752360AbcHHLFp (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Mon, 8 Aug 2016 07:05:45 -0400
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Mark Brown <broonie@kernel.org>, Mark Brown <broonie@kernel.org>,
	linux-renesas-soc@vger.kernel.org,
	Linux-ALSA <alsa-devel@alsa-project.org>,
	Simon <horms@verge.net.au>, Liam Girdwood <lgirdwood@gmail.com>
In-Reply-To: <8737mf8x8p.wl%kuninori.morimoto.gx@renesas.com>
Message-Id: <E1bWiNG-0003zf-M5@debutante>
Date: Mon, 08 Aug 2016 12:05:38 +0100
Subject: Applied "ASoC: codec duplicated callback function goes to component on tlv320aic31xx" to the asoc tree
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

The patch

   ASoC: codec duplicated callback function goes to component on tlv320aic31xx

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

>From 1bb99f2a00682162b42998d2bafd7633c6c37541 Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Mon, 8 Aug 2016 08:53:34 +0000
Subject: [PATCH] ASoC: codec duplicated callback function goes to component on
 tlv320aic31xx

codec driver and component driver has duplicated callback functions,
and codec side functions are just copied to component side when
register timing. This was quick-hack, but no longer needed.
This patch moves these functions from codec driver to component driver.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/tlv320aic31xx.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/sound/soc/codecs/tlv320aic31xx.c b/sound/soc/codecs/tlv320aic31xx.c
index 3c5e1df01c19..e46fb472e48d 100644
--- a/sound/soc/codecs/tlv320aic31xx.c
+++ b/sound/soc/codecs/tlv320aic31xx.c
@@ -1114,12 +1114,14 @@ static struct snd_soc_codec_driver soc_codec_driver_aic31xx = {
 	.set_bias_level		= aic31xx_set_bias_level,
 	.suspend_bias_off	= true,
 
-	.controls		= aic31xx_snd_controls,
-	.num_controls		= ARRAY_SIZE(aic31xx_snd_controls),
-	.dapm_widgets		= aic31xx_dapm_widgets,
-	.num_dapm_widgets	= ARRAY_SIZE(aic31xx_dapm_widgets),
-	.dapm_routes		= aic31xx_audio_map,
-	.num_dapm_routes	= ARRAY_SIZE(aic31xx_audio_map),
+	.component_driver = {
+		.controls		= aic31xx_snd_controls,
+		.num_controls		= ARRAY_SIZE(aic31xx_snd_controls),
+		.dapm_widgets		= aic31xx_dapm_widgets,
+		.num_dapm_widgets	= ARRAY_SIZE(aic31xx_dapm_widgets),
+		.dapm_routes		= aic31xx_audio_map,
+		.num_dapm_routes	= ARRAY_SIZE(aic31xx_audio_map),
+	},
 };
 
 static const struct snd_soc_dai_ops aic31xx_dai_ops = {
-- 
2.8.1
