Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from perceval.ideasonboard.com ([213.167.242.64]:48342 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727290AbeJRBom (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 17 Oct 2018 21:44:42 -0400
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] ARM: dts: r8a779[01]: Disable unconnected LVDS encoders
Date: Wed, 17 Oct 2018 20:48:01 +0300
Message-Id: <20181017174801.19838-1-laurent.pinchart+renesas@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

The LVDS0 encoder on Koelsh and Porter, and the LVDS1 encoder on Lager,
are enabled in DT but have no device connected to their output. This
result in spurious messages being printed to the kernel log such as

rcar-du feb00000.display: no connector for encoder /soc/lvds@feb90000, skipping

Fix it by disabling the encoders.

Fixes: 15a1ff30d8f9 ("ARM: dts: r8a7790: Convert to new LVDS DT bindings")
Fixes: e5c3f4707f39 ("ARM: dts: r8a7791: Convert to new LVDS DT bindings")
Reported-by: Simon Horman <horms@verge.net.au>
Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 arch/arm/boot/dts/r8a7790-lager.dts   | 2 --
 arch/arm/boot/dts/r8a7791-koelsch.dts | 2 --
 arch/arm/boot/dts/r8a7791-porter.dts  | 2 --
 3 files changed, 6 deletions(-)

diff --git a/arch/arm/boot/dts/r8a7790-lager.dts b/arch/arm/boot/dts/r8a7790-lager.dts
index 50312e752e2f..7b9508e83d46 100644
--- a/arch/arm/boot/dts/r8a7790-lager.dts
+++ b/arch/arm/boot/dts/r8a7790-lager.dts
@@ -489,8 +489,6 @@
 };
 
 &lvds1 {
-	status = "okay";
-
 	ports {
 		port@1 {
 			lvds_connector: endpoint {
diff --git a/arch/arm/boot/dts/r8a7791-koelsch.dts b/arch/arm/boot/dts/r8a7791-koelsch.dts
index ce22db01fbba..e6580aa0cea3 100644
--- a/arch/arm/boot/dts/r8a7791-koelsch.dts
+++ b/arch/arm/boot/dts/r8a7791-koelsch.dts
@@ -479,8 +479,6 @@
 };
 
 &lvds0 {
-	status = "okay";
-
 	ports {
 		port@1 {
 			lvds_connector: endpoint {
diff --git a/arch/arm/boot/dts/r8a7791-porter.dts b/arch/arm/boot/dts/r8a7791-porter.dts
index f02036e5de01..fefdf8238bbe 100644
--- a/arch/arm/boot/dts/r8a7791-porter.dts
+++ b/arch/arm/boot/dts/r8a7791-porter.dts
@@ -482,8 +482,6 @@
 };
 
 &lvds0 {
-	status = "okay";
-
 	ports {
 		port@1 {
 			lvds_connector: endpoint {
-- 
Regards,

Laurent Pinchart
