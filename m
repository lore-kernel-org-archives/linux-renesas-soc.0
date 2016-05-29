Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-pf0-f196.google.com ([209.85.192.196]:35633 "EHLO
	mail-pf0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752858AbcE2UZc (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Sun, 29 May 2016 16:25:32 -0400
From: Yoshihiro Kaneko <ykaneko0929@gmail.com>
To: netdev@vger.kernel.org
Cc: "David S. Miller" <davem@davemloft.net>,
	Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
	Simon Horman <horms@verge.net.au>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH net-next] ravb: Add ESF in RCR for enabling separation filter
Date: Mon, 30 May 2016 05:25:00 +0900
Message-Id: <1464553500-19043-1-git-send-email-ykaneko0929@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Masaru Nagai <masaru.nagai.vx@renesas.com>

This patch adds enabling separation filter(ESF) is setting value of B'11.
This setting filter for separating AVB stream frames from non-AVB stream
frames is enabled. Non-matching frames from a stream are processed in
queue 0(best effort). H/W manual recommends B'11 or B'10.
When B'10 is setting, Non-mating frames are discarded.

Signed-off-by: Masaru Nagai <masaru.nagai.vx@renesas.com>
Signed-off-by: Kazuya Mizuguchi <kazuya.mizuguchi.ks@renesas.com>
Signed-off-by: Yoshihiro Kaneko <ykaneko0929@gmail.com>
---

This patch is based on the master branch of David Miller's next networking
tree.

 drivers/net/ethernet/renesas/ravb_main.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/renesas/ravb_main.c b/drivers/net/ethernet/renesas/ravb_main.c
index 867caf6..1ceadbf 100644
--- a/drivers/net/ethernet/renesas/ravb_main.c
+++ b/drivers/net/ethernet/renesas/ravb_main.c
@@ -402,7 +402,8 @@ static int ravb_dmac_init(struct net_device *ndev)
 #endif
 
 	/* Set AVB RX */
-	ravb_write(ndev, RCR_EFFS | RCR_ENCF | RCR_ETS0 | 0x18000000, RCR);
+	ravb_write(ndev,
+		   RCR_EFFS | RCR_ENCF | RCR_ETS0 | RCR_ESF | 0x18000000, RCR);
 
 	/* Set FIFO size */
 	ravb_write(ndev, TGC_TQP_AVBMODE1 | 0x00222200, TGC);
-- 
1.9.1
