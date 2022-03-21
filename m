Return-Path: <linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A13E8C433F5
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 21 Mar 2022 15:43:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350465AbiCUPot (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 21 Mar 2022 11:44:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46120 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350485AbiCUPos (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 21 Mar 2022 11:44:48 -0400
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 219D01110;
        Mon, 21 Mar 2022 08:43:22 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.90,198,1643641200"; 
   d="scan'208";a="114269415"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 22 Mar 2022 00:43:21 +0900
Received: from vb.home (unknown [10.226.92.216])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id DE1A04001960;
        Tue, 22 Mar 2022 00:43:19 +0900 (JST)
From:   Phil Edworthy <phil.edworthy@renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     Phil Edworthy <phil.edworthy@renesas.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Biju Das <biju.das.jz@bp.renesas.com>
Subject: [PATCH 02/14] dt-bindings: arm: renesas: Document Renesas RZ/V2M System Configuration
Date:   Mon, 21 Mar 2022 15:42:20 +0000
Message-Id: <20220321154232.56315-3-phil.edworthy@renesas.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220321154232.56315-1-phil.edworthy@renesas.com>
References: <20220321154232.56315-1-phil.edworthy@renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add DT binding documentation for System Configuration (SYS) found on
RZ/V2M SoC's.

SYS block contains the SYS_VERSION register which can be used to retrieve
SoC version information.

Signed-off-by: Phil Edworthy <phil.edworthy@renesas.com>
Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 .../bindings/arm/renesas,rzv2m-sys.yaml       | 39 +++++++++++++++++++
 1 file changed, 39 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/renesas,rzv2m-sys.yaml

diff --git a/Documentation/devicetree/bindings/arm/renesas,rzv2m-sys.yaml b/Documentation/devicetree/bindings/arm/renesas,rzv2m-sys.yaml
new file mode 100644
index 000000000000..1a58906336b8
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/renesas,rzv2m-sys.yaml
@@ -0,0 +1,39 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/arm/renesas,rzv2m-sys.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: Renesas RZ/V2M System Configuration (SYS)
+
+maintainers:
+  - Geert Uytterhoeven <geert+renesas@glider.be>
+
+description:
+  The RZ/V2M System Configuration (SYS) performs system control of the LSI
+  and supports the following functions,
+  - LSI version
+  - 34-bit address space access function
+  - PCIe related settings
+  - WDT stop control
+  - Temperature sensor (TSU) monitor
+
+properties:
+  compatible:
+    const: renesas,r9a09g011-sys
+
+  reg:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    sysc: system-configuration@a3f03000 {
+            compatible = "renesas,r9a09g011-sys";
+            reg = <0 0xa3f03000 0 0x400>;
+    };
-- 
2.32.0

