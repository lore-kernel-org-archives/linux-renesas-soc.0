Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from smtp-4.sys.kth.se ([130.237.48.193]:45498 "EHLO
        smtp-4.sys.kth.se" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751876AbdKZAu3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 25 Nov 2017 19:50:29 -0500
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
To: linux-renesas-soc@vger.kernel.org
Cc: Kieran Bingham <kieran.bingham@ideasonboard.com>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 3/3] arm64: dts: renesas: eagle: enable VIN
Date: Sun, 26 Nov 2017 01:50:12 +0100
Message-Id: <20171126005012.22573-4-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20171126005012.22573-1-niklas.soderlund+renesas@ragnatech.se>
References: <20171126005012.22573-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 arch/arm64/boot/dts/renesas/r8a77970-eagle.dts | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a77970-eagle.dts b/arch/arm64/boot/dts/renesas/r8a77970-eagle.dts
index 41e3b4521a5aa39e..d3c6bcb82a5176c6 100644
--- a/arch/arm64/boot/dts/renesas/r8a77970-eagle.dts
+++ b/arch/arm64/boot/dts/renesas/r8a77970-eagle.dts
@@ -226,5 +226,21 @@
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
 /* FAKRA Overlay */
 #include "eagle-fakra.dtsi"
\ No newline at end of file
-- 
2.15.0
