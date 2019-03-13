Return-Path: <SRS0=0QpP=RQ=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15D0EC43381
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 13 Mar 2019 10:51:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D7A242087C
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 13 Mar 2019 10:51:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="hw2S4UiB"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725883AbfCMKvd (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 13 Mar 2019 06:51:33 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:34780 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725847AbfCMKvd (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 13 Mar 2019 06:51:33 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id CF4EF25BEEE;
        Wed, 13 Mar 2019 21:51:30 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1552474291; bh=GmktyKRzOfyHKFbY+TZGoA5vK1LyHCgZ7SX+9OWZgLo=;
        h=From:To:Cc:Subject:Date:From;
        b=hw2S4UiBMsIY9l/CpLOgNhzA8y07IeS3+RHeHGd7o0N7Zo0d7rb48N+2aAfLeS/Nu
         av8EGIH5WC/i1cD8S5PF/TnEIHKgmSWpRIYFNpiAoHw1EowdI8RfmxQoJ+kbAt3Pkp
         DBEwrzZRZQ2UI1OOyLx1bMHADibIgWRb/dehdMHQ=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 167C1940C8F; Wed, 13 Mar 2019 11:51:29 +0100 (CET)
From:   Simon Horman <horms+renesas@verge.net.au>
To:     linux-renesas-soc@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Simon Horman <horms+renesas@verge.net.au>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>
Subject: [PATCH] arm64: dts: renesas: draak: Remove unecessary index from vin4 port
Date:   Wed, 13 Mar 2019 11:51:18 +0100
Message-Id: <20190313105118.23245-1-horms+renesas@verge.net.au>
X-Mailer: git-send-email 2.11.0
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The ports node of vin4 only has one sub-node and thus does
not need #address-cells/#size-cells and the sub-node does
not need an exit.

This addresses the following warning:

 # make dtbs W=1
 ...
 arch/arm64/boot/dts/renesas/r8a77995-draak.dts:492.8-503.4: Warning (graph_child_address): /soc/video@e6ef4000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary

Fixes: 6a0942c20f5c ("arm64: dts: renesas: draak: Describe CVBS input")
Cc: Jacopo Mondi <jacopo+renesas@jmondi.org>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm64/boot/dts/renesas/r8a77995-draak.dts | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

 Developed on top of renesas-devel-20190308-v5.0
 Compile tested only

diff --git a/arch/arm64/boot/dts/renesas/r8a77995-draak.dts b/arch/arm64/boot/dts/renesas/r8a77995-draak.dts
index 244b0dda03ed..8fba6cde5905 100644
--- a/arch/arm64/boot/dts/renesas/r8a77995-draak.dts
+++ b/arch/arm64/boot/dts/renesas/r8a77995-draak.dts
@@ -490,12 +490,7 @@
 	status = "okay";
 
 	ports {
-		#address-cells = <1>;
-		#size-cells = <0>;
-
-		port@0 {
-			reg = <0>;
-
+		port {
 			vin4_in: endpoint {
 				remote-endpoint = <&adv7180_out>;
 			};
-- 
2.11.0

