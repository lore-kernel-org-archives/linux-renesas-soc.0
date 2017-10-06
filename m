Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f51.google.com ([209.85.215.51]:54264 "EHLO
        mail-lf0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751423AbdJFCoC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 5 Oct 2017 22:44:02 -0400
Received: by mail-lf0-f51.google.com with SMTP id l23so12013458lfk.10
        for <linux-renesas-soc@vger.kernel.org>; Thu, 05 Oct 2017 19:44:02 -0700 (PDT)
From: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
To: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>
Cc: devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Vladimir Barinov <vladimir.barinov@cogentembedded.com>
Subject: [PATCH v2 12/18] arm64: dts: ulcb-kf: enable PCIE0/1
Date: Fri,  6 Oct 2017 05:43:59 +0300
Message-Id: <1507257839-12066-1-git-send-email-vladimir.barinov@cogentembedded.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

This supports PCIE0/1 on ULCB Kingfisher board

Signed-off-by: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Changes in version 2:
- removed status update for pcie_bus_clk

 arch/arm64/boot/dts/renesas/ulcb-kf.dtsi | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/ulcb-kf.dtsi b/arch/arm64/boot/dts/renesas/ulcb-kf.dtsi
index 46e3a34..952d2b7 100644
--- a/arch/arm64/boot/dts/renesas/ulcb-kf.dtsi
+++ b/arch/arm64/boot/dts/renesas/ulcb-kf.dtsi
@@ -52,6 +52,18 @@
 	status = "okay";
 };
 
+&pcie_bus_clk {
+	clock-frequency = <100000000>;
+};
+
+&pciec0 {
+	status = "okay";
+};
+
+&pciec1 {
+	status = "okay";
+};
+
 &pfc {
 	can0_pins: can0 {
 		groups = "can0_data_a";
-- 
1.9.1
