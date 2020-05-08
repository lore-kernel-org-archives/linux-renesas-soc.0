Return-Path: <SRS0=J9CX=6W=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6BA1C47257
	for <linux-renesas-soc@archiver.kernel.org>; Fri,  8 May 2020 09:59:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8728120870
	for <linux-renesas-soc@archiver.kernel.org>; Fri,  8 May 2020 09:59:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726897AbgEHJ71 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 8 May 2020 05:59:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34046 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725825AbgEHJ70 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 8 May 2020 05:59:26 -0400
Received: from andre.telenet-ops.be (andre.telenet-ops.be [IPv6:2a02:1800:120:4::f00:15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 627F8C05BD43
        for <linux-renesas-soc@vger.kernel.org>; Fri,  8 May 2020 02:59:26 -0700 (PDT)
Received: from ramsan ([IPv6:2a02:1810:ac12:ed60:5bb:5444:969e:23bc])
        by andre.telenet-ops.be with bizsmtp
        id c9zK2200E2zKgvk019zKQY; Fri, 08 May 2020 11:59:22 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1jWzmp-0002sb-Fp; Fri, 08 May 2020 11:59:19 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1jWzmp-0001aW-Cd; Fri, 08 May 2020 11:59:19 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>,
        Ulrich Hecht <uli+renesas@fpond.eu>
Cc:     linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] ARM: dts: r8a7740: Add missing extal2 to CPG node
Date:   Fri,  8 May 2020 11:59:18 +0200
Message-Id: <20200508095918.6061-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The Clock Pulse Generator (CPG) device node lacks the extal2 clock.
This may lead to a failure registering the "r" clock, or to a wrong
parent for the "usb24s" clock, depending on MD_CK2 pin configuration and
boot loader CPG_USBCKCR register configuration.

This went unnoticed, as this does not affect the single upstream board
configuration, which relies on the first clock input only.

Fixes: d9ffd583bf345e2e ("ARM: shmobile: r8a7740: add SoC clocks to DTS")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
To be queued in renesas-fixes for v5.7, to avoid the json-schema CPG DT
bindings conversion introducing a regression.
---
 arch/arm/boot/dts/r8a7740.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/r8a7740.dtsi b/arch/arm/boot/dts/r8a7740.dtsi
index 014805894ea71f41..0588d4446f9ac2e0 100644
--- a/arch/arm/boot/dts/r8a7740.dtsi
+++ b/arch/arm/boot/dts/r8a7740.dtsi
@@ -479,7 +479,7 @@
 		cpg_clocks: cpg_clocks@e6150000 {
 			compatible = "renesas,r8a7740-cpg-clocks";
 			reg = <0xe6150000 0x10000>;
-			clocks = <&extal1_clk>, <&extalr_clk>;
+			clocks = <&extal1_clk>, <&extal2_clk>, <&extalr_clk>;
 			#clock-cells = <1>;
 			clock-output-names = "system", "pllc0", "pllc1",
 					     "pllc2", "r",
-- 
2.17.1

