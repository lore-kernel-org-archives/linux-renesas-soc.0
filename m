Return-Path: <SRS0=voFw=X3=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3877C352AA
	for <linux-renesas-soc@archiver.kernel.org>; Wed,  2 Oct 2019 15:21:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A448321920
	for <linux-renesas-soc@archiver.kernel.org>; Wed,  2 Oct 2019 15:21:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728605AbfJBPVO (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 2 Oct 2019 11:21:14 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:10176 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726179AbfJBPVO (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 2 Oct 2019 11:21:14 -0400
X-IronPort-AV: E=Sophos;i="5.64,574,1559487600"; 
   d="scan'208";a="27899365"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 03 Oct 2019 00:21:12 +0900
Received: from be1yocto.ree.adwin.renesas.com (unknown [172.29.43.62])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 7B4054006A99;
        Thu,  3 Oct 2019 00:21:09 +0900 (JST)
From:   Biju Das <biju.das@bp.renesas.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc:     Biju Das <biju.das@bp.renesas.com>,
        Simon Horman <horms@verge.net.au>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: [PATCH v3 9/9] arm64: dts: renesas: Add support for Advantech idk-1110wr LVDS panel
Date:   Wed,  2 Oct 2019 16:20:19 +0100
Message-Id: <1570029619-43238-10-git-send-email-biju.das@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1570029619-43238-1-git-send-email-biju.das@bp.renesas.com>
References: <1570029619-43238-1-git-send-email-biju.das@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This patch adds support for Advantech idk-1110wr LVDS panel.
The HiHope RZ/G2[MN] is advertised as compatible with panel
idk-1110wr from Advantech, however the panel isn't sold alongside
the board.

Signed-off-by: Biju Das <biju.das@bp.renesas.com>
Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 V1-->V2
   * Incorporated Laurent's review comments
 V2-->V3
   * Incorporated Laurent's review comments
---
 .../renesas/rzg2-advantech-idk-1110wr-panel.dtsi   | 41 ++++++++++++++++++++++
 1 file changed, 41 insertions(+)
 create mode 100644 arch/arm64/boot/dts/renesas/rzg2-advantech-idk-1110wr-panel.dtsi

diff --git a/arch/arm64/boot/dts/renesas/rzg2-advantech-idk-1110wr-panel.dtsi b/arch/arm64/boot/dts/renesas/rzg2-advantech-idk-1110wr-panel.dtsi
new file mode 100644
index 0000000..bcc2117
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/rzg2-advantech-idk-1110wr-panel.dtsi
@@ -0,0 +1,41 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Device Tree Source for the Advantech idk-1110wr LVDS panel connected
+ * to RZ/G2 boards
+ *
+ * Copyright (C) 2019 Renesas Electronics Corp.
+ */
+
+/ {
+	panel-lvds {
+		compatible = "advantech,idk-1110wr", "panel-lvds";
+
+		width-mm = <223>;
+		height-mm = <125>;
+
+		data-mapping = "jeida-24";
+
+		panel-timing {
+			/* 1024x600 @60Hz */
+			clock-frequency = <51200000>;
+			hactive = <1024>;
+			vactive = <600>;
+			hsync-len = <240>;
+			hfront-porch = <40>;
+			hback-porch = <40>;
+			vfront-porch = <15>;
+			vback-porch = <10>;
+			vsync-len = <10>;
+		};
+
+		port {
+			panel_in: endpoint {
+				remote-endpoint = <&lvds_connector>;
+			};
+		};
+	};
+};
+
+&lvds_connector {
+	remote-endpoint = <&panel_in>;
+};
-- 
2.7.4

