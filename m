Return-Path: <SRS0=FDtJ=RR=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75F03C43381
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 14 Mar 2019 08:45:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4B78221019
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 14 Mar 2019 08:45:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727312AbfCNIp4 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 14 Mar 2019 04:45:56 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:58673 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727152AbfCNIp4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 14 Mar 2019 04:45:56 -0400
X-IronPort-AV: E=Sophos;i="5.58,477,1544454000"; 
   d="scan'208";a="10141365"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 14 Mar 2019 17:45:56 +0900
Received: from be1yocto.ree.adwin.renesas.com (unknown [172.29.43.62])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id DD8A5402C059;
        Thu, 14 Mar 2019 17:45:52 +0900 (JST)
From:   Biju Das <biju.das@bp.renesas.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc:     Biju Das <biju.das@bp.renesas.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Felipe Balbi <balbi@kernel.org>,
        Simon Horman <horms@verge.net.au>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: [PATCH v2 6/7] arm64: dts: renesas: r8a774c0-cat874: Enable USB3.0 host/peripheral device node
Date:   Thu, 14 Mar 2019 08:39:34 +0000
Message-Id: <1552552775-51667-7-git-send-email-biju.das@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1552552775-51667-1-git-send-email-biju.das@bp.renesas.com>
References: <1552552775-51667-1-git-send-email-biju.das@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This patch enables USB3.0 host/peripheral device node for r8a774c0
cat874 board.

Signed-off-by: Biju Das <biju.das@bp.renesas.com>
---
V1-->V2
  * No change

This patch depends on commit 35ed6229c0f0d079f2
("usb: gadget: udc: renesas_usb3: Add bindings for r8a774c0")
---
 arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts b/arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts
index 42c66f9..d9d55c8 100644
--- a/arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts
+++ b/arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts
@@ -124,6 +124,11 @@
 		function = "sdhi0";
 		power-source = <1800>;
 	};
+
+	usb30_pins: usb30 {
+		groups = "usb30", "usb30_id";
+		function = "usb30";
+	};
 };
 
 &rwdt {
@@ -151,3 +156,15 @@
 	sd-uhs-sdr104;
 	status = "okay";
 };
+
+&usb3_peri0 {
+	companion = <&xhci0>;
+	status = "okay";
+};
+
+&xhci0 {
+	pinctrl-0 = <&usb30_pins>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
-- 
2.7.4

