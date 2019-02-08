Return-Path: <SRS0=rsGL=QP=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.0 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,UPPERCASE_50_75,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80615C169C4
	for <linux-renesas-soc@archiver.kernel.org>; Fri,  8 Feb 2019 11:13:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 48E5520863
	for <linux-renesas-soc@archiver.kernel.org>; Fri,  8 Feb 2019 11:13:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="ILSDlce4"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726547AbfBHLN5 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 8 Feb 2019 06:13:57 -0500
Received: from kirsty.vergenet.net ([202.4.237.240]:46305 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726068AbfBHLN5 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 8 Feb 2019 06:13:57 -0500
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 0F9A525BF03;
        Fri,  8 Feb 2019 22:13:50 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1549624430; bh=Zm5aNypMPiaPyAeO7lyV3W5bMvv6g2OwgbkINaXMjBQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=ILSDlce4Czc9cMUyhXXaBGDFew058M7xwLye3m/getQrbAath8Cndh1DmjSy9GWcI
         eyS4uDRXyp8V6uNyuOKK1Xk4LX5WpWl1YY+L7EK/GTw2tv6a5ukfuuCO3+PE2loED7
         Urf7ZdMfh7/vmPtH2GumP8X8BxUfG/MnITGmB5v8=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 5A880940461; Fri,  8 Feb 2019 12:13:48 +0100 (CET)
From:   Simon Horman <horms+renesas@verge.net.au>
To:     linux-renesas-soc@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 3/5] ARM: shmobile: defconfig: Refresh for v5.0-rc1
Date:   Fri,  8 Feb 2019 12:13:45 +0100
Message-Id: <4162325afd0d553c26fd06089b04e123699cf893.1549621233.git.horms+renesas@verge.net.au>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1549621233.git.horms+renesas@verge.net.au>
References: <cover.1549621233.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Geert Uytterhoeven <geert+renesas@glider.be>

- Move SoC config options (moved in commit 062887bf5ef73313 ("ARM:
    shmobile: Move SoC Kconfig symbols to drivers/soc/renesas/")),
  - Move PCI config options (moved in commit eb01d42a77785ff9 ("PCI:
    consolidate PCI config entry in drivers/pci")),
  - Drop CONFIG_I2C_MUX=y (auto-enabled since commit ea6b13e9fed0fda9
    ("drm/bridge/sii902x: Add missing dependency on I2C_MUX")),
  - Drop CONFIG_SH_DMAE=y (no longer selectable since commit
    a19788612f51b787 ("dmaengine: sh: Remove R-Mobile APE6 support")),
  - Drop CONFIG_ARM_UNWIND (auto-enabled since commit f9b58e8c7d031b0d
    ("ARM: 8800/1: use choice for kernel unwinders")).

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm/configs/shmobile_defconfig | 45 +++++++++++++++++--------------------
 1 file changed, 21 insertions(+), 24 deletions(-)

diff --git a/arch/arm/configs/shmobile_defconfig b/arch/arm/configs/shmobile_defconfig
index fdac4e4ca04d..14e9255e48c3 100644
--- a/arch/arm/configs/shmobile_defconfig
+++ b/arch/arm/configs/shmobile_defconfig
@@ -8,29 +8,8 @@ CONFIG_CC_OPTIMIZE_FOR_SIZE=y
 CONFIG_PERF_EVENTS=y
 CONFIG_SLAB=y
 CONFIG_ARCH_RENESAS=y
-CONFIG_ARCH_EMEV2=y
-CONFIG_ARCH_R7S72100=y
-CONFIG_ARCH_R8A73A4=y
-CONFIG_ARCH_R8A7740=y
-CONFIG_ARCH_R8A7743=y
-CONFIG_ARCH_R8A7744=y
-CONFIG_ARCH_R8A7745=y
-CONFIG_ARCH_R8A77470=y
-CONFIG_ARCH_R8A7778=y
-CONFIG_ARCH_R8A7779=y
-CONFIG_ARCH_R8A7790=y
-CONFIG_ARCH_R8A7791=y
-CONFIG_ARCH_R8A7792=y
-CONFIG_ARCH_R8A7793=y
-CONFIG_ARCH_R8A7794=y
-CONFIG_ARCH_R9A06G032=y
-CONFIG_ARCH_SH73A0=y
 CONFIG_PL310_ERRATA_588369=y
 CONFIG_ARM_ERRATA_754322=y
-CONFIG_PCI=y
-CONFIG_PCI_MSI=y
-CONFIG_PCI_RCAR_GEN2=y
-CONFIG_PCIE_RCAR=y
 CONFIG_SMP=y
 CONFIG_SCHED_MC=y
 CONFIG_NR_CPUS=8
@@ -58,6 +37,10 @@ CONFIG_IP_PNP=y
 CONFIG_IP_PNP_DHCP=y
 CONFIG_CAN=y
 CONFIG_CAN_RCAR=y
+CONFIG_PCI=y
+CONFIG_PCI_MSI=y
+CONFIG_PCI_RCAR_GEN2=y
+CONFIG_PCIE_RCAR=y
 CONFIG_DEVTMPFS=y
 CONFIG_DEVTMPFS_MOUNT=y
 CONFIG_DMA_CMA=y
@@ -91,7 +74,6 @@ CONFIG_SERIAL_8250_DW=y
 CONFIG_SERIAL_8250_EM=y
 CONFIG_SERIAL_SH_SCI=y
 CONFIG_I2C_CHARDEV=y
-CONFIG_I2C_MUX=y
 CONFIG_I2C_DEMUX_PINCTRL=y
 CONFIG_I2C_EMEV2=y
 CONFIG_I2C_GPIO=y
@@ -183,12 +165,28 @@ CONFIG_RTC_DRV_S35390A=y
 CONFIG_RTC_DRV_RX8581=y
 CONFIG_RTC_DRV_DA9063=y
 CONFIG_DMADEVICES=y
-CONFIG_SH_DMAE=y
 CONFIG_RCAR_DMAC=y
 CONFIG_RENESAS_USB_DMAC=y
 CONFIG_STAGING=y
 CONFIG_STAGING_BOARD=y
 # CONFIG_IOMMU_SUPPORT is not set
+CONFIG_ARCH_EMEV2=y
+CONFIG_ARCH_R7S72100=y
+CONFIG_ARCH_R8A73A4=y
+CONFIG_ARCH_R8A7740=y
+CONFIG_ARCH_R8A7743=y
+CONFIG_ARCH_R8A7744=y
+CONFIG_ARCH_R8A7745=y
+CONFIG_ARCH_R8A77470=y
+CONFIG_ARCH_R8A7778=y
+CONFIG_ARCH_R8A7779=y
+CONFIG_ARCH_R8A7790=y
+CONFIG_ARCH_R8A7791=y
+CONFIG_ARCH_R8A7792=y
+CONFIG_ARCH_R8A7793=y
+CONFIG_ARCH_R8A7794=y
+CONFIG_ARCH_R9A06G032=y
+CONFIG_ARCH_SH73A0=y
 CONFIG_IIO=y
 CONFIG_AK8975=y
 CONFIG_PWM=y
@@ -212,4 +210,3 @@ CONFIG_NLS_ISO8859_1=y
 CONFIG_PRINTK_TIME=y
 # CONFIG_ENABLE_MUST_CHECK is not set
 CONFIG_DEBUG_KERNEL=y
-# CONFIG_ARM_UNWIND is not set
-- 
2.11.0

