Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011006.outbound.protection.outlook.com [52.101.125.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E97B137CD32;
	Tue, 18 Aug 2026 14:29:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.6
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787063383; cv=fail; b=BVqG/8smAcBj13IBoSxaA01ICVsYRPF9maOr/DM0GMI1HHe60mxaYTH3w7FpIOQsjv0O2UO8JK1TeMyJLMdQcuP3J/YjJS8v9iwP1IvaC7A5kd/XIkTWHDz+2ruOfHuq9nrFOmGkzNi8WRwpiQGGH60sLGyPE+NPlfhP0SEDxzg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787063383; c=relaxed/simple;
	bh=I3gUfVoX6XqakabJyEOPw5gPSsn/uAHR+qINQiE3S4c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=F4w+BOkymGGPfPS2b3rMw5UbJNnaXcKJlVFm9YA9aMdh+vQg++Bi39aBWtQXK/aNXKN0hDMF2GKfVL/L3ZBy9uK9Jqy5ZFyLT//gxzpMuwGUZoMSELyhpHXmnepMw4gpkwjd15n5muhjBdpNCxYCSKQvVfb+2mowFzkQt1ulR30=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=EFAvfwhe; arc=fail smtp.client-ip=52.101.125.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="EFAvfwhe"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M/Y4fBivNvByqfBTUimYXna9VAhuJkpsIOKCRZjkJ8CAWVDJCDDKsKClieb4goC9KPQkgnZHh5oDbA3Urm0r0zmdhQ4osywaZa/fGrbojKsgGMTItq5lltNsItvHG+KBh95Zs1rA3302zNw1puRQFHePm+/nx4bLiFxhhsvMVHDMhIE3orLXdQS7Fk7+ohQHGX67TD3f0+ZAkqYWx7qIsSbtq7Bu8XtRbXh51+wxP9BSHToib34lk3Zqp3R5RKrsnsOGV7RUdHf+hoMpUAu6dqYB/OyBDXjFKx5pi9SM/CJlnh7MtNjwePZN+fwqcpQUnen/bjyerZ5OnkRjCa9ITQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9tycUW/x9kvW0TWhEuOKdm5/3zIq2dTBqbNxJRoIpNk=;
 b=ISch56HttSxAb/QTLGy4U5G4Rw+3/bzEBmMQJFOKw9gb4IL91BOUJrgEhFkPfEhp9EiqXKqTDjP5H1tsGV4mqYP+wuE6yslEQFSbmT7AIYbJm20E9StBeKiB1IAonCN3J0DyjYQxYw4tIaUwcCuTmQWE/2i3FYIXlZyJw5OX2vi+T11ypttMPq/eUWom2GB5NIhl8ipkokp32KUIhgprduWu0XwQ1MP3QXAHDlfTfd7IFEWt1csML9UQJ2+b7mwmfW8/9qmWfQCKpk+8VHp5ncwyTX3ZIj8bCqA5nDwQ5J9SeQiPM00qcPflq6OjrGrseds0SI2udQDgt2bx/6MTqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9tycUW/x9kvW0TWhEuOKdm5/3zIq2dTBqbNxJRoIpNk=;
 b=EFAvfwhe7I0ACnJGDe6qdBYplbP//RS1Hw8FwpnMor634JRgjbEdHfxWFKtyuWAYknkAZNIrGkEa481wCJOT7Wb7F+lxdnTG3p8ZNXVDVveO0hdVnz9dg6H1HBrLSeOT7wFc4YLTRyoihGz1vHRWQ3BPVi6pYgKRm/D02OyKQiE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYRPR01MB13588.jpnprd01.prod.outlook.com (2603:1096:405:18d::7)
 by OS7PR01MB17734.jpnprd01.prod.outlook.com (2603:1096:604:460::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.17; Tue, 18 Aug
 2026 14:29:36 +0000
Received: from TYRPR01MB13588.jpnprd01.prod.outlook.com
 ([fe80::2f5b:8560:48ed:3828]) by TYRPR01MB13588.jpnprd01.prod.outlook.com
 ([fe80::2f5b:8560:48ed:3828%4]) with mapi id 15.21.0315.016; Tue, 18 Aug 2026
 14:29:36 +0000
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
Subject: [PATCH 2/3] arm64: dts: renesas: r9a09g047: Add USB2.0 support
Date: Tue, 18 Aug 2026 16:29:00 +0200
Message-ID: <d72dcffe5427f03d1de8b8e50069a5fa0e4b7edc.1787062965.git.tommaso.merciai.xr@bp.renesas.com>
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
X-MS-Office365-Filtering-Correlation-Id: 07d20b82-1ab9-4e3a-4874-08defd3520fe
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|376014|52116014|366016|38350700014|56012099006|10067099003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	cnGt9RY9b6FlJ4xqPw3lfyV3FR492W05BluZf1TZ0iQn5E0SafUFX5suuls71Me7P4ZUZpXh9qET+f9AOMW2f9ktNRwTDbER8N/zg66GtTh2a5+2G+GpysmtEqmUT/Bgboy/kAdcnK5SKhtMxMRy8ammCH5aowZzaWSbZDLmf/w96cnGsrBNRX6Baln1h4xhXbOZVPpLE1imNGM96CLQPxN3WxrR/ikE7taABhMhItaB/LkS4maAuyvhPh41TBJfPpypiqKOP8bo0ItTzF4CNXwjMwfd9uttMwAjQ9Aw/WHuPxF3HSXhkk1oQntT28btGdgHOQxEaTKo3BzfkGJwXl3AW9CuXAWEH6Q0KmFzPyIsR1KDI1RVVD+R/fM+eShMcKC5bKT0FNMhQvvkw4RxTthu9r92VppIvJq6euSF1BicXHxdbUQHMv9WEPoRsXZjwNLhGSNNEWaZj+TMR2Or8nciJ6+YkDhyLj6kvJhVitjY40L0T1+0dtbMj4MCDSw4POG8YZdP/u4AQBno6xhsgSX9JTACoTBFJXkcZ6wZfudt40NvKTDZEKsQqvmGEXLBvhnATY7hJXnAKuh7H8BzbFAMh5OZYY+VF6HkD/L+ap4mKQqfRTWXpTE7HXATRVpPHMycgA+TEb3LHGqqpvKVTSB7TMWJcDoDlvqQbAv/plaGEEQxp7oNFlcW9M1BQnJKBLS7fXf/UZ38Gi9u6lD/gpM6BnD18n5vm4Ry13AOad4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYRPR01MB13588.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(52116014)(366016)(38350700014)(56012099006)(10067099003)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?8yVZbdr6Wh3GJlu9P3tXCMEmZmkTvNt0r8rro/C0YyOKron/wloPUoUPVDPU?=
 =?us-ascii?Q?9NbGTU+ZQbdtkIBq7MCSGXDapTkT9Y22cJQ7GbqbTFq1o0UTZYMlJwbpbtN8?=
 =?us-ascii?Q?I67K/TgfsyQedJDTGyKc66vJJ5YgSH+zNJeOMW8MFcxjcDfF805Bz09A+CSJ?=
 =?us-ascii?Q?z2fi9eEqgJTpS1miZvPs2O1b9C7y4bCiOtjbPNZZHtMF1srafUUg87ljvstq?=
 =?us-ascii?Q?a7xRYqNBr4jcE46yD+8Tla/ogGPFl9XHb1vfFz1T8/MbmZYrcvjpvNgqCyqZ?=
 =?us-ascii?Q?GubXHpyLPWXRJgOhuijijgyOZyJlXEKguBmaEgIfYM0GvgHEWUXh3b610/xt?=
 =?us-ascii?Q?TUCTHOAiBcu0o2JIdLBn5VwsQQ+jhGKGfR46eCspuv+Yv8LSCHscSCDWHauB?=
 =?us-ascii?Q?HaauQPmMdQ61LyHC52aFhhjKRDCwR4HS/8WUCjVwVs4iF3S2evD6GYNXhPSr?=
 =?us-ascii?Q?9LgiXGDsI72zYJTTxXHcb17Bs3QAb48fD3QpuNq3M0r18JEI1ohTy+bXwnn8?=
 =?us-ascii?Q?HiVG3BkakV1150BH67e686nU2T6zI1wz6VbT4LSMzpRPKOMVSD5MqvvwrGY7?=
 =?us-ascii?Q?WJJ9jiQC70iaED0WqaOdOl0/c1iN/Qbrhoe0/fO/ZPFGdV0eJSaB+54TF7KK?=
 =?us-ascii?Q?5kuDjT+jHVPX9NnAJbTJGa5pV+KoCaDB4EPnAMtRsv2dys/WGGM5NC4m/2LO?=
 =?us-ascii?Q?SW8cPwqcd8Pz0L16/x220Fvo7JnXH5ZBT20jAJT9x+gSIHo5LrUZERNA6Y4s?=
 =?us-ascii?Q?5WBWT3OAm/oSBIPE7qXf9i6J2HuFW1YUf8VQHKdwzpdcfQr5fqMra0gTGcGU?=
 =?us-ascii?Q?KlRsoWqH+mJGhCgiVT40WTAXC21yMAXASvvnyMg9RzylyIW2dIDPgzQT0uG9?=
 =?us-ascii?Q?srkVjpRR9dP/wmWVvQbC97BmACcYJmOwWD5yt4qTnPORjIuWEKovLpi31zvt?=
 =?us-ascii?Q?wnn3vdJ/CSf2EQanG+ZWR9uKYj6Zl9ZAPJCLpdoijydG8JmJYNjWhNxiX7xZ?=
 =?us-ascii?Q?nCyA+WdzP27lXurjVWTO++nASqFEa0kV2NjYWnKK8ylIHG9dRvIhOJTHtbNc?=
 =?us-ascii?Q?MqAQx5DwvgimHSH7gQBcCZkUevT0FirwvoEdpe13u/Mk4qE9MZxDlg69BVWF?=
 =?us-ascii?Q?yXOM2fwmotG1Sg4o9izPcxOoZfejjBqu8ccW5E8KaeTEbih56t0+VT1EFpME?=
 =?us-ascii?Q?ztIm5Qwm5pjHd6TZVSkmIutGaq5660yGJvB+8T2AZsCpccmOpikrNSaOckDv?=
 =?us-ascii?Q?wePw8NvUnFbXzZAf0xJMAJo6xhfpsjY7OlOWyaUR08F572rZSLKDR9vR+6sF?=
 =?us-ascii?Q?xMKOTUnryQzLkAH9a1nRH/OL+vT4HgdSDUfqftzfK35EypUsSWNjiy+fUffX?=
 =?us-ascii?Q?pSDxBmaETDngYXIlJpxlMz1zaLqMPbIXPl7RmSd1/4QEknnbMwQnsIQ3Cr67?=
 =?us-ascii?Q?DlP1qLugPBdAw7HUd1a8NVmVQIQUIzqA2plklsMkKsmmsHks5fuyf/EgL2x0?=
 =?us-ascii?Q?7xipz5zrAv74XOdQgAsvp3kkmsduXGXQL0kcf/70KabWR1TAgQoagdU74E6d?=
 =?us-ascii?Q?L6KEf6c/6ni5kerDQlxiwZzTKHmSkVY6ICEmTcC8sVw8SY28h5Py+nCTGBuC?=
 =?us-ascii?Q?StKROmyRksOdiulS953TpzXHJZD8V2uZ04aQmwWosHT2xnNZEDUBnq4pQ5zO?=
 =?us-ascii?Q?4U2VPs/BnxDCLDB7y10IIgZ4sla+9hdUpwC4zSDYa3sso4qdU7N3FWcWcgRU?=
 =?us-ascii?Q?lnI49L5QZee29XvDNPm/fcGjd+uQmyu/vhZRCoRUgEYEhJTkL49n?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 07d20b82-1ab9-4e3a-4874-08defd3520fe
X-MS-Exchange-CrossTenant-AuthSource: TYRPR01MB13588.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2026 14:29:36.5236
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BoeqL12or1KSuivz20KI/BDNjMZVstlJvXDd0WIdMkqFH0hcndNBzM2vZMa2/y6CWCY1w0/3fcehWEANwlkpXP04ZEsWlGnO2mJOhfwQa8QxanpLvswUhfjE87RJCyZL
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB17734

The Renesas RZ/G3E ("R9A09G047") SoC supports 1x channel with OTG/DRD
and 1x channel with host interface.

Add the EHCI, OHCI, USB2.0 PHY and reset control nodes for USB2.0 channels
in R9A09G047 SoC DTSI.

Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
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

