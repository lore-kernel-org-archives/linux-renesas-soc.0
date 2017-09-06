Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from smtp6-v.fe.bosch.de ([139.15.237.11]:55541 "EHLO
        smtp6-v.fe.bosch.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751870AbdIFHFO (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 6 Sep 2017 03:05:14 -0400
From: Dirk Behme <dirk.behme@de.bosch.com>
To: <linux-renesas-soc@vger.kernel.org>, <linux-spi@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>
CC: Hiromitsu Yamasaki <hiromitsu.yamasaki.ym@renesas.com>,
        Dirk Behme <dirk.behme@de.bosch.com>
Subject: [PATCH 8/8] spi: sh-msiof: Add registers reset
Date: Wed, 6 Sep 2017 09:05:07 +0200
Message-ID: <20170906070507.26223-9-dirk.behme@de.bosch.com>
In-Reply-To: <20170906070507.26223-1-dirk.behme@de.bosch.com>
References: <20170906070507.26223-1-dirk.behme@de.bosch.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Hiromitsu Yamasaki <hiromitsu.yamasaki.ym@renesas.com>

Reset register before starting transfer.

Signed-off-by: Hiromitsu Yamasaki <hiromitsu.yamasaki.ym@renesas.com>
Signed-off-by: Dirk Behme <dirk.behme@de.bosch.com>
---
 drivers/spi/spi-sh-msiof.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/drivers/spi/spi-sh-msiof.c b/drivers/spi/spi-sh-msiof.c
index fdad8d852602..e8aebd406477 100644
--- a/drivers/spi/spi-sh-msiof.c
+++ b/drivers/spi/spi-sh-msiof.c
@@ -130,6 +130,8 @@ struct sh_msiof_spi_priv {
 #define CTR_TFSE	0x00004000 /* Transmit Frame Sync Signal Output Enable */
 #define CTR_TXE		0x00000200 /* Transmit Enable */
 #define CTR_RXE		0x00000100 /* Receive Enable */
+#define CTR_TXRST	0x00000002 /* Transmit Reset */
+#define CTR_RXRST	0x00000001 /* Receive Reset */
 
 /* FCTR */
 #define FCTR_TFWM_MASK	0xe0000000 /* Transmit FIFO Watermark */
@@ -254,6 +256,25 @@ static irqreturn_t sh_msiof_spi_irq(int irq, void *data)
 	return IRQ_HANDLED;
 }
 
+static void sh_msiof_spi_reset_regs(struct sh_msiof_spi_priv *p)
+{
+	u32 mask = CTR_TXRST | CTR_RXRST;
+	u32 data;
+	int k;
+
+	data = sh_msiof_read(p, CTR);
+	data |= mask;
+
+	sh_msiof_write(p, CTR, data);
+
+	for (k = 100; k > 0; k--) {
+		if (!(sh_msiof_read(p, CTR) & mask))
+			break;
+
+		udelay(10);
+	}
+}
+
 static struct {
 	unsigned short div;
 	unsigned short brdv;
@@ -924,6 +945,9 @@ static int sh_msiof_transfer_one(struct spi_master *master,
 	bool swab;
 	int ret;
 
+	/* reset registers */
+	sh_msiof_spi_reset_regs(p);
+
 	/* setup clocks (clock already enabled in chipselect()) */
 	if (!spi_controller_is_slave(p->master))
 		sh_msiof_spi_set_clk_regs(p, clk_get_rate(p->clk), t->speed_hz);
-- 
2.14.1
