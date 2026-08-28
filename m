Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011002.outbound.protection.outlook.com [52.101.125.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A9DA221F39;
	Fri, 28 Aug 2026 13:04:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.2
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787922267; cv=fail; b=qyOm1Yr8i3/6QAugpKMVdRY0NGCrWMDiZhZsZrnpQHwhATEYhzNDKRaxSs2hKrX2oYBKWDKVYkgEmFfwRUSC/nKFkdxfHUripbQNqBbjIkKf5MrljEiSDiyF8ELTn/dnBCPpUO7rogmegKss9uJ7R59xnnEeuS3cXfk/a3tU0T0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787922267; c=relaxed/simple;
	bh=8w7H2SsqzJGYII/0YjVVtYfbTVobM8NWjuu8kOYDj5c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=tSjS+GSw3sx2PsRdiEHP81c9+9GGnRf2rUYV1IhECAvDCKGF0aBIZ8TKoz8g45VeW3cbNHywGA8ahvG1vBPVOtyFoK766+B5NjLZtzYfAH+FRdxKn6xJsD8ZoctU3RJVmci2DrENzkl9NwjacUXeBMnzrhPG+Cjuzg7XWmw+Ls8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=wRSrYudQ; arc=fail smtp.client-ip=52.101.125.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="wRSrYudQ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ykBP7p3017jiNvr1xiTOTe4GJ2Arf0bHjYVJxDnAjNxqgWs7B2rMnDhPRNBXhW+2I8T20NuCdbgKQR9dLPLCvupZHxgN51HCz0BkvsVReKF0dF5O0mHenT2eUY/FHDY8Q2eNDeihqdDPQWigCl/9ZJxY9J/uRkGfek+fYqr/kHLirNx/dF1pO01iNR5qDUlglwK7ABGeGlU2uD6MK3E5aRfS3ZZjx8hWBfnxdsAFbYiJAZ229r7k7MUxivwEU6zzoOpAitqaWt8rdanV34XQqQ1Td0GD5xsg7XwbwTHBVL9hRbxZZ5VxwiNacgm324a/mOcDcJLqC+ThxKR89E1l4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6Jjxf27RXThyP5QBYWsB7rOrr/UBfGX5L2tRy8S5DMU=;
 b=owKLiZzyf1FLWLdtDkAdT6ZmG2x56ifhALbxHO/J9PzR1ojmXlw8upEmT2QKRChgPChm2zgchEu2JKPXVhoObh2icQVBVA6xGFjgGXFdjChMArsV4JawGPyehrpRhqUw8jAopX91e2j+EcJLaIA0uZ9fw9Q2X7CHFdRWAztCNqosnGwzvArq+KjCamqzEJ8MdvqQAXIWmeIiT7zMdqEQhg9F94HAL3KUNBxofKRQ93H3+pX8CoKABbkQ+RYCDirAFu3/2Yq7337e3eWUG3nYZ+upQDxN2KBkDEeUnLWzO/8FiKxSoerzLuk6/3B40h9AADYktb50qBXTWic1AFT3eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6Jjxf27RXThyP5QBYWsB7rOrr/UBfGX5L2tRy8S5DMU=;
 b=wRSrYudQk1zHgun1lwz5gsYYwoh3LSoZl3O82t5E+ZLXyKfn6MwHZg53zZ/iFGtP0nRXmsL5FJa81D3M/sI1+baILDt65GhZTfA4t7KD5TgsGbpGXM55tB2R4VnnqBjRrGoYARGZiXu9gn+TpBPcPP+Ee5icfcmBAp6iYAvlemA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OS7PR01MB13935.jpnprd01.prod.outlook.com (2603:1096:604:369::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.11; Fri, 28 Aug
 2026 13:04:23 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%4]) with mapi id 15.21.0360.008; Fri, 28 Aug 2026
 13:04:23 +0000
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
Date: Fri, 28 Aug 2026 14:01:52 +0100
Message-ID: <20260828130202.275826-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260828130202.275826-1-biju.das.jz@bp.renesas.com>
References: <20260828130202.275826-1-biju.das.jz@bp.renesas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA0P287CA0010.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:d9::15) To TY3PR01MB11346.jpnprd01.prod.outlook.com
 (2603:1096:400:3d0::7)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11346:EE_|OS7PR01MB13935:EE_
X-MS-Office365-Filtering-Correlation-Id: b37943b4-250b-440d-a4f2-08df0504e1e0
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|23010399003|1800799024|366016|38350700014|10067099003|11063799006|56012099006|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	vcHb4vyhvRZtNNa3zV8ctzHsLHxCujQ4btnFkGYvMsGeGMHgiqJ7vgmzo8r9Ud/ya+PjcaH8sl77Mp5R0a1OnrHOuSTc30n2jLI1oJFEODJWI/CbrPX+551NWNzyrNzrlo1aFrR+JQrh4iM8kmp5xo3FgC5aRmvoPrUtTAQoLaXPIYNyAJ/0FGs4wOvZbx6WB3n7Onjrgx0cy7zktcPGBnFgfcy1mCw0uwXsvprWBJyCGhd3La3vHhRVh3VZNtroFNnm0jyzc5b3TNUwQzMuvG8ouomi03ZDAj/zHrXvX/zjBwuu9l3eDmGAL6wbPYf+JotUrktE2RoyR3BCHcotSwZCA8p7C42bccP+gwKabA7PU4QrRi206PUUiNJj8Y1bZwgJ0yDLLwMvfedJsNtLXMqri9QTEhqJPbUGID51W+aMKQXwEadRNHnIUlWQ/XfKZ0VnoU0cnc13qxwb4tcw2qvTb/WQh0vBwxjvQfvrOXA+zFUeBc+U4nDTfuhjdaY10+IqF0AgSSA2/nIBLJCAzTDmA+PlJfKqMOA/dgl9vzsQTVf1hnfUp+caV7wEyGmYHa64d7iXPEt1Y+VEV2nIU8k2pJzxxx35q4bH+xaY/ToCdyq2sVbioiPFhh5a9cdBsq/o3tjK/xFvlsdqxqK6ndSJ/qh8yaIkwcNXO6A1VInmAdBNx3Nkqy8PXJaIYqdYJOYcn2YNo6yyutBY/mwmxQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(23010399003)(1800799024)(366016)(38350700014)(10067099003)(11063799006)(56012099006)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?73HlEx6QgDkjjNgYpbL9ClDwmOMhv0GH4khqpBaRX4Hh9O9mEOfNGfRa7bNn?=
 =?us-ascii?Q?jyrpuvLxWnTHxdv66W+Y73mJlWLbHd6IB7C/rWqSWCC6bFANN6KG0j7cX0ED?=
 =?us-ascii?Q?7BJRy6rSwwFmxVr18MlbXNbXQzSk1oi2E+00Nb+QPHS6fyLZsgc180Vg//Sm?=
 =?us-ascii?Q?8kFPLN0RLhEjVCwLfDsz5y0YdgMfKTpY4hPgH4VMiAmO+SITE87ExyaGTiLt?=
 =?us-ascii?Q?QEVYQ3Vixjh5VoHgp2WbCxdw/rFSip0RXgrNqRUt8P2SCgIWgCDN17KC8Saw?=
 =?us-ascii?Q?ysGpjSyJPM1Df8FNsNBhM2MejCJpDjpImC+w1CDKDnC2APV6Dbod4WPc+s1A?=
 =?us-ascii?Q?d0ighO+p2EH+mVPygPjCHzb5hEaMB49KgIHHtLzVTI1CGKYQhVpEk3nxkp/o?=
 =?us-ascii?Q?xZcpE90xpKnsQnIJqOmLVQKRHOGQMCTiiKxAb3Sie1QsMlkzJaKPMOfuV0uF?=
 =?us-ascii?Q?gngId1oHXs7mxDI0lGLC8MZi53yGxT0XaYydmFRxqWpr0FLzbCNVzKaj7/7c?=
 =?us-ascii?Q?A5WvOVqwjyll8+oMD9R3HFlNTvE9NdBIBoovHZbmtnN8f1WVndm6CxJSA/+M?=
 =?us-ascii?Q?w0yui7QVN6qiDK5LK3CgLTpG/SGNvFpzO9ZqRPS16VKhUa2USTyaZ7rCfY8d?=
 =?us-ascii?Q?VOIbVFxCzdsOqZ2zVW6s1TRVFJ0PK9j0tbl5NCtctO2LoThP6WNq/iL58YF4?=
 =?us-ascii?Q?wgRkvmOOK6q/qQLzKV+SpN4/fZ2sqDGK3CZc9bP9gSE1eYbzUEfD4McDNVtg?=
 =?us-ascii?Q?mntb/L+6SZ63J/uQId/kDzn9gkpxRJ0VPB4PQ+hjXqy9TmBajvHVQUOQ9XjD?=
 =?us-ascii?Q?ecaL91ijDS09YmAx95zUDW+KrJ0fJpAdr6s3wzAgFRdzlpJQyMcf0iFXkc37?=
 =?us-ascii?Q?y1ii5yS5WQctCXfbjIVi5Q0RDLuqPvU3Cr8D9m/2LDCZRT8x1k+jwuUqPh32?=
 =?us-ascii?Q?DICQT48RfujyQy/g2e4F9xsORyjU445p+5qYRhfA562GTqdnwUaiono0n5Xr?=
 =?us-ascii?Q?9jFU633q+0ycax4K0ERPwDBkPf4lgoypvEAsLYjR5dIrKLZt6QfbwVFDJDDQ?=
 =?us-ascii?Q?bufCLldzqV84JeZdCdChnQyGjfYt9Xerp2s4JeHlDFxhofZbzErbHnJ93+L8?=
 =?us-ascii?Q?6bQjzK5EEmpR9kRfbtWjEkRY+kwvZRH6KKtQCLYLQHVJ8R01INUPY04MyxAz?=
 =?us-ascii?Q?Ng5uwitir7lYAdqqJk1RiMovxVoL+MpmFEoJqXJ6ff7iLRuCS6OkMYt6r9zQ?=
 =?us-ascii?Q?qYxPdSpzzebdMN8B0Y7HarDs/q+XJvLQTR2z6hquGkU1AwCrmmajR7uu5D1F?=
 =?us-ascii?Q?KHx60AmLGI5Gzb2gw8KEn6Gso1KsTf7wWYDVhEAYdzvcWkuiURUxWoauOPfr?=
 =?us-ascii?Q?VnGQacGYgaPSgbWPbOyTwkPCGCw6MCfKwnjK0PVpLgH89aKSVy6VPFhZziHX?=
 =?us-ascii?Q?yCTsb38gcg+XX+M+5Tvnk/Eo523CzpfLSFmDE+xH13SaaZilXgDNJ9ufmYfo?=
 =?us-ascii?Q?G2WatyL4yasfuDwSmdVNTYi+IUrbFR35BRUbgtgFO/H3C6xcb81raTv53x7Z?=
 =?us-ascii?Q?WRvEaH0BydMkZVGvxhIYW5i0fPn54fGfLSFoV8H7r7hZYk6LCa+y54eI/duR?=
 =?us-ascii?Q?fQGDY7JHsxdemkuX4inYUeDaKlxSXPpCyunRqqfTuKMp6Py/Rki8fAWSAa0C?=
 =?us-ascii?Q?DshDMuT/BRyjmaL5xfYM0lyFHFGFET7JcqtNJx9OgRS3KOdo1TaxJU+UJXQ8?=
 =?us-ascii?Q?7/NmbhLXVASNhE/xL5YTTdoJu09FECg=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b37943b4-250b-440d-a4f2-08df0504e1e0
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11346.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2026 13:04:23.8750
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EqLn+5SXLeKEkas4Fwm9t2zzbJTwjeNesXhSpXgIA+dh977F0QBCh2S9N2elQYzoX4m36EwLqIgHMjn/zEC31zPV+HpUcZlWF1dtG8flHdM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB13935

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

