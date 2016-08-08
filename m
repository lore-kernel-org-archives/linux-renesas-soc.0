Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:53078 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752101AbcHHLEg (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Mon, 8 Aug 2016 07:04:36 -0400
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Mark Brown <broonie@kernel.org>, Mark Brown <broonie@kernel.org>,
	linux-renesas-soc@vger.kernel.org,
	Linux-ALSA <alsa-devel@alsa-project.org>,
	Simon <horms@verge.net.au>, Liam Girdwood <lgirdwood@gmail.com>
In-Reply-To: <8760rb7ibj.wl%kuninori.morimoto.gx@renesas.com>
Message-Id: <E1bWiMA-0003fM-AO@debutante>
Date: Mon, 08 Aug 2016 12:04:30 +0100
Subject: Applied "ASoC: codec duplicated callback function goes to component on gtm601" to the asoc tree
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

The patch

   ASoC: codec duplicated callback function goes to component on gtm601

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

>From 054ea6c9e3d240a6679458c6e6e1ecf4031271ea Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Mon, 8 Aug 2016 09:01:11 +0000
Subject: [PATCH] ASoC: codec duplicated callback function goes to component on
 gtm601

codec driver and component driver has duplicated callback functions,
and codec side functions are just copied to component side when
register timing. This was quick-hack, but no longer needed.
This patch moves these functions from codec driver to component driver.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/gtm601.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/gtm601.c b/sound/soc/codecs/gtm601.c
index 0b80052996d3..926b1a4e37d4 100644
--- a/sound/soc/codecs/gtm601.c
+++ b/sound/soc/codecs/gtm601.c
@@ -52,10 +52,12 @@ static struct snd_soc_dai_driver gtm601_dai = {
 };
 
 static const struct snd_soc_codec_driver soc_codec_dev_gtm601 = {
-	.dapm_widgets = gtm601_dapm_widgets,
-	.num_dapm_widgets = ARRAY_SIZE(gtm601_dapm_widgets),
-	.dapm_routes = gtm601_dapm_routes,
-	.num_dapm_routes = ARRAY_SIZE(gtm601_dapm_routes),
+	.component_driver = {
+		.dapm_widgets		= gtm601_dapm_widgets,
+		.num_dapm_widgets	= ARRAY_SIZE(gtm601_dapm_widgets),
+		.dapm_routes		= gtm601_dapm_routes,
+		.num_dapm_routes	= ARRAY_SIZE(gtm601_dapm_routes),
+	},
 };
 
 static int gtm601_platform_probe(struct platform_device *pdev)
-- 
2.8.1
