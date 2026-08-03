Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011025.outbound.protection.outlook.com [52.101.125.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54E3D375ABE;
	Mon,  3 Aug 2026 13:29:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785763751; cv=fail; b=uu+cMp5WdKfJbhDjSlpMPMfAvgaw7F82OWh+vFYqxUX0RHJ3R6ShmIbsvWtV/InfcD5qRD4jiKDtyK55AW5WyjuqTSHXkVyfuVGoYSz39i+ItfBLyrAQ0ELsR7vSYP5I8046ZEMBIwkRdtleWPEUp0+FCoOkYYBjtKdXO+j1WJQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785763751; c=relaxed/simple;
	bh=2tygM/ttgf+a8uxF1UDnaaUIPUb5uCmFayaNsTM+TWk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Q5SGFYDMXDdOUGHbIqQtSu2LMJ70nfe5argAk+H4bmtaSrqXlo9jvRrPxoSX0gYaI6DMaGiyl5Ez8VN1kDAtACooCP/fUNNs3LKZHyvSjcK7b0Q2PwN71KYv3c65uL4g4lTkUkDS7z7jgwQaicPvDKN3f8nAiO+DIx7GAB9V/7k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=fnTIIb1L; arc=fail smtp.client-ip=52.101.125.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="fnTIIb1L"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FhS9y3M33YVC/cV+BTwuU9Adx9usYK54RWQ2m/yCyuE5FbWSy7n8ZyL/5c8vQM5Lg1DHIDNlGb8tRLoHL297KGa1et26m2Tn5YSCc0mprHQPm6Ik8XYKxzLLpWzQhcsXOFk/huGfDjziBLv4Zr+ILZyLjNaE1oBvmdzbPpqG49VUGBEYmwOutBkykKbUESu6MYE+W3+fg9ijHuw8/UjZzSjyeqHDtFJTmH+OBrtnpIfa/e0Ptyhi6eoEvllfIWi91hbo36T6CVOTM04Dij9h/SJ3XK4LLrwA0DmBJRkys8n595vlc5VQMBWOoUt5sKLDwdjwcteD8pWsIexz4h4xkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i4jz60wGfPYLlThVeDOI/y0Q2g60OBkrMCcaZeES+Tg=;
 b=CaBjbZ6/r2dmoX6iBuhczT/n3TnTU52SETueZgSyEu9JzV4R8nw1040RBLpiMiPW4ddCQSCZMvoXvIgbW6HdpHWzUu8k7vdXBcDZzqDfKv6w1EsBvDW8ZXAzvbItVNgeRcP2A8vk+t7pqK5EWn+dmf9ljKQBbM4dRju2X8oceISYEFw2wA3IoUK+QTT3wYVf4QBGE1T7dJKVx0WTDTpgM5D5stO8+soFp8YPNl/sIvd/Gup6RCognle73a/V4lIevTd2F5z3oRC5vHqIexUzamQDlMEfudvinWEN4Ts3Nq+O4Aus31kgCxOyZec0as9JEllrcxJTP0yd3KNsqfPGfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i4jz60wGfPYLlThVeDOI/y0Q2g60OBkrMCcaZeES+Tg=;
 b=fnTIIb1Lc+itNw0AC0dcFTGrvGlHtWk65ie4eYv9W5XL2tgzR9+SiJYu0P9Eu/ia3ttoLBEbEcMegPtMTNRJ3m3of6xbN9E/IY3dEIMBfgaE3cGgkF3UJotMzLqNYdAa9QMuom2oVABBkGj0FBb2f3JeTcui1kkNdxps25tlvEA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYRPR01MB13588.jpnprd01.prod.outlook.com (2603:1096:405:18d::7)
 by TY4PR01MB17923.jpnprd01.prod.outlook.com (2603:1096:405:34a::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.17; Mon, 3 Aug
 2026 13:29:02 +0000
Received: from TYRPR01MB13588.jpnprd01.prod.outlook.com
 ([fe80::2f5b:8560:48ed:3828]) by TYRPR01MB13588.jpnprd01.prod.outlook.com
 ([fe80::2f5b:8560:48ed:3828%4]) with mapi id 15.21.0270.016; Mon, 3 Aug 2026
 13:29:02 +0000
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: tomm.merciai@gmail.com
Cc: linux-renesas-soc@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	John Madieu <john.madieu.xa@bp.renesas.com>,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] arm64: dts: renesas: r9a09g047: Add missing I2C clock-frequency
Date: Mon,  3 Aug 2026 15:28:25 +0200
Message-ID: <20260803132828.3249424-3-tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260803132828.3249424-1-tommaso.merciai.xr@bp.renesas.com>
References: <20260803132828.3249424-1-tommaso.merciai.xr@bp.renesas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR0P281CA0050.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:48::13) To TYRPR01MB13588.jpnprd01.prod.outlook.com
 (2603:1096:405:18d::7)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYRPR01MB13588:EE_|TY4PR01MB17923:EE_
X-MS-Office365-Filtering-Correlation-Id: 14df236f-18b5-4785-e0aa-08def1632ebd
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|7416014|376014|1800799024|23010399003|366016|18002099003|22082099003|38350700014|3023799007|56012099006|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info:
	5dMlBjmOq5XDj5EtVrjclILfVE7a0us60XSaKcIDJUfw8m9DIJc4eyxv0tdmAOkA/2Pcw8pHm9rNU4p7mBLbE+8rlHQ4dp0WsAc6n7hwnmKHiYF5E85pc10Hjcd2kPe6YoirpnVcoV92k9odf9WYRSRdlHTYbIUUYR1JlTgKw4mxLV/8crDLVnppkPS+SctYCaCZP7pJDIzsToYBxayhhPpFNyUJnp8CMwHNEnG7vGKLOgflksb8ZfXi7ZMYhZQ0MCKAMae8X2M8o0Bq0x1aIPr779YGD6n9gENvV9ETGiNUIe1HEhSPneWU/vEOCmYiOndBPZm6rXlQi+NwyZ+OEpDRiD6jT2sihm0DV/bjsBzNDsxysO2dMQ2vNtVU2sry+Jc03GcCHp1dr7OzXu75bkNV6i69hK94P3Roy9rXIHpmV2NHUxmR1JQiJo0f5RXGazWpGXFK/Cz/MIFZgQOj9B3wVRxgu/AWMHEf4aDHJkzd4JRQMauz1KtIWslG/Ivr9J03GixyR3m1QgzOKD065kiFioUn3k4jrw/YzTah43RtbqaDbbA29PVpxPeIqPB7mO59I9USonvfr0JMIbPaNKEW+c6RvBSC/lBVUY3J5OEiqdg91PlKbqvVRQvsWCoYtIsQr/GBC/ZM1x78YJ8W0fEk3E9venaeO8klKFLyVUVEVRHQLMA0tR5L32G4gYb1PuX2dVEJeEWg86yQYir47EqY7Fvw2F78DWcG8PCYExQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYRPR01MB13588.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(1800799024)(23010399003)(366016)(18002099003)(22082099003)(38350700014)(3023799007)(56012099006)(11063799006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?vOeObYe8XfNI1U+prAldaglWNVjkzUfwBezrXjvT3ItwU6PsKDfaKu5k8AXS?=
 =?us-ascii?Q?M6Uu17CoBvGMlzc1DTVbhTjOgAMjJcvcBfbyjEeYHe3j/KwUhrxPepjZ2VLq?=
 =?us-ascii?Q?6tZVfoQThZgMun244GNco3mHpBr2HxEsLpeTZ0hfOipM3Tkr2l5vYpMO8FYY?=
 =?us-ascii?Q?z0ql/4asrwuvgVC0bktWdAgpRHoZcnoaJFtF6mjgrrTuYeXQHuJV8vytaZ43?=
 =?us-ascii?Q?PrZmq7xG20SZ42MDtEK5rpSScZm9IKwbYtZyJoQI8QyK+KUMjRLbos3DyMdn?=
 =?us-ascii?Q?XTx7cPgHwdri2M+tIp6N5/lV8kRYHOdzBzkmvfBB7PAKbFfGewJp+Ebq3EbC?=
 =?us-ascii?Q?0VR0C6d1ESEf8AApSadTnld1gTU5J275aOCHsFP206xpiPI8MHdYWSjHH9Bq?=
 =?us-ascii?Q?LuAdBpXEpAvKN1TVFXdUwTU21SOYEkZkcmRc8SRDGHo1Sx1kPthqHSLDc17W?=
 =?us-ascii?Q?OQTmXuBNBgSgY9Ic/9awu/zYmXN3Y3ePzRX5hULHKnPpPnT+KebwrSTr5OtS?=
 =?us-ascii?Q?liqINLPaK1M08VqO99BWjJAH5KnqfN1/LSYVfZ/21BZTErnIptV1y4JU7D2B?=
 =?us-ascii?Q?LYVqc2SGKIczC++damEU/jWuRgiTgMcuYAAKIqmn40Q2crdWxkZ95fj6PKYN?=
 =?us-ascii?Q?lDsxylH2GSUhxRakJterD8OJFfij4RyzSfVMHSycnfzu0QlHEpZquiiLW6wU?=
 =?us-ascii?Q?WrV33TUERQpXYAqb729xNKoEiz7IxKwXtIATqqW8ftrKa3PlFPH5f+jYMmBb?=
 =?us-ascii?Q?N9cKFLHiVvecYurSVtVBIKE1WKFEBOoPprnz7p2H6urvvAds+Xd0uXm4iTbm?=
 =?us-ascii?Q?Lnj2nQ6T5fkFfgrx2Rexkh1hdKhj6pUAx2bRid0+7Qg7GbCLRP5RB5dkrt3d?=
 =?us-ascii?Q?eHRuaTHnGayQ4Z+t2YRZvtDRaw5vK+GkqmF0N5TOMPZKtccSB5Frpxpvyh5Y?=
 =?us-ascii?Q?aTvUsHtJezaZw9NxzGwR8f7RouPWPl2A7R5RKoSIC8AKjdM29MIYLv+6C005?=
 =?us-ascii?Q?VBqplwiXIxTSGoXcyTz/MF4j5LrZmytg0TC1BjDoiPFjHRTotyE53yWl1wdv?=
 =?us-ascii?Q?SqF+imZcuBefs+45D4RSWf8qbIbYDe7I3ouwTlnmYhAYCA0Ha8byHZbCXv94?=
 =?us-ascii?Q?k3L0aRae4RSrPl25iesN438S9q0Q4CZOay3Tyh6USSZDW5fNmhJ/BT9MyVXd?=
 =?us-ascii?Q?UdrE2ARXssvb3BSF+8/f81J9Yt5s47XCVwSFjJLxtew3KkuZUVx0uLToTL/x?=
 =?us-ascii?Q?mXCa6LCohMgwn4wgcsSjx0LQXiJngOSWk5DPxm9A9a9QlYHMT/Ye5TTyiiGu?=
 =?us-ascii?Q?jhXccBv0XIBCVSNalKo6pAgfV5a47fCEZg88LbhZm5+MldRAigCPZAWy9ks1?=
 =?us-ascii?Q?8AXqwFW8G+9/8QXWmK7Uw4D86cX6qNSUV2oe0r28GPvuCzq90EKyxfmucqwT?=
 =?us-ascii?Q?3A6b4Qk6MbBcYpKOgFgSJGBC9QP4ez0dEnBHDRCw/51v6rkxW67MWEiLueru?=
 =?us-ascii?Q?BkeQtiX2JC+KrpOkbyh+QNNmY+vtwPWKfKcHI/rvjZ6u0gvhVCMs0VM+vzVy?=
 =?us-ascii?Q?ODe1SXq65M/3zZAEIVRES28i42n5Ew3LMCVaTHoUEE+ub6aFQe37ZTEjWVnD?=
 =?us-ascii?Q?SoUkAfbeqDOs9agW4v0DxhBHwvu8NijTqZbwQCU5GHwhDUkbqgR6FWGDAwIp?=
 =?us-ascii?Q?+4mBXT5oPIdX0N9xPIqX7RZtMJBb2q9ALdEO3gV5LGfJfAVk1OTkUJ3HN/n1?=
 =?us-ascii?Q?yOI3V1obSmGBWlzX7hNYreWDhRJ0RJ6jAoC2i5iaJrrdoyZMpDrx?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 14df236f-18b5-4785-e0aa-08def1632ebd
X-MS-Exchange-CrossTenant-AuthSource: TYRPR01MB13588.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2026 13:29:02.2492
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mcaBw9TFIogYqDcMPqU4aRkUXQYgAybr3GsDQGpLjr3c7iwzJ5BNMXS/ZpGMs7fs8XO4XIzf7h1nzBJek2oALGmWKeWoWtwmzjXybet73mZqaN08GYz6hLt2SHvtQSab
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB17923

clock-frequency is a required property of the renesas,riic binding, but
it is not set in any of the I2C nodes, so dtbs_check fails on boards
that enable an I2C controller without providing a rate:

  r9a09g047e57-smarc.dtb: i2c@14400800 (renesas,riic-r9a09g047):
  'clock-frequency' is a required property

Add the standard mode rate (100 kHz) to all I2C nodes. Boards that
need a faster bus can still override it.

Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/r9a09g047.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g047.dtsi b/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
index 73757e8e2197..b9a707f04004 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
@@ -1538,6 +1538,7 @@ i2c0: i2c@14400400 {
 			interrupt-names = "tei", "ri", "ti", "spi", "sti",
 					  "naki", "ali", "tmoi";
 			clocks = <&cpg CPG_MOD 0x94>;
+			clock-frequency = <100000>;
 			resets = <&cpg 0x98>;
 			power-domains = <&cpg>;
 			#address-cells = <1>;
@@ -1559,6 +1560,7 @@ i2c1: i2c@14400800 {
 			interrupt-names = "tei", "ri", "ti", "spi", "sti",
 					  "naki", "ali", "tmoi";
 			clocks = <&cpg CPG_MOD 0x95>;
+			clock-frequency = <100000>;
 			resets = <&cpg 0x99>;
 			power-domains = <&cpg>;
 			#address-cells = <1>;
@@ -1580,6 +1582,7 @@ i2c2: i2c@14400c00 {
 			interrupt-names = "tei", "ri", "ti", "spi", "sti",
 					  "naki", "ali", "tmoi";
 			clocks = <&cpg CPG_MOD 0x96>;
+			clock-frequency = <100000>;
 			resets = <&cpg 0x9a>;
 			power-domains = <&cpg>;
 			#address-cells = <1>;
@@ -1601,6 +1604,7 @@ i2c3: i2c@14401000 {
 			interrupt-names = "tei", "ri", "ti", "spi", "sti",
 					  "naki", "ali", "tmoi";
 			clocks = <&cpg CPG_MOD 0x97>;
+			clock-frequency = <100000>;
 			resets = <&cpg 0x9b>;
 			power-domains = <&cpg>;
 			#address-cells = <1>;
@@ -1622,6 +1626,7 @@ i2c4: i2c@14401400 {
 			interrupt-names = "tei", "ri", "ti", "spi", "sti",
 					  "naki", "ali", "tmoi";
 			clocks = <&cpg CPG_MOD 0x98>;
+			clock-frequency = <100000>;
 			resets = <&cpg 0x9c>;
 			power-domains = <&cpg>;
 			#address-cells = <1>;
@@ -1643,6 +1648,7 @@ i2c5: i2c@14401800 {
 			interrupt-names = "tei", "ri", "ti", "spi", "sti",
 					  "naki", "ali", "tmoi";
 			clocks = <&cpg CPG_MOD 0x99>;
+			clock-frequency = <100000>;
 			resets = <&cpg 0x9d>;
 			power-domains = <&cpg>;
 			#address-cells = <1>;
@@ -1664,6 +1670,7 @@ i2c6: i2c@14401c00 {
 			interrupt-names = "tei", "ri", "ti", "spi", "sti",
 					  "naki", "ali", "tmoi";
 			clocks = <&cpg CPG_MOD 0x9a>;
+			clock-frequency = <100000>;
 			resets = <&cpg 0x9e>;
 			power-domains = <&cpg>;
 			#address-cells = <1>;
@@ -1685,6 +1692,7 @@ i2c7: i2c@14402000 {
 			interrupt-names = "tei", "ri", "ti", "spi", "sti",
 					  "naki", "ali", "tmoi";
 			clocks = <&cpg CPG_MOD 0x9b>;
+			clock-frequency = <100000>;
 			resets = <&cpg 0x9f>;
 			power-domains = <&cpg>;
 			#address-cells = <1>;
@@ -1706,6 +1714,7 @@ i2c8: i2c@11c01000 {
 			interrupt-names = "tei", "ri", "ti", "spi", "sti",
 					  "naki", "ali", "tmoi";
 			clocks = <&cpg CPG_MOD 0x93>;
+			clock-frequency = <100000>;
 			resets = <&cpg 0xa0>;
 			power-domains = <&cpg>;
 			#address-cells = <1>;
-- 
2.54.0

