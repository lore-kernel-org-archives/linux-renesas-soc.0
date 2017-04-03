Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relay4-d.mail.gandi.net ([217.70.183.196]:56083 "EHLO
        relay4-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751803AbdDCQDc (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 3 Apr 2017 12:03:32 -0400
From: Jacopo Mondi <jacopo+renesas@jmondi.org>
To: chris.brandt@renesas.com, horms+renesas@verge.net.au,
        geert@linux-m68k.org, robh+dt@kernel.org, mark.rutland@arm.com
Cc: rtc-linux@googlegroups.com, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH] arm: dts: genmai: Enable rtc and rtc_x1 clock
Date: Mon,  3 Apr 2017 18:03:18 +0200
Message-Id: <1491235398-26549-1-git-send-email-jacopo+renesas@jmondi.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Enable the 32.768 kHz RTC_X1 clock by setting the frequency value to
non-zero and enable the realtime clock.

Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---

This patch depends on Chris Brandt's series
"rtc: Reuse rtc-sh driver to support RZ/A1"
Please queue this on top of that.

 arch/arm/boot/dts/r7s72100-genmai.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm/boot/dts/r7s72100-genmai.dts b/arch/arm/boot/dts/r7s72100-genmai.dts
index 118a8e2..52a7b58 100644
--- a/arch/arm/boot/dts/r7s72100-genmai.dts
+++ b/arch/arm/boot/dts/r7s72100-genmai.dts
@@ -44,6 +44,10 @@
 	clock-frequency = <48000000>;
 };

+&rtc_x1_clk {
+	clock-frequency = <32768>;
+};
+
 &mtu2 {
 	status = "okay";
 };
@@ -59,6 +63,10 @@
 	};
 };

+&rtc {
+	status = "okay";
+};
+
 &scif2 {
 	status = "okay";
 };
--
2.7.4
