Return-Path: <SRS0=nIvG=PX=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D0D7C43387
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 15 Jan 2019 12:03:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id CDDFA20657
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 15 Jan 2019 12:03:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PKCJjQT0"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727984AbfAOMDO (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 15 Jan 2019 07:03:14 -0500
Received: from mail-pl1-f194.google.com ([209.85.214.194]:38348 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727369AbfAOMDO (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 15 Jan 2019 07:03:14 -0500
Received: by mail-pl1-f194.google.com with SMTP id e5so1203148plb.5
        for <linux-renesas-soc@vger.kernel.org>; Tue, 15 Jan 2019 04:03:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=vOR3MkD+36PX7kfHg0GNPwmhMeDJF2JG8bnig2yC5Os=;
        b=PKCJjQT0yDr8pQJG4f2NMe0pbd3HgaSkZN00LGzA3hA3H4IHm7lVKXd2IV5kGgY4at
         j1/bEscM5Rr83Yfi6GDOw3LEfQuKWQmKI23+RI4jL3aBfbOp3dd8wWVtVSAXfiWfJr1r
         xbS/wknELDnd8mt5eTuUmbpHhC5eFgoH3dhxdd82ZUnXBdolrtaAMERhOdbF0lPobGsr
         VMk1Suwuf0CLAtmpwSYrwTRDg3W6OeOyRKXnQasdjoZQ8nAIv5+hfoUXYScwfvEEuFp4
         VEgPJwlk73pIjdDwLx0pGiWDtIXGy6QmuP8QH2ZptZBzFZ85S5h49qK1yG2BGfRiPdDT
         aRjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=vOR3MkD+36PX7kfHg0GNPwmhMeDJF2JG8bnig2yC5Os=;
        b=laR/f/pGW8NABvUI6DbZ32TgMt6ob7gmt0CCruphyh0r5j1NY3ioHLU0XGklQ8kmLT
         Zon/gC6iZrwakFsYQ8qFwlcoODT72Uo+RufZEtnLIFNJ025MOCPnVPdnJC/KPmHQXi66
         MdfbpbjOsm5wcqcQfCs2LQnqPzOWCUwZ0yyr896k2q9mPZ87GdkEzknisULZR5kHWxmJ
         O9IW3xWuELbmBgvldhmy7dsP8YLa+fFIhcxHG80izd2UxqVFvdp643WfZAeqA0Y0bHM+
         KWMzvu1hLQOq2Ir2nU5lg3+msTGdIt36Zqji1KUWTB9KZdeRFazsuUqOqlrUFsF9FW7K
         QY8A==
X-Gm-Message-State: AJcUukcSlxGDjKkvkq/dRRC8P+ROn+sknzG1WYCA3Dqr+KFoGCg2DJOT
        8R+MEpgKa0vyKXW+fK7Bscd4wWrt
X-Google-Smtp-Source: ALg8bN6fSV2RULObECD6zdb5DI53pDQnAybzrU/jreictBziXWcJBI581/ziFxOUeKITGeDBNSAR7Q==
X-Received: by 2002:a17:902:8484:: with SMTP id c4mr3674270plo.59.1547553793254;
        Tue, 15 Jan 2019 04:03:13 -0800 (PST)
Received: from localhost.localdomain (p7732116-ipngn36501marunouchi.tokyo.ocn.ne.jp. [114.158.79.116])
        by smtp.gmail.com with ESMTPSA id h185sm4109903pfg.143.2019.01.15.04.03.11
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Tue, 15 Jan 2019 04:03:12 -0800 (PST)
From:   Yoshihiro Kaneko <ykaneko0929@gmail.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH/RFT] arm64: dts: renesas: r8a77990: Add OPPs table for cpu devices
Date:   Tue, 15 Jan 2019 21:02:42 +0900
Message-Id: <1547553762-4467-1-git-send-email-ykaneko0929@gmail.com>
X-Mailer: git-send-email 1.9.1
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Takeshi Kihara <takeshi.kihara.df@renesas.com>

This patch define OOP tables for all CPUs.
This allows CPUFreq to function.

Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
Signed-off-by: Yoshihiro Kaneko <ykaneko0929@gmail.com>
---

This patch is based on the devel branch of Simon Horman's renesas tree.

 arch/arm64/boot/dts/renesas/r8a77990.dtsi | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a77990.dtsi b/arch/arm64/boot/dts/renesas/r8a77990.dtsi
index 84bbe70..936714e 100644
--- a/arch/arm64/boot/dts/renesas/r8a77990.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77990.dtsi
@@ -55,6 +55,27 @@
 		clock-frequency = <0>;
 	};
 
+	cluster1_opp: opp_table10 {
+		compatible = "operating-points-v2";
+		opp-shared;
+		opp-800000000 {
+			opp-hz = /bits/ 64 <800000000>;
+			opp-microvolt = <820000>;
+			clock-latency-ns = <300000>;
+		};
+		opp-1000000000 {
+			opp-hz = /bits/ 64 <1000000000>;
+			opp-microvolt = <820000>;
+			clock-latency-ns = <300000>;
+		};
+		opp-1200000000 {
+			opp-hz = /bits/ 64 <1200000000>;
+			opp-microvolt = <820000>;
+			clock-latency-ns = <300000>;
+			opp-suspend;
+		};
+	};
+
 	cpus {
 		#address-cells = <1>;
 		#size-cells = <0>;
@@ -66,6 +87,8 @@
 			power-domains = <&sysc R8A77990_PD_CA53_CPU0>;
 			next-level-cache = <&L2_CA53>;
 			enable-method = "psci";
+			clocks =<&cpg CPG_CORE R8A77990_CLK_Z2>;
+			operating-points-v2 = <&cluster1_opp>;
 		};
 
 		a53_1: cpu@1 {
@@ -75,6 +98,8 @@
 			power-domains = <&sysc R8A77990_PD_CA53_CPU1>;
 			next-level-cache = <&L2_CA53>;
 			enable-method = "psci";
+			clocks =<&cpg CPG_CORE R8A77990_CLK_Z2>;
+			operating-points-v2 = <&cluster1_opp>;
 		};
 
 		L2_CA53: cache-controller-0 {
-- 
1.9.1

