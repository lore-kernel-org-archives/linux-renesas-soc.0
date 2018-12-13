Return-Path: <SRS0=gRf3=OW=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.9 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10D0DC65BAE
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 13 Dec 2018 20:19:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D6CD320851
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 13 Dec 2018 20:19:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D6CD320851
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-renesas-soc-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727849AbeLMUTT (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 13 Dec 2018 15:19:19 -0500
Received: from relmlor2.renesas.com ([210.160.252.172]:1935 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726355AbeLMUTT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 13 Dec 2018 15:19:19 -0500
X-IronPort-AV: E=Sophos;i="5.56,349,1539615600"; 
   d="scan'208";a="2555583"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 14 Dec 2018 05:19:17 +0900
Received: from fabrizio-dev.ree.adwin.renesas.com (unknown [10.226.37.69])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id F006940F76B2;
        Fri, 14 Dec 2018 05:19:14 +0900 (JST)
From:   Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc:     Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Simon Horman <horms+renesas@verge.net.au>,
        Wolfram Sang <wsa@the-dreams.de>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Biju Das <biju.das@bp.renesas.com>, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Simon Horman <horms@verge.net.au>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH] dt-bindings: i2c: sh_mobile: Add r8a774c0 support
Date:   Thu, 13 Dec 2018 20:19:12 +0000
Message-Id: <1544732352-6178-1-git-send-email-fabrizio.castro@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Document RZ/G2E (R8A774C0) SoC bindings.

Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
---
 Documentation/devicetree/bindings/i2c/i2c-sh_mobile.txt | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/i2c/i2c-sh_mobile.txt b/Documentation/devicetree/bindings/i2c/i2c-sh_mobile.txt
index bc876b7..3dff89f 100644
--- a/Documentation/devicetree/bindings/i2c/i2c-sh_mobile.txt
+++ b/Documentation/devicetree/bindings/i2c/i2c-sh_mobile.txt
@@ -8,6 +8,7 @@ Required properties:
 			- "renesas,iic-r8a7744" (RZ/G1N)
 			- "renesas,iic-r8a7745" (RZ/G1E)
 			- "renesas,iic-r8a774a1" (RZ/G2M)
+			- "renesas,iic-r8a774c0" (RZ/G2E)
 			- "renesas,iic-r8a7790" (R-Car H2)
 			- "renesas,iic-r8a7791" (R-Car M2-W)
 			- "renesas,iic-r8a7792" (R-Car V2H)
@@ -32,7 +33,7 @@ Required properties:
 			When compatible with "renesas,rmobile-iic" it should
 			be the last compatibility string listed.
 
-			The r8a77990 (R-Car E3) controller is not
+			The r8a77990 (R-Car E3) and RZ/G2E controllers are not
 			considered compatible with "renesas,rcar-gen3-iic"
 			or "renesas,rmobile-iic" due to the absence of
 			automatic transmission registers.
-- 
2.7.4

