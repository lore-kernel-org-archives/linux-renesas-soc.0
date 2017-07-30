Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from smtp-4.sys.kth.se ([130.237.48.193]:34341 "EHLO
        smtp-4.sys.kth.se" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754611AbdG3U5n (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 30 Jul 2017 16:57:43 -0400
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [RFC 4/5] arm64: dts: renesas: salvator: enable VIN
Date: Sun, 30 Jul 2017 22:56:50 +0200
Message-Id: <20170730205651.6478-5-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20170730205651.6478-1-niklas.soderlund+renesas@ragnatech.se>
References: <20170730205651.6478-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 arch/arm64/boot/dts/renesas/salvator-common.dtsi | 32 ++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/salvator-common.dtsi b/arch/arm64/boot/dts/renesas/salvator-common.dtsi
index aef35e0b685a3a85..bba4976bee619d42 100644
--- a/arch/arm64/boot/dts/renesas/salvator-common.dtsi
+++ b/arch/arm64/boot/dts/renesas/salvator-common.dtsi
@@ -619,6 +619,38 @@
 	status = "okay";
 };
 
+&vin0 {
+	status = "okay";
+};
+
+&vin1 {
+	status = "okay";
+};
+
+&vin2 {
+	status = "okay";
+};
+
+&vin3 {
+	status = "okay";
+};
+
+&vin4 {
+	status = "okay";
+};
+
+&vin5 {
+	status = "okay";
+};
+
+&vin6 {
+	status = "okay";
+};
+
+&vin7 {
+	status = "okay";
+};
+
 &wdt0 {
 	timeout-sec = <60>;
 	status = "okay";
-- 
2.13.3
