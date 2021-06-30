Return-Path: <linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A05BC11F6A
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 30 Jun 2021 07:30:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 829BB61D03
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 30 Jun 2021 07:30:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233022AbhF3Hd0 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 30 Jun 2021 03:33:26 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:28915 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S233011AbhF3HdQ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 30 Jun 2021 03:33:16 -0400
X-IronPort-AV: E=Sophos;i="5.83,311,1616425200"; 
   d="scan'208";a="85975988"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 30 Jun 2021 16:30:47 +0900
Received: from localhost.localdomain (unknown [10.226.93.82])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 3B48241DBA50;
        Wed, 30 Jun 2021 16:30:45 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Philipp Zabel <p.zabel@pengutronix.de>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>, devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH v3 03/11] dt-bindings: reset: Document RZ/G2L USBPHY Control bindings
Date:   Wed, 30 Jun 2021 08:30:05 +0100
Message-Id: <20210630073013.22415-4-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210630073013.22415-1-biju.das.jz@bp.renesas.com>
References: <20210630073013.22415-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add device tree binding document for RZ/G2L USBPHY Control Device.
It mainly controls reset and power down of the USB/PHY.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 v3:
  * New patch.
  * Modelled USBPHY control from phy bindings to reset bindings, since the
    IP mainly contols the reset of USB PHY.     
---
 .../reset/renesas,rzg2l-usbphy-ctrl.yaml      | 66 +++++++++++++++++++
 1 file changed, 66 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/reset/renesas,rzg2l-usbphy-ctrl.yaml

diff --git a/Documentation/devicetree/bindings/reset/renesas,rzg2l-usbphy-ctrl.yaml b/Documentation/devicetree/bindings/reset/renesas,rzg2l-usbphy-ctrl.yaml
new file mode 100644
index 000000000000..2a398c7ce7c8
--- /dev/null
+++ b/Documentation/devicetree/bindings/reset/renesas,rzg2l-usbphy-ctrl.yaml
@@ -0,0 +1,66 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/reset/renesas,rzg2l-usbphy-ctrl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Renesas RZ/G2L USBPHY Control
+
+maintainers:
+  - Biju Das <biju.das.jz@bp.renesas.com>
+
+description:
+  The RZ/G2L USBPHY Control mainly controls reset and power down of the
+  USB/PHY.
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - renesas,r9a07g044-usbphy-ctrl # RZ/G2{L,LC}
+      - const: renesas,rzg2l-usbphy-ctrl
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  resets:
+    maxItems: 1
+
+  power-domains:
+    maxItems: 1
+
+  '#reset-cells':
+    # see reset.txt in the same directory
+    const: 1
+    description: |
+      The phandle's argument in the reset specifier is the PHY reset associated
+      with the USB port.
+      0 = Port 1 Phy reset
+      1 = Port 2 Phy reset
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - resets
+  - power-domains
+  - '#reset-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/r9a07g044-cpg.h>
+
+    phyrst: usbphy-ctrl@11c40000 {
+        compatible = "renesas,r9a07g044-usbphy-ctrl",
+                     "renesas,rzg2l-usbphy-ctrl";
+        reg = <0x11c40000 0x10000>;
+        clocks = <&cpg CPG_MOD R9A07G044_USB_PCLK>;
+        resets = <&cpg R9A07G044_USB_PRESETN>;
+        power-domains = <&cpg>;
+        #reset-cells = <1>;
+    };
-- 
2.17.1

