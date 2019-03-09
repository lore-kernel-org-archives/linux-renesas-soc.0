Return-Path: <SRS0=uGqO=RM=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CB83C43381
	for <linux-renesas-soc@archiver.kernel.org>; Sat,  9 Mar 2019 02:06:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0198C2081B
	for <linux-renesas-soc@archiver.kernel.org>; Sat,  9 Mar 2019 02:06:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Nd7oECLX"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726412AbfCICGr (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 8 Mar 2019 21:06:47 -0500
Received: from mail-wr1-f67.google.com ([209.85.221.67]:39249 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726375AbfCICGr (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 8 Mar 2019 21:06:47 -0500
Received: by mail-wr1-f67.google.com with SMTP id l12so6789879wrp.6
        for <linux-renesas-soc@vger.kernel.org>; Fri, 08 Mar 2019 18:06:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gZzmFU13l2yoUQpw6uQVYoOFo9rDJwPZyv5TJlZh1e4=;
        b=Nd7oECLXYiIz2fLG2yRljPbccwWKaZhOjeXclg0MjIjKO2eGvplAE2WlKs8qfTv2PL
         MDI6w/J07zZzuNT2q63aiOBhc4BVLHwmpoPp28BbmS4/vN7EjVJQ2SHQSWscn6x7rljL
         Ul2u+oAv2UK/9WFXsAe3oHe5252i7LMEmrW7B4488cz5NBndzTZWCPULZdvP2T7mOuMY
         bK1pri5jHL3STc5/L43Wl3Gw7TyxqkNsWYUX/aYFs14vTLdIFuMw1NZEQQ3qTaNCN9QA
         VPP6OroAKIahVuiRfMwrBkA6EwJe9zDo/DPOU/NusXsUF6mu1cj8KIvrXP4XCtmhPm3V
         RshQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gZzmFU13l2yoUQpw6uQVYoOFo9rDJwPZyv5TJlZh1e4=;
        b=PazkPGD+YQ5XLsAgxOsYF2dof+nMTsGS2Bho3L3eqmcrQ1CYvbrxgmK4F7k5qPMaZ7
         63Xk8HgxfTyAfE7spYZdenhRbZhH/SbPNuzBszbFHCUc8KpENJ9aR/t40168kkFHjUpv
         I63kB8YxHMuRI0j/9lihUlb4elrFDpeL+25UHJuZG9JMN2WKaAbiQEZNtDEkClqEMYFg
         JDnEP5lB7j2ktIVRv5mGdTJrkzAp/XT7bE1hfsXqUvX+TXLzReEqcx1PmvwJAHKuEhNG
         7faEUofa9MFubHmG0DkFAS0P22MS1C/zGxxvnrZgias8Lhuzru8BSIYnKCOmzS4lA2Lv
         7xfw==
X-Gm-Message-State: APjAAAWcSQMr++HAXygbnLlvm/0cCh0fyeG0H1N7M5VWUO3/yJQAAiZh
        +M0t2JKPlsEWMO18UIZZw2E=
X-Google-Smtp-Source: APXvYqxtTy2WfYgn9ivvUibd51tRLmR87jDkT3rwFW1cgI5q5Kk+KgeahwQ+YbkkkRbIvohRPooGNw==
X-Received: by 2002:a05:6000:1142:: with SMTP id d2mr12691482wrx.43.1552097205745;
        Fri, 08 Mar 2019 18:06:45 -0800 (PST)
Received: from kurokawa.lan (ip-86-49-110-70.net.upcbroadband.cz. [86.49.110.70])
        by smtp.gmail.com with ESMTPSA id r63sm15340468wmr.32.2019.03.08.18.06.44
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 08 Mar 2019 18:06:44 -0800 (PST)
From:   marek.vasut@gmail.com
To:     linux-arm-kernel@lists.infradead.org
Cc:     Marek Vasut <marek.vasut+renesas@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms+renesas@verge.net.au>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH] arm64: dts: renesas: r8a77995: draak: Enable CAN0, CAN1
Date:   Sat,  9 Mar 2019 03:06:42 +0100
Message-Id: <20190309020642.15985-1-marek.vasut@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Marek Vasut <marek.vasut+renesas@gmail.com>

Enable both CAN0 and CAN1 controllers on R8A77995 Draak board,
since they are available on connectors CN43, CN44 respectively.

Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Simon Horman <horms+renesas@verge.net.au>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
---
 .../arm64/boot/dts/renesas/r8a77995-draak.dts | 22 +++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a77995-draak.dts b/arch/arm64/boot/dts/renesas/r8a77995-draak.dts
index db2bed1751b8..9a000a75fe8e 100644
--- a/arch/arm64/boot/dts/renesas/r8a77995-draak.dts
+++ b/arch/arm64/boot/dts/renesas/r8a77995-draak.dts
@@ -179,6 +179,18 @@
 	};
 };
 
+&can0 {
+	pinctrl-0 = <&can0_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
+&can1 {
+	pinctrl-0 = <&can1_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
 &du {
 	pinctrl-0 = <&du_pins>;
 	pinctrl-names = "default";
@@ -375,6 +387,16 @@
 		};
 	};
 
+	can0_pins: can0 {
+		groups = "can0_data_a";
+		function = "can0";
+	};
+
+	can1_pins: can1 {
+		groups = "can1_data_a";
+		function = "can1";
+	};
+
 	du_pins: du {
 		groups = "du_rgb888", "du_sync", "du_disp", "du_clk_out_0";
 		function = "du";
-- 
2.20.1

