Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011053.outbound.protection.outlook.com [52.101.125.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F342470126;
	Tue, 25 Aug 2026 13:16:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787663779; cv=fail; b=EOPfi1nhTP9i8sf0FsfWi1bI2WpOIHCrWTpICmfBbk/OzY7D0lS4iXrJuCr8Pv3MCDtNPklbb5mbcgNQ/cVj8CbQSeTT7RFarpqxnkTCpSio1Z4aLy4YuL2r4jytq/22Ic7O5QU2G0uY/B0fCdmK6kfjmv0bggm7G5Ily+2p3D4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787663779; c=relaxed/simple;
	bh=oOD0CaP0A8Ld8MS+VkCgD5eT73u7ze9BPRmuE4LU9Bk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=gmL7iDonZxKWbMa4FsgWUc14H3ubSW+J+4X6CdgDCkJqTeBo4/grARQVS8MjKpcBDP2EsMu7X4P1Yb95UZYj89/Wg+GeHsS/0vi3i06FDJG5XrpqmOQkqFJ4W8c8mn6C7MaWnfwzFqtinLPEKiLeOAizd4fOb4dPe4kWpIF7J+4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=TMhPGSRE; arc=fail smtp.client-ip=52.101.125.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="TMhPGSRE"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JyW2E3qPKndMsDjPP8Rk/efLvOxcVf62Xj3j/zlb9WnrpMZIinLFiaJnIzghbsQngC4dZigdNNI8YG1/bBd09lsuUYJRWJoy4SexPqyI7N3rWYfTHy4E/14vVyuT8zIvum3MSpjnPl+fBwdh1GKWc0J0D3ng3d+1DnPntKGzAlmYCXFg/mGkNj5vMMn7F4iJkodi/Mex9gF5asvKGJDJ2ySMWtTMaQT23AMCnn8dOIZHwG74Zo+S4rONOLOfQy3UXHxP3SJ1RX0j43rsppJhWxSepBL0AlaOHUSKZ299rQGT/06mCJk0eKmWDtYDckyIP2VqNVK7g10SCQQYriDtbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tFW3FYocWo1hlrdntSG0Qzn3W6z2M2mi4j/px2HQwP0=;
 b=v0h+Z2pcCHWbAi3UVwM7pgNk+Y9Z75+tLGB+qljii5wvR31qI8HCHFsUFuF4aewJTttOpBQIZy/DeI70tQo1Yw72LbgJOTevy/mlAt8T5MsS7/rTKWSuu1IDHO9GPl+Pi+b+AJapzHlxvMi8EseUFIOTi8B4RLoY4KLYt4S1OAnSKnQ6HOWzGFEeOzrkUqXW8nJ+zl6/I7QsoKEePZH8suo2fCWHDV7UiJ6FbyCe7txJFX77cKtEWknkLVZDgejkMClak6stl2ax4p4tpo4dwp6jcplI1hG9wZGvoM5GkJP9jnaSRQVu7F+873yEC0AW5K4oTTGnYaIpfagpyQSwZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tFW3FYocWo1hlrdntSG0Qzn3W6z2M2mi4j/px2HQwP0=;
 b=TMhPGSRETktqxjXgtaIbr8k6Zuih81YzSafk12AqSpKs4HqLvze+bud3UCLUmAFSohDm1VK/zXPJAF5htYrUZ+FzBTBgZa54mCXnXCr36U3KtO1aJcb4Q0ozTcLE0u3ds8hX+AXjBVrZyWjO5FqJAo2AVvZY4phZJRUcHsC/ob4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYRPR01MB13588.jpnprd01.prod.outlook.com (2603:1096:405:18d::7)
 by TYWPR01MB8495.jpnprd01.prod.outlook.com (2603:1096:400:173::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Tue, 25 Aug
 2026 13:16:08 +0000
Received: from TYRPR01MB13588.jpnprd01.prod.outlook.com
 ([fe80::2f5b:8560:48ed:3828]) by TYRPR01MB13588.jpnprd01.prod.outlook.com
 ([fe80::2f5b:8560:48ed:3828%4]) with mapi id 15.21.0339.012; Tue, 25 Aug 2026
 13:16:08 +0000
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: tomm.merciai@gmail.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com
Cc: linux-renesas-soc@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Subject: [PATCH v2 1/4] arm64: dts: renesas: r9a08g046: Add USB2.0 host/phy device nodes
Date: Tue, 25 Aug 2026 15:15:22 +0200
Message-ID: <d1f700679bd5c7703564f662550d4dad22355088.1787663426.git.tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1787663426.git.tommaso.merciai.xr@bp.renesas.com>
References: <cover.1787663426.git.tommaso.merciai.xr@bp.renesas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0264.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:37c::15) To TYRPR01MB13588.jpnprd01.prod.outlook.com
 (2603:1096:405:18d::7)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYRPR01MB13588:EE_|TYWPR01MB8495:EE_
X-MS-Office365-Filtering-Correlation-Id: 46f424d6-4d76-465e-f7db-08df02ab066b
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|23010399003|366016|1800799024|38350700014|10067099003|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	qNVD+tf26TnF6m8LqdqJ9zV+Vsb7UTq94xazjcenvP0B5vsbkQAUZfycXlhAh7peAYemwdz6m6VeovbnC13oX8UFObw8mxTCPqu5WTBymGxWYjCIirlgKccp/67RSHYBZZhsxdMrBcP2XA8y4S/GBBUI2fdXyLMJdTT4zLux4j10ByUFRD0Uz90WkJPBxie0kkJyhfd3DHCtLJZE3goHPrViAGXJYtJFD6NvJZnv3A+aChT++l/k57bhFwFsTd6NiCQ8A/Nw3AUkK32sXSXTubOHoqMRCS3cNNU9pZvZqQRH6k5qtpAYeHSkBVr8kmmLA9KFBHv+yNEzPp88dlt0pP/m4TzAs1JNpjknhpuHrHjPW7Mj+c0ifEwWxcDlRQtx6W5PuUKbCOMMOjZzF0aGgIhHw9vvtrNPkUv3C3SkvJ3kkE2q6aWNnDjmnJ8yWjKyRTt5Dxx1Rq5x6uhTOjgQfktcbRACHukUYM1rSbEsB11HphXAaJM1qzuAWPH5j30doXL0WnPlQFIkImFj4qPzDcdPk1SIzw8XtZ7Jx1OaAvhoZEn7MWhDhYgrqb0+H1ML452or9GjE2ceyNuaaCx8Hi9YnSlRYkMIbvBf5AEanYi9F17QEEN4vWwaD2ZFER9M87XjQkeeJL0jPN9udYg/cqLeDWKLMwBf2xnql8FOKN90D4XFuGDTQg4WEJ8N8w9I0Fbsqfst5/IxU9x2+0u7zGWm3oT6e+3r19RGSPFMPyw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYRPR01MB13588.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(23010399003)(366016)(1800799024)(38350700014)(10067099003)(56012099006)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?3DyrlXtgCJM2vqfaxWwowPwG3yQdpCTnOStTdU10Mx1W44oyb0l3NRZmx4Fg?=
 =?us-ascii?Q?BJh/WKuX2cOoL1FwgVHsfNhGZ2AQRavwj1+8KG5YNGB9X3uoSFb4TOEsMFWc?=
 =?us-ascii?Q?vL73oj0oYKLkZYmZKFSa/c4tqXX3JDzJZCF5C0zcL6i8zWWAxzK7j/tD9H/L?=
 =?us-ascii?Q?1fWt657oGAcki5csswV0FTKyufh6V4x73rzsJizFe9DYi3pBwUvhtT4OuaDk?=
 =?us-ascii?Q?iDMdfJbRqIoyxHT2hYNrUQV+2u/PFZDk5gH6CRv1LW49V8nVOJ/B4vQDg3/z?=
 =?us-ascii?Q?dmTlzozS4e94j47qX4jcuNeD7D7uJTs5l81PF4oFRdNht4zM/Wzwm3neE9Pb?=
 =?us-ascii?Q?6KVz2/03+/gvEbwYOuN8SO7v+iE6n3F/HQrdYX6SbS6tI26/06JNBa8OEwId?=
 =?us-ascii?Q?2joL7Ih972/lXKn4T8s/SoW/8kCWTOGYEZ6QjXLJoeyCJyAD+m1J2jpUWmcf?=
 =?us-ascii?Q?f8m+rimPLxD0coRrJ0/LXMiBQWgffnr1AGekAQx8ceeKx0GSPmrRtc02dUMb?=
 =?us-ascii?Q?EJ2g9tZwKBevnTPxe+il+5w1fBDFCTPnEUPAsNeHC05xMrpdsCPllr54Xfer?=
 =?us-ascii?Q?ThKSwPqpN0PgYmYoj9BI+I98ioKnsyngH67S2sauQIyIRzXfcknB9zxSIIMu?=
 =?us-ascii?Q?3hB8mNVwtEWMqTNeCFwuJTv7NotmyJwyUQ07ZBT5iNRCIaZcI01ObfnIhFl8?=
 =?us-ascii?Q?k12K6l6+hJ6Va2bpeAv27cJ/iIFuExKAcgW8vqZWYOd+PbHZAqJkrti9OCbN?=
 =?us-ascii?Q?lbYLW09yGeQz3P4sOp+NYkctiHXW+ZnuDaDyz4y9JmTvV6QG8dSR4a2Eqji2?=
 =?us-ascii?Q?0rdMxYEyHnWhfGNTDucApRqcuDsHglEBT3dRXAAOC/ucEr9S+zq4IyEO7Kre?=
 =?us-ascii?Q?E5asYtdKdkn/7T655mbiBz6jdPO2Ruj3VyjMCOfOz7plQ6hALm2QjQEfEtiK?=
 =?us-ascii?Q?qv3X5ltLTbPV7L9UVIGmGlv7dg5Ux50qQnQjODZMY7OSvmx9lUy+ZFvJ5Daq?=
 =?us-ascii?Q?fl8U/vZbwMeuXo+KKVFAcl6eMqkqri36XlqTwsMbZXvtjq5z3OcCyyeOa6Ix?=
 =?us-ascii?Q?x2ay+fPTN+Kkhh25zBMhTowy5qr1iMEa7DS/SDSPOEbLNFJBzGWw2AxuMFHj?=
 =?us-ascii?Q?kZaIquupzCN9fU310X3GWNrNph/yPnDPiCWlPJOCBWr3u30ipVUkjA+i5MfN?=
 =?us-ascii?Q?gYLcSws0BZkun3/nQZdvp819di8ikwcRtc5rbOUEDAr4vlmB/DNv4cozHMtu?=
 =?us-ascii?Q?ep08SJhlU5kbaVJh/cZkIB992TFn2Sb0AeIX20EL9YvEddjOfxdtOrYYQbQU?=
 =?us-ascii?Q?SJJ4z1adlKUiqvq3O1YoC4JT7hB14uuDWV+aN+qaXoVP7X1O0gx2PLInTqfV?=
 =?us-ascii?Q?AFSzwXbh9ujFJGPf/1qwVRyO8aAK/2cHFv1cPPbsD6/9SUpFIUbg1jM/nUml?=
 =?us-ascii?Q?BmfDf1wD46CR1phEefyOtnGcvYAJ0J4YhNglaUOuG3Nc1gswgeLNjtyI/e/F?=
 =?us-ascii?Q?pTrM9YoU64LYtShx97yp8AkyP6nT78o4yN/QJY9JCbfGxNBYZOLM+BXeanSh?=
 =?us-ascii?Q?HvixhdU8RlSsmK00tS9XV3SHzQZ7H/+SXhimm568DZ1SEUMjqTf26YeZUfe5?=
 =?us-ascii?Q?YHHD8kHeWFKUOIgt0CXLG9SF+v9ywYYKQWnZpKLSvfw5JEVAGcRHLVcP7h/4?=
 =?us-ascii?Q?h9jZweYgeZZfVxDI+XeTde85PMowz7NG7f5qw3yxM5chkAuY2KwvruvDTAzC?=
 =?us-ascii?Q?7DlM269q+q6MIkMMz9vc7RVVnffg23cxFgUerrumC7aOvJGK4JOV?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 46f424d6-4d76-465e-f7db-08df02ab066b
X-MS-Exchange-CrossTenant-AuthSource: TYRPR01MB13588.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2026 13:16:08.3632
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3jdssmPRc/7E/0nctHgrlIhejiVrNvWGVoMRifFX9B89ftjC01+0hLKRl3JsTCRhZsYKqfkTZ1davmlEd6yUkw5Cup0jIN54XrkQlYdHH5F3WnTM2Qr++IcEr+BP589L
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB8495

From: Biju Das <biju.das.jz@bp.renesas.com>

Add USB2.0 device nodes to the RZ/G3L (r9a08g046) SoC DTSI, covering
the USB PHY controller, OHCI/EHCI host controllers, and USB2 PHYs for
both ports.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
v1->v2:
 - Cherry picked from "Add RZ/G3L USB2.0 host support" v7.
   v7: https://lore.kernel.org/all/20260812141940.246223-7-biju.das.jz@bp.renesas.com/

 arch/arm64/boot/dts/renesas/r9a08g046.dtsi | 104 +++++++++++++++++++++
 1 file changed, 104 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a08g046.dtsi b/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
index c63a857f0e5b..2d8c8fd8a01c 100644
--- a/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
@@ -1001,6 +1001,110 @@ queue3 {
 			};
 		};
 
+		phyrst: usbphy-ctrl@11e00000 {
+			compatible = "renesas,r9a08g046-usbphy-ctrl";
+			reg = <0 0x11e00000 0 0x10000>;
+			clocks = <&cpg CPG_MOD R9A08G046_USB_PCLK>;
+			resets = <&cpg R9A08G046_USB_PRESETN>;
+			power-domains = <&cpg>;
+			#reset-cells = <1>;
+			status = "disabled";
+
+			regulators {
+				usb0_vbus_otg: vbus0 {
+					regulator-name = "usb0_vbus";
+				};
+
+				usb1_vbus_otg: vbus1 {
+					regulator-name = "usb1_vbus";
+				};
+			};
+		};
+
+		ohci0: usb@11e10000 {
+			compatible = "generic-ohci";
+			reg = <0 0x11e10000 0 0x100>;
+			interrupts = <GIC_SPI 113 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD R9A08G046_USB_PCLK>,
+				 <&cpg CPG_MOD R9A08G046_USB_U2H0_HCLK>;
+			resets = <&phyrst 0>,
+				 <&cpg R9A08G046_USB_U2H0_HRESETN>;
+			phys = <&usb2_phy0 1>;
+			phy-names = "usb";
+			power-domains = <&cpg>;
+			status = "disabled";
+		};
+
+		ohci1: usb@11e90000 {
+			compatible = "generic-ohci";
+			reg = <0 0x11e90000 0 0x100>;
+			interrupts = <GIC_SPI 118 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD R9A08G046_USB_PCLK>,
+				 <&cpg CPG_MOD R9A08G046_USB_U2H1_HCLK>;
+			resets = <&phyrst 1>,
+				 <&cpg R9A08G046_USB_U2H1_HRESETN>;
+			phys = <&usb2_phy1 1>;
+			phy-names = "usb";
+			power-domains = <&cpg>;
+			status = "disabled";
+		};
+
+		ehci0: usb@11e10100 {
+			compatible = "generic-ehci";
+			reg = <0 0x11e10100 0 0x100>;
+			interrupts = <GIC_SPI 114 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD R9A08G046_USB_PCLK>,
+				 <&cpg CPG_MOD R9A08G046_USB_U2H0_HCLK>;
+			resets = <&phyrst 0>,
+				 <&cpg R9A08G046_USB_U2H0_HRESETN>;
+			phys = <&usb2_phy0 2>;
+			phy-names = "usb";
+			companion = <&ohci0>;
+			power-domains = <&cpg>;
+			status = "disabled";
+		};
+
+		ehci1: usb@11e90100 {
+			compatible = "generic-ehci";
+			reg = <0 0x11e90100 0 0x100>;
+			interrupts = <GIC_SPI 119 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD R9A08G046_USB_PCLK>,
+				 <&cpg CPG_MOD R9A08G046_USB_U2H1_HCLK>;
+			resets = <&phyrst 1>,
+				 <&cpg R9A08G046_USB_U2H1_HRESETN>;
+			phys = <&usb2_phy1 2>;
+			phy-names = "usb";
+			companion = <&ohci1>;
+			power-domains = <&cpg>;
+			status = "disabled";
+		};
+
+		usb2_phy0: usb-phy@11e10200 {
+			compatible = "renesas,usb2-phy-r9a08g046";
+			reg = <0 0x11e10200 0 0x700>;
+			interrupts = <GIC_SPI 116 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD R9A08G046_USB_PCLK>,
+				 <&cpg CPG_MOD R9A08G046_USB_U2H0_HCLK>;
+			resets = <&phyrst 0>,
+				 <&cpg R9A08G046_USB_U2H0_HRESETN>;
+			#phy-cells = <1>;
+			power-domains = <&cpg>;
+			status = "disabled";
+		};
+
+		usb2_phy1: usb-phy@11e90200 {
+			compatible = "renesas,usb2-phy-r9a08g046";
+			reg = <0 0x11e90200 0 0x700>;
+			interrupts = <GIC_SPI 121 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD R9A08G046_USB_PCLK>,
+				 <&cpg CPG_MOD R9A08G046_USB_U2H1_HCLK>;
+			resets = <&phyrst 1>,
+				 <&cpg R9A08G046_USB_U2H1_HRESETN>;
+			#phy-cells = <1>;
+			power-domains = <&cpg>;
+			status = "disabled";
+		};
+
 		pcie: pcie@11e40000 {
 			reg = <0 0x11e40000 0 0x10000>;
 			ranges = <0x02000000 0 0x30000000 0 0x30000000 0 0x08000000>;
-- 
2.54.0

