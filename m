Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:46087 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933608AbdIYHx7 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 25 Sep 2017 03:53:59 -0400
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH] ARM: multi_v7_defconfig: Enable BQ32000 RTC driver
Date: Mon, 25 Sep 2017 09:53:37 +0200
Message-Id: <545dc83ed09b5c04f663b766a92cbc8bb02c5f15.1506325167.git.horms+renesas@verge.net.au>
In-Reply-To: <cover.1506325167.git.horms+renesas@verge.net.au>
References: <cover.1506325167.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Biju Das <biju.das@bp.renesas.com>

The iWave RZ/G1M Q7 SOM supports RTC (TI BQ32000).
To increase hardware support enable the driver in the
multi_v7_defconfig multiplatform configuration.

Signed-off-by: Biju Das <biju.das@bp.renesas.com>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm/configs/multi_v7_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
index 0cacdbf84a71..90f546766f38 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -767,6 +767,7 @@ CONFIG_RTC_DRV_MAX8997=m
 CONFIG_RTC_DRV_MAX77686=y
 CONFIG_RTC_DRV_RK808=m
 CONFIG_RTC_DRV_RS5C372=m
+CONFIG_RTC_DRV_BQ32K=m
 CONFIG_RTC_DRV_PALMAS=y
 CONFIG_RTC_DRV_ST_LPC=y
 CONFIG_RTC_DRV_TWL4030=y
-- 
2.1.4
