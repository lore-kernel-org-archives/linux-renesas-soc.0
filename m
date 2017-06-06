Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:59038 "EHLO
        mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751436AbdFFTGq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 6 Jun 2017 15:06:46 -0400
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Mark Brown <broonie@kernel.org>, Mark Brown <broonie@kernel.org>,
        linux-renesas-soc@vger.kernel.org,
        Linux-ALSA <alsa-devel@alsa-project.org>,
        Simon <horms@verge.net.au>, alsa-devel@alsa-project.org
In-Reply-To: <87inkbdq1u.wl%kuninori.morimoto.gx@renesas.com>
Message-Id: <E1dIJoO-0007MQ-CM@debutante>
Date: Tue, 06 Jun 2017 20:06:40 +0100
Subject: Applied "ASoC: rsnd: remove unused rsnd_ssi_non_ops" to the asoc tree
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

The patch

   ASoC: rsnd: remove unused rsnd_ssi_non_ops

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

>From f07b38e53b71aeb62f865632d31d3f579a77ffc0 Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Tue, 6 Jun 2017 02:34:42 +0000
Subject: [PATCH] ASoC: rsnd: remove unused rsnd_ssi_non_ops

rsnd_ssi_non_ops is never used. Let's remove it

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/sh/rcar/ssi.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/sound/soc/sh/rcar/ssi.c b/sound/soc/sh/rcar/ssi.c
index d0602c189736..eddd8afa0825 100644
--- a/sound/soc/sh/rcar/ssi.c
+++ b/sound/soc/sh/rcar/ssi.c
@@ -792,13 +792,6 @@ int rsnd_ssi_is_dma_mode(struct rsnd_mod *mod)
 
 
 /*
- *		Non SSI
- */
-static struct rsnd_mod_ops rsnd_ssi_non_ops = {
-	.name	= SSI_NAME,
-};
-
-/*
  *		ssi mod function
  */
 static void rsnd_ssi_connect(struct rsnd_mod *mod,
@@ -998,7 +991,6 @@ int rsnd_ssi_probe(struct rsnd_priv *priv)
 			goto rsnd_ssi_probe_done;
 		}
 
-		ops = &rsnd_ssi_non_ops;
 		if (of_property_read_bool(np, "pio-transfer"))
 			ops = &rsnd_ssi_pio_ops;
 		else
-- 
2.11.0
