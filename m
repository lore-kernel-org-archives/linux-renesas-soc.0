Return-Path: <SRS0=bqQk=O5=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FROM,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4293FC43387
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 20 Dec 2018 20:50:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 042BD218FD
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 20 Dec 2018 20:50:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="p577dpeV"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387604AbeLTUt7 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 20 Dec 2018 15:49:59 -0500
Received: from mail-pf1-f195.google.com ([209.85.210.195]:43361 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1733134AbeLTUt7 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 20 Dec 2018 15:49:59 -0500
Received: by mail-pf1-f195.google.com with SMTP id w73so1463218pfk.10
        for <linux-renesas-soc@vger.kernel.org>; Thu, 20 Dec 2018 12:49:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=0flPfBxzfyZe3dhoZo6Ms+aMB+NadIGKBxGum72SgVk=;
        b=p577dpeVOwFZPNfz/oEfrJFTVwIHBEIn/XbkpbNoGx99hGag274+rZF3Z98CtNzf66
         xdSCQfhdjkU5EVtOhvNqyBtfP4JvEK9nq+PFF6rsGooRxp/9Idm/IW/mls5Dxb6UFhYL
         qU1F1nw75Y8xGk4jilAF+jNBRt6xmMTJqzoVsksBcMTCxV8KjsNiwHkh3imGO/fdzYEW
         DiDzQa1iTgLpzNlABeAaQ5UsTOWQB3cOPx7sBkKM2aBNNu2wpxFBQdYT/SwVX3v4+ijx
         GHKFlR8kDfPKUhexMKgotOxbyYbLG5EwDpiKSpHHfwKOTPWkGpYN+dhWHumkp3ETTefp
         XEzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=0flPfBxzfyZe3dhoZo6Ms+aMB+NadIGKBxGum72SgVk=;
        b=PO7IAS49fY1m1m80AJWTH9BOJx+FuxOjVsDPGLRoEW28kqo+w3q4yX2kQ308q8IHTK
         c/IgcMniSYpKgYUPxTGdA8M6VSCtW5yDvR91UthTNKFNTh6F9vXoJCCC6MA3HeBlv7tU
         dsPu9M9ir3qv0qUvu1/8e3DsSZaIGspaLQo5WvHOBBuLnb6YwIyjHnnk6fpW5Lx5WftE
         QmgtaCr7id+2k37sLrcRulMq4C2BhM6VNgwI1LE1W4tvRX1CwXY6rkPYBfGm7awVxpZP
         4S5vg4O83dl589ZbWWOIsrSNYn9LFGrR7kDQee2vR6R3WtO16k6jXO8PwPvaboRDaZFJ
         Nt4g==
X-Gm-Message-State: AA+aEWagW3wpJ2CjEKvefy7crXd+g42hI7TzObQT3TZGRabA/atDmzhX
        UggLd8gkiRkwil3XcdJk8PvH8JgC
X-Google-Smtp-Source: AFSGD/WXCkyhIucrpxkfaW4GrqdRVkZtZK5Hb6uiWM/3S21XsUD9HQ4y5h78EUFjntSCC0KjLq2V2A==
X-Received: by 2002:a62:9683:: with SMTP id s3mr25574029pfk.60.1545338997658;
        Thu, 20 Dec 2018 12:49:57 -0800 (PST)
Received: from localhost.localdomain (KD118155013174.ppp-bb.dion.ne.jp. [118.155.13.174])
        by smtp.gmail.com with ESMTPSA id r4sm50924003pgn.54.2018.12.20.12.49.55
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Thu, 20 Dec 2018 12:49:56 -0800 (PST)
From:   Yoshihiro Kaneko <ykaneko0929@gmail.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH/RFT] arm64: dts: renesas: r8a7795: Create thermal zone to support IPA
Date:   Fri, 21 Dec 2018 05:49:39 +0900
Message-Id: <1545338982-19466-1-git-send-email-ykaneko0929@gmail.com>
X-Mailer: git-send-email 1.9.1
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Dien Pham <dien.pham.ry@renesas.com>

[dien.pham.ry: arm64: dts: r8a7795: Add support IPA for CA53 core]

Setup a thermal zone driven by SoC temperature sensor.
Create passive trip points and bind them to CPUFreq cooling
device that supports power extension.

In R-Car Gen3, IPA is supportted for only one channel
 (on H3/M3/M3N board, it is channel THS3). Reason:
  Currently, IPA controls base on only CPU temperature.
  And only one thermal channel is assembled closest
  CPU cores is selected as target of IPA.
  If other channels are used, IPA controlling is not properly.

Signed-off-by: Keita Kobayashi <keita.kobayashi.ym@renesas.com>
[gaku.inami.xw: fix the trip temperature for cooling-device]
[gaku.inami.xw: fix the power coefficient]
Signed-off-by: Gaku Inami <gaku.inami.xw@bp.renesas.com>
Signed-off-by: Hien Dang <hien.dang.eb@rvc.renesas.com>
Signed-off-by: An Huynh <an.huynh.uj@rvc.renesas.com>
[takeshi.kihara.df: fix W=1 dtc unit_address_vs_reg warnings]
Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
Signed-off-by: Yoshihiro Kaneko <ykaneko0929@gmail.com>
---

This patch is based on the devel branch of Simon Horman's renesas tree.

 arch/arm64/boot/dts/renesas/r8a7795.dtsi | 64 ++++++++++++++------------------
 1 file changed, 27 insertions(+), 37 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a7795.dtsi b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
index af9605d..dd52b50 100644
--- a/arch/arm64/boot/dts/renesas/r8a7795.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
@@ -155,6 +155,9 @@
 			power-domains = <&sysc R8A7795_PD_CA57_CPU0>;
 			next-level-cache = <&L2_CA57>;
 			enable-method = "psci";
+			dynamic-power-coefficient = <854>;
+			cooling-min-level = <0>;
+			cooling-max-level = <2>;
 			clocks = <&cpg CPG_CORE R8A7795_CLK_Z>;
 			operating-points-v2 = <&cluster0_opp>;
 			capacity-dmips-mhz = <1024>;
@@ -207,6 +210,10 @@
 			power-domains = <&sysc R8A7795_PD_CA53_CPU0>;
 			next-level-cache = <&L2_CA53>;
 			enable-method = "psci";
+			#cooling-cells = <2>;
+			dynamic-power-coefficient = <277>;
+			cooling-min-level = <0>;
+			cooling-max-level = <2>;
 			clocks = <&cpg CPG_CORE R8A7795_CLK_Z2>;
 			operating-points-v2 = <&cluster1_opp>;
 			capacity-dmips-mhz = <535>;
@@ -3098,58 +3105,30 @@
 			polling-delay-passive = <250>;
 			polling-delay = <1000>;
 			thermal-sensors = <&tsc 0>;
+			sustainable-power = <6313>;
 
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
-					cooling-device = <&a57_0 4 4>,
-							 <&a57_1 4 4>,
-							 <&a57_2 4 4>,
-							 <&a57_3 4 4>;
-				};
-			};
 		};
 
 		sensor_thermal2: sensor-thermal2 {
 			polling-delay-passive = <250>;
 			polling-delay = <1000>;
 			thermal-sensors = <&tsc 1>;
+			sustainable-power = <6313>;
 
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
-					cooling-device = <&a57_0 4 4>,
-							 <&a57_1 4 4>,
-							 <&a57_2 4 4>,
-							 <&a57_3 4 4>;
-				};
-			};
 		};
 
 		sensor_thermal3: sensor-thermal3 {
@@ -3158,11 +3137,18 @@
 			thermal-sensors = <&tsc 2>;
 
 			trips {
-				sensor3_passive: sensor3-passive {
-					temperature = <95000>;
+				threshold: trip-point0 {
+					temperature = <90000>;
+					hysteresis = <1000>;
+					type = "passive";
+				};
+
+				target: trip-point1 {
+					temperature = <100000>;
 					hysteresis = <1000>;
 					type = "passive";
 				};
+
 				sensor3_crit: sensor3-crit {
 					temperature = <120000>;
 					hysteresis = <1000>;
@@ -3172,11 +3158,15 @@
 
 			cooling-maps {
 				map0 {
-					trip = <&sensor3_passive>;
-					cooling-device = <&a57_0 4 4>,
-							 <&a57_1 4 4>,
-							 <&a57_2 4 4>,
-							 <&a57_3 4 4>;
+					trip = <&target>;
+					cooling-device = <&a57_0 0 2>;
+					contribution = <1024>;
+				};
+
+				map1 {
+					trip = <&target>;
+					cooling-device = <&a53_0 0 2>;
+					contribution = <1024>;
 				};
 			};
 		};
-- 
1.9.1

