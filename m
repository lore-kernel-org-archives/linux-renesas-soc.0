Return-Path: <SRS0=Wh2G=SE=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0986C4360F
	for <linux-renesas-soc@archiver.kernel.org>; Tue,  2 Apr 2019 14:40:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A04B72133D
	for <linux-renesas-soc@archiver.kernel.org>; Tue,  2 Apr 2019 14:40:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731501AbfDBOk2 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 2 Apr 2019 10:40:28 -0400
Received: from albert.telenet-ops.be ([195.130.137.90]:47732 "EHLO
        albert.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731495AbfDBOk2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 2 Apr 2019 10:40:28 -0400
Received: from ramsan ([84.194.111.163])
        by albert.telenet-ops.be with bizsmtp
        id vSgQ1z00D3XaVaC06SgQdv; Tue, 02 Apr 2019 16:40:25 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1hBKaO-0002lc-Nk; Tue, 02 Apr 2019 16:40:24 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1hBKaO-00079X-M7; Tue, 02 Apr 2019 16:40:24 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Mark Brown <broonie@kernel.org>
Cc:     Simon Horman <horms+renesas@verge.net.au>,
        Wolfram Sang <wsa@the-dreams.de>, linux-spi@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Hiromitsu Yamasaki <hiromitsu.yamasaki.ym@renesas.com>
Subject: [PATCH v2 3/3] spi: sh-msiof: Add reset of registers before starting transfer
Date:   Tue,  2 Apr 2019 16:40:23 +0200
Message-Id: <20190402144023.27422-4-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190402144023.27422-1-geert+renesas@glider.be>
References: <20190402144023.27422-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

In accordance with hardware specification Ver 1.0, reset register
transmission / reception setting before transfer.

Signed-off-by: Hiromitsu Yamasaki <hiromitsu.yamasaki.ym@renesas.com>
[geert: Use readl_poll_timeout_atomic()]
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v2:
  - Use BIT(),
  - Use readl_poll_timeout_atomic().
---
 drivers/spi/spi-sh-msiof.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/spi/spi-sh-msiof.c b/drivers/spi/spi-sh-msiof.c
index 3243ff258896595b..d3794499915c17cb 100644
--- a/drivers/spi/spi-sh-msiof.c
+++ b/drivers/spi/spi-sh-msiof.c
@@ -132,6 +132,8 @@ struct sh_msiof_spi_priv {
 #define CTR_TFSE	BIT(14)   /* Transmit Frame Sync Signal Output Enable */
 #define CTR_TXE		BIT(9)    /* Transmit Enable */
 #define CTR_RXE		BIT(8)    /* Receive Enable */
+#define CTR_TXRST	BIT(1)    /* Transmit Reset */
+#define CTR_RXRST	BIT(0)    /* Receive Reset */
 
 /* FCTR */
 #define FCTR_TFWM_MASK	GENMASK(31, 29) /* Transmit FIFO Watermark */
@@ -241,6 +243,19 @@ static irqreturn_t sh_msiof_spi_irq(int irq, void *data)
 	return IRQ_HANDLED;
 }
 
+static void sh_msiof_spi_reset_regs(struct sh_msiof_spi_priv *p)
+{
+	u32 mask = CTR_TXRST | CTR_RXRST;
+	u32 data;
+
+	data = sh_msiof_read(p, CTR);
+	data |= mask;
+	sh_msiof_write(p, CTR, data);
+
+	readl_poll_timeout_atomic(p->mapbase + CTR, data, !(data & mask), 1,
+				  100);
+}
+
 static const u32 sh_msiof_spi_div_array[] = {
 	SCR_BRDV_DIV_1, SCR_BRDV_DIV_2,	 SCR_BRDV_DIV_4,
 	SCR_BRDV_DIV_8,	SCR_BRDV_DIV_16, SCR_BRDV_DIV_32,
@@ -920,6 +935,9 @@ static int sh_msiof_transfer_one(struct spi_controller *ctlr,
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

