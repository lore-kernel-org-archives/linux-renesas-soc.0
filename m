Return-Path: <SRS0=bqQk=O5=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FROM,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BA9CC43387
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 20 Dec 2018 20:50:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6CE55218FD
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 20 Dec 2018 20:50:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="n0lnMcgh"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733134AbeLTUuH (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 20 Dec 2018 15:50:07 -0500
Received: from mail-pf1-f196.google.com ([209.85.210.196]:41700 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387606AbeLTUuH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 20 Dec 2018 15:50:07 -0500
Received: by mail-pf1-f196.google.com with SMTP id b7so1466418pfi.8
        for <linux-renesas-soc@vger.kernel.org>; Thu, 20 Dec 2018 12:50:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=4odp2+RFytClLaKntEe3wnMAIEZDbKE1PHbW/8Vr5cg=;
        b=n0lnMcghI6qbafubapj+m+abg+X9ws1w1P4Yh7KlAVzmzVCKXWRj4xL+0sA2lkVZly
         FnJyFvBvT8CumgTRbEmvAxmfxsL7ApQl9pVOvbixbYloXuzR5hi2hQLaey6uV1s35Dzd
         pYJG+HYgDSfnTcEsXiZdrfrZBusyN1NOBUEcs3eJegW78xzKmn5S8CxegzvleJ8jP3Qq
         BQk1wydXHzasx9dfkX48+Gse/xV1UDbYvFpEhj7T79p4JCflEtq6u5WnZ5Jlh0pD6KUX
         LpdMUCC2B6O0yHLsLxzxxGWxpho9ABMVI0uBj/OzQHIkkPXgBTFH/SujIxX8CkwMLeUw
         XObg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=4odp2+RFytClLaKntEe3wnMAIEZDbKE1PHbW/8Vr5cg=;
        b=YZv6IyWrCTZT8oygndt6Ez+Eb7jNVI90GAVeWYfUtqslCOYquhF2j+QPukZAoFrwP2
         pEB39joaROIiXhbf5Lt3tHXD0LRTBNCglgeg1ilMRKGuaK2AeKzJgAmGmABXc8DkwKO6
         GgfRwAMrkc6uX0v1RDmj/3+DI0++45jV0I0c01USsEcHM/quZCv8hJ5EAJxERdH8gx+h
         0EavatGKpsoLdyCJog2zLJV/1QZnCFtjE7+tcgq/CCumQbsgPkt4TaFQVvotZdYMG/iG
         ZZJ2QHJ0LZVw0rDY0fIAP71EYS7c9YwjcXivaDhsRH4U7avVFUt7rAsSq6DbMs6SpH8i
         2QMQ==
X-Gm-Message-State: AA+aEWYSinfMCR4Q126FpZnBEiBYCuTIeCCKa+TRkzNGYVBz9nUvPwCA
        jLEuSJr8dbDQDFvHg/KcByj7DbIM
X-Google-Smtp-Source: AFSGD/WUar6aIx6zEei3CcmQdIynypDXz/KJ0qF87ro5ekNh+q2Ak6+J8/kc9SR2R6a3jtUX4jLeuQ==
X-Received: by 2002:a63:6f0d:: with SMTP id k13mr24032634pgc.42.1545339005755;
        Thu, 20 Dec 2018 12:50:05 -0800 (PST)
Received: from localhost.localdomain (KD118155013174.ppp-bb.dion.ne.jp. [118.155.13.174])
        by smtp.gmail.com with ESMTPSA id r4sm50924003pgn.54.2018.12.20.12.50.03
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Thu, 20 Dec 2018 12:50:05 -0800 (PST)
From:   Yoshihiro Kaneko <ykaneko0929@gmail.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH/RFT] arm64: dts: renesas: r8a7796: Create thermal zone to support IPA
Date:   Fri, 21 Dec 2018 05:49:40 +0900
Message-Id: <1545338982-19466-2-git-send-email-ykaneko0929@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1545338982-19466-1-git-send-email-ykaneko0929@gmail.com>
References: <1545338982-19466-1-git-send-email-ykaneko0929@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Dien Pham <dien.pham.ry@renesas.com>

[dien.pham.ry: arm64: dts: r8a7796: Add support IPA for CA53 core]

Setup a thermal zone driven by SoC temperature sensor.
Create passive trip points and bind them to CPUFreq cooling
device that supports power extension.

In R-Car Gen3, IPA is supportted for only one channel
 (on H3/M3/M3N board, it is channel THS3). Reason:
  Currently, IPA controls base on only CPU temperature.
  And only one thermal channel is assembled closest
  CPU cores is selected as target of IPA.
  If other channels are used, IPA controlling is not properly.

Signed-off-by: Hien Dang <hien.dang.eb@rvc.renesas.com>
Signed-off-by: An Huynh <an.huynh.uj@rvc.renesas.com>
[takeshi.kihara.df: fix W=1 dtc unit_address_vs_reg warnings]
Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
Signed-off-by: Yoshihiro Kaneko <ykaneko0929@gmail.com>
---

This patch is based on the devel branch of Simon Horman's renesas tree.

 arch/arm64/boot/dts/renesas/r8a7796.dtsi | 56 +++++++++++++++-----------------
 1 file changed, 27 insertions(+), 29 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a7796.dtsi b/arch/arm64/boot/dts/renesas/r8a7796.dtsi
index afedbf5..98f621c 100644
--- a/arch/arm64/boot/dts/renesas/r8a7796.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a7796.dtsi
@@ -160,6 +160,9 @@
 			power-domains = <&sysc R8A7796_PD_CA57_CPU0>;
 			next-level-cache = <&L2_CA57>;
 			enable-method = "psci";
+			dynamic-power-coefficient = <854>;
+			cooling-min-level = <0>;
+			cooling-max-level = <2>;
 			clocks = <&cpg CPG_CORE R8A7796_CLK_Z>;
 			operating-points-v2 = <&cluster0_opp>;
 			capacity-dmips-mhz = <1024>;
@@ -186,6 +189,10 @@
 			power-domains = <&sysc R8A7796_PD_CA53_CPU0>;
 			next-level-cache = <&L2_CA53>;
 			enable-method = "psci";
+			#cooling-cells = <2>;
+			dynamic-power-coefficient = <277>;
+			cooling-min-level = <0>;
+			cooling-max-level = <2>;
 			clocks = <&cpg CPG_CORE R8A7796_CLK_Z2>;
 			operating-points-v2 = <&cluster1_opp>;
 			capacity-dmips-mhz = <535>;
@@ -2822,76 +2829,67 @@
 			polling-delay-passive = <250>;
 			polling-delay = <1000>;
 			thermal-sensors = <&tsc 0>;
+			sustainable-power = <3874>;
 
 			trips {
-				sensor1_passive: sensor1-passive {
-					temperature = <95000>;
-					hysteresis = <1000>;
-					type = "passive";
-				};
 				sensor1_crit: sensor1-crit {
 					temperature = <120000>;
 					hysteresis = <1000>;
 					type = "critical";
 				};
 			};
-
-			cooling-maps {
-				map0 {
-					trip = <&sensor1_passive>;
-					cooling-device = <&a57_0 5 5>, <&a57_1 5 5>;
-				};
-			};
 		};
 
 		sensor_thermal2: sensor-thermal2 {
 			polling-delay-passive = <250>;
 			polling-delay = <1000>;
 			thermal-sensors = <&tsc 1>;
+			sustainable-power = <3874>;
 
 			trips {
-				sensor2_passive: sensor2-passive {
-					temperature = <95000>;
-					hysteresis = <1000>;
-					type = "passive";
-				};
 				sensor2_crit: sensor2-crit {
 					temperature = <120000>;
 					hysteresis = <1000>;
 					type = "critical";
 				};
 			};
-
-			cooling-maps {
-				map0 {
-					trip = <&sensor2_passive>;
-					cooling-device = <&a57_0 5 5>, <&a57_1 5 5>;
-				};
-			};
 		};
 
 		sensor_thermal3: sensor-thermal3 {
 			polling-delay-passive = <250>;
 			polling-delay = <1000>;
 			thermal-sensors = <&tsc 2>;
+			sustainable-power = <3874>;
 
 			trips {
-				sensor3_passive: sensor3-passive {
-					temperature = <95000>;
+				threshold: trip-point0 {
+					temperature = <90000>;
 					hysteresis = <1000>;
 					type = "passive";
 				};
+
+				target: trip-point1 {
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
-
 			cooling-maps {
 				map0 {
-					trip = <&sensor3_passive>;
-					cooling-device = <&a57_0 5 5>, <&a57_1 5 5>;
+					trip = <&target>;
+					cooling-device = <&a57_0 0 2>;
+					contribution = <1024>;
+				};
+				map1 {
+					trip = <&target>;
+					cooling-device = <&a53_0 0 2>;
+					contribution = <1024>;
 				};
 			};
 		};
-- 
1.9.1

