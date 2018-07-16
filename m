Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from bin-mail-out-05.binero.net ([195.74.38.228]:53880 "EHLO
        bin-mail-out-05.binero.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729969AbeGPMrJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 16 Jul 2018 08:47:09 -0400
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        netdev@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 2/3] ravb: fix warning about memcpy length
Date: Mon, 16 Jul 2018 14:19:26 +0200
Message-Id: <20180716121927.21918-3-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20180716121927.21918-1-niklas.soderlund+renesas@ragnatech.se>
References: <20180716121927.21918-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

This fixes sparse warning:

ravb_main.c:1257 ravb_get_strings() error: memcpy() '*ravb_gstrings_stats' too small (32 vs 960)

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 drivers/net/ethernet/renesas/ravb_main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/renesas/ravb_main.c b/drivers/net/ethernet/renesas/ravb_main.c
index e5784f0eac3df57c..a100bccb3234bd5c 100644
--- a/drivers/net/ethernet/renesas/ravb_main.c
+++ b/drivers/net/ethernet/renesas/ravb_main.c
@@ -1258,7 +1258,7 @@ static void ravb_get_strings(struct net_device *ndev, u32 stringset, u8 *data)
 {
 	switch (stringset) {
 	case ETH_SS_STATS:
-		memcpy(data, *ravb_gstrings_stats, sizeof(ravb_gstrings_stats));
+		memcpy(data, ravb_gstrings_stats, sizeof(ravb_gstrings_stats));
 		break;
 	}
 }
-- 
2.17.0
