Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:37491 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1758755AbdEMXQa (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 13 May 2017 19:16:30 -0400
Received: from avalon.bb.dnainternet.fi (dfj612ybrt5fhg77mgycy-3.rev.dnainternet.fi [IPv6:2001:14ba:21f5:5b00:2e86:4862:ef6a:2804])
        by galahad.ideasonboard.com (Postfix) with ESMTPSA id 7FE3420B95
        for <linux-renesas-soc@vger.kernel.org>; Sun, 14 May 2017 01:16:22 +0200 (CEST)
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: linux-renesas-soc@vger.kernel.org
Subject: [PATCH v5 6/6] ARM: shmobile: dts: Switch to panel-lvds bindings for Mitsubishi panels
Date: Sun, 14 May 2017 02:16:18 +0300
Message-Id: <20170513231618.1715-7-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To: <20170513231618.1715-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20170513231618.1715-1-laurent.pinchart+renesas@ideasonboard.com>
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
