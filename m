Return-Path: <SRS0=apzE=SS=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03AD7C10F13
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 16 Apr 2019 09:45:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D147720684
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 16 Apr 2019 09:45:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728365AbfDPJpP (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 16 Apr 2019 05:45:15 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:15774 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728556AbfDPJpP (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 16 Apr 2019 05:45:15 -0400
X-IronPort-AV: E=Sophos;i="5.60,357,1549897200"; 
   d="scan'208";a="13206205"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 16 Apr 2019 18:45:13 +0900
Received: from be1yocto.ree.adwin.renesas.com (unknown [172.29.43.62])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 0BFB74038495;
        Tue, 16 Apr 2019 18:45:09 +0900 (JST)
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
Subject: [PATCH V4 7/7] arm64: dts: renesas: r8a774c0-cat874: Enable usb role switch support
Date:   Tue, 16 Apr 2019 10:38:07 +0100
Message-Id: <1555407487-35394-8-git-send-email-biju.das@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1555407487-35394-1-git-send-email-biju.das@bp.renesas.com>
References: <1555407487-35394-1-git-send-email-biju.das@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This patch enables TI HD3SS3220 device and support usb role switch
for the CAT 874 platform.

Signed-off-by: Biju Das <biju.das@bp.renesas.com>
---
V3-->V4
  * No change
V2-->V3
  * Used "renesas,usb-role-switch" instead of generic "usb-role-switch"
    property
V1-->V2
  * New patch
---
 arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts | 39 +++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts b/arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts
index b9ae7db..746826c 100644
--- a/arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts
+++ b/arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts
@@ -85,6 +85,34 @@
 	clock-frequency = <48000000>;
 };
 
+&i2c0 {
+	status = "okay";
+	clock-frequency = <100000>;
+
+	hd3ss3220@47 {
+		compatible = "ti,hd3ss3220";
+		reg = <0x47>;
+		interrupt-parent = <&gpio6>;
+		interrupts = <3 IRQ_TYPE_LEVEL_LOW>;
+
+		usb_con: connector {
+			compatible = "usb-c-connector";
+			label = "USB-C";
+			data-role = "dual";
+		};
+
+		port {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			hd3ss3220_ep: endpoint@0 {
+				reg = <0>;
+				remote-endpoint = <&usb3peri_role_switch>;
+			};
+		};
+	};
+};
+
 &i2c1 {
 	pinctrl-0 = <&i2c1_pins>;
 	pinctrl-names = "default";
@@ -175,6 +203,17 @@
 &usb3_peri0 {
 	companion = <&xhci0>;
 	status = "okay";
+	renesas,usb-role-switch;
+
+	port {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		usb3peri_role_switch: endpoint@0 {
+			reg = <0>;
+			remote-endpoint = <&hd3ss3220_ep>;
+		};
+	};
 };
 
 &xhci0 {
-- 
2.7.4

