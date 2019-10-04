Return-Path: <SRS0=tri8=X5=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B245C4360C
	for <linux-renesas-soc@archiver.kernel.org>; Fri,  4 Oct 2019 07:16:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0245C21848
	for <linux-renesas-soc@archiver.kernel.org>; Fri,  4 Oct 2019 07:16:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728031AbfJDHQe (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 4 Oct 2019 03:16:34 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:26274 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727484AbfJDHQe (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 4 Oct 2019 03:16:34 -0400
X-IronPort-AV: E=Sophos;i="5.67,255,1566831600"; 
   d="scan'208";a="28279217"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 04 Oct 2019 16:16:32 +0900
Received: from be1yocto.ree.adwin.renesas.com (unknown [172.29.43.62])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 5B3CC40062CD;
        Fri,  4 Oct 2019 16:16:29 +0900 (JST)
From:   Biju Das <biju.das@bp.renesas.com>
To:     Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <maz@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc:     Biju Das <biju.das@bp.renesas.com>, devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms@verge.net.au>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH] dt-bindings: irqchip: renesas-irqc: Document r8a774b1 bindings
Date:   Fri,  4 Oct 2019 08:16:03 +0100
Message-Id: <1570173363-4633-1-git-send-email-biju.das@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Document SoC specific bindings for RZ/G2N (r8a774b1) SoC.

Signed-off-by: Biju Das <biju.das@bp.renesas.com>
---
 Documentation/devicetree/bindings/interrupt-controller/renesas,irqc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/renesas,irqc.yaml b/Documentation/devicetree/bindings/interrupt-controller/renesas,irqc.yaml
index 92f9f4d..ee5273b 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/renesas,irqc.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/renesas,irqc.yaml
@@ -24,6 +24,7 @@ properties:
           - renesas,irqc-r8a7793        # R-Car M2-N
           - renesas,irqc-r8a7794        # R-Car E2
           - renesas,intc-ex-r8a774a1    # RZ/G2M
+          - renesas,intc-ex-r8a774b1    # RZ/G2N
           - renesas,intc-ex-r8a774c0    # RZ/G2E
           - renesas,intc-ex-r8a7795     # R-Car H3
           - renesas,intc-ex-r8a7796     # R-Car M3-W
-- 
2.7.4

