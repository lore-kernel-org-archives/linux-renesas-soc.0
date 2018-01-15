Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from o1.7nn.fshared.sendgrid.net ([167.89.55.65]:48635 "EHLO
        o1.7nn.fshared.sendgrid.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S965162AbeAOM7S (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 15 Jan 2018 07:59:18 -0500
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
To: linux-renesas-soc@vger.kernel.org,
        Simon Horman <horms@verge.net.au>
Cc: geert@glider.be, Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: [PATCH] [LOCAL] arm64: renesas_defconfig: Use a default 128MB of CMA
Date: Mon, 15 Jan 2018 12:59:16 +0000 (UTC)
Message-Id: <1516021154-17400-1-git-send-email-kieran.bingham@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Our media tests frequently need large areas of CMA.
Define the default allocation to be 128 MBytes to support
larger use-cases.

Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
Acked-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---

v1.1
 - Collected Laurent's Acked-by


 arch/arm64/configs/renesas_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/renesas_defconfig b/arch/arm64/configs/renesas_defconfig
index b1aeb5f366c5..d150d8c4b5df 100644
--- a/arch/arm64/configs/renesas_defconfig
+++ b/arch/arm64/configs/renesas_defconfig
@@ -87,6 +87,7 @@ CONFIG_CAN_RCAR_CANFD=y
 CONFIG_DEVTMPFS=y
 CONFIG_DEVTMPFS_MOUNT=y
 CONFIG_DMA_CMA=y
+CONFIG_CMA_SIZE_MBYTES=128
 CONFIG_CMA_ALIGNMENT=9
 CONFIG_MTD=y
 CONFIG_MTD_BLOCK=y
-- 
2.7.4
