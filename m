Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:52596 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751979AbcHHLDi (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Mon, 8 Aug 2016 07:03:38 -0400
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Mark Brown <broonie@kernel.org>, Mark Brown <broonie@kernel.org>,
	linux-renesas-soc@vger.kernel.org,
	Linux-ALSA <alsa-devel@alsa-project.org>,
	Simon <horms@verge.net.au>, Liam Girdwood <lgirdwood@gmail.com>
In-Reply-To: <87d1lj63gm.wl%kuninori.morimoto.gx@renesas.com>
Message-Id: <E1bWiLD-0003O5-S0@debutante>
Date: Mon, 08 Aug 2016 12:03:31 +0100
Subject: Applied "ASoC: codec duplicated callback function goes to component on adau7002" to the asoc tree
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

The patch

   ASoC: codec duplicated callback function goes to component on adau7002

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

>From 7d9477e8e3f2ef6c8ca8103cca6fe9dbef300cd4 Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Mon, 8 Aug 2016 09:07:29 +0000
Subject: [PATCH] ASoC: codec duplicated callback function goes to component on
 adau7002

codec driver and component driver has duplicated callback functions,
and codec side functions are just copied to component side when
register timing. This was quick-hack, but no longer needed.
This patch moves these functions from codec driver to component driver.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/adau7002.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/adau7002.c b/sound/soc/codecs/adau7002.c
index 9df72c6adcca..6384c5491de8 100644
--- a/sound/soc/codecs/adau7002.c
+++ b/sound/soc/codecs/adau7002.c
@@ -39,10 +39,12 @@ static struct snd_soc_dai_driver adau7002_dai = {
 };
 
 static const struct snd_soc_codec_driver adau7002_codec_driver = {
-	.dapm_widgets = adau7002_widgets,
-	.num_dapm_widgets = ARRAY_SIZE(adau7002_widgets),
-	.dapm_routes = adau7002_routes,
-	.num_dapm_routes = ARRAY_SIZE(adau7002_routes),
+	.component_driver = {
+		.dapm_widgets		= adau7002_widgets,
+		.num_dapm_widgets	= ARRAY_SIZE(adau7002_widgets),
+		.dapm_routes		= adau7002_routes,
+		.num_dapm_routes	= ARRAY_SIZE(adau7002_routes),
+	},
 };
 
 static int adau7002_probe(struct platform_device *pdev)
-- 
2.8.1
