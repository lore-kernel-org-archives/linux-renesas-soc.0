Return-Path: <SRS0=9p1a=P2=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,UPPERCASE_50_75,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88877C43387
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 18 Jan 2019 16:00:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 60EDF2086D
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 18 Jan 2019 16:00:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727491AbfARQAP (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 18 Jan 2019 11:00:15 -0500
Received: from albert.telenet-ops.be ([195.130.137.90]:46544 "EHLO
        albert.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727467AbfARQAP (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 18 Jan 2019 11:00:15 -0500
Received: from ramsan ([84.194.111.163])
        by albert.telenet-ops.be with bizsmtp
        id Rs0D1z00C3XaVaC06s0D01; Fri, 18 Jan 2019 17:00:13 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1gkWZ3-0008M3-Dz; Fri, 18 Jan 2019 17:00:13 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1gkWZ3-0003CD-Ce; Fri, 18 Jan 2019 17:00:13 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] [LOCAL] arm64: renesas_defconfig: Refresh for v5.0-rc2
Date:   Fri, 18 Jan 2019 17:00:12 +0100
Message-Id: <20190118160012.12244-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

  - Move SoC config options (moved in commit fa43948f6736b74c ("arm64:
    renesas: Move SoC Kconfig symbols to drivers/soc/renesas/")),
  - Move PCI config options (moved in commit eb01d42a77785ff9 ("PCI:
    consolidate PCI config entry in drivers/pci")),
  - Disable CONFIG_ARM64_PTR_AUTH (R-Car Gen3 is not ARMv8.3),
  - Drop CONFIG_IOSCHED_DEADLINE (removed in commit f382fb0bcef4c37d
    ("block: remove legacy IO schedulers")),
  - Drop CONFIG_GPIOLIB=y (auto-enabled since commit 9374eee32b666c92
    ("arm64: renesas: Enable GPIOLIB to allow GPIO driver selection")).

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm64/configs/renesas_defconfig | 35 ++++++++++++++--------------
 1 file changed, 17 insertions(+), 18 deletions(-)

diff --git a/arch/arm64/configs/renesas_defconfig b/arch/arm64/configs/renesas_defconfig
index b252e2d3f7cf5606..d9390aec00809bb0 100644
--- a/arch/arm64/configs/renesas_defconfig
+++ b/arch/arm64/configs/renesas_defconfig
@@ -29,22 +29,6 @@ CONFIG_BLK_DEV_INITRD=y
 # CONFIG_COMPAT_BRK is not set
 CONFIG_PROFILING=y
 CONFIG_ARCH_RENESAS=y
-CONFIG_ARCH_R8A774A1=y
-CONFIG_ARCH_R8A774C0=y
-CONFIG_ARCH_R8A7795=y
-CONFIG_ARCH_R8A7796=y
-CONFIG_ARCH_R8A77965=y
-CONFIG_ARCH_R8A77970=y
-CONFIG_ARCH_R8A77980=y
-CONFIG_ARCH_R8A77990=y
-CONFIG_ARCH_R8A77995=y
-CONFIG_PCI=y
-CONFIG_PCIEPORTBUS=y
-CONFIG_HOTPLUG_PCI_PCIE=y
-CONFIG_PCI_IOV=y
-CONFIG_HOTPLUG_PCI=y
-CONFIG_PCIE_RCAR=y
-CONFIG_PCI_HOST_GENERIC=y
 # CONFIG_CAVIUM_ERRATUM_22375 is not set
 # CONFIG_CAVIUM_ERRATUM_23154 is not set
 # CONFIG_CAVIUM_ERRATUM_27456 is not set
@@ -62,6 +46,7 @@ CONFIG_CRASH_DUMP=y
 CONFIG_XEN=y
 # CONFIG_ARM64_LSE_ATOMICS is not set
 # CONFIG_ARM64_RAS_EXTN is not set
+# CONFIG_ARM64_PTR_AUTH is not set
 CONFIG_COMPAT=y
 CONFIG_HIBERNATION=y
 CONFIG_WQ_POWER_EFFICIENT_DEFAULT=y
@@ -80,7 +65,6 @@ CONFIG_CRYPTO_AES_ARM64_CE_CCM=y
 CONFIG_CRYPTO_AES_ARM64_CE_BLK=y
 CONFIG_JUMP_LABEL=y
 CONFIG_BLK_DEV_INTEGRITY=y
-# CONFIG_IOSCHED_DEADLINE is not set
 # CONFIG_CORE_DUMP_DEFAULT_ELF_HEADERS is not set
 CONFIG_KSM=y
 CONFIG_TRANSPARENT_HUGEPAGE=y
@@ -98,6 +82,13 @@ CONFIG_NETFILTER=y
 CONFIG_CAN=y
 CONFIG_CAN_RCAR=y
 CONFIG_CAN_RCAR_CANFD=y
+CONFIG_PCI=y
+CONFIG_PCIEPORTBUS=y
+CONFIG_HOTPLUG_PCI_PCIE=y
+CONFIG_PCI_IOV=y
+CONFIG_HOTPLUG_PCI=y
+CONFIG_PCIE_RCAR=y
+CONFIG_PCI_HOST_GENERIC=y
 CONFIG_DEVTMPFS=y
 CONFIG_DEVTMPFS_MOUNT=y
 CONFIG_DMA_CMA=y
@@ -145,7 +136,6 @@ CONFIG_SPI_SH_MSIOF=y
 CONFIG_SPI_SPIDEV=y
 CONFIG_SPMI=y
 CONFIG_PINCTRL_SINGLE=y
-CONFIG_GPIOLIB=y
 CONFIG_GPIO_GENERIC_PLATFORM=y
 CONFIG_GPIO_RCAR=y
 CONFIG_GPIO_PCA953X=y
@@ -296,6 +286,15 @@ CONFIG_HWSPINLOCK=y
 # CONFIG_ARM64_ERRATUM_858921 is not set
 CONFIG_MAILBOX=y
 CONFIG_IOMMU_IO_PGTABLE_LPAE=y
+CONFIG_ARCH_R8A774A1=y
+CONFIG_ARCH_R8A774C0=y
+CONFIG_ARCH_R8A7795=y
+CONFIG_ARCH_R8A7796=y
+CONFIG_ARCH_R8A77965=y
+CONFIG_ARCH_R8A77970=y
+CONFIG_ARCH_R8A77980=y
+CONFIG_ARCH_R8A77990=y
+CONFIG_ARCH_R8A77995=y
 CONFIG_EXTCON_USB_GPIO=y
 CONFIG_IIO=y
 CONFIG_MAX9611=y
-- 
2.17.1

