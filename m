Return-Path: <SRS0=xIzj=SV=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2426BC282DA
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 19 Apr 2019 18:23:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id EE6EE222CC
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 19 Apr 2019 18:23:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725860AbfDSSXQ (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 19 Apr 2019 14:23:16 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:58840 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727708AbfDSSXN (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 19 Apr 2019 14:23:13 -0400
Received: from penelope.horms.nl (unknown [62.153.215.140])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 111A525B812;
        Sat, 20 Apr 2019 00:34:03 +1000 (AEST)
Received: by penelope.horms.nl (Postfix, from userid 7100)
        id 1DA36E21BE7; Fri, 19 Apr 2019 16:34:00 +0200 (CEST)
From:   Simon Horman <horms+renesas@verge.net.au>
To:     linux-renesas-soc@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Takeshi Kihara <takeshi.kihara.df@renesas.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 5/6] arm64: dts: renesas: r8a77965: Remove reg-names of display node
Date:   Fri, 19 Apr 2019 16:33:57 +0200
Message-Id: <32d622f3290b2a10e3d8edd55cd21caa7384b03e.1555683861.git.horms+renesas@verge.net.au>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1555683861.git.horms+renesas@verge.net.au>
References: <cover.1555683861.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Takeshi Kihara <takeshi.kihara.df@renesas.com>

Remove the "reg-names" property from the display node of R-Car Gen3 R8A77965
device tree.

No other mainline R-Car Gen3 SoC has that property specified.

Fixes: 2f2c71bfc8c5 ("arm64: dts: renesas: r8a77965: Populate the DU instance placeholder")

Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
[reworded commit message, sent upstream]
Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm64/boot/dts/renesas/r8a77965.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a77965.dtsi b/arch/arm64/boot/dts/renesas/r8a77965.dtsi
index 4a6446305c18..2554b1742dbf 100644
--- a/arch/arm64/boot/dts/renesas/r8a77965.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77965.dtsi
@@ -2447,7 +2447,6 @@
 		du: display@feb00000 {
 			compatible = "renesas,du-r8a77965";
 			reg = <0 0xfeb00000 0 0x80000>;
-			reg-names = "du";
 			interrupts = <GIC_SPI 256 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 268 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 270 IRQ_TYPE_LEVEL_HIGH>;
-- 
2.11.0

