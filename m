Return-Path: <SRS0=l30p=SD=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,UPPERCASE_50_75,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EB92C43381
	for <linux-renesas-soc@archiver.kernel.org>; Mon,  1 Apr 2019 11:57:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 04B2920870
	for <linux-renesas-soc@archiver.kernel.org>; Mon,  1 Apr 2019 11:57:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726534AbfDAL5Z (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 1 Apr 2019 07:57:25 -0400
Received: from baptiste.telenet-ops.be ([195.130.132.51]:34512 "EHLO
        baptiste.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726412AbfDAL5Z (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 1 Apr 2019 07:57:25 -0400
Received: from ramsan ([84.194.111.163])
        by baptiste.telenet-ops.be with bizsmtp
        id uzxQ1z00N3XaVaC01zxQ4u; Mon, 01 Apr 2019 13:57:24 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1hAvZ6-0003g9-Fm; Mon, 01 Apr 2019 13:57:24 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1hAvZ6-0007qe-ED; Mon, 01 Apr 2019 13:57:24 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH LOCAL] arm64: renesas_defconfig: Refresh for v5.1-rc1
Date:   Mon,  1 Apr 2019 13:57:23 +0200
Message-Id: <20190401115723.30098-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Update the defconfig for Renesas R-Car Gen3 boards:
  - Move CMA-related config options (moved in commit ddb26d8e1e97af23
    ("dma-mapping: move CONFIG_DMA_CMA to kernel/dma/Kconfig"),
  - Drop CONFIG_CAVIUM_PTP=n (not enabled by default since commit
    e8c32c32b48c2e88 ("net: Don't default Cavium PTP driver to 'y'")),
  - Drop CONFIG_DRM_RCAR_LVDS=y (auto-enabled since commit
    02f2b30032c12b1b ("drm: rcar-du: lvds: Add API to enable/disable
    clock output")),
  - Drop CONFIG_SND_SIMPLE_SCU_CARD=y (removed in commit
    c8ed6aca6b824018 ("ASoC: simple-scu-card: remove simple-scu-card")).

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm64/configs/renesas_defconfig | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/configs/renesas_defconfig b/arch/arm64/configs/renesas_defconfig
index 5561d30a3f270e26..1c4cbf4b936f60f0 100644
--- a/arch/arm64/configs/renesas_defconfig
+++ b/arch/arm64/configs/renesas_defconfig
@@ -91,9 +91,6 @@ CONFIG_PCIE_RCAR=y
 CONFIG_PCI_HOST_GENERIC=y
 CONFIG_DEVTMPFS=y
 CONFIG_DEVTMPFS_MOUNT=y
-CONFIG_DMA_CMA=y
-CONFIG_CMA_SIZE_MBYTES=128
-CONFIG_CMA_ALIGNMENT=9
 CONFIG_MTD=y
 CONFIG_MTD_BLOCK=y
 CONFIG_MTD_SPI_NOR=y
@@ -110,7 +107,6 @@ CONFIG_SATA_RCAR=y
 CONFIG_NETDEVICES=y
 CONFIG_TUN=y
 CONFIG_VIRTIO_NET=y
-# CONFIG_CAVIUM_PTP is not set
 CONFIG_RAVB=y
 CONFIG_MDIO_BUS_MUX_MMIOREG=y
 CONFIG_MICREL_PHY=y
@@ -210,7 +206,6 @@ CONFIG_VIDEO_ADV748X=y
 CONFIG_DRM=y
 CONFIG_DRM_RCAR_DU=y
 CONFIG_DRM_RCAR_DW_HDMI=y
-CONFIG_DRM_RCAR_LVDS=y
 CONFIG_DRM_DUMB_VGA_DAC=y
 CONFIG_DRM_THINE_THC63LVD1024=y
 CONFIG_DRM_DW_HDMI_AHB_AUDIO=y
@@ -233,7 +228,6 @@ CONFIG_SND_SOC_RCAR=y
 CONFIG_SND_SOC_AK4613=y
 CONFIG_SND_SOC_PCM3168A_I2C=y
 CONFIG_SND_SIMPLE_CARD=y
-CONFIG_SND_SIMPLE_SCU_CARD=y
 CONFIG_SND_AUDIO_GRAPH_CARD=y
 CONFIG_USB=y
 CONFIG_USB_OTG=y
@@ -327,6 +321,9 @@ CONFIG_NLS_ISO8859_1=y
 CONFIG_CRYPTO_ANSI_CPRNG=y
 # CONFIG_CRYPTO_DEV_VIRTIO is not set
 CONFIG_CRYPTO_DEV_CCREE=y
+CONFIG_DMA_CMA=y
+CONFIG_CMA_SIZE_MBYTES=128
+CONFIG_CMA_ALIGNMENT=9
 CONFIG_PRINTK_TIME=y
 CONFIG_MAGIC_SYSRQ=y
 CONFIG_DEBUG_KERNEL=y
-- 
2.17.1

