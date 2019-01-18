Return-Path: <SRS0=9p1a=P2=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1762C4363B
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 18 Jan 2019 10:48:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 93C472087E
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 18 Jan 2019 10:48:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=fpond.eu header.i=@fpond.eu header.b="VhUdhnaT"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726593AbfARKsb (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 18 Jan 2019 05:48:31 -0500
Received: from mo4-p02-ob.smtp.rzone.de ([81.169.146.170]:16022 "EHLO
        mo4-p02-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726780AbfARKsb (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 18 Jan 2019 05:48:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1547808508;
        s=strato-dkim-0002; d=fpond.eu;
        h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=B21LhsefrCWxu5LZT6yWPYFImFeTnqwoOe2GywmaDRw=;
        b=VhUdhnaTn/7kTGG9Rdwrmwau57e6KFbXDwwOpSQlfU72EYh1WhjAyUIvwXApFWNlTD
        Hb8Oju/j+beCLWgEdP/BIf5bZNe7rBnAoRbCK9/rud2p/gOQ7Q6U5991hPxtLa742/kl
        W1j8EL3jRl1HfT2sLrdB0NswaqWPYkM830zNPZEesxCA+nph+tJICc3L9liYEED0hQqZ
        u/A4bCxunaB1XJXZosNbMwfC1U9/lRXCfNDZETa5vqNQmvN6aPb3DbOu72NOSi5YHvhE
        qoISnqhzg6d17dT9MUwwMtMPBcX1VR2uIaxC79lHMUc+lqBaUZbAxCJaA48UrEywhHo7
        5TtA==
X-RZG-AUTH: ":OWANVUa4dPFUgKR/3dpvnYP0Np73dmm4I5W0/AvA67Ot4fvR8GZZd0rmoQ=="
X-RZG-CLASS-ID: mo00
Received: from groucho.site
        by smtp.strato.de (RZmta 44.9 DYNA|AUTH)
        with ESMTPSA id V028b8v0IAmAnyG
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA (curve secp521r1 with 521 ECDH bits, eq. 15360 bits RSA))
        (Client did not present a certificate);
        Fri, 18 Jan 2019 11:48:10 +0100 (CET)
From:   Ulrich Hecht <uli+renesas@fpond.eu>
To:     linux-renesas-soc@vger.kernel.org
Cc:     horms@verge.net.au, geert@linux-m68k.org,
        khiem.nguyen.xt@renesas.com, dien.pham.ry@renesas.com,
        takeshi.kihara.df@renesas.com, Ulrich Hecht <uli+renesas@fpond.eu>
Subject: [PATCH v2 4/5] arm64: dts: r8a7796: Add cpuidle support for CA53 cores
Date:   Fri, 18 Jan 2019 11:47:53 +0100
Message-Id: <1547808474-19427-5-git-send-email-uli+renesas@fpond.eu>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1547808474-19427-1-git-send-email-uli+renesas@fpond.eu>
References: <1547808474-19427-1-git-send-email-uli+renesas@fpond.eu>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Dien Pham <dien.pham.ry@renesas.com>

Enable cpuidle (core shutdown) support for R-Car M3-W CA53 cores.

Signed-off-by: Dien Pham <dien.pham.ry@renesas.com>
Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
Signed-off-by: Ulrich Hecht <uli+renesas@fpond.eu>
---
 arch/arm64/boot/dts/renesas/r8a7796.dtsi | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a7796.dtsi b/arch/arm64/boot/dts/renesas/r8a7796.dtsi
index 212ffd6..81af1ee 100644
--- a/arch/arm64/boot/dts/renesas/r8a7796.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a7796.dtsi
@@ -188,6 +188,7 @@
 			power-domains = <&sysc R8A7796_PD_CA53_CPU0>;
 			next-level-cache = <&L2_CA53>;
 			enable-method = "psci";
+			cpu-idle-states = <&CPU_SLEEP_1>;
 			clocks = <&cpg CPG_CORE R8A7796_CLK_Z2>;
 			operating-points-v2 = <&cluster1_opp>;
 			capacity-dmips-mhz = <535>;
@@ -200,6 +201,7 @@
 			power-domains = <&sysc R8A7796_PD_CA53_CPU1>;
 			next-level-cache = <&L2_CA53>;
 			enable-method = "psci";
+			cpu-idle-states = <&CPU_SLEEP_1>;
 			clocks = <&cpg CPG_CORE R8A7796_CLK_Z2>;
 			operating-points-v2 = <&cluster1_opp>;
 			capacity-dmips-mhz = <535>;
@@ -212,6 +214,7 @@
 			power-domains = <&sysc R8A7796_PD_CA53_CPU2>;
 			next-level-cache = <&L2_CA53>;
 			enable-method = "psci";
+			cpu-idle-states = <&CPU_SLEEP_1>;
 			clocks = <&cpg CPG_CORE R8A7796_CLK_Z2>;
 			operating-points-v2 = <&cluster1_opp>;
 			capacity-dmips-mhz = <535>;
@@ -224,6 +227,7 @@
 			power-domains = <&sysc R8A7796_PD_CA53_CPU3>;
 			next-level-cache = <&L2_CA53>;
 			enable-method = "psci";
+			cpu-idle-states = <&CPU_SLEEP_1>;
 			clocks = <&cpg CPG_CORE R8A7796_CLK_Z2>;
 			operating-points-v2 = <&cluster1_opp>;
 			capacity-dmips-mhz = <535>;
@@ -254,6 +258,15 @@
 				exit-latency-us = <500>;
 				min-residency-us = <4000>;
 			};
+
+			CPU_SLEEP_1: cpu-sleep-1 {
+				compatible = "arm,idle-state";
+				arm,psci-suspend-param = <0x0010000>;
+				local-timer-stop;
+				entry-latency-us = <700>;
+				exit-latency-us = <700>;
+				min-residency-us = <5000>;
+			};
 		};
 	};
 
-- 
2.7.4

