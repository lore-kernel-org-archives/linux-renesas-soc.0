Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relay5-d.mail.gandi.net ([217.70.183.197]:39031 "EHLO
        relay5-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751274AbdHXItC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 24 Aug 2017 04:49:02 -0400
From: Jacopo Mondi <jacopo+renesas@jmondi.org>
To: horms@verge.net.au
Cc: Jacopo Mondi <jacopo+renesas@jmondi.org>, magnus.damm@gmail.com,
        robh+dt@kernel.org, mark.rutland@arm.com, linux@armlinux.org.uk,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH 1/4] arm: dts: gr-peach: Remove empty line
Date: Thu, 24 Aug 2017 10:48:40 +0200
Message-Id: <1503564523-31899-2-git-send-email-jacopo+renesas@jmondi.org>
In-Reply-To: <1503564523-31899-1-git-send-email-jacopo+renesas@jmondi.org>
References: <1503564523-31899-1-git-send-email-jacopo+renesas@jmondi.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Remove an empty line in gr-peach device tree source file.

Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
 arch/arm/boot/dts/r7s72100-gr-peach.dts | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/boot/dts/r7s72100-gr-peach.dts b/arch/arm/boot/dts/r7s72100-gr-peach.dts
index a1b2aef9..1c40a1a 100644
--- a/arch/arm/boot/dts/r7s72100-gr-peach.dts
+++ b/arch/arm/boot/dts/r7s72100-gr-peach.dts
@@ -28,7 +28,6 @@
 	memory@20000000 {
 		device_type = "memory";
 		reg = <0x20000000 0x00a00000>;
-
 	};
 
 	lbsc {
-- 
2.7.4
