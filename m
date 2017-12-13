Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from andre.telenet-ops.be ([195.130.132.53]:56040 "EHLO
        andre.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753790AbdLMTFX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 13 Dec 2017 14:05:23 -0500
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc: linux-spi@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 2/4] spi: sh-msiof: Extend support to 3 native chip selects
Date: Wed, 13 Dec 2017 20:05:11 +0100
Message-Id: <1513191913-10612-3-git-send-email-geert+renesas@glider.be>
In-Reply-To: <1513191913-10612-1-git-send-email-geert+renesas@glider.be>
References: <1513191913-10612-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Currently only the MSIOF_SYNC signal can be used as a native chip
select.  Extend support to up to 3 native chipselects using the
MSIOF_SS1 and MSIOF_SS2 signals.

Inspired by a patch in the BSP by Hiromitsu Yamasaki.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 Documentation/devicetree/bindings/spi/sh-msiof.txt |  6 +++++-
 drivers/spi/spi-sh-msiof.c                         | 18 +++++++++++++-----
 2 files changed, 18 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/spi/sh-msiof.txt b/Documentation/devicetree/bindings/spi/sh-msiof.txt
index bdd83959019c7883..bc8c16a6cfc82685 100644
--- a/Documentation/devicetree/bindings/spi/sh-msiof.txt
+++ b/Documentation/devicetree/bindings/spi/sh-msiof.txt
@@ -36,7 +36,11 @@ Required properties:
 
 Optional properties:
 - clocks               : Must contain a reference to the functional clock.
-- num-cs               : Total number of chip-selects (default is 1)
+- num-cs               : Total number of chip selects (default is 1).
+			 Up to 3 native chip selects are supported:
+			   0: MSIOF_SYNC
+			   1: MSIOF_SS1
+			   2: MSIOF_SS2
 - dmas                 : Must contain a list of two references to DMA
 			 specifiers, one for transmission, and one for
 			 reception.
diff --git a/drivers/spi/spi-sh-msiof.c b/drivers/spi/spi-sh-msiof.c
index 2704abb11ea41fd0..9bdc292aa050cb16 100644
--- a/drivers/spi/spi-sh-msiof.c
+++ b/drivers/spi/spi-sh-msiof.c
@@ -60,6 +60,8 @@ struct sh_msiof_spi_priv {
 	bool slave_aborted;
 };
 
+#define MAX_SS	3	/* Maximum number of native chip selects */
+
 #define TMDR1	0x00	/* Transmit Mode Register 1 */
 #define TMDR2	0x04	/* Transmit Mode Register 2 */
 #define TMDR3	0x08	/* Transmit Mode Register 3 */
@@ -93,6 +95,8 @@ struct sh_msiof_spi_priv {
 #define MDR1_XXSTP	 0x00000001 /* Transmission/Reception Stop on FIFO */
 /* TMDR1 */
 #define TMDR1_PCON	 0x40000000 /* Transfer Signal Connection */
+#define TMDR1_SYNCCH_MASK 0xc000000 /* Synchronization Signal Channel Select */
+#define TMDR1_SYNCCH_SHIFT	 26 /* 0=MSIOF_SYNC, 1=MSIOF_SS1, 2=MSIOF_SS2 */
 
 /* TMDR2 and RMDR2 */
 #define MDR2_BITLEN1(i)	(((i) - 1) << 24) /* Data Size (8-32 bits) */
@@ -326,7 +330,7 @@ static u32 sh_msiof_spi_get_dtdl_and_syncdl(struct sh_msiof_spi_priv *p)
 	return val;
 }
 
-static void sh_msiof_spi_set_pin_regs(struct sh_msiof_spi_priv *p,
+static void sh_msiof_spi_set_pin_regs(struct sh_msiof_spi_priv *p, u32 ss,
 				      u32 cpol, u32 cpha,
 				      u32 tx_hi_z, u32 lsb_first, u32 cs_high)
 {
@@ -344,10 +348,13 @@ static void sh_msiof_spi_set_pin_regs(struct sh_msiof_spi_priv *p,
 	tmp |= !cs_high << MDR1_SYNCAC_SHIFT;
 	tmp |= lsb_first << MDR1_BITLSB_SHIFT;
 	tmp |= sh_msiof_spi_get_dtdl_and_syncdl(p);
-	if (spi_controller_is_slave(p->master))
+	if (spi_controller_is_slave(p->master)) {
 		sh_msiof_write(p, TMDR1, tmp | TMDR1_PCON);
-	else
-		sh_msiof_write(p, TMDR1, tmp | MDR1_TRMD | TMDR1_PCON);
+	} else {
+		sh_msiof_write(p, TMDR1,
+			       tmp | MDR1_TRMD | TMDR1_PCON |
+			       (ss < MAX_SS ? ss : 0) << TMDR1_SYNCCH_SHIFT);
+	}
 	if (p->master->flags & SPI_MASTER_MUST_TX) {
 		/* These bits are reserved if RX needs TX */
 		tmp &= ~0x0000ffff;
@@ -575,7 +582,8 @@ static int sh_msiof_prepare_message(struct spi_master *master,
 	const struct spi_device *spi = msg->spi;
 
 	/* Configure pins before asserting CS */
-	sh_msiof_spi_set_pin_regs(p, !!(spi->mode & SPI_CPOL),
+	sh_msiof_spi_set_pin_regs(p, spi->chip_select,
+				  !!(spi->mode & SPI_CPOL),
 				  !!(spi->mode & SPI_CPHA),
 				  !!(spi->mode & SPI_3WIRE),
 				  !!(spi->mode & SPI_LSB_FIRST),
-- 
2.7.4
