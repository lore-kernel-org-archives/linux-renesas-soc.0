Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-yw0-f169.google.com ([209.85.161.169]:33695 "EHLO
        mail-yw0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753251AbdGGCJv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 6 Jul 2017 22:09:51 -0400
Received: by mail-yw0-f169.google.com with SMTP id x125so8356012ywa.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 06 Jul 2017 19:09:51 -0700 (PDT)
From: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
To: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>
Cc: devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Vladimir Barinov <vladimir.barinov@cogentembedded.com>
Subject: [PATCH] arm64: dts: renesas: ulcb: Enable I2C for DVFS device
Date: Fri,  7 Jul 2017 05:09:46 +0300
Message-Id: <1499393386-11554-1-git-send-email-vladimir.barinov@cogentembedded.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Vladimir Barinov <vladimir.barinov+renesas@cogentembedded.com>

This enables I2C for DVFS device for ULCB board

Signed-off-by: Vladimir Barinov <vladimir.barinov+renesas@cogentembedded.com>
---
 arch/arm64/boot/dts/renesas/ulcb.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/ulcb.dtsi b/arch/arm64/boot/dts/renesas/ulcb.dtsi
index d1a3f3b..6e5ffc8 100644
--- a/arch/arm64/boot/dts/renesas/ulcb.dtsi
+++ b/arch/arm64/boot/dts/renesas/ulcb.dtsi
@@ -189,6 +189,10 @@
 	};
 };
 
+&i2c_dvfs {
+	status = "okay";
+};
+
 &ohci1 {
 	status = "okay";
 };
-- 
1.9.1
