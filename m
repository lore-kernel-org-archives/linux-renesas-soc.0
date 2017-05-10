Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:57762 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752045AbdEJHFH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 10 May 2017 03:05:07 -0400
Received: from avalon.ideasonboard.com (syi-ogw1-1554.syi.inet.fi [194.89.38.18])
        by galahad.ideasonboard.com (Postfix) with ESMTPSA id E0D51203A2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 10 May 2017 09:04:00 +0200 (CEST)
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: linux-renesas-soc@vger.kernel.org
Subject: [PATCH v4 7/7] ARM: shmobile: dts: Switch to panel-lvds bindings for Mitsubishi panels
Date: Wed, 10 May 2017 10:04:58 +0300
Message-Id: <20170510070458.21193-8-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To: <20170510070458.21193-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20170510070458.21193-1-laurent.pinchart+renesas@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

The aa104xd12 and aa121td01 panels are LVDS panels, not DPI panels.
Use the correct DT bindings.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
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
Regards,

Laurent Pinchart
