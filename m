Return-Path: <SRS0=GULD=UG=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7754EC28CC3
	for <linux-renesas-soc@archiver.kernel.org>; Fri,  7 Jun 2019 07:18:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 58614208C0
	for <linux-renesas-soc@archiver.kernel.org>; Fri,  7 Jun 2019 07:18:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727574AbfFGHSr (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 7 Jun 2019 03:18:47 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:6387 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726699AbfFGHSr (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 7 Jun 2019 03:18:47 -0400
X-IronPort-AV: E=Sophos;i="5.60,562,1549897200"; 
   d="scan'208";a="17856949"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 07 Jun 2019 16:18:45 +0900
Received: from be1yocto.ree.adwin.renesas.com (unknown [172.29.43.62])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id B213641FE039;
        Fri,  7 Jun 2019 16:18:42 +0900 (JST)
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
Subject: [PATCH 3/3] arm64: dts: renesas: hihope-rzg2-ex: Enable PCIe support
Date:   Fri,  7 Jun 2019 08:13:59 +0100
Message-Id: <1559891639-62529-4-git-send-email-biju.das@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1559891639-62529-1-git-send-email-biju.das@bp.renesas.com>
References: <1559891639-62529-1-git-send-email-biju.das@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This patch enables PCIEC[01] PCI express controller on the sub board.

Signed-off-by: Biju Das <biju.das@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/hihope-rzg2-ex.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/hihope-rzg2-ex.dtsi b/arch/arm64/boot/dts/renesas/hihope-rzg2-ex.dtsi
index b1e45944..07a6eea 100644
--- a/arch/arm64/boot/dts/renesas/hihope-rzg2-ex.dtsi
+++ b/arch/arm64/boot/dts/renesas/hihope-rzg2-ex.dtsi
@@ -31,6 +31,14 @@
 	};
 };
 
+&pciec0 {
+	status = "okay";
+};
+
+&pciec1 {
+	status = "okay";
+};
+
 &pfc {
 	pinctrl-0 = <&scif_clk_pins>;
 	pinctrl-names = "default";
-- 
2.7.4

