Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:60560 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750814AbeD1UBI (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 28 Apr 2018 16:01:08 -0400
From: Wolfram Sang <wsa@the-dreams.de>
To: linux-i2c@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@gmail.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH] i2c: rcar: enhance comment to avoid regressions
Date: Sat, 28 Apr 2018 22:01:02 +0200
Message-Id: <20180428200102.16498-1-wsa@the-dreams.de>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Wolfram Sang <wsa+renesas@sang-engineering.com>

Give a clear testcase for people wishing to change this code. It is also
a reminder for me if people ask about it.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/i2c/busses/i2c-rcar.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/i2c/busses/i2c-rcar.c b/drivers/i2c/busses/i2c-rcar.c
index c6915b835396..9d8d5b91220f 100644
--- a/drivers/i2c/busses/i2c-rcar.c
+++ b/drivers/i2c/busses/i2c-rcar.c
@@ -542,6 +542,8 @@ static void rcar_i2c_irq_recv(struct rcar_i2c_priv *priv, u32 msr)
 	 * If next received data is the _LAST_, go to STOP phase. Might be
 	 * overwritten by REP START when setting up a new msg. Not elegant
 	 * but the only stable sequence for REP START I have found so far.
+	 * If you want to change this code, make sure sending one transfer with
+	 * four messages (WR-RD-WR-RD) works!
 	 */
 	if (priv->pos + 1 >= msg->len)
 		rcar_i2c_write(priv, ICMCR, RCAR_BUS_PHASE_STOP);
-- 
2.11.0
