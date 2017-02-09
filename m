Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from newton.telenet-ops.be ([195.130.132.45]:37924 "EHLO
        newton.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752003AbdBIKT4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 9 Feb 2017 05:19:56 -0500
Received: from albert.telenet-ops.be (albert.telenet-ops.be [IPv6:2a02:1800:110:4::f00:1a])
        by newton.telenet-ops.be (Postfix) with ESMTPS id 3vJvFw67GxzMyYhP
        for <linux-renesas-soc@vger.kernel.org>; Thu,  9 Feb 2017 11:19:48 +0100 (CET)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 1/2] ARM: dts: renesas: Switch from ARCH_SHMOBILE_MULTI to ARCH_RENESAS
Date: Thu,  9 Feb 2017 11:18:48 +0100
Message-Id: <1486635529-6636-2-git-send-email-geert+renesas@glider.be>
In-Reply-To: <1486635529-6636-1-git-send-email-geert+renesas@glider.be>
References: <1486635529-6636-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Commit 9b5ba0df4ea4 ("ARM: shmobile: Introduce ARCH_RENESAS") started
the migration from ARCH_SHMOBILE_MULTI to ARCH_RENESAS.
Update the Makefile to build DTBs for Renesas platforms to use the new
symbol, and move the Renesas section to preserve sort order.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm/boot/dts/Makefile | 38 +++++++++++++++++++-------------------
 1 file changed, 19 insertions(+), 19 deletions(-)

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index d1b241e3cedb4d8d..625660fcc8720de4 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -672,6 +672,25 @@ dtb-$(CONFIG_ARCH_REALVIEW) += \
 	arm-realview-eb-a9mp-bbrevd.dtb \
 	arm-realview-pba8.dtb \
 	arm-realview-pbx-a9.dtb
+dtb-$(CONFIG_ARCH_RENESAS) += \
+	emev2-kzm9d.dtb \
+	r7s72100-genmai.dtb \
+	r7s72100-rskrza1.dtb \
+	r8a73a4-ape6evm.dtb \
+	r8a7740-armadillo800eva.dtb \
+	r8a7743-sk-rzg1m.dtb \
+	r8a7745-sk-rzg1e.dtb \
+	r8a7778-bockw.dtb \
+	r8a7779-marzen.dtb \
+	r8a7790-lager.dtb \
+	r8a7791-koelsch.dtb \
+	r8a7791-porter.dtb \
+	r8a7792-blanche.dtb \
+	r8a7792-wheat.dtb \
+	r8a7793-gose.dtb \
+	r8a7794-alt.dtb \
+	r8a7794-silk.dtb \
+	sh73a0-kzm9g.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += \
 	rk1108-evb.dtb \
 	rk3036-evb.dtb \
@@ -712,25 +731,6 @@ dtb-$(CONFIG_ARCH_S5PV210) += \
 	s5pv210-smdkc110.dtb \
 	s5pv210-smdkv210.dtb \
 	s5pv210-torbreck.dtb
-dtb-$(CONFIG_ARCH_SHMOBILE_MULTI) += \
-	emev2-kzm9d.dtb \
-	r7s72100-genmai.dtb \
-	r7s72100-rskrza1.dtb \
-	r8a73a4-ape6evm.dtb \
-	r8a7740-armadillo800eva.dtb \
-	r8a7743-sk-rzg1m.dtb \
-	r8a7745-sk-rzg1e.dtb \
-	r8a7778-bockw.dtb \
-	r8a7779-marzen.dtb \
-	r8a7790-lager.dtb \
-	r8a7791-koelsch.dtb \
-	r8a7791-porter.dtb \
-	r8a7792-blanche.dtb \
-	r8a7792-wheat.dtb \
-	r8a7793-gose.dtb \
-	r8a7794-alt.dtb \
-	r8a7794-silk.dtb \
-	sh73a0-kzm9g.dtb
 dtb-$(CONFIG_ARCH_SOCFPGA) += \
 	socfpga_arria5_socdk.dtb \
 	socfpga_arria10_socdk_nand.dtb \
-- 
1.9.1
