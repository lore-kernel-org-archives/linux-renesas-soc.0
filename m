Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011053.outbound.protection.outlook.com [52.101.125.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4DCB470128;
	Tue, 25 Aug 2026 13:16:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787663777; cv=fail; b=VDVyaIcVgb4zJJ1rAOsfgTib8K8NmuXrielZFi4UjZIVgh8olyqJYeAHu0e0XwetPQdW1/8gUQmIJ2STIg1NRPKQCjL4a/ET01FiVmNPc1uaLjw49mSYu6reS88KNcB+iHrQvKvFKpD+ObomLj1meXNJGtbVhLvD3ybM8WJF0so=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787663777; c=relaxed/simple;
	bh=4svIKrwXaDsIJ0BN2yukEO7MjwS+jhLCOYHQCf7ozX0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=QQFdZuS7UD4iRoJSGbKs8L0Elqoc1YQuRtxJTgMLPJH+ptb71Tq99zKrPCVbq4ptrYA3pADmQ/rNbSmGnh2BWjJufzvYU6oBQSOeg6PkIvXh+/A/YIKZurOhx5VBtI7yF5YZ+IXBiJgJ25NESpaTVqyuBl2DQmHAw2pxtU8esaE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=l5isHbUm; arc=fail smtp.client-ip=52.101.125.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="l5isHbUm"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PzShfG2JZNQ991s2VXGoiTVoYowJih59NravSIp8fT5uMtZ44j67/qubCsTskECvQLLbMjzrMKAzbKWjM1Ejhi+0G4E7R38T5jzP/AjwGFvybbMJOFblY4aUQzxf+v4rzVQ3MpBjcUi1X4Zm91a8VX/IHIIqqD8xGpYJkGhG96g29fEwOQy6qsxMio4MnIE0ftcBD+JIJbpisKCGLZr+m7fzB4do/oHMPy0RS4GsaM9lCSXr2+P4/v9SkAXrh1tcsnXArMr+9NUQkqFDsfgJ5lCtmCyOoA1lTaX49aN92kl0ex8hsqLXBfahtctsfTRDnYYGVgUMW6z/RjAVHBiWaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+Y0OR229EdfLBBumbJNFXV6YfrNqI/a7nYvsvJoRlsE=;
 b=iVZnC8of3sBhwtbN47VUm/dUaB+BxGHgKKZ3yx13+YDmdKdiw5I9xtFe+pEzi8PEKZEyQUiTfVUjFrqwAyeX9PaWLVc73aN3QlYoQhYmtytQu+PdQO8kb4HjUGzTEqPSQY82vSO9jwGOzKoHOZuafWU7ok+frxiz3Caaq4Yp8nY/uYGKPrL3UL4aiLyd2IMUHASulM3GHiILHJF11gKWj/hwueJ/6EtdfMvcmJ476qpcb+bgo2cgMwkt+1p0G9QbEdWehBxjWrMD8JY1gSUhmfCT3PYGTgCO6n4N7D7/xWQ98bfBdTSlOBQImoARCcO3LsPu6XPdmBUQqnZVefO73A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+Y0OR229EdfLBBumbJNFXV6YfrNqI/a7nYvsvJoRlsE=;
 b=l5isHbUmRs8firLhPEQeyV5AmuGs/iwsYQt1mC3t4yklkDsnmIVLZE3eXOCp32ZF5Zja8IqmbEM6JlCk7LLBsE9vVk33TGNWN93+Ki2dERtMhc+cG9N6B2TyGWhz1N61/jfbZ4kwHpAIHBMW7q0EIvTSRqwpV5hTygOVY//ZJdM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYRPR01MB13588.jpnprd01.prod.outlook.com (2603:1096:405:18d::7)
 by TYWPR01MB8495.jpnprd01.prod.outlook.com (2603:1096:400:173::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Tue, 25 Aug
 2026 13:16:13 +0000
Received: from TYRPR01MB13588.jpnprd01.prod.outlook.com
 ([fe80::2f5b:8560:48ed:3828]) by TYRPR01MB13588.jpnprd01.prod.outlook.com
 ([fe80::2f5b:8560:48ed:3828%4]) with mapi id 15.21.0339.012; Tue, 25 Aug 2026
 13:16:13 +0000
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
Subject: [PATCH v2 2/4] arm64: dts: renesas: r9a08g046: Add USB2.0 function device nodes
Date: Tue, 25 Aug 2026 15:15:23 +0200
Message-ID: <962c65901519b066b201f5f9bf15047f9aa45ffc.1787663426.git.tommaso.merciai.xr@bp.renesas.com>
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
X-MS-Office365-Filtering-Correlation-Id: 88df3b42-b89b-4d3f-bc19-08df02ab0950
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|23010399003|366016|1800799024|38350700014|10067099003|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	WoPkwSGgMPox6JVd/jXPjVeQRJnV1oF12InmCZ9xZfvEHItWml/dOm1tufYg6PTVe+ohJ5l2VQ5655O6+Q/uHUi36u3C7IhOfVj6MbXGsO+ogLXtmcM/QwkHn5vdieO75wXr8kz25uqUqsAv0879MonQPkpN8ACdcrPR4FO6lld0rzPHhR66olv9rb7bJA+DsVv3w1wRPjAjj04NFDwAvZ+cCIfaFEu+S2hw1epL+kPSbOgVBu6jpvBIQzrDA4oSySWRz8BxTIF3RkD1Rirm0/qfD3rgWHdRMf+qerV04mm0IUcJ4Rrw0jNQymWS2/ZutfmPEQa5tf7Set39PxxeNWRDDvRaVwUBhCgvp7Q+mR47fncTver7pdnaWR0q5D621Fqje48Yk8BzsuttbJFVT/wP77RQh8CTe4jfF8BsKPi3L0jFZ3z3dTNxW6gJXro6WKdzxrhpBtvOQxotzHJ3+Nbr4Z9VWGSRFWdsKZpwv+lhaZa8VFakEwQPNJTpxhly5IzvHaqp3L2GZLjLH6P5WVEpZLzApNED3RzdWtI1xWP8vwRr40ibppkzCoTIdj3oG2h+WBGXesgvxFetXs0TQpQ1hDe4+4adH2BJrSzrDKz8obHGJaEuxTfmwSQMdbjbv+gtP/UISrWL6LotLjf3jj6M2HPrbBjnZnt6dIglt8PNpn6/TRIW/VVBL5nqTutIcb/lusKvUGhaw9pjVmXMxHznvZT4ZYajv7/9VEDMjEY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYRPR01MB13588.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(23010399003)(366016)(1800799024)(38350700014)(10067099003)(56012099006)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?+9sR0v//VCiV0aS1xCYegECtFrnCrFGcre8AV+wW01Dhk+mVMxKr1vMjJZnh?=
 =?us-ascii?Q?rtjvufNr1EwpGG0QSIIstOb1eXcXDdBpZmJFB8DDmoIvAyWe0TxYw9QmGNEl?=
 =?us-ascii?Q?mnAM+7bYWgWq5N6UQiVlEa4KvZxYVkzTDiupS6aNytI2CY8Z9BqKBYziczIj?=
 =?us-ascii?Q?49wAut/lFy6aCyCiftZrkX71am1/WgMTPXohCAS4sXUDdWVP24EbY15gMGB4?=
 =?us-ascii?Q?hv552RtKHobX/fcbyL6Dz0ShvKfbtlkFTNlQ9CiV4BPJtXjq4O+brC3512hH?=
 =?us-ascii?Q?pMogiWWfveoEil4eZLZhVr7bCwXTdxjc3jFFCh3iEXgR90aIoXL0fxO565MM?=
 =?us-ascii?Q?b7+8F3p8wzK/fu0Vry3pRtcpB5IRpdzCUrJNHI3AwVg1OdjXvQ//L8tR8fvq?=
 =?us-ascii?Q?U0sf1Ar6akn01/i6ieRmeT1WlAIT4Ef+Qpgf2vh6r/LOPgsALYmaM/RpTOFA?=
 =?us-ascii?Q?N5eF8bZBiH7MY4omua4/ww4vzEDfrZ/1qfof5XPBUlD//LgrRukgWNmcv1zr?=
 =?us-ascii?Q?/p1ipZSjrWY24a+O0WK7A+waybY8NHWeldn8+hrccE8dyL77bOdBpjpLnnbV?=
 =?us-ascii?Q?MNfW0zbSJ0hqAJIoLDF6gQbUTyFjaJDUo+gXisVjVADYTrjNWQ6G6rVEPEeL?=
 =?us-ascii?Q?RQY3ttma+AcNOR9/pNhZat4Uqh9bzx1MZRl44OHOFhI06Y9nrIRRpomAYNUj?=
 =?us-ascii?Q?S2Av6uYA2/SMlEiQJhLYAWpS+5HiM6bVkwsmN934R0y1WjhYq6CoV4g3IVE0?=
 =?us-ascii?Q?tbt05k4duSLi6A1xkg4nrj/OVY5WHbR3mnyoxU4ohSmhs++FkyBIC5Ib1lrA?=
 =?us-ascii?Q?b81cWpd3wnAGlRsCwhqprsjWRzI2ovdDAVJ7etBDVIuPtIDi0Unl6ypiVl4r?=
 =?us-ascii?Q?Ny3iA+QoGipgeOubil3wTBNPsSgYJ1+jpHw+AJe0EPboiwdGGmHsCap2SSxG?=
 =?us-ascii?Q?hv2n5Ug66n5v+xe3H2rW4R1QxZCb6uyvHJXgfTnsR2MKS+oRrBi8VJbchRzY?=
 =?us-ascii?Q?nhO9J7aS8k0RsK7kGvs21xlLiSf99ahtmFwnrd01JP0e293k9lXg7b5iFEBe?=
 =?us-ascii?Q?i0OJiDVvCg6L5zXm8k+N+IeCK8Bs+fk5+rK7GjGCFEGlv0zUo5Y5mWeiJiWJ?=
 =?us-ascii?Q?Ir+xcbg1PfMKrVfQ4hNWgKQ14Gq0cpt+BxqeBg3XKXxrjy/U03ICTEWh7/BE?=
 =?us-ascii?Q?Y5/O0UdoBY1Nj8NjEzN8owVvwDWl02630/gZHGmjdUiR2jsVfUHvbmCn8tLN?=
 =?us-ascii?Q?hnDOUPKwd5i3za/BcIBTpUNM3s8LLMdFidNZUZ4OA+lG4RF8XnAS4n8Vff3E?=
 =?us-ascii?Q?KE6ke6Gb147M0POvB0IvBrgydfqx8qJtv4EwiV2quQRnYFr1svKE/1HjnLhw?=
 =?us-ascii?Q?m7Ou2xH+joxRUTQWFruM4JvcJhx9DSJ/R57MAADRI0gjB3m/GWPCmbmc78ST?=
 =?us-ascii?Q?jPZio6vIZUvKSxWh5M1F6I/aPqxf9PKa80PvvxMGTmhtJ+Wrpxw/kLTxKhdC?=
 =?us-ascii?Q?B5zVAo0Xu7J4SnKB5ir2vn6mk5Ui24x9S8wNx3sJiqbLbFS8iT+HunHqiO4h?=
 =?us-ascii?Q?2d6qM5692dNufoaoAlzZvnefoIYeAX9462qmZTTnXd1uByJmSow5AL0bJW5m?=
 =?us-ascii?Q?v26GlOlCZXgVPZtvXacmF+ZDGlEEI4nbFcyI3xzqYaAmE880sGdP/ctCCskz?=
 =?us-ascii?Q?fFvFrWcJCycTNNzcfHHu4/Xf09kzByzatxpx5LSvGB5X5w8e4S8gUiX/QW+D?=
 =?us-ascii?Q?6kN/xfktGxQTbW69zvoz+ARqKJcPvmkzZlg6BVN9Ow81O8pNH/gA?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 88df3b42-b89b-4d3f-bc19-08df02ab0950
X-MS-Exchange-CrossTenant-AuthSource: TYRPR01MB13588.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2026 13:16:13.2249
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fnyekWPGFXA0h7wvIIfe4DOf0qsV37KSOOOFkOgIff0Gcwhcqt6VLtf4+yP5fcX2sg7dAv0l2oLr01ug7mLIe/EeAfjS8q6/ngrNP858odQxAbaucpH2p461jIlgSHrc
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB8495

From: Biju Das <biju.das.jz@bp.renesas.com>

Add USB2.0 function device nodes to the RZ/G3L (r9a08g046) SoC DTSI.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
v1->v2:
 - Cherry picked from "Add RZ/G3L USB2.0 host support" v7.
   v7: https://lore.kernel.org/all/20260812141940.246223-8-biju.das.jz@bp.renesas.com/

 arch/arm64/boot/dts/renesas/r9a08g046.dtsi | 38 ++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a08g046.dtsi b/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
index 2d8c8fd8a01c..7cf29aed5211 100644
--- a/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
@@ -1105,6 +1105,44 @@ usb2_phy1: usb-phy@11e90200 {
 			status = "disabled";
 		};
 
+		hsusb0: usb@11e30000 {
+			compatible = "renesas,usbhs-r9a08g046",
+				     "renesas,rzg2l-usbhs";
+			reg = <0 0x11e30000 0 0x10000>;
+			interrupts = <GIC_SPI 123 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 124 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 125 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 122 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD R9A08G046_USB_PCLK>,
+				 <&cpg CPG_MOD R9A08G046_USB_U2P0_EXR_CPUCLK>;
+			resets = <&phyrst 0>,
+				 <&cpg R9A08G046_USB_U2P0_EXL_SYSRST>;
+			renesas,buswait = <7>;
+			phys = <&usb2_phy0 3>;
+			phy-names = "usb";
+			power-domains = <&cpg>;
+			status = "disabled";
+		};
+
+		hsusb1: usb@11eb0000 {
+			compatible = "renesas,usbhs-r9a08g046",
+				     "renesas,rzg2l-usbhs";
+			reg = <0 0x11eb0000 0 0x10000>;
+			interrupts = <GIC_SPI 127 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 128 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 129 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 126 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD R9A08G046_USB_PCLK>,
+				 <&cpg CPG_MOD R9A08G046_USB_U2P1_EXR_CPUCLK>;
+			resets = <&phyrst 1>,
+				 <&cpg R9A08G046_USB_U2P1_EXL_SYSRST>;
+			renesas,buswait = <7>;
+			phys = <&usb2_phy1 3>;
+			phy-names = "usb";
+			power-domains = <&cpg>;
+			status = "disabled";
+		};
+
 		pcie: pcie@11e40000 {
 			reg = <0 0x11e40000 0 0x10000>;
 			ranges = <0x02000000 0 0x30000000 0 0x30000000 0 0x08000000>;
-- 
2.54.0

