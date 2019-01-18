Return-Path: <SRS0=9p1a=P2=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E6C7C43387
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 18 Jan 2019 10:48:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 50369204EC
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 18 Jan 2019 10:48:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=fpond.eu header.i=@fpond.eu header.b="KkYCQdQ3"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726801AbfARKse (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 18 Jan 2019 05:48:34 -0500
Received: from mo4-p02-ob.smtp.rzone.de ([81.169.146.171]:25640 "EHLO
        mo4-p02-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726741AbfARKsd (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 18 Jan 2019 05:48:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1547808512;
        s=strato-dkim-0002; d=fpond.eu;
        h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=Cmc9Alv1HrDQBn2VDq5e/VAI79by0Paip2fgBN5DS1I=;
        b=KkYCQdQ3vLNAhTzOckWrwQLAREmwCfiuX8uyjDtfnhhTBStf4oFcgJLbZ34bQEYnVc
        +tkZrKlWM5bXDEv3jPKYIwZqERwweOuKu2MnJ0p6qZMwGhZqLegBQfTf6wguTSFOiFF0
        SDD8uKn0jBOpT768lQNTtyxR+M+yUrlBZLirDBD65KPaDIorI20qA82YJT+rwbjYCWMY
        /pAgYjcJfdUy/WVoqcyAE6q2hXeXztU86q4Mi8FMX988mnc00f+GEj0QDIU+Zcsk5T6g
        v+wWeo7vSlDDfaGHQptuVLyzZYuPqOuP+lcmj0fW8LRhn/B7GpSkH3AYeFaqFprGaK3K
        LORw==
X-RZG-AUTH: ":OWANVUa4dPFUgKR/3dpvnYP0Np73dmm4I5W0/AvA67Ot4fvR8GZZd0rmoQ=="
X-RZG-CLASS-ID: mo00
Received: from groucho.site
        by smtp.strato.de (RZmta 44.9 DYNA|AUTH)
        with ESMTPSA id V028b8v0IAm9nyE
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA (curve secp521r1 with 521 ECDH bits, eq. 15360 bits RSA))
        (Client did not present a certificate);
        Fri, 18 Jan 2019 11:48:09 +0100 (CET)
From:   Ulrich Hecht <uli+renesas@fpond.eu>
To:     linux-renesas-soc@vger.kernel.org
Cc:     horms@verge.net.au, geert@linux-m68k.org,
        khiem.nguyen.xt@renesas.com, dien.pham.ry@renesas.com,
        takeshi.kihara.df@renesas.com,
        Khiem Nguyen <khiem.nguyen.xt@rvc.renesas.com>,
        Ulrich Hecht <uli+renesas@fpond.eu>
Subject: [PATCH v2 3/5] arm64: dts: r8a7796: Add cpuidle support for CA57 cores
Date:   Fri, 18 Jan 2019 11:47:52 +0100
Message-Id: <1547808474-19427-4-git-send-email-uli+renesas@fpond.eu>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1547808474-19427-1-git-send-email-uli+renesas@fpond.eu>
References: <1547808474-19427-1-git-send-email-uli+renesas@fpond.eu>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Khiem Nguyen <khiem.nguyen.xt@rvc.renesas.com>

Enable cpuidle (core shutdown) support for R-Car M3-W CA57 cores.

Parameters were found after evaluation by gaku.inami.xw@bp.renesas.com; they
help to keep the performance and reduce the power consumption.

Signed-off-by: Khiem Nguyen <khiem.nguyen.xt@rvc.renesas.com>
Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
[dien.pham.ry: Apply new cpuidle parameters]
Signed-off-by: Dien Pham <dien.pham.ry@renesas.com>
Signed-off-by: Ulrich Hecht <uli+renesas@fpond.eu>
---
 arch/arm64/boot/dts/renesas/r8a7796.dtsi | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a7796.dtsi b/arch/arm64/boot/dts/renesas/r8a7796.dtsi
index 3a9f8c7..212ffd6 100644
--- a/arch/arm64/boot/dts/renesas/r8a7796.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a7796.dtsi
@@ -160,6 +160,7 @@
 			power-domains = <&sysc R8A7796_PD_CA57_CPU0>;
 			next-level-cache = <&L2_CA57>;
 			enable-method = "psci";
+			cpu-idle-states = <&CPU_SLEEP_0>;
 			clocks = <&cpg CPG_CORE R8A7796_CLK_Z>;
 			operating-points-v2 = <&cluster0_opp>;
 			capacity-dmips-mhz = <1024>;
@@ -173,6 +174,7 @@
 			power-domains = <&sysc R8A7796_PD_CA57_CPU1>;
 			next-level-cache = <&L2_CA57>;
 			enable-method = "psci";
+			cpu-idle-states = <&CPU_SLEEP_0>;
 			clocks = <&cpg CPG_CORE R8A7796_CLK_Z>;
 			operating-points-v2 = <&cluster0_opp>;
 			capacity-dmips-mhz = <1024>;
@@ -240,6 +242,19 @@
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

