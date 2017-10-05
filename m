Return-Path: <kieranbingham.mailinglists+caf_=kieranbingham=gmail.com@gmail.com>
Return-Path: <linux-kernel-owner@vger.kernel.org>
From: Jacopo Mondi <jacopo+renesas@jmondi.org>
To: horms@verge.net.au, geert@linux-m68k.org, magnus.damm@gmail.com,
        robh+dt@kernel.org, mark.rutland@arm.com, linux@armlinux.org.uk
Cc: Jacopo Mondi <jacopo+renesas@jmondi.org>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] ARM: dts: gr-peach: Fix 'leds' node name indent
Date: Thu,  5 Oct 2017 10:58:18 +0200
Message-Id: <1507193900-23801-2-git-send-email-jacopo+renesas@jmondi.org>
In-Reply-To: <1507193900-23801-1-git-send-email-jacopo+renesas@jmondi.org>
References: <1507193900-23801-1-git-send-email-jacopo+renesas@jmondi.org>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Fix 'leds' node name indent as it was wrongly aligned.

Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
 arch/arm/boot/dts/r7s72100-gr-peach.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/r7s72100-gr-peach.dts b/arch/arm/boot/dts/r7s72100-gr-peach.dts
index f2ddd11..20309ac 100644
--- a/arch/arm/boot/dts/r7s72100-gr-peach.dts
+++ b/arch/arm/boot/dts/r7s72100-gr-peach.dts
@@ -53,7 +53,7 @@
 		};
 	};
 
-leds {
+	leds {
 		status = "okay";
 		compatible = "gpio-leds";
 
-- 
2.7.4
