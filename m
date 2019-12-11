Return-Path: <SRS0=2fsb=2B=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2177EC2D0C7
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 11 Dec 2019 13:52:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E9F6F21556
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 11 Dec 2019 13:52:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729228AbfLKNwZ (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 11 Dec 2019 08:52:25 -0500
Received: from albert.telenet-ops.be ([195.130.137.90]:43012 "EHLO
        albert.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729511AbfLKNwZ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 11 Dec 2019 08:52:25 -0500
Received: from ramsan ([84.195.182.253])
        by albert.telenet-ops.be with bizsmtp
        id cdsP2100j5USYZQ06dsPi0; Wed, 11 Dec 2019 14:52:24 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1if2Pf-00014C-MF; Wed, 11 Dec 2019 14:52:23 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1if2Pf-0006yb-LI; Wed, 11 Dec 2019 14:52:23 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 1/4] ARM: dts: sh73a0: Rename twd clock to periph clock
Date:   Wed, 11 Dec 2019 14:52:19 +0100
Message-Id: <20191211135222.26770-2-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191211135222.26770-1-geert+renesas@glider.be>
References: <20191211135222.26770-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The "TWD" clock is actually the Cortex-A9 MPCore "PERIPHCLK" clock,
which not only clocks the private timers and watchdogs (TWD), but also
the interrupt controller and global timer.

Hence rename it from "twd" to "periph".

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v2:
  - No changes.
---
 arch/arm/boot/dts/sh73a0.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/sh73a0.dtsi b/arch/arm/boot/dts/sh73a0.dtsi
index 8b35ff4030ef9767..9093b3b9fc0cbd1d 100644
--- a/arch/arm/boot/dts/sh73a0.dtsi
+++ b/arch/arm/boot/dts/sh73a0.dtsi
@@ -43,7 +43,7 @@
 		compatible = "arm,cortex-a9-twd-timer";
 		reg = <0xf0000600 0x20>;
 		interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_EDGE_RISING)>;
-		clocks = <&twd_clk>;
+		clocks = <&periph_clk>;
 	};
 
 	gic: interrupt-controller@f0001000 {
@@ -812,7 +812,7 @@
 			clock-div = <13>;
 			clock-mult = <1>;
 		};
-		twd_clk: twd {
+		periph_clk: periph {
 			compatible = "fixed-factor-clock";
 			clocks = <&cpg_clocks SH73A0_CLK_Z>;
 			#clock-cells = <0>;
-- 
2.17.1

