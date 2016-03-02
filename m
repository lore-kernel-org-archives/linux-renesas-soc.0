Return-Path: <kieranbingham.mailinglists+caf_=kieranbingham=gmail.com@gmail.com>
Return-Path: <linux-kernel-owner@vger.kernel.org>
From: Wolfram Sang <wsa@the-dreams.de>
To: linux-kernel@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
	Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
	netdev@vger.kernel.org
Subject: [PATCH 2/6] net: ethernet: renesas: ravb_main: test clock rate to avoid division by 0
Date: Wed,  2 Mar 2016 23:33:33 +0100
Message-Id: <1456958018-7849-3-git-send-email-wsa@the-dreams.de>
In-Reply-To: <1456958018-7849-1-git-send-email-wsa@the-dreams.de>
References: <1456958018-7849-1-git-send-email-wsa@the-dreams.de>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Wolfram Sang <wsa+renesas@sang-engineering.com>

The clk API may return 0 on clk_get_rate, so we should check the result before
using it as a divisor.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

Should go individually via subsystem tree.

 drivers/net/ethernet/renesas/ravb_main.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/net/ethernet/renesas/ravb_main.c b/drivers/net/ethernet/renesas/ravb_main.c
index 88656ceb6e2946..ce1954a6a12726 100644
--- a/drivers/net/ethernet/renesas/ravb_main.c
+++ b/drivers/net/ethernet/renesas/ravb_main.c
@@ -1691,6 +1691,9 @@ static int ravb_set_gti(struct net_device *ndev)
 	rate = clk_get_rate(clk);
 	clk_put(clk);
 
+	if (!rate)
+		return -EINVAL;
+
 	inc = 1000000000ULL << 20;
 	do_div(inc, rate);
 
-- 
2.7.0
