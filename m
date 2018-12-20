Return-Path: <SRS0=bqQk=O5=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FROM,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90220C43387
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 20 Dec 2018 20:50:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 613A9218FD
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 20 Dec 2018 20:50:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BYrKi0Sk"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387607AbeLTUuL (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 20 Dec 2018 15:50:11 -0500
Received: from mail-pl1-f194.google.com ([209.85.214.194]:35177 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387606AbeLTUuK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 20 Dec 2018 15:50:10 -0500
Received: by mail-pl1-f194.google.com with SMTP id p8so1424383plo.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 20 Dec 2018 12:50:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=fFllszrbZpSKDpUS8hDNuEI0GYealzXav3QnqlzAY5U=;
        b=BYrKi0SkVlFW3DoIuuhEaYWOdq8DPQKOxGVWEdwrmEpO0l9wr6LtDcmd1W0H4x5MyO
         sYDJ5Hpncy7Qyv2jp7b1CLuQ+wSNa4Fgr6vNPUKCkpHDeOvMUzlxzM5CotQnA+x0n9oh
         kqwdjr1/hziIqbhaVhIUm2GjxL5Yb1NwAMj9DClnu9hqi0TbXhPFcBnuweARC0/D9Lq1
         UP64Xl/gL+Oj3g1IwCsAP4uLqYcDh44lmHT6obSlaIrxsQtWLilzxWMSvWkMzzm0Pt08
         gj3nlh8ozizbazUtBCKCUseJqBeFU24ai7gmfldrQKtmARsDRIrGBMXjTxlb4LD8boKJ
         CgDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=fFllszrbZpSKDpUS8hDNuEI0GYealzXav3QnqlzAY5U=;
        b=Ff+gRS4iwZitQSUpGXA1RqOaCOMON8rjqb1qCARyiXOZr8oroYRYOrv4jVe4Xb04b6
         6SA2B3ArUn3yf2JeGKaw8OX1bH59kiRJeS8KAXc51eBGoIABnJTfKacU/5wdJxTgTIF2
         mTsiRMQ9rDMu08uSGrxkq/8w6Uwrbp3z0ZYzY5WHmfN2CBErp7uB43H0sXOlDqUgFT2N
         zuGZy+JpZXv0u/GgttTrTSKy16Z9SuD8WpFzke4BLCcMNWb6D88f0CM6wS+wjD25g2sL
         KQO7Ukc810XXcTTkKtNJVau1ar50gacPeu13iuo5Qq2NynxZoh1HR5yAakCtzyYC/bTb
         VgcA==
X-Gm-Message-State: AA+aEWY5wdJyI8zhNXDJTne4MKdbN44IJVVELeDeOFMG+AIK2wy7vBim
        tiUkce2+3+w+2/tFmpOXa7IUr7Y6
X-Google-Smtp-Source: AFSGD/UF5DARrK+L+4DIhGKqWlRwEztW5w5cvrbdAoQ+hZd6KgGl/vL5PxUwKK4nVfXLmV12/I38dg==
X-Received: by 2002:a17:902:2ec1:: with SMTP id r59mr25869076plb.254.1545339009164;
        Thu, 20 Dec 2018 12:50:09 -0800 (PST)
Received: from localhost.localdomain (KD118155013174.ppp-bb.dion.ne.jp. [118.155.13.174])
        by smtp.gmail.com with ESMTPSA id r4sm50924003pgn.54.2018.12.20.12.50.07
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Thu, 20 Dec 2018 12:50:08 -0800 (PST)
From:   Yoshihiro Kaneko <ykaneko0929@gmail.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH/RFT] arm64: dts: renesas: r8a77965: Create thermal zone to support IPA
Date:   Fri, 21 Dec 2018 05:49:41 +0900
Message-Id: <1545338982-19466-3-git-send-email-ykaneko0929@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1545338982-19466-1-git-send-email-ykaneko0929@gmail.com>
References: <1545338982-19466-1-git-send-email-ykaneko0929@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Dien Pham <dien.pham.ry@renesas.com>

Setup a thermal zone driven by SoC temperature sensor.
Create passive trip points and bind them to CPUFreq cooling
device that supports power extension.

In R-Car Gen3, IPA is supportted for only one channel
 (on H3/M3/M3N board, it is channel THS3). Reason:
  Currently, IPA controls base on only CPU temperature.
  And only one thermal channel is assembled closest
  CPU cores is selected as target of IPA.
  If other channels are used, IPA controlling is not properly.

Signed-off-by: Dien Pham <dien.pham.ry@renesas.com>
Signed-off-by: An Huynh <an.huynh.uj@rvc.renesas.com>
[takeshi.kihara.df: fix W=1 dtc unit_address_vs_reg warnings]
Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
Signed-off-by: Yoshihiro Kaneko <ykaneko0929@gmail.com>
---

This patch is based on the devel branch of Simon Horman's renesas tree.

 arch/arm64/boot/dts/renesas/r8a77965.dtsi | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a77965.dtsi b/arch/arm64/boot/dts/renesas/r8a77965.dtsi
index 6dc9b1f..a5bf342 100644
--- a/arch/arm64/boot/dts/renesas/r8a77965.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77965.dtsi
@@ -111,6 +111,10 @@
 			power-domains = <&sysc R8A77965_PD_CA57_CPU0>;
 			next-level-cache = <&L2_CA57>;
 			enable-method = "psci";
+			#cooling-cells = <2>;
+			dynamic-power-coefficient = <854>;
+			cooling-min-level = <0>;
+			cooling-max-level = <2>;
 			clocks = <&cpg CPG_CORE R8A77965_CLK_Z>;
 			operating-points-v2 = <&cluster0_opp>;
 		};
@@ -2236,6 +2240,7 @@
 			polling-delay-passive = <250>;
 			polling-delay = <1000>;
 			thermal-sensors = <&tsc 0>;
+			sustainable-power = <2439>;
 
 			trips {
 				sensor1_crit: sensor1-crit {
@@ -2250,6 +2255,7 @@
 			polling-delay-passive = <250>;
 			polling-delay = <1000>;
 			thermal-sensors = <&tsc 1>;
+			sustainable-power = <2439>;
 
 			trips {
 				sensor2_crit: sensor2-crit {
@@ -2264,14 +2270,37 @@
 			polling-delay-passive = <250>;
 			polling-delay = <1000>;
 			thermal-sensors = <&tsc 2>;
+			sustainable-power = <2439>;
 
 			trips {
+				threshold: trip-point0 {
+					/* miliCelsius  */
+					temperature = <90000>;
+					hysteresis = <1000>;
+					type = "passive";
+				};
+
+				target: trip-point1 {
+					/* miliCelsius  */
+					temperature = <100000>;
+					hysteresis = <1000>;
+					type = "passive";
+				};
+
 				sensor3_crit: sensor3-crit {
 					temperature = <120000>;
 					hysteresis = <1000>;
 					type = "critical";
 				};
 			};
+
+			cooling-maps {
+				map0 {
+					trip = <&target>;
+					cooling-device = <&a57_0 0 2>;
+					contribution = <1024>;
+				};
+			};
 		};
 	};
 
-- 
1.9.1

