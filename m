Return-Path: <SRS0=9p1a=P2=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2333C43387
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 18 Jan 2019 10:48:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E1847204EC
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 18 Jan 2019 10:48:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=fpond.eu header.i=@fpond.eu header.b="ZSsw8l2u"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726810AbfARKsa (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 18 Jan 2019 05:48:30 -0500
Received: from mo4-p01-ob.smtp.rzone.de ([85.215.255.54]:27775 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726031AbfARKsa (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 18 Jan 2019 05:48:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1547808508;
        s=strato-dkim-0002; d=fpond.eu;
        h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=SRya3jP5IaWIDd3jJ0GT9MhpmfyeLLWePFeR310Q2No=;
        b=ZSsw8l2uQm7PKLGpGlRM06+9OmgfoYycwy6fDGR2hHAJKQ9x462t13UQe2kHtjoeF+
        npfPiziaeyEmOQs3FQJ2GcIDX6slndO6dQB0S0pvonzh7bNsCn16UE0DG+IgaacEQiWX
        Dlrr88pYc+3jem1sdnPMWsdTdNEb6tnGvVQFJfhRX/SXfmVIP36tey79whNrkdal06a8
        zs0/IkeJwf1NMcKtsSlWUaLU2bx3lHaZrWYPenjA3xXYDifkZqwsKKEQtgEuXfrgMVJG
        DlXHrxnPhjbx43gs/flX9Cwx1G5z0kjM2T9qbTxdg35SrGB3J4hyokm71+GaR9f+svHx
        efLQ==
X-RZG-AUTH: ":OWANVUa4dPFUgKR/3dpvnYP0Np73dmm4I5W0/AvA67Ot4fvR8GZZd0rmoQ=="
X-RZG-CLASS-ID: mo00
Received: from groucho.site
        by smtp.strato.de (RZmta 44.9 DYNA|AUTH)
        with ESMTPSA id V028b8v0IAm7nyB
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA (curve secp521r1 with 521 ECDH bits, eq. 15360 bits RSA))
        (Client did not present a certificate);
        Fri, 18 Jan 2019 11:48:07 +0100 (CET)
From:   Ulrich Hecht <uli+renesas@fpond.eu>
To:     linux-renesas-soc@vger.kernel.org
Cc:     horms@verge.net.au, geert@linux-m68k.org,
        khiem.nguyen.xt@renesas.com, dien.pham.ry@renesas.com,
        takeshi.kihara.df@renesas.com, Ulrich Hecht <uli+renesas@fpond.eu>
Subject: [PATCH v2 2/5] arm64: dts: r8a7795: Add cpuidle support for CA53 cores
Date:   Fri, 18 Jan 2019 11:47:51 +0100
Message-Id: <1547808474-19427-3-git-send-email-uli+renesas@fpond.eu>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1547808474-19427-1-git-send-email-uli+renesas@fpond.eu>
References: <1547808474-19427-1-git-send-email-uli+renesas@fpond.eu>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Dien Pham <dien.pham.ry@renesas.com>

Enables cpuidle (core shutdown) support for R-Car H3 CA53 cores.

Signed-off-by: Dien Pham <dien.pham.ry@renesas.com>
Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
Signed-off-by: Ulrich Hecht <uli+renesas@fpond.eu>
---
 arch/arm64/boot/dts/renesas/r8a7795.dtsi | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a7795.dtsi b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
index 7ae974d..483ba3b 100644
--- a/arch/arm64/boot/dts/renesas/r8a7795.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
@@ -211,6 +211,7 @@
 			power-domains = <&sysc R8A7795_PD_CA53_CPU0>;
 			next-level-cache = <&L2_CA53>;
 			enable-method = "psci";
+			cpu-idle-states = <&CPU_SLEEP_1>;
 			clocks = <&cpg CPG_CORE R8A7795_CLK_Z2>;
 			operating-points-v2 = <&cluster1_opp>;
 			capacity-dmips-mhz = <535>;
@@ -223,6 +224,7 @@
 			power-domains = <&sysc R8A7795_PD_CA53_CPU1>;
 			next-level-cache = <&L2_CA53>;
 			enable-method = "psci";
+			cpu-idle-states = <&CPU_SLEEP_1>;
 			clocks = <&cpg CPG_CORE R8A7795_CLK_Z2>;
 			operating-points-v2 = <&cluster1_opp>;
 			capacity-dmips-mhz = <535>;
@@ -235,6 +237,7 @@
 			power-domains = <&sysc R8A7795_PD_CA53_CPU2>;
 			next-level-cache = <&L2_CA53>;
 			enable-method = "psci";
+			cpu-idle-states = <&CPU_SLEEP_1>;
 			clocks = <&cpg CPG_CORE R8A7795_CLK_Z2>;
 			operating-points-v2 = <&cluster1_opp>;
 			capacity-dmips-mhz = <535>;
@@ -247,6 +250,7 @@
 			power-domains = <&sysc R8A7795_PD_CA53_CPU3>;
 			next-level-cache = <&L2_CA53>;
 			enable-method = "psci";
+			cpu-idle-states = <&CPU_SLEEP_1>;
 			clocks = <&cpg CPG_CORE R8A7795_CLK_Z2>;
 			operating-points-v2 = <&cluster1_opp>;
 			capacity-dmips-mhz = <535>;
@@ -277,6 +281,15 @@
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

