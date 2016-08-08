Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:53102 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752101AbcHHLEj (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Mon, 8 Aug 2016 07:04:39 -0400
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Mark Brown <broonie@kernel.org>, Mark Brown <broonie@kernel.org>,
	linux-renesas-soc@vger.kernel.org,
	Linux-ALSA <alsa-devel@alsa-project.org>,
	Simon <horms@verge.net.au>, Liam Girdwood <lgirdwood@gmail.com>
In-Reply-To: <877fbr7ic1.wl%kuninori.morimoto.gx@renesas.com>
Message-Id: <E1bWiMD-0003gH-84@debutante>
Date: Mon, 08 Aug 2016 12:04:33 +0100
Subject: Applied "ASoC: codec duplicated callback function goes to component on inno_rk3036" to the asoc tree
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

The patch

   ASoC: codec duplicated callback function goes to component on inno_rk3036

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

>From f410a81d4d5fd4d0e9477c5d7ebd4e6712ed4c42 Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Mon, 8 Aug 2016 09:00:54 +0000
Subject: [PATCH] ASoC: codec duplicated callback function goes to component on
 inno_rk3036

codec driver and component driver has duplicated callback functions,
and codec side functions are just copied to component side when
register timing. This was quick-hack, but no longer needed.
This patch moves these functions from codec driver to component driver.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/inno_rk3036.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/sound/soc/codecs/inno_rk3036.c b/sound/soc/codecs/inno_rk3036.c
index 9b6e8840a1b5..b918ba5c8ce5 100644
--- a/sound/soc/codecs/inno_rk3036.c
+++ b/sound/soc/codecs/inno_rk3036.c
@@ -380,12 +380,14 @@ static struct snd_soc_codec_driver rk3036_codec_driver = {
 	.probe			= rk3036_codec_probe,
 	.remove			= rk3036_codec_remove,
 	.set_bias_level		= rk3036_codec_set_bias_level,
-	.controls		= rk3036_codec_dapm_controls,
-	.num_controls		= ARRAY_SIZE(rk3036_codec_dapm_controls),
-	.dapm_routes		= rk3036_codec_dapm_routes,
-	.num_dapm_routes	= ARRAY_SIZE(rk3036_codec_dapm_routes),
-	.dapm_widgets		= rk3036_codec_dapm_widgets,
-	.num_dapm_widgets	= ARRAY_SIZE(rk3036_codec_dapm_widgets),
+	.component_driver = {
+		.controls		= rk3036_codec_dapm_controls,
+		.num_controls		= ARRAY_SIZE(rk3036_codec_dapm_controls),
+		.dapm_routes		= rk3036_codec_dapm_routes,
+		.num_dapm_routes	= ARRAY_SIZE(rk3036_codec_dapm_routes),
+		.dapm_widgets		= rk3036_codec_dapm_widgets,
+		.num_dapm_widgets	= ARRAY_SIZE(rk3036_codec_dapm_widgets),
+	},
 };
 
 static const struct regmap_config rk3036_codec_regmap_config = {
-- 
2.8.1
