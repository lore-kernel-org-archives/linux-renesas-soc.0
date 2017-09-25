Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:45476 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S965275AbdIYQRO (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 25 Sep 2017 12:17:14 -0400
From: Mark Brown <broonie@kernel.org>
To: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc: Mark Brown <broonie@kernel.org>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, linux-spi@vger.kernel.org,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>, linux-spi@vger.kernel.org
Subject: Applied "spi: sh-msiof: Add r8a774[35] to the compatible list" to the spi tree
In-Reply-To: <1506329660-4064-3-git-send-email-fabrizio.castro@bp.renesas.com>
Message-Id: <20170925161636.AB23F440057@finisterre.ee.mobilebroadband>
Date: Mon, 25 Sep 2017 17:16:36 +0100 (BST)
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

The patch

   spi: sh-msiof: Add r8a774[35] to the compatible list

has been applied to the spi tree at

   git://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git 

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

>From 4702f4b23a2fc6196abacf515a959e69176da40e Mon Sep 17 00:00:00 2001
From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Date: Mon, 25 Sep 2017 09:54:20 +0100
Subject: [PATCH] spi: sh-msiof: Add r8a774[35] to the compatible list

Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 Documentation/devicetree/bindings/spi/sh-msiof.txt | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/spi/sh-msiof.txt b/Documentation/devicetree/bindings/spi/sh-msiof.txt
index e865855726a2..bdd83959019c 100644
--- a/Documentation/devicetree/bindings/spi/sh-msiof.txt
+++ b/Documentation/devicetree/bindings/spi/sh-msiof.txt
@@ -1,7 +1,9 @@
 Renesas MSIOF spi controller
 
 Required properties:
-- compatible           : "renesas,msiof-r8a7790" (R-Car H2)
+- compatible           : "renesas,msiof-r8a7743" (RZ/G1M)
+			 "renesas,msiof-r8a7745" (RZ/G1E)
+			 "renesas,msiof-r8a7790" (R-Car H2)
 			 "renesas,msiof-r8a7791" (R-Car M2-W)
 			 "renesas,msiof-r8a7792" (R-Car V2H)
 			 "renesas,msiof-r8a7793" (R-Car M2-N)
@@ -10,7 +12,7 @@ Required properties:
 			 "renesas,msiof-r8a7796" (R-Car M3-W)
 			 "renesas,msiof-sh73a0" (SH-Mobile AG5)
 			 "renesas,sh-mobile-msiof" (generic SH-Mobile compatibile device)
-			 "renesas,rcar-gen2-msiof" (generic R-Car Gen2 compatible device)
+			 "renesas,rcar-gen2-msiof" (generic R-Car Gen2 and RZ/G1 compatible device)
 			 "renesas,rcar-gen3-msiof" (generic R-Car Gen3 compatible device)
 			 "renesas,sh-msiof"      (deprecated)
 
-- 
2.14.1
