Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mo4-p02-ob.smtp.rzone.de ([85.215.255.84]:22614 "EHLO
        mo4-p02-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732757AbeHNQlC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 14 Aug 2018 12:41:02 -0400
From: Ulrich Hecht <uli+renesas@fpond.eu>
To: laurent.pinchart@ideasonboard.com
Cc: linux-renesas-soc@vger.kernel.org, dri-devel@lists.freedesktop.org,
        jacopo+renesas@jmondi.org, kieran.bingham+renesas@ideasonboard.com,
        Koji Matsuoka <koji.matsuoka.xm@renesas.com>,
        Takeshi Kihara <takeshi.kihara.df@renesas.com>,
        Ulrich Hecht <uli+renesas@fpond.eu>
Subject: [PROTO][PATCH 07/10] arm64: dts: r8a77995-draak: set external clock for DU
Date: Tue, 14 Aug 2018 15:50:01 +0200
Message-Id: <1534254604-24204-8-git-send-email-uli+renesas@fpond.eu>
In-Reply-To: <1534254604-24204-1-git-send-email-uli+renesas@fpond.eu>
References: <1534254604-24204-1-git-send-email-uli+renesas@fpond.eu>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Koji Matsuoka <koji.matsuoka.xm@renesas.com>

Signed-off-by: Koji Matsuoka <koji.matsuoka.xm@renesas.com>
Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
Signed-off-by: Ulrich Hecht <uli+renesas@fpond.eu>
---
 arch/arm64/boot/dts/renesas/r8a77995-draak.dts | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a77995-draak.dts b/arch/arm64/boot/dts/renesas/r8a77995-draak.dts
index a8e8f26..bd5c6fa 100644
--- a/arch/arm64/boot/dts/renesas/r8a77995-draak.dts
+++ b/arch/arm64/boot/dts/renesas/r8a77995-draak.dts
@@ -2,7 +2,7 @@
 /*
  * Device Tree Source for the Draak board
  *
- * Copyright (C) 2016 Renesas Electronics Corp.
+ * Copyright (C) 2016-2018 Renesas Electronics Corp.
  * Copyright (C) 2017 Glider bvba
  */
 
@@ -269,8 +269,10 @@
 
 	clocks = <&cpg CPG_MOD 724>,
 		 <&cpg CPG_MOD 723>,
-		 <&x12_clk>;
-	clock-names = "du.0", "du.1", "dclkin.0";
+		 <&x12_clk>,
+		 <&extal_clk>;
+	clock-names = "du.0", "du.1",
+		      "dclkin.0", "extal";
 
 	ports {
 		port@0 {
-- 
2.7.4
