Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor1.renesas.com ([210.160.252.171]:37826 "EHLO
        relmlie4.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S934578AbdCVO3G (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 22 Mar 2017 10:29:06 -0400
From: Chris Brandt <chris.brandt@renesas.com>
To: Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@free-electrons.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Simon Horman <horms+renesas@verge.net.au>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Cc: rtc-linux@googlegroups.com, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Chris Brandt <chris.brandt@renesas.com>
Subject: [PATCH v2 6/7] ARM: dts: rskrza1: set rtc_x1 clock value
Date: Wed, 22 Mar 2017 10:27:53 -0400
Message-Id: <20170322142754.30888-7-chris.brandt@renesas.com>
In-Reply-To: <20170322142754.30888-1-chris.brandt@renesas.com>
References: <20170322142754.30888-1-chris.brandt@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Enable the 32.768 kHz RTC_X1 clock by setting the frequency value to
non-zero.

Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
---
 arch/arm/boot/dts/r7s72100-rskrza1.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/r7s72100-rskrza1.dts b/arch/arm/boot/dts/r7s72100-rskrza1.dts
index 02b59c5..cab5857 100644
--- a/arch/arm/boot/dts/r7s72100-rskrza1.dts
+++ b/arch/arm/boot/dts/r7s72100-rskrza1.dts
@@ -43,6 +43,10 @@
 	clock-frequency = <48000000>;
 };
 
+&rtc_x1_clk {
+	clock-frequency = <32768>;
+};
+
 &mtu2 {
 	status = "okay";
 };
-- 
2.10.1
