Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:36992 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1754229AbdLRAA3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 17 Dec 2017 19:00:29 -0500
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-mmc@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Simon Horman <horms@verge.net.au>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [RFC PATCH] mmc: tmio: use ioread* for repeated access to a register
Date: Mon, 18 Dec 2017 01:00:21 +0100
Message-Id: <20171218000021.16655-1-wsa+renesas@sang-engineering.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Not all archs define reads* and writes*. Switch to ioread*_rep and
friends which is defined everywhere, so we can enable COMPILE_TEST after
that.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

So, I pushed this to buildbot on top of Yamada-san's patch series and there
were no complaints, even with COMPILE_TEST enabled. I also did some tests on
HW and checksuming huge files on SD cards still works.

However, I am not sure about this mixture of read* and ioread* functions. Shall
we convert maybe all of those?

 drivers/mmc/host/tmio_mmc.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/mmc/host/tmio_mmc.h b/drivers/mmc/host/tmio_mmc.h
index 76094345cbacf3..03519c4ca0aa1a 100644
--- a/drivers/mmc/host/tmio_mmc.h
+++ b/drivers/mmc/host/tmio_mmc.h
@@ -233,7 +233,7 @@ static inline u16 sd_ctrl_read16(struct tmio_mmc_host *host, int addr)
 static inline void sd_ctrl_read16_rep(struct tmio_mmc_host *host, int addr,
 				      u16 *buf, int count)
 {
-	readsw(host->ctl + (addr << host->bus_shift), buf, count);
+	ioread16_rep(host->ctl + (addr << host->bus_shift), buf, count);
 }
 
 static inline u32 sd_ctrl_read16_and_16_as_32(struct tmio_mmc_host *host,
@@ -246,7 +246,7 @@ static inline u32 sd_ctrl_read16_and_16_as_32(struct tmio_mmc_host *host,
 static inline void sd_ctrl_read32_rep(struct tmio_mmc_host *host, int addr,
 				      u32 *buf, int count)
 {
-	readsl(host->ctl + (addr << host->bus_shift), buf, count);
+	ioread32_rep(host->ctl + (addr << host->bus_shift), buf, count);
 }
 
 static inline void sd_ctrl_write16(struct tmio_mmc_host *host, int addr,
@@ -263,7 +263,7 @@ static inline void sd_ctrl_write16(struct tmio_mmc_host *host, int addr,
 static inline void sd_ctrl_write16_rep(struct tmio_mmc_host *host, int addr,
 				       u16 *buf, int count)
 {
-	writesw(host->ctl + (addr << host->bus_shift), buf, count);
+	iowrite16_rep(host->ctl + (addr << host->bus_shift), buf, count);
 }
 
 static inline void sd_ctrl_write32_as_16_and_16(struct tmio_mmc_host *host,
@@ -276,7 +276,7 @@ static inline void sd_ctrl_write32_as_16_and_16(struct tmio_mmc_host *host,
 static inline void sd_ctrl_write32_rep(struct tmio_mmc_host *host, int addr,
 				       const u32 *buf, int count)
 {
-	writesl(host->ctl + (addr << host->bus_shift), buf, count);
+	iowrite32_rep(host->ctl + (addr << host->bus_shift), buf, count);
 }
 
 #endif
-- 
2.11.0
