Return-Path: <SRS0=9p1a=P2=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08627C43172
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 18 Jan 2019 10:48:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C0A15204EC
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 18 Jan 2019 10:48:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=fpond.eu header.i=@fpond.eu header.b="rCxMfvic"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726780AbfARKsb (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 18 Jan 2019 05:48:31 -0500
Received: from mo4-p02-ob.smtp.rzone.de ([85.215.255.84]:32029 "EHLO
        mo4-p02-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726741AbfARKsb (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 18 Jan 2019 05:48:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1547808509;
        s=strato-dkim-0002; d=fpond.eu;
        h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=FV/WSebsEm50iUag4oti1K+iFHC4Tfb/FWx070O/S1Q=;
        b=rCxMfviccfvEQ7hEn18NXTuLCAjENtlAu8hXo7GTgglL5ZfPjUDFFoXF0PzDe59k9s
        iu7klDFQiklDFPvoYPVRh6Z1DiZ27pZLLuTnCkB+UFOQzUO2y5roEEASStY3G2pLXw7H
        cUw7ZzIQaGntm02W18Sli0W3VuvcgEgN7YurANLtK/ET8SPWJHj9hxcr4paVsPD2I9Az
        fN0xpAi1spt/I2AbAnIHGVFJY0DDAxbnj26fgHMxddCof1vhSUhTSSAYJGtkPqlEkDky
        WWXdVpNXytRUc5fo23i0aM05G9dmLbw5s6UvjUxB8A+Jlh92KgdKzOSsujh/ETPSbKOJ
        dlSQ==
X-RZG-AUTH: ":OWANVUa4dPFUgKR/3dpvnYP0Np73dmm4I5W0/AvA67Ot4fvR8GZZd0rmoQ=="
X-RZG-CLASS-ID: mo00
Received: from groucho.site
        by smtp.strato.de (RZmta 44.9 DYNA|AUTH)
        with ESMTPSA id V028b8v0IAmMnyN
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA (curve secp521r1 with 521 ECDH bits, eq. 15360 bits RSA))
        (Client did not present a certificate);
        Fri, 18 Jan 2019 11:48:22 +0100 (CET)
From:   Ulrich Hecht <uli+renesas@fpond.eu>
To:     geert@linux-m68k.org, linux-renesas-soc@vger.kernel.org
Cc:     horms@verge.net.au, linux-serial@vger.kernel.org,
        magnus.damm@gmail.com, Ulrich Hecht <uli+renesas@fpond.eu>
Subject: [PATCH 2/2] ARM: dts: r8a7779: Add HSCIF0/1 device nodes
Date:   Fri, 18 Jan 2019 11:48:15 +0100
Message-Id: <1547808495-19509-3-git-send-email-uli+renesas@fpond.eu>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1547808495-19509-1-git-send-email-uli+renesas@fpond.eu>
References: <1547808495-19509-1-git-send-email-uli+renesas@fpond.eu>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Based on Rev. 1.00 of the R-Car H1 datasheet.

Signed-off-by: Ulrich Hecht <uli+renesas@fpond.eu>
---
 arch/arm/boot/dts/r8a7779.dtsi | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/arch/arm/boot/dts/r8a7779.dtsi b/arch/arm/boot/dts/r8a7779.dtsi
index 3bc133d..34e468c 100644
--- a/arch/arm/boot/dts/r8a7779.dtsi
+++ b/arch/arm/boot/dts/r8a7779.dtsi
@@ -287,6 +287,32 @@
 		status = "disabled";
 	};
 
+	hscif0: serial@ffe48000 {
+		compatible = "renesas,hscif-r8a7779",
+			     "renesas,rcar-gen1-hscif", "renesas,hscif";
+		reg = <0xffe48000 96>;
+		interrupts = <GIC_SPI 94 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&mstp0_clks R8A7779_CLK_HSCIF0>,
+			 <&cpg_clocks R8A7779_CLK_S>,
+			 <&scif_clk>;
+		clock-names = "fck", "brg_int", "scif_clk";
+		power-domains = <&cpg_clocks>;
+		status = "disabled";
+	};
+
+	hscif1: serial@ffe49000 {
+		compatible = "renesas,hscif-r8a7779",
+			     "renesas,rcar-gen1-hscif", "renesas,hscif";
+		reg = <0xffe49000 96>;
+		interrupts = <GIC_SPI 95 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&mstp0_clks R8A7779_CLK_HSCIF1,
+			 <&cpg_clocks R8A7779_CLK_S>,
+			 <&scif_clk>;
+		clock-names = "fck", "brg_int", "scif_clk";
+		power-domains = <&cpg_clocks>;
+		status = "disabled";
+	};
+
 	pfc: pin-controller@fffc0000 {
 		compatible = "renesas,pfc-r8a7779";
 		reg = <0xfffc0000 0x23c>;
-- 
2.7.4

