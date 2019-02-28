Return-Path: <SRS0=CNOd=RD=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5DDDC10F00
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 28 Feb 2019 11:02:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7406E218AE
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 28 Feb 2019 11:02:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731747AbfB1LCY (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 28 Feb 2019 06:02:24 -0500
Received: from albert.telenet-ops.be ([195.130.137.90]:49884 "EHLO
        albert.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731481AbfB1LCX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 28 Feb 2019 06:02:23 -0500
Received: from ramsan ([84.194.111.163])
        by albert.telenet-ops.be with bizsmtp
        id iB2N1z0073XaVaC06B2NCe; Thu, 28 Feb 2019 12:02:22 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1gzJSI-0007Sr-4R; Thu, 28 Feb 2019 12:02:22 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1gzJSI-0000RS-2r; Thu, 28 Feb 2019 12:02:22 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Mark Brown <broonie@kernel.org>
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-spi@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Hiromitsu Yamasaki <hiromitsu.yamasaki.ym@renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] spi: sh-msiof: Add reset of registers before starting transfer
Date:   Thu, 28 Feb 2019 12:02:15 +0100
Message-Id: <20190228110215.1657-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Hiromitsu Yamasaki <hiromitsu.yamasaki.ym@renesas.com>

In accordance with hardware specification Ver 1.0, reset register
transmission / reception setting before transfer.

Signed-off-by: Hiromitsu Yamasaki <hiromitsu.yamasaki.ym@renesas.com>
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/spi/spi-sh-msiof.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/drivers/spi/spi-sh-msiof.c b/drivers/spi/spi-sh-msiof.c
index b20e70a2bdd115d7..6e83368874839d09 100644
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
@@ -246,6 +248,25 @@ static irqreturn_t sh_msiof_spi_irq(int irq, void *data)
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
+		udelay(1);
+	}
+}
+
 static const u32 sh_msiof_spi_div_array[] = {
 	SCR_BRDV_DIV_1, SCR_BRDV_DIV_2,	 SCR_BRDV_DIV_4,
 	SCR_BRDV_DIV_8,	SCR_BRDV_DIV_16, SCR_BRDV_DIV_32,
@@ -925,6 +946,9 @@ static int sh_msiof_transfer_one(struct spi_controller *ctlr,
 	bool swab;
 	int ret;
 
+	/* reset registers */
+	sh_msiof_spi_reset_regs(p);
+
 	/* setup clocks (clock already enabled in chipselect()) */
 	if (!spi_controller_is_slave(p->ctlr))
 		sh_msiof_spi_set_clk_regs(p, clk_get_rate(p->clk), t->speed_hz);
-- 
2.17.1

