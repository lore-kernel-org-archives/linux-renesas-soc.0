Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011006.outbound.protection.outlook.com [52.101.125.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8216237A48D;
	Tue, 18 Aug 2026 14:29:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.6
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787063385; cv=fail; b=plWniFLuVtQrBmBdcrqDYkRiNnaaNOgxz/NJKJFzHKa8iyg4G09vx2AwByd1nHKtgb7NO93MxD5wgrPjvo5exMSFyevt8QhswAJUMsh3EZeex9/Izm0YIXpC7jbTWVamu0mbWuAl2vrvs/22skbNW8Q76WGHVpqEi5eRFSldcrs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787063385; c=relaxed/simple;
	bh=vtfRJJUUGrglYyd95m4/0xqH6dWfNKECbyzaFWE80oU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=oOdpGRtNUWWq1un/4nhGSfZsRd2Z7NS+w+1XyVOLDQVk2aDaCbvzUcqgfO/QE3P+RRjjow1jKefhYXQZlAcBMPAdnz2c1JwLY3J6g+bYVzwMFAwei7GVViySB/OWp7T93o5BupE1+g1Y5tBr7pA1nWB/7oCXuDxc/94YAvKaPaM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=dg1x13Ys; arc=fail smtp.client-ip=52.101.125.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="dg1x13Ys"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LwbhbusuafV+dbeb4jXDOotaxddQR4XwOqm8CNnVStUH3tc1+LHbKj9y3OGDv68TcFIumz0aJSKI7JkTRaIpFS9I5/j/t0GR3SpfFWKwQlF+5LJ106MCsuvUzZLIFxBYMmvNEVtpoXbK1/iXessvszaYzAfT/CcnxSqSJNtbvqJFGEGlIXHNJQ7XuwPI92zlwXP8CgccZUVKvPHiGNYlxVQ+le5ENJ11ej1XwNoG0q6wE49PJuPUrEcPqNJyfs0rzMtW+ICcUmhJkBAm77Og9tQbDbylDHIkNJlH0/Hz2kTn12Mn7uGF9nGq0StmWO2kTDMFi1Y111sm2kA0gf+56w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/ZUk0mLPQqtAVBYkkQcmLvPbQQmURkx9XohuyVHd1JE=;
 b=wgWZcxYfChR03lIC/A3BmGXS/SR2+FhqL3JeniOVyzDBqwxFvirbmtmNr2dmGBDMVhcirAjnJQm1zD6tm15jszRPpirbaEo8tdAohDSrluWGMoQD3LXAfyTtf0JXkZ4pU4hnNVDA6UsHLEBzF8DbneEqfCc+DzVc35ji4yF0p62jnyAL5UPNr3d5Miskera4wfjV9N2E8zFefyjBoWEqMsw4h7UNGaIzTKViNTy9NXzHaRYeM5I++VVnT89qV1jru8yqeWbTklddTaC9kENtrmCwzBssFOGmL8tsmh19pCy97GKA3UeBWo6JHRH8iRscq4rTiZShmFX7knjPTOTepA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/ZUk0mLPQqtAVBYkkQcmLvPbQQmURkx9XohuyVHd1JE=;
 b=dg1x13YslcLi2oaTQPK80/BZpj5pdDTnHtJT23VqC9B4ZEtV3obLvKyENM3VkOipV+VOHskUXPCguMd7S249+JolEVN1vMrOKDK9/ajtvrBNrxA4IHX6vvVixtf63JUtxUNA5XvhJBb4/ytBTtjHLERI95Zv4RoI2f2H8eKw4oY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYRPR01MB13588.jpnprd01.prod.outlook.com (2603:1096:405:18d::7)
 by OS7PR01MB17734.jpnprd01.prod.outlook.com (2603:1096:604:460::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.17; Tue, 18 Aug
 2026 14:29:41 +0000
Received: from TYRPR01MB13588.jpnprd01.prod.outlook.com
 ([fe80::2f5b:8560:48ed:3828]) by TYRPR01MB13588.jpnprd01.prod.outlook.com
 ([fe80::2f5b:8560:48ed:3828%4]) with mapi id 15.21.0315.016; Tue, 18 Aug 2026
 14:29:41 +0000
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
Subject: [PATCH 3/3] arm64: dts: renesas: r9a09g047e57-smarc: Enable USB2.0 support
Date: Tue, 18 Aug 2026 16:29:01 +0200
Message-ID: <c2a9a45078773cd022cfec77578ed68c57921c73.1787062965.git.tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1787062965.git.tommaso.merciai.xr@bp.renesas.com>
References: <cover.1787062965.git.tommaso.merciai.xr@bp.renesas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR0P281CA0128.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:97::10) To TYRPR01MB13588.jpnprd01.prod.outlook.com
 (2603:1096:405:18d::7)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYRPR01MB13588:EE_|OS7PR01MB17734:EE_
X-MS-Office365-Filtering-Correlation-Id: d897293d-2e9e-42da-b793-08defd3523cc
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|376014|52116014|366016|38350700014|56012099006|10067099003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	ENxkEA7pRF6COkmRoKnME5feVj/6raOoS9nAbC+nybNm4/iJFu3WMiV7yc19802Uj6zd/d+KT1JFylcMSuRIsqYJqzz26fQuDY30J7YeS47pDdPjbFxWuOHHDNkTFSpm7RvAKIQXvpQRSibYE/0615ESa8a1c+hEWG6L3RM0jVfTgTM2W9aP01c8cwzqe2gKVHYAxV/272kwaK6GoDmOkD/FTWb9ow0xOnYKWqSVy2zLt9PR5RQGiUmLYSXwlnCYgicSUTCqU2cATQ9MZGeIscplNIgnw8tUnze4zFJN21d7bEpL1ByjmmD5sl/vJqmqTV8uRjruVwEDmLo6DgMgxsn4lKrqp0iCxpXqC9IThSjy2+KlD8ODwxewZ18OKAkhSzJ2o4qpqSM1p7cjdj1NeFykaACPBMcqE1U0Z+tbWtc95vpKELl1prHbZn/z7m/iJR9fA3w0azEphK4jdm0D43CN5N6vO9d1s3/8AdayHA4NEaME+cFq0UpXvxvOwIyxhMon9WPkAA+qVSw+BjogF9PdzKiTJHmu/DE8EwgsgP+EnEBbq05XY7pfS9CL9VGlgQBHFNyp2nt2Obawkk/0wXO6yCdaNkla93JhGNr6+YsbFn6iVZD0Dbc7lK5o5qzZRgrNZaKCCc+gZfQfo7aplBBdZxFJodZ3+YjIJNpsujYCRQmAMx1+1vMZifCeLT2/Jf7OwPs8ShAqseeEO97X/Iq128UT4bgl2bZ12mCBsVs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYRPR01MB13588.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(52116014)(366016)(38350700014)(56012099006)(10067099003)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?YPqCbQPRX0fN8ECt2s+MPq0bX7/LdbgyuSqc5u4xMxLvusspKctreEFmM52H?=
 =?us-ascii?Q?qzihcPh85rsUnZJz7dzffUGJ1eII+phmzTBNDNO8ONOTNhz5rXB4/4Fowf0X?=
 =?us-ascii?Q?F6bp13hzxvwUluKoAJzOTGSxKfkINQ42Ec6UQvsarxsb79vindIOTCUDqPKU?=
 =?us-ascii?Q?eTIBXpmY43rGiIF0uE/l5ntSWLWIOYNu99bCHMCI+WOvi3e/OkA4PQ78RxIL?=
 =?us-ascii?Q?UgjmSiz+UqpBXHwMBtNo4oyMdgmzmdw4fhAzDv7kx/CSGyj5gDAwsykSIuEF?=
 =?us-ascii?Q?USi1S9MnFthszy0YKZiKMvprfce6/ogvqiWlF8kv0PhsJUX3WtGuGFDaaZoG?=
 =?us-ascii?Q?OfF0h4ypRlZn1KgmeN1oC91TsLS4bho5nEBiX3Bup3iFlr6LnJDeCIPZARok?=
 =?us-ascii?Q?wJU0Pr92TY8LiBTUiNcEZ/dhJUvB1GRgWqxsygnJc5tpLJxSbxz8KU2zadUf?=
 =?us-ascii?Q?RHhRdaiC/ZqHjxze1Gdx2JKVwKAHi28LOjbuPIicwEKvPJGYbn5LOc5P4E+a?=
 =?us-ascii?Q?Df1gG7R43RQuvwJ5qFQb0db9PF8uY5cEZ+BmsaC7TM8mbg9LUH9RB95iureW?=
 =?us-ascii?Q?wRff2Q5JH0binisDYqSOcnPSQ66AItvHTroImv0L70UZJ7azwoAmPcnMipUy?=
 =?us-ascii?Q?PFNtNlkb50iyn28X0/P3/eyhCRE1CykAEXqZzQjJnMI4lJryiZ7RPa1k4NgW?=
 =?us-ascii?Q?+Q9egmsXnAVwILaSmrKgTKMYafUeKBxc/CwrYPn/Dvh4lWXdVPVBHrN/gakM?=
 =?us-ascii?Q?NHK1nXJkgU/KBpHc4DLCX3Elz2+DDcUlgD76daRrl+aO4JGgY9u1m4ttZcZs?=
 =?us-ascii?Q?A8E95vXf/VaTMBrS9Hcl1CJh+tbDnmqzrlB5aJy8yIAptFCWx3V5ttC1UJKy?=
 =?us-ascii?Q?YaSRis75gr2wWGmav9UGUhzirqZLNFGDtZRF7NnQQzWt+9Szt4AuNYaATJD7?=
 =?us-ascii?Q?RWMgablsTP4nj69A4saEfeg3Ui35e/mbuYrombjW6CeK9xy4oS+sgWwR0Bb6?=
 =?us-ascii?Q?CJpGpn3ezGo5p5gF2jsWOdacQoJgPvX4eUHT3yG1mNuBE0/tF20UrKaEhrrY?=
 =?us-ascii?Q?YmLwkL4AQDJiZIKMijI9IsHfLox9TIpTYVhRa/3E9JnGO1YqccWZJsnVpc2H?=
 =?us-ascii?Q?yI0PIk5jhBaT4ORMMkpmJy8a0UrAYC1q/RtwiraYXs4Rb0c3A9twEEJgTaUY?=
 =?us-ascii?Q?sAYNLpqWh2vy1BTrjTBMzTqHqZK3XK1JZO8D9GgSwFLh4jHvsuuQs3VZ+WGo?=
 =?us-ascii?Q?dTV3Tf0eOOsZJrgIFP0i1n27TYaecrv48jbyrTtkIJD/cL2V+2eAztnlNqpY?=
 =?us-ascii?Q?xPiGyU1ucO1Baun6/v4tB1QrBZYzhV2rVqv9BXi+h4VjtKEdhirYn2RhQNrx?=
 =?us-ascii?Q?74inO/UteHQ9xfQmOj8EtQ619wM/vTGvzOdWI9+cAVrekuvp6pcmt6u+0nm4?=
 =?us-ascii?Q?QObKoL60WOo8t4SMf4MgXfxVPREL8hbEuTu2LUdh9aeARAvhtVyNLJRfkJRc?=
 =?us-ascii?Q?ZKMaYjbUNidclt6mW4HFuXrol4Sfwc4dvQSW23XzHzZN8mQdgoJg8QgyVzRL?=
 =?us-ascii?Q?L24WH/K2Q81+Lqlff6yoz8z97jihh5nSpcsujkwSeqfn93UTh++7BZhifXxA?=
 =?us-ascii?Q?/TMA827PdoVrc6Q7P24eQFSKZ3JoM31Pklwg7qlSJAo/9efBzXHhs3JN9QGn?=
 =?us-ascii?Q?7GTScUnlNgyOBpE+rgbqSMQPWG5KEF6pjQflC4cLgmp4YnyOWplPXSZpmFag?=
 =?us-ascii?Q?FVcuD/JqJF5/R/HbSDGRU0n4FbZWQWe1fk3qbw8lsFru9B4ELgCI?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d897293d-2e9e-42da-b793-08defd3523cc
X-MS-Exchange-CrossTenant-AuthSource: TYRPR01MB13588.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2026 14:29:41.2446
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mY6N2QQU89YlbYfOQlgLtnx9goNw98HWoedbt3dN+4pbtUGNRjNx+TRELv8VX33qQli/iptUn2yjgndEoQFfXS7JqKn7PhqipXqY5vuHNySngrJV7Qntp9puOPX6Zs3C
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB17734

Enable USB2.0 support on the RZ/G3E EVK board. The USB1B_1A_HOST and
USB5_4_HOST connectors support host operation only, while USB0_OTG
supports both host and peripheral operation.

Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
 .../boot/dts/renesas/r9a09g047e57-smarc.dts   | 45 +++++++++++++++++++
 .../boot/dts/renesas/renesas-smarc2.dtsi      | 25 +++++++++++
 2 files changed, 70 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts b/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts
index 4eed095b683b..7dd508b5eb0e 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts
+++ b/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts
@@ -296,6 +296,28 @@ sd1-data {
 		};
 	};
 
+	usb20_pins: usb20 {
+		ovc {
+			pinmux = <RZG3E_PORT_PINMUX(0, 0, 12)>; /* OVC */
+			bias-pull-up;
+		};
+
+		vbus {
+			pinmux = <RZG3E_PORT_PINMUX(0, 1, 12)>; /* VBUS */
+		};
+	};
+
+	usb21_pins: usb21 {
+		ovc {
+			pinmux = <RZG3E_PORT_PINMUX(G, 6, 12)>; /* OVC */
+			bias-pull-up;
+		};
+
+		vbus {
+			pinmux = <RZG3E_PORT_PINMUX(K, 3, 12)>; /* VBUS */
+		};
+	};
+
 	usb3_pins: usb3 {
 		pinmux = <RZG3E_PORT_PINMUX(4, 1, 12)>, /* USB30_VBUSEN */
 			 <RZG3E_PORT_PINMUX(4, 0, 12)>; /* USB30_OVRCURN */
@@ -392,6 +414,29 @@ &ssi4 {
 	shared-pin;
 };
 
+&usb20phyrst {
+	status = "okay";
+};
+
+&usb21phyrst {
+	status = "okay";
+};
+
+&usb2_phy0 {
+	pinctrl-0 = <&usb20_pins>;
+	pinctrl-names = "default";
+
+	vbus-supply = <&usb2_phy0_vbus_otg>;
+	status = "okay";
+};
+
+&usb2_phy1 {
+	pinctrl-0 = <&usb21_pins>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
+
 &usb3_phy {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/renesas/renesas-smarc2.dtsi b/arch/arm64/boot/dts/renesas/renesas-smarc2.dtsi
index 696a933af808..e07fd9396adb 100644
--- a/arch/arm64/boot/dts/renesas/renesas-smarc2.dtsi
+++ b/arch/arm64/boot/dts/renesas/renesas-smarc2.dtsi
@@ -91,11 +91,36 @@ &canfd {
 	status = "okay";
 };
 
+&ehci0 {
+	dr_mode = "otg";
+	status = "okay";
+};
+
+&ehci1 {
+	dr_mode = "host";
+	status = "okay";
+};
+
+&hsusb0 {
+	dr_mode = "otg";
+	status = "okay";
+};
+
 &i2c0 {
 	status = "okay";
 	clock-frequency = <400000>;
 };
 
+&ohci0 {
+	dr_mode = "otg";
+	status = "okay";
+};
+
+&ohci1 {
+	dr_mode = "host";
+	status = "okay";
+};
+
 &pcie {
 	status = "okay";
 };
-- 
2.54.0

