Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:55138 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1161249AbcE3QB7 (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Mon, 30 May 2016 12:01:59 -0400
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Mark Brown <broonie@kernel.org>, Mark Brown <broonie@kernel.org>,
	linux-renesas-soc@vger.kernel.org,
	Linux-ALSA <alsa-devel@alsa-project.org>,
	Simon <horms@verge.net.au>, Liam Girdwood <lgirdwood@gmail.com>
In-Reply-To: <87h9dtrs3s.wl%kuninori.morimoto.gx@renesas.com>
Message-Id: <E1b7PdU-0003yF-Am@debutante>
Date: Mon, 30 May 2016 17:01:48 +0100
Subject: Applied "ASoC: rsrc-card: remove unused dai_num" to the asoc tree
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

The patch

   ASoC: rsrc-card: remove unused dai_num

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

>From 52fd98bcaf22052fc8946d36b13d5e646b7b41b0 Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Fri, 20 May 2016 09:39:55 +0000
Subject: [PATCH] ASoC: rsrc-card: remove unused dai_num

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/sh/rcar/rsrc-card.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/sound/soc/sh/rcar/rsrc-card.c b/sound/soc/sh/rcar/rsrc-card.c
index 1bc7ecfc42a9..b85b5ee5fad4 100644
--- a/sound/soc/sh/rcar/rsrc-card.c
+++ b/sound/soc/sh/rcar/rsrc-card.c
@@ -64,7 +64,6 @@ struct rsrc_card_priv {
 	struct snd_soc_codec_conf codec_conf;
 	struct rsrc_card_dai *dai_props;
 	struct snd_soc_dai_link *dai_link;
-	int dai_num;
 	u32 convert_rate;
 	u32 convert_channels;
 };
@@ -418,7 +417,6 @@ static int rsrc_card_parse_of(struct device_node *node,
 
 	priv->dai_props	= props;
 	priv->dai_link	= links;
-	priv->dai_num	= num;
 
 	/* Init snd_soc_card */
 	priv->snd_card.owner			= THIS_MODULE;
-- 
2.8.1
