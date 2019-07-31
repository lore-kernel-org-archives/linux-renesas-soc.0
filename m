Return-Path: <SRS0=jr3J=V4=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71DADC32751
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 31 Jul 2019 07:37:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4209220693
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 31 Jul 2019 07:37:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726009AbfGaHhw (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 31 Jul 2019 03:37:52 -0400
Received: from xavier.telenet-ops.be ([195.130.132.52]:57412 "EHLO
        xavier.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725921AbfGaHhv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 31 Jul 2019 03:37:51 -0400
Received: from ramsan ([84.194.98.4])
        by xavier.telenet-ops.be with bizsmtp
        id jKdl2000s05gfCL01Kdl8g; Wed, 31 Jul 2019 09:37:50 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1hsjBB-0006tB-SD; Wed, 31 Jul 2019 09:37:45 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1hsjBB-0003dy-Qu; Wed, 31 Jul 2019 09:37:45 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] arm64: dts: renesas: r8a77995: draak: Fix backlight regulator name
Date:   Wed, 31 Jul 2019 09:37:44 +0200
Message-Id: <20190731073744.13963-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Currently there are two nodes named "regulator1" in the Draak DTS: a
3.3V regulator for the eMMC and the LVDS decoder, and a 12V regulator
for the backlight.  This causes the former to be overwritten by the
latter.

Fix this by renaming all regulators with numerical suffixes to use named
suffixes, which are less likely to conflict.

Fixes: 4fbd4158fe8967e9 ("arm64: dts: renesas: r8a77995: draak: Add backlight")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
I guess this is a fix for v5.3?

This fix takes a slightly different approach than commit
12105cec654cf906 ("arm64: dts: renesas: r8a77990: ebisu: Fix backlight
regulator numbering"), which just fixed the conflicting numerical
suffix.
---
 arch/arm64/boot/dts/renesas/r8a77995-draak.dts | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a77995-draak.dts b/arch/arm64/boot/dts/renesas/r8a77995-draak.dts
index 0711170b26b1fe1c..3aa2564dfdc25fff 100644
--- a/arch/arm64/boot/dts/renesas/r8a77995-draak.dts
+++ b/arch/arm64/boot/dts/renesas/r8a77995-draak.dts
@@ -97,7 +97,7 @@
 		reg = <0x0 0x48000000 0x0 0x18000000>;
 	};
 
-	reg_1p8v: regulator0 {
+	reg_1p8v: regulator-1p8v {
 		compatible = "regulator-fixed";
 		regulator-name = "fixed-1.8V";
 		regulator-min-microvolt = <1800000>;
@@ -106,7 +106,7 @@
 		regulator-always-on;
 	};
 
-	reg_3p3v: regulator1 {
+	reg_3p3v: regulator-3p3v {
 		compatible = "regulator-fixed";
 		regulator-name = "fixed-3.3V";
 		regulator-min-microvolt = <3300000>;
@@ -115,7 +115,7 @@
 		regulator-always-on;
 	};
 
-	reg_12p0v: regulator1 {
+	reg_12p0v: regulator-12p0v {
 		compatible = "regulator-fixed";
 		regulator-name = "D12.0V";
 		regulator-min-microvolt = <12000000>;
-- 
2.17.1

