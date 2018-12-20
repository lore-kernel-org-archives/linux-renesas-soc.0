Return-Path: <SRS0=bqQk=O5=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FROM,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DF60C43387
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 20 Dec 2018 20:50:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0EE1421905
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 20 Dec 2018 20:50:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Nkwa31It"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387624AbeLTUuO (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 20 Dec 2018 15:50:14 -0500
Received: from mail-pf1-f176.google.com ([209.85.210.176]:45587 "EHLO
        mail-pf1-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387606AbeLTUuO (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 20 Dec 2018 15:50:14 -0500
Received: by mail-pf1-f176.google.com with SMTP id g62so1463910pfd.12
        for <linux-renesas-soc@vger.kernel.org>; Thu, 20 Dec 2018 12:50:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=W0ODiBCwrHpbgCJ5wuLLPh+VEcu6MXeBYtzHrt7UrQY=;
        b=Nkwa31ItnU1F1jsCGDGl08mGOytMHbjBsBK6oJ7+aTdt3fenHbchBx9xz8zPH8euuO
         ap15jWfj1f08vofasjwU8aIz8OQ6GRpfeHOcgX41mFVoHKkRjFliWTJP9/56LSU8D1AW
         c+KlBUbBrgH/Ui4unngvyks1MPankt//3wToUGYgO9kv4oMPbqBcbMi3FWOwZyGAK6Ss
         ePC5gqPKvMeDui5vNcar8POutCqWqRAovBpc1w0qgtlgyVGKd+4YNhMh3kmTiWZkg9sF
         Ui3ecbrHmfqOPIiJca3/Qz08V6/Hww2X646Az9n9ktZoASoC3+p+69MUB+xIUi+S9ZIK
         J+gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=W0ODiBCwrHpbgCJ5wuLLPh+VEcu6MXeBYtzHrt7UrQY=;
        b=RTI/XxUFV4rA9QheFg9P1woawys6ytfpAk98fD3XYhvLpE9xj9PmrTtf4QBQBPFxK2
         ksZqs+ya3ahim3UtL5Hdqc2kizpJM/ijjMp0m3JyKanakgLaw9BrNsHmfC5vKT4A2WZu
         7/TnNGHqU2WGIluy1xfIJ9n7CDeuPP3/ztBoyZPEim+bi2NLTpUBYeXww/x665mu8N5u
         wuCcnLeYDKrwnkFaEWz4+kE64cfNd4cAuiVANiK3Mc/AUJxp65vv6lIEcdykNmxXnllq
         t78RxKwI//bjv36rAeJGiDoqm+vTyy3ZQJpcczLpPyWlsl0PvwyaJVNlL/pGNc7B75F2
         JxVA==
X-Gm-Message-State: AA+aEWb/txQ3UUGevp6aRj13ypnh4BNxtVGaVFu/KnHlBbwA2MTRZNPR
        Rf16qwCmHj3xR5u3M+m1IDCPpkj/
X-Google-Smtp-Source: AFSGD/VozfJTBwcBTNuEH5AUcI+InFT/uXZcAsiTMyL6Y4vujqn/TDHkzvfx4VQprHmtU8H7JVnGBg==
X-Received: by 2002:a63:c503:: with SMTP id f3mr23605700pgd.431.1545339012418;
        Thu, 20 Dec 2018 12:50:12 -0800 (PST)
Received: from localhost.localdomain (KD118155013174.ppp-bb.dion.ne.jp. [118.155.13.174])
        by smtp.gmail.com with ESMTPSA id r4sm50924003pgn.54.2018.12.20.12.50.10
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Thu, 20 Dec 2018 12:50:11 -0800 (PST)
From:   Yoshihiro Kaneko <ykaneko0929@gmail.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH/RFT] arm64: dts: renesas: r8a77990: Create thermal zone to support IPA
Date:   Fri, 21 Dec 2018 05:49:42 +0900
Message-Id: <1545338982-19466-4-git-send-email-ykaneko0929@gmail.com>
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
[takeshi.kihara.df: fix W=1 dtc unit_address_vs_reg warnings]
Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
Signed-off-by: Yoshihiro Kaneko <ykaneko0929@gmail.com>
---

This patch is based on the devel branch of Simon Horman's renesas tree.

 arch/arm64/boot/dts/renesas/r8a77990.dtsi | 28 +++++++++++++++++++++++++---
 1 file changed, 25 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a77990.dtsi b/arch/arm64/boot/dts/renesas/r8a77990.dtsi
index b2f606e..c37ba9d 100644
--- a/arch/arm64/boot/dts/renesas/r8a77990.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77990.dtsi
@@ -66,6 +66,10 @@
 			power-domains = <&sysc R8A77990_PD_CA53_CPU0>;
 			next-level-cache = <&L2_CA53>;
 			enable-method = "psci";
+			#cooling-cells = <2>;
+			dynamic-power-coefficient = <277>;
+			cooling-min-level = <0>;
+			cooling-max-level = <2>;
 		};
 
 		a53_1: cpu@1 {
@@ -1760,11 +1764,24 @@
 	thermal-zones {
 		cpu-thermal {
 			polling-delay-passive = <250>;
-			polling-delay = <1000>;
-			thermal-sensors = <&thermal>;
+			polling-delay = <0>;
+			thermal-sensors = <&thermal 0>;
+			sustainable-power = <717>;
 
 			trips {
-				cpu-crit {
+				threshold: trip-point0 {
+					temperature = <90000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				target: trip-point1 {
+					temperature = <100000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				sensor1_crit: sensor1-crit {
 					temperature = <120000>;
 					hysteresis = <2000>;
 					type = "critical";
@@ -1772,6 +1789,11 @@
 			};
 
 			cooling-maps {
+				map0 {
+					trip = <&target>;
+					cooling-device = <&a53_0 0 2>;
+					contribution = <1024>;
+				};
 			};
 		};
 	};
-- 
1.9.1

