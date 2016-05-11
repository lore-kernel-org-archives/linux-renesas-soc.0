Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from smtp6-v.fe.bosch.de ([139.15.237.11]:12986 "EHLO
	smtp6-v.fe.bosch.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751315AbcEKFbY (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Wed, 11 May 2016 01:31:24 -0400
Received: from vsmta14.fe.internet.bosch.com (unknown [10.4.98.54])
	by imta23.fe.bosch.de (Postfix) with ESMTP id 88A8415801DC
	for <linux-renesas-soc@vger.kernel.org>; Wed, 11 May 2016 07:31:23 +0200 (CEST)
Received: from FE-HUB1001.de.bosch.com (vsgw22.fe.internet.bosch.com [10.4.98.11])
	by vsmta14.fe.internet.bosch.com (Postfix) with ESMTP id 2FC0DA4023E
	for <linux-renesas-soc@vger.kernel.org>; Wed, 11 May 2016 07:31:23 +0200 (CEST)
From: Dirk Behme <dirk.behme@de.bosch.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Simon Horman <horms+renesas@verge.net.au>,
	<linux-renesas-soc@vger.kernel.org>
CC: Dirk Behme <dirk.behme@gmail.com>
Subject: [PATCH v2 07/10] arm: renesas: rcar-gen3: Make boot-mode-reg Gen3 compatible
Date: Wed, 11 May 2016 07:29:35 +0200
Message-ID: <1462944578-1220-8-git-send-email-dirk.behme@de.bosch.com>
In-Reply-To: <1462944578-1220-1-git-send-email-dirk.behme@de.bosch.com>
References: <1462944578-1220-1-git-send-email-dirk.behme@de.bosch.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Dirk Behme <dirk.behme@gmail.com>

The boot mode register is available on Renesas Gen3, too.
Use the same driver on Gen3 as on Gen2.

Signed-off-by: Dirk Behme <dirk.behme@gmail.com>
---
 arch/arm64/Kconfig.platforms      | 1 +
 drivers/misc/boot-mode-reg/rcar.c | 4 +++-
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
index fda93a2..591ab8f 100644
--- a/arch/arm64/Kconfig.platforms
+++ b/arch/arm64/Kconfig.platforms
@@ -106,6 +106,7 @@ config ARCH_SHMOBILE
 config ARCH_RENESAS
 	bool "Renesas SoC Platforms"
 	select ARCH_SHMOBILE
+	select BOOT_MODE_REG_RCAR
 	select PINCTRL
 	select PM
 	select PM_GENERIC_DOMAINS
diff --git a/drivers/misc/boot-mode-reg/rcar.c b/drivers/misc/boot-mode-reg/rcar.c
index c3b778fe..e994980 100644
--- a/drivers/misc/boot-mode-reg/rcar.c
+++ b/drivers/misc/boot-mode-reg/rcar.c
@@ -48,7 +48,9 @@ int __init rcar_init_boot_mode(void)
 	    of_machine_is_compatible("renesas,r8a7791") ||
 	    of_machine_is_compatible("renesas,r8a7792") ||
 	    of_machine_is_compatible("renesas,r8a7793") ||
-	    of_machine_is_compatible("renesas,r8a7794"))
+	    of_machine_is_compatible("renesas,r8a7794") ||
+	    of_machine_is_compatible("renesas,r8a7795") ||
+	    of_machine_is_compatible("renesas,r8a7796"))
 		return rcar_read_mode_pins();
 
 	return 0;
-- 
2.8.0
