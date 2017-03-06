Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor1.renesas.com ([210.160.252.171]:31439 "EHLO
        relmlie4.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S932367AbdCFU2i (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 6 Mar 2017 15:28:38 -0500
From: Chris Brandt <chris.brandt@renesas.com>
To: Wolfram Sang <wsa@the-dreams.de>
Cc: linux-i2c@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Simon Horman <horms+renesas@verge.net.au>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Chris Brandt <chris.brandt@renesas.com>
Subject: [PATCH] i2c: riic: fix restart condition
Date: Mon,  6 Mar 2017 15:20:51 -0500
Message-Id: <20170306202051.3158-1-chris.brandt@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

While modifying the driver to use the STOP interrupt, the completion of the
intermediate transfers need to wake the driver back up in order to initiate
the next transfer (restart condition). Otherwise you get never ending
interrupts and only the first transfer sent.

Fixes: 71ccea095ea1 ("i2c: riic: correctly finish transfers")
Reported-by: Simon Horman <horms@verge.net.au>
Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
---
 drivers/i2c/busses/i2c-riic.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-riic.c b/drivers/i2c/busses/i2c-riic.c
index 8f11d34..c811af4 100644
--- a/drivers/i2c/busses/i2c-riic.c
+++ b/drivers/i2c/busses/i2c-riic.c
@@ -218,8 +218,12 @@ static irqreturn_t riic_tend_isr(int irq, void *data)
 	}
 
 	if (riic->is_last || riic->err) {
-		riic_clear_set_bit(riic, 0, ICIER_SPIE, RIIC_ICIER);
+		riic_clear_set_bit(riic, ICIER_TEIE, ICIER_SPIE, RIIC_ICIER);
 		writeb(ICCR2_SP, riic->base + RIIC_ICCR2);
+	} else {
+		/* Transfer is complete, but do not send STOP */
+		riic_clear_set_bit(riic, ICIER_TEIE, 0, RIIC_ICIER);
+		complete(&riic->msg_done);
 	}
 
 	return IRQ_HANDLED;
-- 
2.10.1
