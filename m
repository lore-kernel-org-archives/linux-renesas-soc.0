Return-Path: <SRS0=9p1a=P2=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61E55C43614
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 18 Jan 2019 10:48:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 284FC2087E
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 18 Jan 2019 10:48:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=fpond.eu header.i=@fpond.eu header.b="bnv439RI"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726032AbfARKsb (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 18 Jan 2019 05:48:31 -0500
Received: from mo4-p02-ob.smtp.rzone.de ([81.169.146.171]:25972 "EHLO
        mo4-p02-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726416AbfARKsb (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 18 Jan 2019 05:48:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1547808508;
        s=strato-dkim-0002; d=fpond.eu;
        h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=z0d+0ifMinzieI0aB75TG74OdXZlxKIhK3AuykiRJZI=;
        b=bnv439RIhDWWPqmeNLuNqe0OV8Xe+FpFuFCOhx2UPQz3YkW8xQvJwqetSWepJZS33E
        k1G8nEEun2u/2zb3McvMjJh9UrxOTeorxjkdFFjBkAHahW8ZMK8boT2UN0Vc6sodES8/
        oUocqcH/6yHhnZ1dyXzE38y0weAZ/wJobxu/8+wIq3mht7WnyVINptVYnLtsLOo2Ijqg
        HAz6q98eudX0IiilnF2rHzyaIP5vUU+oC08J62ToOOy6dDt3WcUc2/5Mv6dkQziTSBm7
        bNvCFQ7qBCOQZZegZWU9Lrb6+67aIM+xzLqyWPvY44tnzJJmm7WOFPaGBYrY8ENpZ3WL
        Y3Nw==
X-RZG-AUTH: ":OWANVUa4dPFUgKR/3dpvnYP0Np73dmm4I5W0/AvA67Ot4fvR8GZZd0rmoQ=="
X-RZG-CLASS-ID: mo00
Received: from groucho.site
        by smtp.strato.de (RZmta 44.9 DYNA|AUTH)
        with ESMTPSA id V028b8v0IAmBnyH
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA (curve secp521r1 with 521 ECDH bits, eq. 15360 bits RSA))
        (Client did not present a certificate);
        Fri, 18 Jan 2019 11:48:11 +0100 (CET)
From:   Ulrich Hecht <uli+renesas@fpond.eu>
To:     linux-renesas-soc@vger.kernel.org
Cc:     horms@verge.net.au, geert@linux-m68k.org,
        khiem.nguyen.xt@renesas.com, dien.pham.ry@renesas.com,
        takeshi.kihara.df@renesas.com, Ulrich Hecht <uli+renesas@fpond.eu>
Subject: [PATCH v2 5/5] arm64: dts: r8a7796-m3ulcb: Disable cpuidle support for CA53 cores
Date:   Fri, 18 Jan 2019 11:47:54 +0100
Message-Id: <1547808474-19427-6-git-send-email-uli+renesas@fpond.eu>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1547808474-19427-1-git-send-email-uli+renesas@fpond.eu>
References: <1547808474-19427-1-git-send-email-uli+renesas@fpond.eu>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Takeshi Kihara <takeshi.kihara.df@renesas.com>

The revision of the R8A7796 SoC on the M3ULCB board is ES1.0. This revision
can not use cpuidle for CA53 cores.

Therefore, this patch disables cpuidle support for CA53 cores.

Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
Signed-off-by: Ulrich Hecht <uli+renesas@fpond.eu>
---
 arch/arm64/boot/dts/renesas/r8a7796-m3ulcb.dts | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a7796-m3ulcb.dts b/arch/arm64/boot/dts/renesas/r8a7796-m3ulcb.dts
index 9e4594c..cf96675 100644
--- a/arch/arm64/boot/dts/renesas/r8a7796-m3ulcb.dts
+++ b/arch/arm64/boot/dts/renesas/r8a7796-m3ulcb.dts
@@ -14,6 +14,12 @@
 	model = "Renesas M3ULCB board based on r8a7796";
 	compatible = "renesas,m3ulcb", "renesas,r8a7796";
 
+	cpus {
+		idle-states {
+			/delete-node/ cpu-sleep-1;
+		};
+	};
+
 	memory@48000000 {
 		device_type = "memory";
 		/* first 128MB is reserved for secure area. */
@@ -26,6 +32,22 @@
 	};
 };
 
+&a53_0 {
+	/delete-property/ cpu-idle-states;
+};
+
+&a53_1 {
+	/delete-property/ cpu-idle-states;
+};
+
+&a53_2 {
+	/delete-property/ cpu-idle-states;
+};
+
+&a53_3 {
+	/delete-property/ cpu-idle-states;
+};
+
 &du {
 	clocks = <&cpg CPG_MOD 724>,
 		 <&cpg CPG_MOD 723>,
-- 
2.7.4

