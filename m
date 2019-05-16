Return-Path: <SRS0=PbOa=TQ=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8697EC04AB4
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 16 May 2019 09:06:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5A69C20818
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 16 May 2019 09:06:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726950AbfEPJGx (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 16 May 2019 05:06:53 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:58069 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726537AbfEPJGx (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 16 May 2019 05:06:53 -0400
X-IronPort-AV: E=Sophos;i="5.60,476,1549897200"; 
   d="scan'208";a="16122360"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 16 May 2019 18:06:51 +0900
Received: from be1yocto.ree.adwin.renesas.com (unknown [172.29.43.62])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id A11AC42BEB8E;
        Thu, 16 May 2019 18:06:49 +0900 (JST)
From:   Biju Das <biju.das@bp.renesas.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc:     Biju Das <biju.das@bp.renesas.com>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: [PATCH 2/2] arm64: dts: renesas: r8a774c0-cat874: Add BT support
Date:   Thu, 16 May 2019 09:59:26 +0100
Message-Id: <1557997166-63351-3-git-send-email-biju.das@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1557997166-63351-1-git-send-email-biju.das@bp.renesas.com>
References: <1557997166-63351-1-git-send-email-biju.das@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This patch enables BT support for the CAT874 board.

Signed-off-by: Biju Das <biju.das@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts b/arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts
index 72cccfc..fdca695 100644
--- a/arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts
+++ b/arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts
@@ -16,6 +16,7 @@
 
 	aliases {
 		serial0 = &scif2;
+		serial1 = &hscif2;
 	};
 
 	chosen {
@@ -154,6 +155,19 @@
 	clock-frequency = <48000000>;
 };
 
+&hscif2 {
+	pinctrl-0 = <&hscif2_pins>;
+	pinctrl-names = "default";
+
+	uart-has-rtscts;
+	status = "okay";
+
+	bluetooth {
+		compatible = "ti,wl1837-st";
+		enable-gpios = <&gpio4 6 GPIO_ACTIVE_HIGH>;
+	};
+};
+
 &i2c0 {
 	status = "okay";
 	clock-frequency = <100000>;
@@ -237,6 +251,11 @@
 		function = "i2c1";
 	};
 
+	hscif2_pins: hscif2 {
+		groups = "hscif2_data_a", "hscif2_ctrl_a";
+		function = "hscif2";
+	};
+
 	scif2_pins: scif2 {
 		groups = "scif2_data_a";
 		function = "scif2";
-- 
2.7.4

