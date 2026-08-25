Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011053.outbound.protection.outlook.com [52.101.125.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF596471424;
	Tue, 25 Aug 2026 13:16:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787663781; cv=fail; b=eb8en/qRoV40uFlOgvlNVcd4v7lEN4+Y3WrB8fgttTvp6EFczOU5wMnv9sw4f2ILOagmRXMclQmOWPK0X9JGHgCOYVGPpsRYpeguaH1e14EImslfuvlgbfa96Sp+lU3OkyKayfRehpay4qvxGLQKcjp0h9dwEho+rdLljd5SJVs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787663781; c=relaxed/simple;
	bh=kqR7lVi+AyigTVn6j0UKUb4Yri0eaxo9j4CgOvYEzHA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Tmqr16uYVs6hD6Watepv0U6WOJ3rsAzcs9tN9j9hh8qgqo0Wm5KCadeOPGNf8lDwe6uEak40YA6proNVl9rXO77+TaAJDODQ3W0g0AIGrqnUzZHuwoOhaaAhJGrMQXxWm74SW+bB9EFP7dyZep2WEHUDJONORWc2RLUzBh6enbY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=Kz0PQbEK; arc=fail smtp.client-ip=52.101.125.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="Kz0PQbEK"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tama6iAa718Ju0ATjPi7hoJ3gXE8ZVCF6pSNsGd3OBLpPzDqY6rcQumq6G1mTwAac2YjASQwbdTn6T/vOyT8uc2hDOzsbsgkhmHjxRSpy7npyunVds+HdchH5j04xjZMlh08BNgmmdzHXD66TUixsmZ5jkOzsbhj88Hk7uakoQvlGkq8nMu3MEuES9SHnSw7X+DiExUW3ycsPJje021embQd/8oEqzgaxWRdrv54//N2ieiMJJsaao5spMzooDu4L/gnZp3hlF38jtypPxgfhGY/a0BZ3fRNNHZd+0WN+QLycrmIO0lgsB90hwMjwaKIoGQniDCDcUHBIM5qnRmM2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=46SN2Cus/KNcX8jeJXyzsngpVJZwphPA1l0pF6Fzf3U=;
 b=UwEty2Ra79YmUubvavkWBhEaG0J/CXr+vGdV8kv4BgdDrbce5i+138d7d7OKzfJRdwxDHedkYG59bvpFoIFZ3TVj7+dlFeyylAU5oDDL94PYsSKgL3Vzsmgt4aYn+45zaXW48Tl1sLgY67pXKjbtegszF8ESM5Zq4ZSbqy2fPg18iOmF5KnS7FMzG5oWAxV9QAJi9eONrIszcNB3CgXJHki2P+BhoZCnyUTYaX9hja76sHryFzqMbGC072mRk+B62WsGwRUmp18MOQhyL1eBLbm3Dm3sm/X82WIhqksQF/TWs+058Z6D7dqEyWlfLzVkvKBT6SS/jRPRKi/HEWj5bQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=46SN2Cus/KNcX8jeJXyzsngpVJZwphPA1l0pF6Fzf3U=;
 b=Kz0PQbEKoBGFBsVnwcShaJIIlgDN+KzLGjBy1KVLxE/rxodlTDircYZ4ai/FuQwlYK+Lmb6mopxwXP8ELel/gyhrq3awolGbZpjWPnEiHQZx2jIM6b2gQ1RtZK+Sr6gkp18hWBEsLxC/6YcwlH3DiZz+pj5QaeIQbtDWz9qV7hI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYRPR01MB13588.jpnprd01.prod.outlook.com (2603:1096:405:18d::7)
 by TYWPR01MB8495.jpnprd01.prod.outlook.com (2603:1096:400:173::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Tue, 25 Aug
 2026 13:16:17 +0000
Received: from TYRPR01MB13588.jpnprd01.prod.outlook.com
 ([fe80::2f5b:8560:48ed:3828]) by TYRPR01MB13588.jpnprd01.prod.outlook.com
 ([fe80::2f5b:8560:48ed:3828%4]) with mapi id 15.21.0339.012; Tue, 25 Aug 2026
 13:16:17 +0000
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: tomm.merciai@gmail.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com
Cc: linux-renesas-soc@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/4] arm64: dts: renesas: r9a09g047: Add USB2.0 support
Date: Tue, 25 Aug 2026 15:15:24 +0200
Message-ID: <c1488855f44e6faddae1f541c460268eaea483d4.1787663426.git.tommaso.merciai.xr@bp.renesas.com>
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
X-MS-Office365-Filtering-Correlation-Id: b316aea8-e0c0-4139-0d5c-08df02ab0c2e
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|23010399003|366016|1800799024|38350700014|10067099003|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	Eq6avitvZ4Mb+Ktj9RAPcia4LRclmyqmi03ZMbG3wlNVc2xYlTOtG0qt6rcHpM/wYfBKqPLhx3Gk+DomonXnGZ1QEWBpLseYGn9uxCgwg5cobWRZVxNgeySTflEG6WUPGI1yQ2HZyvLj+7Nm35th9jrU1xMgI0IYtqg9zWttCng3WadUyuOyz5+Si4eEoLMfqp3v60f7tf9VTscvfcpRvtSD115fC3snf45xgqZ/0Lbi5qEfYwhdqoMSmuyw7h3Dj83XqG8ETEbDYvDz+WJg/ZYx6/fNkmk7KktaHj1VZR7YSQ+muwvlg+aR8chnGr82neGcoGO8zXNIkITn/DkW3toBfDvvb0/8iRvGHxjrRFxlo86PAQlxwdZOsm9iCrgKBdrQS1kLAvBVi1q1HKQ8YahPrEp5UFsrV/XmbUXNxGMwv5fYiSqyBvWBt4mrmeLaiCntnrQ4o8EeuSbOAWM5H9oBheCgAmPm04Ob9WdKuv1P3YwJOv4eP+k/AwDHVNnUgDgY7Vfq3S5WeFaq8cvDo1Zk0QXnc5W6JxP5lswezZm59sN1iDaQCBxh3wJ34aIGR2KRYiinS+JkBmupM80iD5iBHILpNpF1Z+aCcDv41hONCtrUsgxyYmX2zkJ1l8y+zz7+SbepQq/VRhnf39HYU+zqo9XtGbzDSmj9h1ynbP1rw0q6WHfN3EMX5/vR2nMNUQ34QcOHvnLjBuoNTWOBUMyhDKyKf/w5SdD/pTJrN7o=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYRPR01MB13588.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(23010399003)(366016)(1800799024)(38350700014)(10067099003)(56012099006)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?kLgl+Ih0RT7joEDBBsCJSOcCgSCkA/Og3Tle9lhxabgeDkfUyLG17pxCFrse?=
 =?us-ascii?Q?2W2ymYocikNmLzceJsq5Pu98FDkqqbsrnroHr+cErv+puW3C/W1Fs3iXteB3?=
 =?us-ascii?Q?OaxvLsst5i5GS8QGHTZey9kipfKGAZeGNn8DI00HFghg/HVTBQZwk6WdHlbE?=
 =?us-ascii?Q?ZFebFsEDxZ6VwxL6uVKzkXZD+WRF0k6OFecm4gOgtDH1JLMy9amWvjkCUvjD?=
 =?us-ascii?Q?VfyVYXBMyszZJB4B3lUPMsl1uL7FLKvedR+K7zNLVs5CkKSYICHdwU11pTej?=
 =?us-ascii?Q?VbhB90hBTy4F9Ws/2fXaP7GxW0Of6FpvyQy916mKEIc8sp0MoA0AGXtehzO+?=
 =?us-ascii?Q?SycgYBwj0JR/RIuEFOPujJx4WYvsdPMv8Dwb+9An1safd9Y78K03UxLZnlUr?=
 =?us-ascii?Q?1/floE9hiBeiHVUJBFSYFidr6Y0DH14MJx99wCWPtStLG/OpomHKPwUIT46M?=
 =?us-ascii?Q?JCJkLgVHoZcmQQFJwDtrICINirNEZPG1AVwFCsrOxvHkKodOok4ozX6mxgvW?=
 =?us-ascii?Q?hdSTkXme3LJZrhJB0Khy8lS8zIBl0+DP+BDx3BbDywC+lkSxzIWCkucIubMH?=
 =?us-ascii?Q?Qi5YeMBZdcI0k4MON+wsFVyl2jnZzCSfFFio8r9HzN+5RO5u4RRxkOr7Uv9O?=
 =?us-ascii?Q?m5boax0JmLq5vqHEJTfytQLBrTRGkAcSn6+vScPR0wQO3AIpKqX8KeM2wcxF?=
 =?us-ascii?Q?W8ajysZPQRZILMFhB2351CGETE4/kwGuiA2fWIXEfiF9prgEFYhR2KmX2DZg?=
 =?us-ascii?Q?fLjJqkKjj65Fq9HLkFhJ47+6TZ4x7qsv/PVKH+UooS/CV3a3126811dmHG39?=
 =?us-ascii?Q?IKABkeZ6vVUsuaPl56OF3RCYmjF19DI9IWhKWhFZUtdhvcJE5mA9lLCxclWc?=
 =?us-ascii?Q?jC/SGTEpjAZguF3FctBRQiiMmUxjKNm9f3g90PuRQ9mpQuhwwxpK0QjTHFM1?=
 =?us-ascii?Q?RFScu57hIfl4kungldnjRvUz84v51oPXcEeLNM1S5so5S5EfPEkKHCabX2E8?=
 =?us-ascii?Q?SJpSi1QsIzKC+JlcDWCGaTJ5ycDVkRyq6iNPoh9/vbGL5Q9IXhxy5OFMSNyI?=
 =?us-ascii?Q?r7u2Ts9l7oumBrmdjJuvuJ7LfUp4qLQr3llLlIGfbdZ18SpnTPw8EiupIy9t?=
 =?us-ascii?Q?GRQOdVm3wId55Pw5BmtALHdzaFNcg1vuKvGO4xYBOm/tDWgzsoDbejid5PkX?=
 =?us-ascii?Q?GWMzTQ5rhlVOwzNGZpl/scxtTWLvdAQCWwg3Nlz57+/xuL17mW/goWy0TK4L?=
 =?us-ascii?Q?xtnjC1/BJHyZ6o7zDT8jlobFrEg/8I6y+vAogICHY+GFSiqtoB8DwthQwrhQ?=
 =?us-ascii?Q?K3VNpeA8Guy0HM/2g0yJdILXS9e72KuZmecYN7qrS0bv8KEKJ4pBPAbubgH0?=
 =?us-ascii?Q?peczfgC9rXr6idYGNKm2+9IRIdn4o/7F5V1lO+EEgnwuER0UdZVOejC8ACmt?=
 =?us-ascii?Q?FtEEWKEK7VokLhavVqXo/lUH0aRmpRFH5MlkQMAkSUGMWO3BB8bGibMB83va?=
 =?us-ascii?Q?sRuNN2PtfQGcPfzpnpzGNrfl+ozOgpRF9fDUbx+s9TVrTnd9cNcIGKD3vD23?=
 =?us-ascii?Q?1uBP5Jhgp7xx7HsQ+bOf3tMVnyQltGufM2RaLNdvXyfKGU0eQ47I6/+ybdm1?=
 =?us-ascii?Q?PSYwT4ziV8d5T0Bnr+C+6HvZmSGqhODOlhDou78YyPEJj7tKTq+RkGqvrz4j?=
 =?us-ascii?Q?Q27/1zEAQukSKAB9zwm6w7ZqL5TWaD7m43xk4c/qPnGGevhaaQNCsehIyM4I?=
 =?us-ascii?Q?Z24xUWsGk23TckBf4uvBikOdqaiCRnol6tOk6Nea7FywzUjYwqer?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b316aea8-e0c0-4139-0d5c-08df02ab0c2e
X-MS-Exchange-CrossTenant-AuthSource: TYRPR01MB13588.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2026 13:16:17.8157
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4Owuu015zn7tHC0kB1Mh4a3+fMDUxtDqtxIl7PCBncN76PW/uhIRmHNrUGl+Yl7vy7zJaQN9wxJ7oI4tEY6TGSGef7b1mnAi0ZoFQ+HeFmM/kesXMyBcEnNwV4YN30u0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB8495

The Renesas RZ/G3E ("R9A09G047") SoC supports 1x channel with OTG/DRD
and 1x channel with host interface.

Add the EHCI, OHCI, USB2.0 PHY and reset control nodes for USB2.0 channels
in R9A09G047 SoC DTSI.

Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
v1->v2:
 - No changes.

 arch/arm64/boot/dts/renesas/r9a09g047.dtsi | 124 +++++++++++++++++++++
 1 file changed, 124 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g047.dtsi b/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
index 73757e8e2197..e26d43538ad8 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
@@ -1773,6 +1773,130 @@ usb3_phy: usb-phy@15870000 {
 			status = "disabled";
 		};
 
+		ohci0: usb@15800000 {
+			compatible = "generic-ohci";
+			reg = <0 0x15800000 0 0x100>;
+			interrupts = <GIC_SPI 742 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 0xb3>, <&cpg CPG_MOD 0xb6>;
+			resets = <&usb20phyrst>, <&cpg 0xac>;
+			phys = <&usb2_phy0 1>;
+			phy-names = "usb";
+			power-domains = <&cpg>;
+			status = "disabled";
+		};
+
+		ohci1: usb@15810000 {
+			compatible = "generic-ohci";
+			reg = <0 0x15810000 0 0x100>;
+			interrupts = <GIC_SPI 747 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 0xb4>, <&cpg CPG_MOD 0xb7>;
+			resets = <&usb21phyrst>, <&cpg 0xad>;
+			phys = <&usb2_phy1 1>;
+			phy-names = "usb";
+			power-domains = <&cpg>;
+			status = "disabled";
+		};
+
+		ehci0: usb@15800100 {
+			compatible = "generic-ehci";
+			reg = <0 0x15800100 0 0x100>;
+			interrupts = <GIC_SPI 743 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 0xb3>, <&cpg CPG_MOD 0xb6>;
+			resets = <&usb20phyrst>, <&cpg 0xac>;
+			phys = <&usb2_phy0 2>;
+			phy-names = "usb";
+			companion = <&ohci0>;
+			power-domains = <&cpg>;
+			status = "disabled";
+		};
+
+		ehci1: usb@15810100 {
+			compatible = "generic-ehci";
+			reg = <0 0x15810100 0 0x100>;
+			interrupts = <GIC_SPI 748 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 0xb4>, <&cpg CPG_MOD 0xb7>;
+			resets = <&usb21phyrst>, <&cpg 0xad>;
+			phys = <&usb2_phy1 2>;
+			phy-names = "usb";
+			companion = <&ohci1>;
+			power-domains = <&cpg>;
+			status = "disabled";
+		};
+
+		usb2_phy0: usb-phy@15800200 {
+			compatible = "renesas,usb2-phy-r9a09g047",
+				     "renesas,usb2-phy-r9a09g057";
+			reg = <0 0x15800200 0 0x700>;
+			interrupts = <GIC_SPI 745 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 0xb3>,
+				 <&cpg CPG_CORE R9A09G047_USB2_0_CLK_CORE0>;
+			clock-names = "fck", "usb_x1";
+			resets = <&usb20phyrst>, <&cpg 0xac>;
+			#phy-cells = <1>;
+			power-domains = <&cpg>;
+			mux-states = <&usb20phyrst 1>;
+			status = "disabled";
+
+			usb2_phy0_vbus_otg: vbus-regulator {
+				regulator-name = "USB2PHY0-VBUS-OTG";
+			};
+		};
+
+		usb2_phy1: usb-phy@15810200 {
+			compatible = "renesas,usb2-phy-r9a09g047",
+				     "renesas,usb2-phy-r9a09g057";
+			reg = <0 0x15810200 0 0x700>;
+			interrupts = <GIC_SPI 750 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 0xb4>,
+				 <&cpg CPG_CORE R9A09G047_USB2_0_CLK_CORE1>;
+			clock-names = "fck", "usb_x1";
+			resets = <&usb21phyrst>, <&cpg 0xad>;
+			#phy-cells = <1>;
+			power-domains = <&cpg>;
+			mux-states = <&usb21phyrst 0>;
+			status = "disabled";
+		};
+
+		hsusb0: usb@15820000 {
+			compatible = "renesas,usbhs-r9a09g047",
+				     "renesas,rzg2l-usbhs";
+			reg = <0 0x15820000 0 0x10000>;
+			interrupts = <GIC_SPI 751 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 752 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 753 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 754 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 0xb3>, <&cpg CPG_MOD 0xb5>;
+			resets = <&usb20phyrst>, <&cpg 0xae>;
+			phys = <&usb2_phy0 3>;
+			phy-names = "usb";
+			power-domains = <&cpg>;
+			status = "disabled";
+		};
+
+		usb20phyrst: reset-controller@15830000 {
+			compatible = "renesas,r9a09g047-usb2phy-reset",
+				     "renesas,r9a09g057-usb2phy-reset";
+			reg = <0 0x15830000 0 0x10000>;
+			clocks = <&cpg CPG_MOD 0xb6>;
+			resets = <&cpg 0xaf>;
+			power-domains = <&cpg>;
+			#reset-cells = <0>;
+			#mux-state-cells = <1>;
+			status = "disabled";
+		};
+
+		usb21phyrst: reset-controller@15840000 {
+			compatible = "renesas,r9a09g047-usb2phy-reset",
+				     "renesas,r9a09g057-usb2phy-reset";
+			reg = <0 0x15840000 0 0x10000>;
+			clocks = <&cpg CPG_MOD 0xb7>;
+			resets = <&cpg 0xaf>;
+			power-domains = <&cpg>;
+			#reset-cells = <0>;
+			#mux-state-cells = <1>;
+			status = "disabled";
+		};
+
 		sdhi0: mmc@15c00000  {
 			compatible = "renesas,sdhi-r9a09g047", "renesas,sdhi-r9a09g057";
 			reg = <0x0 0x15c00000 0 0x10000>;
-- 
2.54.0

