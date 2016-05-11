Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from smtp6-v.fe.bosch.de ([139.15.237.11]:12988 "EHLO
	smtp6-v.fe.bosch.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751397AbcEKFbZ (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Wed, 11 May 2016 01:31:25 -0400
Received: from vsmta12.fe.internet.bosch.com (unknown [10.4.98.52])
	by imta24.fe.bosch.de (Postfix) with ESMTP id 538ACD8021B
	for <linux-renesas-soc@vger.kernel.org>; Wed, 11 May 2016 07:31:24 +0200 (CEST)
Received: from SI-HUB1000.de.bosch.com (vsgw23.fe.internet.bosch.com [10.4.98.23])
	by vsmta12.fe.internet.bosch.com (Postfix) with ESMTP id ED2AE1B80420
	for <linux-renesas-soc@vger.kernel.org>; Wed, 11 May 2016 07:31:23 +0200 (CEST)
From: Dirk Behme <dirk.behme@de.bosch.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Simon Horman <horms+renesas@verge.net.au>,
	<linux-renesas-soc@vger.kernel.org>
Subject: [PATCH v2 06/10] arm: renesas: rcar-gen2: Remove unused rcar_gen2_read_mode_pins()
Date: Wed, 11 May 2016 07:29:34 +0200
Message-ID: <1462944578-1220-7-git-send-email-dirk.behme@de.bosch.com>
In-Reply-To: <1462944578-1220-1-git-send-email-dirk.behme@de.bosch.com>
References: <1462944578-1220-1-git-send-email-dirk.behme@de.bosch.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Simon Horman <horms+renesas@verge.net.au>

The new boot mode reg infrastructure is now used in
place of rcar_gen2_read_mode_pins so the latter may now be removed.

Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm/mach-shmobile/rcar-gen2.h       |  1 -
 arch/arm/mach-shmobile/setup-rcar-gen2.c | 18 ------------------
 2 files changed, 19 deletions(-)

diff --git a/arch/arm/mach-shmobile/rcar-gen2.h b/arch/arm/mach-shmobile/rcar-gen2.h
index 8a66b4a..4c4ec37 100644
--- a/arch/arm/mach-shmobile/rcar-gen2.h
+++ b/arch/arm/mach-shmobile/rcar-gen2.h
@@ -3,7 +3,6 @@
 
 void rcar_gen2_timer_init(void);
 #define MD(nr) BIT(nr)
-u32 rcar_gen2_read_mode_pins(void);
 void rcar_gen2_reserve(void);
 void rcar_gen2_pm_init(void);
 
diff --git a/arch/arm/mach-shmobile/setup-rcar-gen2.c b/arch/arm/mach-shmobile/setup-rcar-gen2.c
index 2af84d8..5942b93 100644
--- a/arch/arm/mach-shmobile/setup-rcar-gen2.c
+++ b/arch/arm/mach-shmobile/setup-rcar-gen2.c
@@ -29,24 +29,6 @@
 #include "common.h"
 #include "rcar-gen2.h"
 
-#define MODEMR 0xe6160060
-
-u32 rcar_gen2_read_mode_pins(void)
-{
-	static u32 mode;
-	static bool mode_valid;
-
-	if (!mode_valid) {
-		void __iomem *modemr = ioremap_nocache(MODEMR, 4);
-		BUG_ON(!modemr);
-		mode = ioread32(modemr);
-		iounmap(modemr);
-		mode_valid = true;
-	}
-
-	return mode;
-}
-
 #define CNTCR 0
 #define CNTFID0 0x20
 
-- 
2.8.0
