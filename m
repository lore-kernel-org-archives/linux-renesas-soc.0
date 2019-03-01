Return-Path: <SRS0=w5fC=RE=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56F64C43381
	for <linux-renesas-soc@archiver.kernel.org>; Fri,  1 Mar 2019 11:07:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 25D1920851
	for <linux-renesas-soc@archiver.kernel.org>; Fri,  1 Mar 2019 11:07:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728193AbfCALHH (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 1 Mar 2019 06:07:07 -0500
Received: from relmlor1.renesas.com ([210.160.252.171]:57039 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725978AbfCALHH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 1 Mar 2019 06:07:07 -0500
X-IronPort-AV: E=Sophos;i="5.58,427,1544454000"; 
   d="scan'208";a="9217643"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 01 Mar 2019 20:07:05 +0900
Received: from fabrizio-dev.ree.adwin.renesas.com (unknown [10.226.36.184])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 022304384577;
        Fri,  1 Mar 2019 20:07:02 +0900 (JST)
From:   Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To:     Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc:     Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>, ebiharaml@si-linux.co.jp
Subject: [PATCH 3/4] arm64: dts: renesas: r8a774c0-cat874: Add USB-HOST support
Date:   Fri,  1 Mar 2019 11:05:47 +0000
Message-Id: <1551438348-22119-4-git-send-email-fabrizio.castro@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1551438348-22119-1-git-send-email-fabrizio.castro@bp.renesas.com>
References: <1551438348-22119-1-git-send-email-fabrizio.castro@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This patch adds USB 2.0 HOST support to the CAT874 board.

Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts b/arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts
index f86b3628..7d3b76f 100644
--- a/arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts
+++ b/arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts
@@ -76,10 +76,20 @@
 	};
 };
 
+&ehci0 {
+	dr_mode = "host";
+	status = "okay";
+};
+
 &extal_clk {
 	clock-frequency = <48000000>;
 };
 
+&ohci0 {
+	dr_mode = "host";
+	status = "okay";
+};
+
 &pcie_bus_clk {
 	clock-frequency = <100000000>;
 };
@@ -128,3 +138,8 @@
 	sd-uhs-sdr104;
 	status = "okay";
 };
+
+&usb2_phy0 {
+	renesas,no-otg-pins;
+	status = "okay";
+};
-- 
2.7.4

