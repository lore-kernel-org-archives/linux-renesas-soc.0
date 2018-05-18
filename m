Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from michel.telenet-ops.be ([195.130.137.88]:51612 "EHLO
        michel.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751413AbeERKwy (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 18 May 2018 06:52:54 -0400
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: "David S . Miller" <davem@davemloft.net>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2] sh_eth: Change platform check to CONFIG_ARCH_RENESAS
Date: Fri, 18 May 2018 12:52:51 +0200
Message-Id: <1526640771-473-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Since commit 9b5ba0df4ea4f940 ("ARM: shmobile: Introduce ARCH_RENESAS")
is CONFIG_ARCH_RENESAS a more appropriate platform check than the legacy
CONFIG_ARCH_SHMOBILE, hence use the former.

Renesas SuperH SH-Mobile SoCs are still covered by the CONFIG_CPU_SH4
check.

This will allow to drop ARCH_SHMOBILE on ARM and ARM64 in the near
future.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Acked-by: Arnd Bergmann <arnd@arndb.de>
Acked-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
---
v2:
  - Add Acked-by, Reviewed-by.
---
 drivers/net/ethernet/renesas/sh_eth.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/renesas/sh_eth.h b/drivers/net/ethernet/renesas/sh_eth.h
index a5b792ce2ae7d046..1bf930d4a1e52c18 100644
--- a/drivers/net/ethernet/renesas/sh_eth.h
+++ b/drivers/net/ethernet/renesas/sh_eth.h
@@ -163,7 +163,7 @@ enum {
 };
 
 /* Driver's parameters */
-#if defined(CONFIG_CPU_SH4) || defined(CONFIG_ARCH_SHMOBILE)
+#if defined(CONFIG_CPU_SH4) || defined(CONFIG_ARCH_RENESAS)
 #define SH_ETH_RX_ALIGN		32
 #else
 #define SH_ETH_RX_ALIGN		2
-- 
2.7.4
