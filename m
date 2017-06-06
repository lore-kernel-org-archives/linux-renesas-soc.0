Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:58992 "EHLO
        mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751590AbdFFTGg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 6 Jun 2017 15:06:36 -0400
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: James Cameron <quozl@laptop.org>, Mark Brown <broonie@kernel.org>,
        Mark Brown <broonie@kernel.org>,
        James Cameron <quozl@laptop.org>,
        linux-renesas-soc@vger.kernel.org,
        Linux-ALSA <alsa-devel@alsa-project.org>,
        Simon <horms@verge.net.au>, alsa-devel@alsa-project.org
In-Reply-To: <87ink9zw3d.wl%kuninori.morimoto.gx@renesas.com>
Message-Id: <E1dIJo7-0007Jn-Dy@debutante>
Date: Tue, 06 Jun 2017 20:06:23 +0100
Subject: Applied "ASoC: simple-scu-card: tidyup "Sampling Rate Conversion"" to the asoc tree
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

The patch

   ASoC: simple-scu-card: tidyup "Sampling Rate Conversion"

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

>From 010f21b2ba0cd546d7489ca536a156b281faa3fb Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Tue, 6 Jun 2017 02:35:43 +0000
Subject: [PATCH] ASoC: simple-scu-card: tidyup "Sampling Rate Conversion"

"Sampling Rate Conversion" is better than "Sampling Rate Convert"

Reported-by: James Cameron <quozl@laptop.org>
Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 Documentation/devicetree/bindings/sound/simple-scu-card.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sound/simple-scu-card.txt b/Documentation/devicetree/bindings/sound/simple-scu-card.txt
index e894cef1d314..327d229a51b2 100644
--- a/Documentation/devicetree/bindings/sound/simple-scu-card.txt
+++ b/Documentation/devicetree/bindings/sound/simple-scu-card.txt
@@ -38,7 +38,7 @@ Optional CPU/CODEC subnodes properties:
 
 - clocks / system-clock-frequency	: see simple-audio-card.txt
 
-Example 1. Sampling Rate Covert
+Example 1. Sampling Rate Conversion
 
 sound {
 	compatible = "simple-scu-audio-card";
-- 
2.11.0
