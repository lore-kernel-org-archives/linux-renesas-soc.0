Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:56856 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753108AbeDPRPp (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 16 Apr 2018 13:15:45 -0400
From: Mark Brown <broonie@kernel.org>
To: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>
Cc: Mark Brown <broonie@kernel.org>, Mark Brown <broonie@kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-spi@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-spi@vger.kernel.org
Subject: Applied "spi: sh-msiof: Simplify calculation of divisors for transfer rate" to the spi tree
In-Reply-To: <1523623457-9682-3-git-send-email-vladimir_zapolskiy@mentor.com>
Message-Id: <E1f87jB-00034L-OK@debutante>
Date: Mon, 16 Apr 2018 18:15:41 +0100
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

The patch

   spi: sh-msiof: Simplify calculation of divisors for transfer rate

has been applied to the spi tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git 

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

>From d8fb2a06943522b193a649c930020780870f0ee4 Mon Sep 17 00:00:00 2001
From: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>
Date: Fri, 13 Apr 2018 15:44:17 +0300
Subject: [PATCH] spi: sh-msiof: Simplify calculation of divisors for transfer
 rate

The change updates sh_msiof_spi_set_clk_regs() function by iterating
over BRDV power values. Note that the change is a functional one, namely
prescaler output x 1/1 set in BRDV bit field (0b111) for MSO division
rate set to 2 is substituted by BRDV = 0b000 and BRPS = 0b0, in terms
of written values to TSCR setting of 0x0107 is substituted by 0x0000,
and for all input parameter cases this is the only functional change,
which touches the controller.

As a result of the rework the function is supposed to be slightly more
efficient and more readable and maintainable in case of any further
extensions.

Signed-off-by: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 drivers/spi/spi-sh-msiof.c | 67 ++++++++++++++++++++------------------
 1 file changed, 35 insertions(+), 32 deletions(-)

diff --git a/drivers/spi/spi-sh-msiof.c b/drivers/spi/spi-sh-msiof.c
index 8171eedbfc90..5c1ff0097e41 100644
--- a/drivers/spi/spi-sh-msiof.c
+++ b/drivers/spi/spi-sh-msiof.c
@@ -39,7 +39,7 @@ struct sh_msiof_chipdata {
 	u16 tx_fifo_size;
 	u16 rx_fifo_size;
 	u16 master_flags;
-	u16 min_div;
+	u16 min_div_pow;
 };
 
 struct sh_msiof_spi_priv {
@@ -51,7 +51,7 @@ struct sh_msiof_spi_priv {
 	struct completion done;
 	unsigned int tx_fifo_size;
 	unsigned int rx_fifo_size;
-	unsigned int min_div;
+	unsigned int min_div_pow;
 	void *tx_dma_page;
 	void *rx_dma_page;
 	dma_addr_t tx_dma_addr;
@@ -249,43 +249,46 @@ static irqreturn_t sh_msiof_spi_irq(int irq, void *data)
 	return IRQ_HANDLED;
 }
 
-static struct {
-	unsigned short div;
-	unsigned short brdv;
-} const sh_msiof_spi_div_table[] = {
-	{ 1,	SCR_BRDV_DIV_1 },
-	{ 2,	SCR_BRDV_DIV_2 },
-	{ 4,	SCR_BRDV_DIV_4 },
-	{ 8,	SCR_BRDV_DIV_8 },
-	{ 16,	SCR_BRDV_DIV_16 },
-	{ 32,	SCR_BRDV_DIV_32 },
+static const u32 sh_msiof_spi_div_array[] = {
+	SCR_BRDV_DIV_1, SCR_BRDV_DIV_2,	 SCR_BRDV_DIV_4,
+	SCR_BRDV_DIV_8,	SCR_BRDV_DIV_16, SCR_BRDV_DIV_32,
 };
 
 static void sh_msiof_spi_set_clk_regs(struct sh_msiof_spi_priv *p,
 				      unsigned long parent_rate, u32 spi_hz)
 {
-	unsigned long div = 1024;
+	unsigned long div;
 	u32 brps, scr;
-	size_t k;
+	unsigned int div_pow = p->min_div_pow;
 
-	if (!WARN_ON(!spi_hz || !parent_rate))
-		div = DIV_ROUND_UP(parent_rate, spi_hz);
-
-	div = max_t(unsigned long, div, p->min_div);
+	if (!spi_hz || !parent_rate) {
+		WARN(1, "Invalid clock rate parameters %lu and %u\n",
+		     parent_rate, spi_hz);
+		return;
+	}
 
-	for (k = 0; k < ARRAY_SIZE(sh_msiof_spi_div_table); k++) {
-		brps = DIV_ROUND_UP(div, sh_msiof_spi_div_table[k].div);
+	div = DIV_ROUND_UP(parent_rate, spi_hz);
+	if (div <= 1024) {
 		/* SCR_BRDV_DIV_1 is valid only if BRPS is x 1/1 or x 1/2 */
-		if (sh_msiof_spi_div_table[k].div == 1 && brps > 2)
-			continue;
-		if (brps <= 32) /* max of brdv is 32 */
-			break;
-	}
+		if (!div_pow && div <= 32 && div > 2)
+			div_pow = 1;
+
+		if (div_pow)
+			brps = (div + 1) >> div_pow;
+		else
+			brps = div;
 
-	k = min_t(int, k, ARRAY_SIZE(sh_msiof_spi_div_table) - 1);
-	brps = min_t(int, brps, 32);
+		for (; brps > 32; div_pow++)
+			brps = (brps + 1) >> 1;
+	} else {
+		/* Set transfer rate composite divisor to 2^5 * 32 = 1024 */
+		dev_err(&p->pdev->dev,
+			"Requested SPI transfer rate %d is too low\n", spi_hz);
+		div_pow = 5;
+		brps = 32;
+	}
 
-	scr = sh_msiof_spi_div_table[k].brdv | SCR_BRPS(brps);
+	scr = sh_msiof_spi_div_array[div_pow] | SCR_BRPS(brps);
 	sh_msiof_write(p, TSCR, scr);
 	if (!(p->master->flags & SPI_MASTER_MUST_TX))
 		sh_msiof_write(p, RSCR, scr);
@@ -1041,21 +1044,21 @@ static const struct sh_msiof_chipdata sh_data = {
 	.tx_fifo_size = 64,
 	.rx_fifo_size = 64,
 	.master_flags = 0,
-	.min_div = 1,
+	.min_div_pow = 0,
 };
 
 static const struct sh_msiof_chipdata rcar_gen2_data = {
 	.tx_fifo_size = 64,
 	.rx_fifo_size = 64,
 	.master_flags = SPI_MASTER_MUST_TX,
-	.min_div = 1,
+	.min_div_pow = 0,
 };
 
 static const struct sh_msiof_chipdata rcar_gen3_data = {
 	.tx_fifo_size = 64,
 	.rx_fifo_size = 64,
 	.master_flags = SPI_MASTER_MUST_TX,
-	.min_div = 2,
+	.min_div_pow = 1,
 };
 
 static const struct of_device_id sh_msiof_match[] = {
@@ -1319,7 +1322,7 @@ static int sh_msiof_spi_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, p);
 	p->master = master;
 	p->info = info;
-	p->min_div = chipdata->min_div;
+	p->min_div_pow = chipdata->min_div_pow;
 
 	init_completion(&p->done);
 
-- 
2.17.0
