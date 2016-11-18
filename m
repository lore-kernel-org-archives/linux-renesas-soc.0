Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from smtp-3.sys.kth.se ([130.237.48.192]:53994 "EHLO
        smtp-3.sys.kth.se" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753725AbcKRPBI (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 18 Nov 2016 10:01:08 -0500
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
To: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 2/2] ARM: shmobile: defconfig: Enable CMA for DMA
Date: Fri, 18 Nov 2016 16:00:45 +0100
Message-Id: <20161118150045.26492-3-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20161118150045.26492-1-niklas.soderlund+renesas@ragnatech.se>
References: <20161118150045.26492-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

To be able to use VIN with larger frame sizes CMA memory are needed for
DMA. If this is not enabled trying to capture large frames can result in
errors such as:

rcar-vin e6ef0000.video: dma_alloc_coherent of size 8388608 failed

A CMA area of 64MB are needed for v4l2-compliance to pass on all formats
on the largest possible frame size of 2048x2048.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 arch/arm/configs/shmobile_defconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm/configs/shmobile_defconfig b/arch/arm/configs/shmobile_defconfig
index 9c311c9..05ab191 100644
--- a/arch/arm/configs/shmobile_defconfig
+++ b/arch/arm/configs/shmobile_defconfig
@@ -32,6 +32,7 @@ CONFIG_HAVE_ARM_ARCH_TIMER=y
 CONFIG_NR_CPUS=8
 CONFIG_AEABI=y
 CONFIG_HIGHMEM=y
+CONFIG_CMA=y
 CONFIG_ZBOOT_ROM_TEXT=0x0
 CONFIG_ZBOOT_ROM_BSS=0x0
 CONFIG_ARM_APPENDED_DTB=y
@@ -57,6 +58,8 @@ CONFIG_CAN_RCAR=y
 CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
 CONFIG_DEVTMPFS=y
 CONFIG_DEVTMPFS_MOUNT=y
+CONFIG_DMA_CMA=y
+CONFIG_CMA_SIZE_MBYTES=64
 CONFIG_SIMPLE_PM_BUS=y
 CONFIG_MTD=y
 CONFIG_MTD_BLOCK=y
-- 
2.10.2
