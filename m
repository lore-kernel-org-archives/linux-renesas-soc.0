Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f67.google.com ([209.85.215.67]:57023 "EHLO
        mail-lf0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751598AbdKHNJD (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 8 Nov 2017 08:09:03 -0500
Received: by mail-lf0-f67.google.com with SMTP id 90so3045081lfs.13
        for <linux-renesas-soc@vger.kernel.org>; Wed, 08 Nov 2017 05:09:03 -0800 (PST)
From: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
To: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>
Cc: devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Vladimir Barinov <vladimir.barinov@cogentembedded.com>
Subject: [PATCH] arm64: dts: ulcb-kf: add dr_mode property for USB2.0 channel 0
Date: Wed,  8 Nov 2017 16:09:00 +0300
Message-Id: <1510146540-31881-1-git-send-email-vladimir.barinov@cogentembedded.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

ULCB-KF has a USB2.0 dual-role channel (CN13).
This adds dr_mode property for USB2.0 channel 0 (EHCI/OHCI and HS-USB)
as "otg".

Signed-off-by: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
---
 arch/arm64/boot/dts/renesas/ulcb-kf.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/ulcb-kf.dtsi b/arch/arm64/boot/dts/renesas/ulcb-kf.dtsi
index 2ecb6ac..ccf5409 100644
--- a/arch/arm64/boot/dts/renesas/ulcb-kf.dtsi
+++ b/arch/arm64/boot/dts/renesas/ulcb-kf.dtsi
@@ -29,6 +29,7 @@
 };
 
 &ehci0 {
+	dr_mode = "otg";
 	status = "okay";
 };
 
@@ -41,6 +42,7 @@
 };
 
 &hsusb {
+	dr_mode = "otg";
 	status = "okay";
 };
 
@@ -133,6 +135,7 @@
 };
 
 &ohci0 {
+	dr_mode = "otg";
 	status = "okay";
 };
 
-- 
1.9.1
