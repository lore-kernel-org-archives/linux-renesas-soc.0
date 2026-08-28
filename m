Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011013.outbound.protection.outlook.com [40.107.74.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10A23469842;
	Fri, 28 Aug 2026 13:36:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787924179; cv=fail; b=QhlvVwMx140USttrvXGUaZvCgs2IV9+MxOHjyMksVeEp2w/Pi03lq2Ys8EE4iwAckQYU8WMOB2yyFVUzKwhvJPU21Qoxzz8p8MjzjJw/DmbCrKnfHMNBJ7nRKKtFw1k8A1AP4ADuqIwbRB+DfxPHws7B4EUV858biSE0V+D39xg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787924179; c=relaxed/simple;
	bh=8w7H2SsqzJGYII/0YjVVtYfbTVobM8NWjuu8kOYDj5c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ij5PrdIAL/AuB60Dh6mt2vgdU9z92y4X+rjZEjZ7AVLpn3J+5aPse6ZmQi0TVimu3FKG5RiK8rooqIyFdAI64HJ5Nf44HHzcC7v6UgnOYf2UgOfycxUMexB/5URdbxmB1zN0AS8AflpAArh4pNgNgTMJ7CWC/vEEe8qXjt9Cqmo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=dIcFOUUJ; arc=fail smtp.client-ip=40.107.74.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="dIcFOUUJ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TahHCXeOQKANopkzIeYpZrtiSBXS5InAmeOytTtbrylNfeOSbBAN5mlUh+ZgnE2qw1wZdHCvmANQ2eBmQsD6TarGORjacAgaQyHvDuw7D80stfd33qJv7duwVr3lARBTL2Y4LA/vhCsoOE+MIV3WlMP0t0XfHRUSK59/ewyU+HE7JQIK5C061eqEXMhaYFQrgdDkBUVOrP92f0okaZ1Yego3SChN3hWVt/erIJVlx57KhwRXCZNCwc5CrV/UTnUpXX/7VKBatIu7kCpSmRepcFGYrJlJPZ9awvT2ABYHtOuIUoAMOjbjRFK7xF+m1G2jpU5OPYtAJYA6ZyUzw0coMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6Jjxf27RXThyP5QBYWsB7rOrr/UBfGX5L2tRy8S5DMU=;
 b=lCLW4/xPhCk6yUVtzGBNVP4AoNvhmAnxD+20eH1h+4nIyyfgzgQQPkxlDKuGfScpOVbjc84UrYTbkouWlmRzD40U7+y1UCbHKnF22x1k6zD4ffQB6yZcl0+HCETl/bPmz+mzQnGrQ89qfnaJq5S6fHpWFYkK2eoEu4q2H+iYe8HHeic2w3tqEowaVin6t2z+4HLZFnrOTk6qORc7G5sQi5PO9RDeAEj/bKMrgHxHSl028iNaF20hNeVmu5ZCwmmAL3ToU91lSaVj0fhr1JdnaNKWxhZiTRMlg+MYtk9QzTeeCKLX2x1J3Nsh1sTYYdTLIeUXPHEwmyk/VVC/H3ryRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 8.62.32.50) smtp.rcpttodomain=bp.renesas.com smtp.mailfrom=bp.renesas.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=bp.renesas.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6Jjxf27RXThyP5QBYWsB7rOrr/UBfGX5L2tRy8S5DMU=;
 b=dIcFOUUJV7tiXoOElS8BdCACGYquhtQwp1zp25MPPD+eSldzCZ0FPnSDu69CwQMjAFvcOp8UPNjbmgjG5zsAR5htqfM145Imi+cH39kiRmKVSrifqUjEd8QEU1AwQ42XJKy+mRZGh/6Sxb5gtmiFmeZGyiHL5Pa/5a3LAgMCs88=
Received: from TYCP286CA0158.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:383::9)
 by TYCPR01MB9521.jpnprd01.prod.outlook.com (2603:1096:400:191::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.10; Fri, 28 Aug
 2026 13:35:53 +0000
Received: from TY2PEPF00005623.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:383:cafe::8f) by TYCP286CA0158.outlook.office365.com
 (2603:1096:400:383::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.10 via Frontend Transport; Fri,
 28 Aug 2026 13:35:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 8.62.32.50)
 smtp.mailfrom=bp.renesas.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=bp.renesas.com;
Received-SPF: Pass (protection.outlook.com: domain of bp.renesas.com
 designates 8.62.32.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=8.62.32.50; helo=ejcrelay005p.adwin.renesas.com; pr=E
Received: from ejcrelay005p.adwin.renesas.com (8.62.32.50) by
 TY2PEPF00005623.mail.protection.outlook.com (10.167.240.54) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.8
 via Frontend Transport; Fri, 28 Aug 2026 13:35:53 +0000
Received: from biju-VirtualBox.adwin.renesas.com (nld-5cg2232q0r.diasemi.com [10.24.0.28])
	by ejcrelay005p.adwin.renesas.com (Postfix) with ESMTP id 1063B3000242;
	Fri, 28 Aug 2026 22:35:46 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Chris Paterson <Chris.Paterson2@renesas.com>,
	Biju Das <biju.das@bp.renesas.com>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v9 2/5] dt-bindings: reset: renesas,rzg2l-usbphy-ctrl: Document RZ/G3L support
Date: Fri, 28 Aug 2026 14:35:02 +0100
Message-ID: <20260828133509.276281-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260828133509.276281-1-biju.das.jz@bp.renesas.com>
References: <20260828133509.276281-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY2PEPF00005623:EE_|TYCPR01MB9521:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 9dfa9406-9cc0-46f0-0cd5-08df05094883
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|1800799024|23010399003|36860700016|10067099003|3023799007|22082099003|18002099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	9xzqc55pYyqup7xJiLIP/2+sDDW+MUosIi8n3zqK5bQUdwcExUmNzA5azSWeX3gDnocsmd/d8UuekkmvXjCsbazHdcwNcHW1FFFk8rbA6gW+w26yI3+O9wv6NXsIGvK2zaNFNP2JXwUN/LKuieT/O5HIbappOJn+9+2esIo6CnpvngzQLjpV+RuKl07aIXVIOVf4+lRwsACi4L+Onr5SDZbKx91gMG4ocrU9CITlH+XpMfeZrLAR16AQ5S7HnRXXhCbCE1vHJpnSVYQH5MAKL3M5Ou166uwqx1vxJ9slSOJCxZvSPbNZwjokSaT2rTxhqu6EaCEofVOyNaKFs8/Afy3BsQhSoLow7rUJU2soM9zB/BUqOk9+GHOGAauUOR5v3FNNR+coARwhiFdtJ3JK+y58hR7mS+CbV572tOJl6tebaGMwzV/ehhPWdKlk2xM7DMQ+5vkWsroyxyBN3+SbVoWdz27MmHxx6+JG0Cnq4p0xPJwTsgELqO/bBH8JKFf17nEDQ2H8iEYwwtBuO/1uG518fIyBtTk+5PzYdTGLorbCHJ1OoaVsrVUbR4zZ3rXnmZCwWqEN7ku8xGlgL8P4ge5XcnmZ7lVlSL7Wwv+XnriqSebZOHe+Y7usCJAMhQiuUiJlzccyECevAML0yz9fSQv7+LzzbHy/+SUpYQXnCbs+ideIIeSSYYkZhz4SDqNu
X-Forefront-Antispam-Report:
	CIP:8.62.32.50;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ejcrelay005p.adwin.renesas.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(23010399003)(36860700016)(10067099003)(3023799007)(22082099003)(18002099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	+lyeUopa9XCLl7Zw8S7f31zVz6DMYSWki0WCpLEJQ5vwSXq3YE2UhbyaOrbKcQpvMCjdLSxa7H+0o83NfJYgahAjdJ8Z1Lgd/TG5iWkDzrLAtVo8IVhio9e9yfGFhSHK39VAiJbPIwkFB9bh8IrFADqqhJskjE0nzdFoOWb93nFOW/RMJMN0+0FjbvSggImVMWy1p5JqFYA1S9DMXLU27xvnMuCYO/LlBG2a/+rEg3ncNU8gaS5eaggfHyVOHNZDAF5+DBS08nYlP/CPWoaG96Rag9yqCONiPn0ggtn6xMYI7zmFjyamuQGkP0ghr7k9/41EAXUIJFAZBZNrl/OGtmsHn8zoBO4xirzm9cOXyDopQRCXV2thCScul7IRfll6LR92zB87Um7LUPTjxXY6ywFAmycvR47Q8kBpuZc1CGZN6QH3xeF5imChAX1KzPkE
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2026 13:35:53.8804
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9dfa9406-9cc0-46f0-0cd5-08df05094883
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=53d82571-da19-47e4-9cb4-625a166a4a2a;Ip=[8.62.32.50];Helo=[ejcrelay005p.adwin.renesas.com]
X-MS-Exchange-CrossTenant-AuthSource: TY2PEPF00005623.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB9521

Document Renesas RZ/G3L (r9a08g046) USB PHY controller bindings.
The RZ/G3L USB PHY block is similar to RZ/G3S but differs in that each
port has its own OTG controller, whereas RZ/G3S only has one on port 1.
To reflect this, RZ/G3L uses a regulators sub-node with per-port vbus0
and vbus1 entries instead of the single regulator-vbus property used
by other compatible SoCs.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v8->v9:
 * No change.
v7->v8:
 * Collected tag.
v6->v7:
 * Added additionalProperties: false in regulators node.
v5->v6:
 * No change.
v4->v5:
 * Dropped renesas,sysc-pwrrdy for RZ/G3L as pwrrdy signal is modelled as
   power sequence.
 * Dropped the tag from Conor due to above change .
v3->v4:
 * No change.
v2->v3:
 * Replaced items->enum
 * Collected tag.
v1->v2:
 * Updated commit description.
 * Added enum instead of const in the compatible section.
 * Dropped regulator1-vbus and added a regulators group node.
 * Updated schema check.
---
 .../reset/renesas,rzg2l-usbphy-ctrl.yaml      | 41 ++++++++++++++++++-
 1 file changed, 40 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/reset/renesas,rzg2l-usbphy-ctrl.yaml b/Documentation/devicetree/bindings/reset/renesas,rzg2l-usbphy-ctrl.yaml
index c83469a1b379..75e034fa7ce7 100644
--- a/Documentation/devicetree/bindings/reset/renesas,rzg2l-usbphy-ctrl.yaml
+++ b/Documentation/devicetree/bindings/reset/renesas,rzg2l-usbphy-ctrl.yaml
@@ -23,6 +23,7 @@ properties:
               - renesas,r9a07g054-usbphy-ctrl # RZ/V2L
           - const: renesas,rzg2l-usbphy-ctrl
       - const: renesas,r9a08g045-usbphy-ctrl # RZ/G3S
+      - const: renesas,r9a08g046-usbphy-ctrl # RZ/G3L
 
   reg:
     maxItems: 1
@@ -50,6 +51,29 @@ properties:
     $ref: /schemas/regulator/regulator.yaml#
     unevaluatedProperties: false
 
+  regulators:
+    type: object
+    additionalProperties: false
+    description:
+      list of vbus regulators provided by this controller.
+
+    properties:
+      vbus0:
+        type: object
+        description: Port 1 USB VBUS regulator
+        $ref: /schemas/regulator/regulator.yaml#
+        unevaluatedProperties: false
+
+      vbus1:
+        type: object
+        description: Port 2 USB VBUS regulator
+        $ref: /schemas/regulator/regulator.yaml#
+        unevaluatedProperties: false
+
+    required:
+      - vbus0
+      - vbus1
+
   renesas,sysc-pwrrdy:
     description:
       The system controller PWRRDY indicates to the USB PHY if the power supply
@@ -71,7 +95,6 @@ required:
   - resets
   - power-domains
   - '#reset-cells'
-  - regulator-vbus
 
 allOf:
   - if:
@@ -86,6 +109,22 @@ allOf:
       properties:
         renesas,sysc-pwrrdy: false
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: renesas,r9a08g046-usbphy-ctrl
+    then:
+      properties:
+        regulator-vbus: false
+      required:
+        - regulators
+    else:
+      properties:
+        regulators: false
+      required:
+        - regulator-vbus
+
 additionalProperties: false
 
 examples:
-- 
2.43.0

