Return-Path: <linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D23DC48BCD
	for <linux-renesas-soc@archiver.kernel.org>; Wed,  9 Jun 2021 15:51:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 61F6861375
	for <linux-renesas-soc@archiver.kernel.org>; Wed,  9 Jun 2021 15:51:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237065AbhFIPxM (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 9 Jun 2021 11:53:12 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:62365 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S237080AbhFIPxJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 9 Jun 2021 11:53:09 -0400
X-IronPort-AV: E=Sophos;i="5.83,261,1616425200"; 
   d="scan'208";a="83734568"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 10 Jun 2021 00:51:13 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 490CA400F5EB;
        Thu, 10 Jun 2021 00:51:11 +0900 (JST)
From:   Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <maz@kernel.org>, Rob Herring <robh+dt@kernel.org>
Cc:     linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2] dt-bindings: interrupt-controller: arm,gic-v3: Describe GICv3 optional properties
Date:   Wed,  9 Jun 2021 16:51:08 +0100
Message-Id: <20210609155108.16590-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Describe the optional GICv3 properties:
- clocks
- clock-names
- power-domains
- resets

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Changes for v2:
* Fixed typo in commit header
* Included RB tags from Biju and Geert
---
 .../bindings/interrupt-controller/arm,gic-v3.yaml   | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/arm,gic-v3.yaml b/Documentation/devicetree/bindings/interrupt-controller/arm,gic-v3.yaml
index 1ecd1831cf02..c84f9fe7f254 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/arm,gic-v3.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/arm,gic-v3.yaml
@@ -145,6 +145,19 @@ properties:
         required:
           - affinity
 
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    items:
+      - const: aclk
+
+  power-domains:
+    maxItems: 1
+
+  resets:
+    maxItems: 1
+
 dependencies:
   mbi-ranges: [ msi-controller ]
   msi-controller: [ mbi-ranges ]
-- 
2.17.1

