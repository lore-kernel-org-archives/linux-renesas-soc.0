Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f67.google.com ([209.85.215.67]:43416 "EHLO
        mail-lf0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752544AbeADV07 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 4 Jan 2018 16:26:59 -0500
Received: by mail-lf0-f67.google.com with SMTP id o26so3165782lfc.10
        for <linux-renesas-soc@vger.kernel.org>; Thu, 04 Jan 2018 13:26:58 -0800 (PST)
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-Id: <20180104212654.038005757@cogentembedded.com>
Date: Fri, 05 Jan 2018 00:26:46 +0300
To: Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>, linux-sh@vger.kernel.org,
        netdev@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH] sh_eth: remove sh_eth_plat_data::edmac_endian
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15
Content-Disposition: inline; filename=sh_eth-remove-sh_eth_plat_data-edmac_endian.patch
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Since the commit 888cc8c20cf ("sh_eth: remove EDMAC_BIG_ENDIAN") (geez,
I didn't realize that was 2 years ago!) the initializers in the SuperH
platform code for the 'sh_eth_plat_data::edmac_endian' stopped to matter,
so we can remove that field for good (not sure if  it  was ever useful --
SH7786 Ether has been reported  to have the same EDMAC descriptor/register
endiannes as configured for the SuperH CPU)...

Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
The patch is against DaveM's 'net-next.git' repo.
Not sure who should apply the patch -- will prolly be faster if DaveM does...

 arch/sh/boards/board-espt.c           |    1 -
 arch/sh/boards/board-sh7757lcr.c      |    4 ----
 arch/sh/boards/mach-ecovec24/setup.c  |    1 -
 arch/sh/boards/mach-se/7724/setup.c   |    1 -
 arch/sh/boards/mach-sh7763rdp/setup.c |    1 -
 arch/sh/kernel/cpu/sh2/setup-sh7619.c |    1 -
 include/linux/sh_eth.h                |    3 ---
 7 files changed, 12 deletions(-)

Index: net-next/arch/sh/boards/board-espt.c
===================================================================
--- net-next.orig/arch/sh/boards/board-espt.c
+++ net-next/arch/sh/boards/board-espt.c
@@ -79,7 +79,6 @@ static struct resource sh_eth_resources[
 
 static struct sh_eth_plat_data sh7763_eth_pdata = {
 	.phy = 0,
-	.edmac_endian = EDMAC_LITTLE_ENDIAN,
 	.phy_interface = PHY_INTERFACE_MODE_MII,
 };
 
Index: net-next/arch/sh/boards/board-sh7757lcr.c
===================================================================
--- net-next.orig/arch/sh/boards/board-sh7757lcr.c
+++ net-next/arch/sh/boards/board-sh7757lcr.c
@@ -76,7 +76,6 @@ static struct resource sh_eth0_resources
 
 static struct sh_eth_plat_data sh7757_eth0_pdata = {
 	.phy = 1,
-	.edmac_endian = EDMAC_LITTLE_ENDIAN,
 	.set_mdio_gate = sh7757_eth_set_mdio_gate,
 };
 
@@ -104,7 +103,6 @@ static struct resource sh_eth1_resources
 
 static struct sh_eth_plat_data sh7757_eth1_pdata = {
 	.phy = 1,
-	.edmac_endian = EDMAC_LITTLE_ENDIAN,
 	.set_mdio_gate = sh7757_eth_set_mdio_gate,
 };
 
@@ -148,7 +146,6 @@ static struct resource sh_eth_giga0_reso
 
 static struct sh_eth_plat_data sh7757_eth_giga0_pdata = {
 	.phy = 18,
-	.edmac_endian = EDMAC_LITTLE_ENDIAN,
 	.set_mdio_gate = sh7757_eth_giga_set_mdio_gate,
 	.phy_interface = PHY_INTERFACE_MODE_RGMII_ID,
 };
@@ -182,7 +179,6 @@ static struct resource sh_eth_giga1_reso
 
 static struct sh_eth_plat_data sh7757_eth_giga1_pdata = {
 	.phy = 19,
-	.edmac_endian = EDMAC_LITTLE_ENDIAN,
 	.set_mdio_gate = sh7757_eth_giga_set_mdio_gate,
 	.phy_interface = PHY_INTERFACE_MODE_RGMII_ID,
 };
Index: net-next/arch/sh/boards/mach-ecovec24/setup.c
===================================================================
--- net-next.orig/arch/sh/boards/mach-ecovec24/setup.c
+++ net-next/arch/sh/boards/mach-ecovec24/setup.c
@@ -159,7 +159,6 @@ static struct resource sh_eth_resources[
 
 static struct sh_eth_plat_data sh_eth_plat = {
 	.phy = 0x1f, /* SMSC LAN8700 */
-	.edmac_endian = EDMAC_LITTLE_ENDIAN,
 	.phy_interface = PHY_INTERFACE_MODE_MII,
 	.ether_link_active_low = 1
 };
Index: net-next/arch/sh/boards/mach-se/7724/setup.c
===================================================================
--- net-next.orig/arch/sh/boards/mach-se/7724/setup.c
+++ net-next/arch/sh/boards/mach-se/7724/setup.c
@@ -374,7 +374,6 @@ static struct resource sh_eth_resources[
 
 static struct sh_eth_plat_data sh_eth_plat = {
 	.phy = 0x1f, /* SMSC LAN8187 */
-	.edmac_endian = EDMAC_LITTLE_ENDIAN,
 	.phy_interface = PHY_INTERFACE_MODE_MII,
 };
 
Index: net-next/arch/sh/boards/mach-sh7763rdp/setup.c
===================================================================
--- net-next.orig/arch/sh/boards/mach-sh7763rdp/setup.c
+++ net-next/arch/sh/boards/mach-sh7763rdp/setup.c
@@ -87,7 +87,6 @@ static struct resource sh_eth_resources[
 
 static struct sh_eth_plat_data sh7763_eth_pdata = {
 	.phy = 1,
-	.edmac_endian = EDMAC_LITTLE_ENDIAN,
 	.phy_interface = PHY_INTERFACE_MODE_MII,
 };
 
Index: net-next/arch/sh/kernel/cpu/sh2/setup-sh7619.c
===================================================================
--- net-next.orig/arch/sh/kernel/cpu/sh2/setup-sh7619.c
+++ net-next/arch/sh/kernel/cpu/sh2/setup-sh7619.c
@@ -122,7 +122,6 @@ static struct platform_device scif2_devi
 
 static struct sh_eth_plat_data eth_platform_data = {
 	.phy		= 1,
-	.edmac_endian	= EDMAC_LITTLE_ENDIAN,
 	.phy_interface	= PHY_INTERFACE_MODE_MII,
 };
 
Index: net-next/include/linux/sh_eth.h
===================================================================
--- net-next.orig/include/linux/sh_eth.h
+++ net-next/include/linux/sh_eth.h
@@ -5,12 +5,9 @@
 #include <linux/phy.h>
 #include <linux/if_ether.h>
 
-enum {EDMAC_LITTLE_ENDIAN};
-
 struct sh_eth_plat_data {
 	int phy;
 	int phy_irq;
-	int edmac_endian;
 	phy_interface_t phy_interface;
 	void (*set_mdio_gate)(void *addr);
 
