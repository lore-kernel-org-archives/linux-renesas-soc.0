Return-Path: <SRS0=xIzj=SV=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9536C282E1
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 19 Apr 2019 18:23:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 848EB222EB
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 19 Apr 2019 18:23:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727838AbfDSSWy (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 19 Apr 2019 14:22:54 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:58840 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727349AbfDSSWx (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 19 Apr 2019 14:22:53 -0400
Received: from penelope.horms.nl (unknown [62.153.215.140])
        by kirsty.vergenet.net (Postfix) with ESMTPA id D143825BDA6;
        Sat, 20 Apr 2019 00:34:22 +1000 (AEST)
Received: by penelope.horms.nl (Postfix, from userid 7100)
        id C91BDE21AF8; Fri, 19 Apr 2019 16:34:20 +0200 (CEST)
From:   Simon Horman <horms+renesas@verge.net.au>
To:     linux-renesas-soc@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 1/5] ARM: shmobile: defconfig: Refresh for v5.1-rc1
Date:   Fri, 19 Apr 2019 16:34:16 +0200
Message-Id: <80acbaee26b5a6842ec64fb7efb2d7af68921060.1555654474.git.horms+renesas@verge.net.au>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1555654474.git.horms+renesas@verge.net.au>
References: <cover.1555654474.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Geert Uytterhoeven <geert+renesas@glider.be>

Update the defconfig for Renesas ARM boards:
  - Move CMA-related config options (moved in commit ddb26d8e1e97af23
    ("dma-mapping: move CONFIG_DMA_CMA to kernel/dma/Kconfig"),
  - Drop CONFIG_DRM_RCAR_LVDS=y (auto-enabled since commit
    02f2b30032c12b1b ("drm: rcar-du: lvds: Add API to enable/disable
    clock output")),
  - Drop CONFIG_SND_SIMPLE_SCU_CARD=y (removed in commit
    c8ed6aca6b824018 ("ASoC: simple-scu-card: remove simple-scu-card")).

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm/configs/shmobile_defconfig | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/arch/arm/configs/shmobile_defconfig b/arch/arm/configs/shmobile_defconfig
index 9b0efac101ab..41e773619c51 100644
--- a/arch/arm/configs/shmobile_defconfig
+++ b/arch/arm/configs/shmobile_defconfig
@@ -43,8 +43,6 @@ CONFIG_PCI_RCAR_GEN2=y
 CONFIG_PCIE_RCAR=y
 CONFIG_DEVTMPFS=y
 CONFIG_DEVTMPFS_MOUNT=y
-CONFIG_DMA_CMA=y
-CONFIG_CMA_SIZE_MBYTES=64
 CONFIG_SIMPLE_PM_BUS=y
 CONFIG_MTD=y
 CONFIG_MTD_BLOCK=y
@@ -123,7 +121,6 @@ CONFIG_VIDEO_ADV7604=y
 CONFIG_VIDEO_ML86V7667=y
 CONFIG_DRM=y
 CONFIG_DRM_RCAR_DU=y
-CONFIG_DRM_RCAR_LVDS=y
 CONFIG_DRM_DUMB_VGA_DAC=y
 CONFIG_DRM_SII902X=y
 CONFIG_DRM_I2C_ADV7511=y
@@ -141,7 +138,6 @@ CONFIG_SND_SOC_RCAR=y
 CONFIG_SND_SOC_AK4642=y
 CONFIG_SND_SOC_SGTL5000=y
 CONFIG_SND_SOC_WM8978=y
-CONFIG_SND_SIMPLE_SCU_CARD=y
 CONFIG_USB=y
 CONFIG_USB_XHCI_HCD=y
 CONFIG_USB_XHCI_PLATFORM=y
@@ -209,6 +205,8 @@ CONFIG_NFS_V4_1=y
 CONFIG_ROOT_NFS=y
 CONFIG_NLS_CODEPAGE_437=y
 CONFIG_NLS_ISO8859_1=y
+CONFIG_DMA_CMA=y
+CONFIG_CMA_SIZE_MBYTES=64
 CONFIG_PRINTK_TIME=y
 # CONFIG_ENABLE_MUST_CHECK is not set
 CONFIG_DEBUG_KERNEL=y
-- 
2.11.0

