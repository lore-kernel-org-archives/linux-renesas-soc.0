Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:46168 "EHLO
        mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754361AbdHIQ4q (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 9 Aug 2017 12:56:46 -0400
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Mark Brown <broonie@kernel.org>, Mark Brown <broonie@kernel.org>,
        linux-renesas-soc@vger.kernel.org,
        Linux-ALSA <alsa-devel@alsa-project.org>,
        Simon <horms@verge.net.au>, alsa-devel@alsa-project.org
In-Reply-To: <87valxebkk.wl%kuninori.morimoto.gx@renesas.com>
Message-Id: <E1dfUHd-0005Js-Pc@debutante>
Date: Wed, 09 Aug 2017 17:56:37 +0100
Subject: Applied "ASoC: rsnd: avoid duplicate free_irq()" to the asoc tree
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

The patch

   ASoC: rsnd: avoid duplicate free_irq()

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

>From e0936c3471a8411a5df327641fa3ffe12a2fb07b Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Wed, 9 Aug 2017 02:16:20 +0000
Subject: [PATCH] ASoC: rsnd: avoid duplicate free_irq()

commit 1f8754d4daea5f ("ASoC: rsnd: don't call free_irq() on
Parent SSI") fixed Parent SSI duplicate free_irq().
But on Renesas Sound, not only Parent SSI but also Multi SSI
have same issue.
This patch avoid duplicate free_irq() if it was not pure SSI.

Fixes: 1f8754d4daea5f ("ASoC: rsnd: don't call free_irq() on Parent SSI")
Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/sh/rcar/ssi.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/sh/rcar/ssi.c b/sound/soc/sh/rcar/ssi.c
index c5d5c64152e9..90cc9c13c4e0 100644
--- a/sound/soc/sh/rcar/ssi.c
+++ b/sound/soc/sh/rcar/ssi.c
@@ -845,10 +845,10 @@ static int rsnd_ssi_dma_remove(struct rsnd_mod *mod,
 			       struct rsnd_priv *priv)
 {
 	struct rsnd_ssi *ssi = rsnd_mod_to_ssi(mod);
-	struct rsnd_mod *ssi_parent_mod = rsnd_io_to_mod_ssip(io);
+	struct rsnd_mod *pure_ssi_mod = rsnd_io_to_mod_ssi(io);
 
-	/* Do nothing for SSI parent mod */
-	if (ssi_parent_mod == mod)
+	/* Do nothing if non SSI (= SSI parent, multi SSI) mod */
+	if (pure_ssi_mod != mod)
 		return 0;
 
 	/* PIO will request IRQ again */
-- 
2.13.3
