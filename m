Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([89.238.76.85]:53557 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1753021AbcJSQoQ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 19 Oct 2016 12:44:16 -0400
From: Wolfram Sang <wsa@the-dreams.de>
To: linux-renesas-soc@vger.kernel.org
Cc: Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [HACK] sh-pfc: hardcode TDSEL to maximum value for 1.8V
Date: Wed, 19 Oct 2016 18:44:06 +0200
Message-Id: <20161019164406.24684-1-wsa@the-dreams.de>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Wolfram Sang <wsa+renesas@sang-engineering.com>

When switching to 1.8V for exposed SD card slots, switch pins from 10pF
to 40pF. Hardcoded for Gen3 Salvator-X boards.

With this patch, my Samsung card can be reliably tuned with SDR104 \o/ Before,
the bus just stalled. SanDisk card still has issues, needs further debugging.
But I think we want this setting in DT.

Not for upstream! Inspired by the fact that a firmware update improved the
situation for Simon (I did not update yet!). Simon, can you test as well?

Not-Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/pinctrl/sh-pfc/pinctrl.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/pinctrl/sh-pfc/pinctrl.c b/drivers/pinctrl/sh-pfc/pinctrl.c
index c5772584594ce3..f69305a3200c42 100644
--- a/drivers/pinctrl/sh-pfc/pinctrl.c
+++ b/drivers/pinctrl/sh-pfc/pinctrl.c
@@ -721,6 +721,12 @@ static int sh_pfc_pinconf_set(struct pinctrl_dev *pctldev, unsigned _pin,
 			else
 				val &= ~BIT(bit);
 			sh_pfc_write_reg(pfc, pocctrl, 32, val);
+
+			if (mV == 3300)
+				sh_pfc_write_reg(pfc, 0xe60603c0, 32, 0);
+			else
+				sh_pfc_write_reg(pfc, 0xe60603c0, 32, 0xc3);
+
 			spin_unlock_irqrestore(&pfc->lock, flags);
 
 			break;
-- 
2.9.3
