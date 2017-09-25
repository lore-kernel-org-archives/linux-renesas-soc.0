Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:46132 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S965298AbdIYQRi (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 25 Sep 2017 12:17:38 -0400
From: Mark Brown <broonie@kernel.org>
To: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc: Mark Brown <broonie@kernel.org>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, linux-spi@vger.kernel.org,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>, linux-spi@vger.kernel.org
Subject: Applied "spi: sh-msiof: Add compatible strings for r8a774[35]" to the spi tree
In-Reply-To: <1506329660-4064-2-git-send-email-fabrizio.castro@bp.renesas.com>
Message-Id: <20170925161637.D7471440058@finisterre.ee.mobilebroadband>
Date: Mon, 25 Sep 2017 17:16:37 +0100 (BST)
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

The patch

   spi: sh-msiof: Add compatible strings for r8a774[35]

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

>From bdacfc7b6216dd30d07c10732fd4c0a660c62853 Mon Sep 17 00:00:00 2001
From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Date: Mon, 25 Sep 2017 09:54:19 +0100
Subject: [PATCH] spi: sh-msiof: Add compatible strings for r8a774[35]

Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 drivers/spi/spi-sh-msiof.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/spi/spi-sh-msiof.c b/drivers/spi/spi-sh-msiof.c
index 0eb1e9583485..00808448cf35 100644
--- a/drivers/spi/spi-sh-msiof.c
+++ b/drivers/spi/spi-sh-msiof.c
@@ -1021,6 +1021,8 @@ static const struct sh_msiof_chipdata rcar_gen3_data = {
 
 static const struct of_device_id sh_msiof_match[] = {
 	{ .compatible = "renesas,sh-mobile-msiof", .data = &sh_data },
+	{ .compatible = "renesas,msiof-r8a7743",   .data = &rcar_gen2_data },
+	{ .compatible = "renesas,msiof-r8a7745",   .data = &rcar_gen2_data },
 	{ .compatible = "renesas,msiof-r8a7790",   .data = &rcar_gen2_data },
 	{ .compatible = "renesas,msiof-r8a7791",   .data = &rcar_gen2_data },
 	{ .compatible = "renesas,msiof-r8a7792",   .data = &rcar_gen2_data },
-- 
2.14.1
