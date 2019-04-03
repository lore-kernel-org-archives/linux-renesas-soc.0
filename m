Return-Path: <SRS0=jJK9=SF=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D74C7C4360F
	for <linux-renesas-soc@archiver.kernel.org>; Wed,  3 Apr 2019 10:35:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A200E206DD
	for <linux-renesas-soc@archiver.kernel.org>; Wed,  3 Apr 2019 10:35:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726565AbfDCKfo (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 3 Apr 2019 06:35:44 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:52995 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726199AbfDCKfo (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 3 Apr 2019 06:35:44 -0400
X-IronPort-AV: E=Sophos;i="5.60,304,1549897200"; 
   d="scan'208";a="11933914"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 03 Apr 2019 19:35:43 +0900
Received: from be1yocto.ree.adwin.renesas.com (unknown [172.29.43.62])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 9CDFA42EBC2D;
        Wed,  3 Apr 2019 19:35:40 +0900 (JST)
From:   Biju Das <biju.das@bp.renesas.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc:     Biju Das <biju.das@bp.renesas.com>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: [PATCH V3 11/13] ARM: dts: iwg23s-sbc: Enable USB USB2.0 Host
Date:   Wed,  3 Apr 2019 11:28:42 +0100
Message-Id: <1554287324-22312-12-git-send-email-biju.das@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1554287324-22312-1-git-send-email-biju.das@bp.renesas.com>
References: <1554287324-22312-1-git-send-email-biju.das@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Enable USB2.0 host on the iwg23s sbc.

Signed-off-by: Biju Das <biju.das@bp.renesas.com>
---
V2-->V3
 * No change
V1-->V2
 * No change
---
 arch/arm/boot/dts/r8a77470-iwg23s-sbc.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm/boot/dts/r8a77470-iwg23s-sbc.dts b/arch/arm/boot/dts/r8a77470-iwg23s-sbc.dts
index 7ae7ee1..366832c 100644
--- a/arch/arm/boot/dts/r8a77470-iwg23s-sbc.dts
+++ b/arch/arm/boot/dts/r8a77470-iwg23s-sbc.dts
@@ -106,6 +106,10 @@
 	};
 };
 
+&ehci1 {
+	status = "okay";
+};
+
 &extal_clk {
 	clock-frequency = <20000000>;
 };
@@ -166,6 +170,10 @@
 	};
 };
 
+&ohci1 {
+	status = "okay";
+};
+
 &pfc {
 	avb_pins: avb {
 		groups = "avb_mdio", "avb_gmii_tx_rx";
-- 
2.7.4

