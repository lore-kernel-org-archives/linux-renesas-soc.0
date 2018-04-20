Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:42146 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753340AbeDTRBD (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 20 Apr 2018 13:01:03 -0400
From: Mark Brown <broonie@kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Mark Brown <broonie@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        linux-renesas-soc@vger.kernel.org, alsa-devel@alsa-project.org,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        alsa-devel@alsa-project.org
Subject: Applied "ASoC: sh: Drop SUPERH platform dependency" to the asoc tree
In-Reply-To: <1524234134-14297-1-git-send-email-geert+renesas@glider.be>
Message-Id: <E1f9ZOz-0004Hg-U0@debutante>
Date: Fri, 20 Apr 2018 18:00:49 +0100
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

The patch

   ASoC: sh: Drop SUPERH platform dependency

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git 

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

>From 4070d91754039e88f7b64e462f3d0d8cdb4be041 Mon Sep 17 00:00:00 2001
From: Geert Uytterhoeven <geert+renesas@glider.be>
Date: Fri, 20 Apr 2018 16:22:14 +0200
Subject: [PATCH] ASoC: sh: Drop SUPERH platform dependency

The SIU sound peripheral is used only on SuperH SH-Mobile platforms.
As both SUPERH and ARCH_SHMOBILE are set for these platforms, the SUPERH
dependency can be dropped.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/sh/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/sh/Kconfig b/sound/soc/sh/Kconfig
index 1aa5cd77ca24..365f46321147 100644
--- a/sound/soc/sh/Kconfig
+++ b/sound/soc/sh/Kconfig
@@ -28,7 +28,7 @@ config SND_SOC_SH4_FSI
 
 config SND_SOC_SH4_SIU
 	tristate
-	depends on (SUPERH || ARCH_SHMOBILE) && HAVE_CLK
+	depends on ARCH_SHMOBILE && HAVE_CLK
 	select DMA_ENGINE
 	select DMADEVICES
 	select SH_DMAE
-- 
2.17.0
