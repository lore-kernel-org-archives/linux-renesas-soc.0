Return-Path: <SRS0=9p1a=P2=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29FBEC43444
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 18 Jan 2019 10:48:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id F0815204EC
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 18 Jan 2019 10:48:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=fpond.eu header.i=@fpond.eu header.b="mV/7JAfU"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726162AbfARKsa (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 18 Jan 2019 05:48:30 -0500
Received: from mo4-p01-ob.smtp.rzone.de ([85.215.255.50]:22565 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726032AbfARKsa (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 18 Jan 2019 05:48:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1547808508;
        s=strato-dkim-0002; d=fpond.eu;
        h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=InwMRDkI8H6JGcUB9I7HGmlAHOM11NOdezq4km6D5FY=;
        b=mV/7JAfU9+2YNm5Tz0UJIWXTRQ/cEB7QlU/WsHJbxJk83oWoUuecgCVDtVmazntFCB
        bpOPQzQJFjFLsT/MLCc9h/oeUBs3B+o4SfRQN3P2/tZ5ZW8v9eVmqdLNebfHeGmUjPM4
        t9B54PQm8wwxpVX9c66EJnAH2Cl+8rjoHx56c+Q4OEJDDeTTimHf3V+ijI2MVvPsMTey
        xDZUHRwe05YSjDx9W9E42zIfK6ABQlR6hN3CwE1fE4O3IMGAj79fQNFG/iax3uR1XhnW
        J9pxj8PiNZMUWdM+ug03x7ffrt1Di9G8cf+bGPD0fiqAYmsijkXnLz87PeLdkzNLA2XA
        n7qQ==
X-RZG-AUTH: ":OWANVUa4dPFUgKR/3dpvnYP0Np73dmm4I5W0/AvA67Ot4fvR8GZZd0rmoQ=="
X-RZG-CLASS-ID: mo00
Received: from groucho.site
        by smtp.strato.de (RZmta 44.9 DYNA|AUTH)
        with ESMTPSA id V028b8v0IAm5nyA
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA (curve secp521r1 with 521 ECDH bits, eq. 15360 bits RSA))
        (Client did not present a certificate);
        Fri, 18 Jan 2019 11:48:05 +0100 (CET)
From:   Ulrich Hecht <uli+renesas@fpond.eu>
To:     linux-renesas-soc@vger.kernel.org
Cc:     horms@verge.net.au, geert@linux-m68k.org,
        khiem.nguyen.xt@renesas.com, dien.pham.ry@renesas.com,
        takeshi.kihara.df@renesas.com, Ulrich Hecht <uli+renesas@fpond.eu>
Subject: [PATCH v2 1/5] arm64: dts: r8a7795: Add cpuidle support for CA57 cores
Date:   Fri, 18 Jan 2019 11:47:50 +0100
Message-Id: <1547808474-19427-2-git-send-email-uli+renesas@fpond.eu>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1547808474-19427-1-git-send-email-uli+renesas@fpond.eu>
References: <1547808474-19427-1-git-send-email-uli+renesas@fpond.eu>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Khiem Nguyen <khiem.nguyen.xt@renesas.com>

Enable cpuidle (core shutdown) support for R-Car H3 CA57 cores.

Parameters were found after evaluation by gaku.inami.xw@bp.renesas.com; they
help to keep the performance and reduce the power consumption.

Signed-off-by: Khiem Nguyen <khiem.nguyen.xt@renesas.com>
[dien.pham.ry: Apply new cpuidle parameters]
Signed-off-by: Dien Pham <dien.pham.ry@renesas.com>
Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
Signed-off-by: Ulrich Hecht <uli+renesas@fpond.eu>
---
 arch/arm64/boot/dts/renesas/r8a7795.dtsi | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a7795.dtsi b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
index a81ed2b..7ae974d 100644
--- a/arch/arm64/boot/dts/renesas/r8a7795.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
@@ -155,6 +155,7 @@
 			power-domains = <&sysc R8A7795_PD_CA57_CPU0>;
 			next-level-cache = <&L2_CA57>;
 			enable-method = "psci";
+			cpu-idle-states = <&CPU_SLEEP_0>;
 			clocks = <&cpg CPG_CORE R8A7795_CLK_Z>;
 			operating-points-v2 = <&cluster0_opp>;
 			capacity-dmips-mhz = <1024>;
@@ -168,6 +169,7 @@
 			power-domains = <&sysc R8A7795_PD_CA57_CPU1>;
 			next-level-cache = <&L2_CA57>;
 			enable-method = "psci";
+			cpu-idle-states = <&CPU_SLEEP_0>;
 			clocks = <&cpg CPG_CORE R8A7795_CLK_Z>;
 			operating-points-v2 = <&cluster0_opp>;
 			capacity-dmips-mhz = <1024>;
@@ -181,6 +183,7 @@
 			power-domains = <&sysc R8A7795_PD_CA57_CPU2>;
 			next-level-cache = <&L2_CA57>;
 			enable-method = "psci";
+			cpu-idle-states = <&CPU_SLEEP_0>;
 			clocks = <&cpg CPG_CORE R8A7795_CLK_Z>;
 			operating-points-v2 = <&cluster0_opp>;
 			capacity-dmips-mhz = <1024>;
@@ -194,6 +197,7 @@
 			power-domains = <&sysc R8A7795_PD_CA57_CPU3>;
 			next-level-cache = <&L2_CA57>;
 			enable-method = "psci";
+			cpu-idle-states = <&CPU_SLEEP_0>;
 			clocks = <&cpg CPG_CORE R8A7795_CLK_Z>;
 			operating-points-v2 = <&cluster0_opp>;
 			capacity-dmips-mhz = <1024>;
@@ -261,6 +265,19 @@
 			cache-unified;
 			cache-level = <2>;
 		};
+
+		idle-states {
+			entry-method = "psci";
+
+			CPU_SLEEP_0: cpu-sleep-0 {
+				compatible = "arm,idle-state";
+				arm,psci-suspend-param = <0x0010000>;
+				local-timer-stop;
+				entry-latency-us = <400>;
+				exit-latency-us = <500>;
+				min-residency-us = <4000>;
+			};
+		};
 	};
 
 	extal_clk: extal {
-- 
2.7.4

