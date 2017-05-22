Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:46181 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1757043AbdEVMar (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 22 May 2017 08:30:47 -0400
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 14/14] ARM: dts: renesas: Switch to panel-lvds bindings for Mitsubishi panels
Date: Mon, 22 May 2017 14:30:24 +0200
Message-Id: <2ae0fcc57e00c11fae80678e2a9fabbeec82a185.1495455272.git.horms+renesas@verge.net.au>
In-Reply-To: <cover.1495455272.git.horms+renesas@verge.net.au>
References: <cover.1495455272.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

The aa104xd12 and aa121td01 panels are LVDS panels, not DPI panels.
Use the correct DT bindings.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm/boot/dts/r8a77xx-aa104xd12-panel.dtsi | 3 ++-
 arch/arm/boot/dts/r8a77xx-aa121td01-panel.dtsi | 3 ++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/r8a77xx-aa104xd12-panel.dtsi b/arch/arm/boot/dts/r8a77xx-aa104xd12-panel.dtsi
index 65cb50f0c29f..238d14bb0ebe 100644
--- a/arch/arm/boot/dts/r8a77xx-aa104xd12-panel.dtsi
+++ b/arch/arm/boot/dts/r8a77xx-aa104xd12-panel.dtsi
@@ -10,10 +10,11 @@
 
 / {
 	panel {
-		compatible = "mitsubishi,aa104xd12", "panel-dpi";
+		compatible = "mitsubishi,aa104xd12", "panel-lvds";
 
 		width-mm = <210>;
 		height-mm = <158>;
+		data-mapping = "jeida-18";
 
 		panel-timing {
 			/* 1024x768 @65Hz */
diff --git a/arch/arm/boot/dts/r8a77xx-aa121td01-panel.dtsi b/arch/arm/boot/dts/r8a77xx-aa121td01-panel.dtsi
index a07ebf8f6938..04aafd479775 100644
--- a/arch/arm/boot/dts/r8a77xx-aa121td01-panel.dtsi
+++ b/arch/arm/boot/dts/r8a77xx-aa121td01-panel.dtsi
@@ -10,10 +10,11 @@
 
 / {
 	panel {
-		compatible = "mitsubishi,aa121td01", "panel-dpi";
+		compatible = "mitsubishi,aa121td01", "panel-lvds";
 
 		width-mm = <261>;
 		height-mm = <163>;
+		data-mapping = "jeida-18";
 
 		panel-timing {
 			/* 1280x800 @60Hz */
-- 
2.1.4
