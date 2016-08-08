Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:51318 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751979AbcHHLBD (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Mon, 8 Aug 2016 07:01:03 -0400
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Mark Brown <broonie@kernel.org>, Mark Brown <broonie@kernel.org>,
	linux-renesas-soc@vger.kernel.org,
	Linux-ALSA <alsa-devel@alsa-project.org>,
	Simon <horms@verge.net.au>, Liam Girdwood <lgirdwood@gmail.com>
In-Reply-To: <878tw739ko.wl%kuninori.morimoto.gx@renesas.com>
Message-Id: <E1bWiIi-0002dH-Tp@debutante>
Date: Mon, 08 Aug 2016 12:00:56 +0100
Subject: Applied "ASoC: codec duplicated callback function goes to component on rt5677" to the asoc tree
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

The patch

   ASoC: codec duplicated callback function goes to component on rt5677

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

>From 1ec95a5748de5fd448f0b54a3b3c6fcd3b8374c0 Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Mon, 8 Aug 2016 09:23:46 +0000
Subject: [PATCH] ASoC: codec duplicated callback function goes to component on
 rt5677

codec driver and component driver has duplicated callback functions,
and codec side functions are just copied to component side when
register timing. This was quick-hack, but no longer needed.
This patch moves these functions from codec driver to component driver.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/rt5677.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/sound/soc/codecs/rt5677.c b/sound/soc/codecs/rt5677.c
index da9483c1c6fb..68268f2d68ca 100644
--- a/sound/soc/codecs/rt5677.c
+++ b/sound/soc/codecs/rt5677.c
@@ -4974,12 +4974,14 @@ static struct snd_soc_codec_driver soc_codec_dev_rt5677 = {
 	.resume = rt5677_resume,
 	.set_bias_level = rt5677_set_bias_level,
 	.idle_bias_off = true,
-	.controls = rt5677_snd_controls,
-	.num_controls = ARRAY_SIZE(rt5677_snd_controls),
-	.dapm_widgets = rt5677_dapm_widgets,
-	.num_dapm_widgets = ARRAY_SIZE(rt5677_dapm_widgets),
-	.dapm_routes = rt5677_dapm_routes,
-	.num_dapm_routes = ARRAY_SIZE(rt5677_dapm_routes),
+	.component_driver = {
+		.controls		= rt5677_snd_controls,
+		.num_controls		= ARRAY_SIZE(rt5677_snd_controls),
+		.dapm_widgets		= rt5677_dapm_widgets,
+		.num_dapm_widgets	= ARRAY_SIZE(rt5677_dapm_widgets),
+		.dapm_routes		= rt5677_dapm_routes,
+		.num_dapm_routes	= ARRAY_SIZE(rt5677_dapm_routes),
+	},
 };
 
 static const struct regmap_config rt5677_regmap_physical = {
-- 
2.8.1
