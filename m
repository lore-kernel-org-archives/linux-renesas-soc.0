Return-Path: <SRS0=E4fS=PS=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E45D6C43613
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 10 Jan 2019 13:39:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B6C2B21773
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 10 Jan 2019 13:39:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728733AbfAJNjZ (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 10 Jan 2019 08:39:25 -0500
Received: from baptiste.telenet-ops.be ([195.130.132.51]:54646 "EHLO
        baptiste.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728810AbfAJNjZ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 10 Jan 2019 08:39:25 -0500
Received: from ramsan ([84.194.111.163])
        by baptiste.telenet-ops.be with bizsmtp
        id NdfM1z00Y3XaVaC01dfM6t; Thu, 10 Jan 2019 14:39:23 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1ghaYL-0004sQ-Sf; Thu, 10 Jan 2019 14:39:21 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1ghaYL-0005ZQ-RT; Thu, 10 Jan 2019 14:39:21 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>
Cc:     Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 3/5] arm64: dts: renesas: r8a7796: Enable DMA for SCIF2
Date:   Thu, 10 Jan 2019 14:39:15 +0100
Message-Id: <20190110133917.21353-4-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190110133917.21353-1-geert+renesas@glider.be>
References: <20190110133917.21353-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SCIF2 on R-Car M3-W can be used with both DMAC1 and DMAC2.

Fixes: dbcae5ea4bd27409 ("arm64: dts: r8a7796: Enable SCIF DMA")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v2:
  - Add Fixes tag.
---
 arch/arm64/boot/dts/renesas/r8a7796.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a7796.dtsi b/arch/arm64/boot/dts/renesas/r8a7796.dtsi
index 3a9f8c7081ca0366..28a4803f0e489723 100644
--- a/arch/arm64/boot/dts/renesas/r8a7796.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a7796.dtsi
@@ -1262,6 +1262,9 @@
 				 <&cpg CPG_CORE R8A7796_CLK_S3D1>,
 				 <&scif_clk>;
 			clock-names = "fck", "brg_int", "scif_clk";
+			dmas = <&dmac1 0x13>, <&dmac1 0x12>,
+			       <&dmac2 0x13>, <&dmac2 0x12>;
+			dma-names = "tx", "rx", "tx", "rx";
 			power-domains = <&sysc R8A7796_PD_ALWAYS_ON>;
 			resets = <&cpg 310>;
 			status = "disabled";
-- 
2.17.1

