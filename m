Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor2.renesas.com ([210.160.252.172]:5386 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725988AbeLGLgg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 7 Dec 2018 06:36:36 -0500
From: Biju Das <biju.das@bp.renesas.com>
To: Simon Horman <horms@verge.net.au>
Cc: Biju Das <biju.das@bp.renesas.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-rtc@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: [PATCH v4 4/5] ARM: shmobile: Enable NXP pcf85363 rtc in shmobile_defconfig
Date: Fri,  7 Dec 2018 11:27:45 +0000
Message-Id: <1544182066-31528-5-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1544182066-31528-1-git-send-email-biju.das@bp.renesas.com>
References: <1544182066-31528-1-git-send-email-biju.das@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

The iWave RZ/G1C SBC supports RTC (NXP pcf85263). To increase hardware
support enable the driver in the shmobile_defconfig multiplatform
configuration.

Signed-off-by: Biju Das <biju.das@bp.renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
V1-->V2
	* No change.
V2-->V3
	* No change.
V3-->V4
	* No Change.
---
 arch/arm/configs/shmobile_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/configs/shmobile_defconfig b/arch/arm/configs/shmobile_defconfig
index 9e5a5ad..fdac4e4 100644
--- a/arch/arm/configs/shmobile_defconfig
+++ b/arch/arm/configs/shmobile_defconfig
@@ -177,6 +177,7 @@ CONFIG_LEDS_CLASS=y
 CONFIG_LEDS_GPIO=y
 CONFIG_RTC_CLASS=y
 CONFIG_RTC_DRV_RS5C372=y
+CONFIG_RTC_DRV_PCF85363=y
 CONFIG_RTC_DRV_BQ32K=y
 CONFIG_RTC_DRV_S35390A=y
 CONFIG_RTC_DRV_RX8581=y
-- 
2.7.4
