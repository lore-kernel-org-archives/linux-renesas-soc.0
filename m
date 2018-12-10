Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor1.renesas.com ([210.160.252.171]:47101 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727396AbeLJON4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 10 Dec 2018 09:13:56 -0500
From: Biju Das <biju.das@bp.renesas.com>
To: Simon Horman <horms+renesas@verge.net.au>
Cc: Biju Das <biju.das@bp.renesas.com>,
        Russell King <linux@armlinux.org.uk>,
        Alexandre Torgue <alexandre.torgue@st.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Tony Lindgren <tony@atomide.com>,
        Stefan Agner <stefan@agner.ch>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Stefan Wahren <stefan.wahren@i2se.com>,
        Olof Johansson <olof@lixom.net>,
        linux-arm-kernel@lists.infradead.org,
        Simon Horman <horms@verge.net.au>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH] ARM: multi_v7_defconfig: Enable NXP pcf85363 rtc
Date: Mon, 10 Dec 2018 14:05:12 +0000
Message-Id: <1544450712-44226-1-git-send-email-biju.das@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

The iWave RZ/G1C SBC supports RTC (NXP pcf85263). To increase
hardware support enable the driver in the multi_v7_defconfig
multiplatform configuration.

Signed-off-by: Biju Das <biju.das@bp.renesas.com>
---
 arch/arm/configs/multi_v7_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
index f29f49a..7762815 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -826,6 +826,7 @@ CONFIG_RTC_DRV_MAX8997=m
 CONFIG_RTC_DRV_MAX77686=y
 CONFIG_RTC_DRV_RK808=m
 CONFIG_RTC_DRV_RS5C372=m
+CONFIG_RTC_DRV_PCF85363=m
 CONFIG_RTC_DRV_BQ32K=m
 CONFIG_RTC_DRV_TWL4030=y
 CONFIG_RTC_DRV_PALMAS=y
-- 
2.7.4
