Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011015.outbound.protection.outlook.com [52.101.125.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BEC7472789;
	Tue, 25 Aug 2026 13:16:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787663786; cv=fail; b=Q/MkdtiwNvgiB1HNVuA/aoUeKQPdSZH8ZqsCxMJDhSuOf5stryHolojt6rrOxd7XLqqV6Ya++nEvtrVESD3bVj8RUY/sxBfWslMcFIbdqwOZcOqj8FVQANnQgFvBl1IQo+L0gN3PC8YLyWCNt8bmNJgiGGU6aDbzRfmDPEsB4wQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787663786; c=relaxed/simple;
	bh=EVJMB/0jw2w5wOCI1FANzkQd18RrqP2IyXc/D/OL/jw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=noyt7V9zvS8IQEELn0UAq3Hy3Wqj9pR/osvWuZL0A4OrfXSTrxwzZlgcw6BCB15uAVNuOXjZQIFlDHd/h6McedNbrs3VGUbF/mdrurPQVZM4eyl3qeS7fmnPQBBjwa6F2dOZWb6XUqK0VGQcFbMEn4ZeEvDArEcFR4isEB3cqD0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=W+/LoVM0; arc=fail smtp.client-ip=52.101.125.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="W+/LoVM0"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P2/t6KeUjhiivwxc6IA/uRFZ2ZrbsT7oWMksGCdCcIPHLOF3izxalekMcvxYaS8Sqi7wNYKUUtafjq2xoIuE0m9u3iovKDYvz1sbf0Co327BqWpFt/IpNLpqWbvH+simVv6SX1XXWUZvSLVe5/XggAhguuM5e/vCypenRcbYBQCxvBGFN6IAmc8RE8QPpbxyZeioYpLvPDX5o0dThklJlPfRwDRp+kG3Y+xyNo0wEn4OLMzrzKbFaL/QDfICl6WHn9FmC4VhRsitbO0iQw4goBSl5cY3rTXcfhUwrLSqTkMyebNtfzHRhlZ+pJbjCJTWD8G81sruvNafHX2lxP3pTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MlAy0DcYmQw7EI4r1n1Cd7pdRc8Su6m3ReuLdgoQqeo=;
 b=ljcQbWr6vnrpEuIFm8Uzme1mgNM3s3uJlIegdXmHDKXdeol15us6Fm53RcCJNHkXKSx7DYYnEQiwlWfzArxtjw/jtheCjR/i8KjjaDlfEnhE8t5bGSwitn5RVVk7lakCN++a8l/k5vCnKz6/Nfcfb4x0RQP+NSnMi00CNVfmeGoTaH/yVf3sj0WIm2qD6aec+3htcD0dosfRp8r37KVR84kI8245bW8JxlV/MpkwqxvbRxqIf6MjiOr9ScB3CvP5BnLeCIiW23YWEC5v8vVYrmEgzUFKe1Uo3cxB8ZbbdrpjNOYyJQPHDLggYPMtsjEDYrI/bB6Wzn3jRIl7587Bdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MlAy0DcYmQw7EI4r1n1Cd7pdRc8Su6m3ReuLdgoQqeo=;
 b=W+/LoVM02nMuS6HcuxB3lIuQNQqFWps6Ht6qpaowQbkrU3jUpEUQ2VzMYTMmyFzBayjTAEjeuU1FBFr/+2+vCEel92Yx+nHStAVTS0nivFyB28XajhDWVRGqzZisr2vSDSmfwETKRFuqBdjhCakUWGD6TIsAfJJtDrhx+rpBYL4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYRPR01MB13588.jpnprd01.prod.outlook.com (2603:1096:405:18d::7)
 by TYWPR01MB8495.jpnprd01.prod.outlook.com (2603:1096:400:173::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Tue, 25 Aug
 2026 13:16:22 +0000
Received: from TYRPR01MB13588.jpnprd01.prod.outlook.com
 ([fe80::2f5b:8560:48ed:3828]) by TYRPR01MB13588.jpnprd01.prod.outlook.com
 ([fe80::2f5b:8560:48ed:3828%4]) with mapi id 15.21.0339.012; Tue, 25 Aug 2026
 13:16:22 +0000
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
Subject: [PATCH v2 4/4] arm64: dts: renesas: r9a09g047e57-smarc: Enable USB2.0 support
Date: Tue, 25 Aug 2026 15:15:25 +0200
Message-ID: <e538f9b6bc29025358edfac215d48dc834f7d480.1787663426.git.tommaso.merciai.xr@bp.renesas.com>
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
X-MS-Office365-Filtering-Correlation-Id: 78c6631b-1094-4c63-ede4-08df02ab0ee4
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|23010399003|366016|1800799024|38350700014|10067099003|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	6S9596sqliWUe+hOpk2urQ8KnGVOjkloFEyEBRQ//UY3F4Yt8AfBry/HvCvY9sRvoXKkJy15MGqYCZr1VC22be3RtmJTqDjdm3Td3XeH2Qv+BtWAkISX9lxvsCzobxA7ItwgA03sG3HmyVjiULiz95cP+wVtslj8i8QHN4EwnquKGesVnFNKPtT+c04u61PqbydjWgE3zDFYLSIVovhkbScaZYwOvkcMbp/phmli3Xc2NmeB5N0tUdmmrJ8h3b9xZWJh/SevlLqP2oWa6gf9IXomB597aAUVHndcCyw3lNQuP58i3jaKWKdKXVBExYEZmw9qy1t4plLQdygQArR4Pjqva0yjPjJC9RV4zuOFxakiOwS+BXRv3KUY2KA5zeXUBVfCdPxmNhjLLt/JuP6rG538Hc+HGxW8xuxppLbpqNkrgegUh/DtPLgaZvHZFKuZ+vQKIvsr/ZzLZ5gX/KNZOkk8onGiBRwwmV/yOdkf0VuqE7f4Jt91vwAekXXywBT39XTtS+XdegRKMl4gHMCRSfK4FNHgeXqK6Y0IbDKnJvSEzDfsXy6FGX5ai6LVjlYMCBYXKH4f/L5aKnsz17ECGYl7b1CfFafhjNtLDGXccFY1t/98TfQL1kLVUkDSdmavx8tss9QThl+sDyoLwQ51TKgGejoQH8uk76cOZ/IBxDqmXzLzdwKSATJ/0YFdS+Jr3j8i5MdS9lF7ZexTWPX5rA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYRPR01MB13588.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(23010399003)(366016)(1800799024)(38350700014)(10067099003)(56012099006)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?tHWmaU+CCH8nzWvwZTDrA3Rbwjo9YgATuS69iNNa72gMM/yFO8tNJKooAgY9?=
 =?us-ascii?Q?ZOFRXE7kp2hEJcABsLPw6l0h+OQF4IPXTz9+RBthmZiJR7CPVXcNCW+fbFK5?=
 =?us-ascii?Q?LxTogS+f3wmuWWv7M0S//71GdmqXcU/qM5p4x3YyUa+OG+KTjEKnIJVfaZFw?=
 =?us-ascii?Q?dMauVRuK7Y7w/gyS+goG46vD2DADlAVZA7P2Si+v3m8eEXk/nFaWziWn5r2a?=
 =?us-ascii?Q?2QcK+rlY3enAa/Ntq+we7+cxxEn55rOle2QoHxMOM5oRZVvKiSvQVuo4xseL?=
 =?us-ascii?Q?UY8lDP9lZq+Sm0BNcwHsKAIFU+DAtVSt1EJ4L1W1ervu3oOoh0fpkQFJSLjo?=
 =?us-ascii?Q?A9veuwJpEZikIzrISElh4SeTdCNU0FWSzbcAMUWn4BqRKhEUQ6yTG0saGUxF?=
 =?us-ascii?Q?+dZ6Itpy3OUzc9CAjl+t8Ga26KgkmOxVZE6NGI6xNv/vCENJ8Vh+xJM2D9r9?=
 =?us-ascii?Q?tG1Iziixa06nf6BEEnbq6wM+sHJNH1jN8xl8SN/bMY4LhE3KlA1RzVoG0wSt?=
 =?us-ascii?Q?AwgoPD1QfI5hvTJctdTVVkJFZoqOUgbQqzAw0yzBL2c0sxfjfrLEx6d+MUIB?=
 =?us-ascii?Q?VHTnEx/TpP7cHjcI0q2uV1vhUztcHmM/8vw9tIRu4BLwDK4pMulX6cEBBwPh?=
 =?us-ascii?Q?ELsRey8YMM/QoWRrW0iS+62QlL0VrSVoSIl7Bqcmdp8vg+FdGukdOHcBl0cv?=
 =?us-ascii?Q?hfRthxyhbxU8hCkTD70lBUPSVpMHpKHW1hLtnswcj6uJE7IiegPzSaBbL9CZ?=
 =?us-ascii?Q?SijPyNZFAfVkZUpxrr+V5ApJm6D0UuT9f73sIDdHFO6stRr+BneNN0WTLfhC?=
 =?us-ascii?Q?3RMXziP9oSP5+Bm0W9s+N1mkMX/Gec1H6P3vOxzgGORebiVSEYpKuoYJlvXv?=
 =?us-ascii?Q?j0Ot5020fWJNp5dMVVAetp59aj8CwpZFuNtJhARPt5HqLVFHnP+OcfFTIHKf?=
 =?us-ascii?Q?ne4YfkECsV93GtVoT27k4lqs7/c0Wd9Os44yJSqwZauPPhklomk0LRryRQv3?=
 =?us-ascii?Q?6KOhi+Veucu/XybSaW2Yuoq7Yg+YjFVemsXAmUl37FdXEJzj/pSIJuBYmMBm?=
 =?us-ascii?Q?qalafni+77Al5diMGrzskrOfWyxEdanb/2ev3rsHSFN/6bsWBYnks9xsaWlu?=
 =?us-ascii?Q?O/f7ezWGWbmJrxi3uyXuXRY2mXDbRk61Ytc++bw32EIr6/2LNiSK8Dm4LtHa?=
 =?us-ascii?Q?l163jdlC3m+tJC3jVZe+pOA+3ouEGt2xWLDFmIN50CWPtiXFPzCm4KMT4dDD?=
 =?us-ascii?Q?TtfsysLVnBrlBU43rfXI0iYLwsfrjhN5Rjc8Uf7rcbqFLAI2v1iSFQSnwBxO?=
 =?us-ascii?Q?bHdekRAnjGHNTMOdDOxYw6in/xshkfMiwYvIJn5O2xpbsrQGDc+wQOUmXsje?=
 =?us-ascii?Q?31Vu+Weuak1zZgoinK0ppUjA5RR7X+SjlfxklRHJczTBhEU2zvnag4Ny4zWz?=
 =?us-ascii?Q?u9A49lCTzA+ea54kLJ73o4pMLXhBpyOkbZFR28Kflx1IR+SZu2A7enPKnXfA?=
 =?us-ascii?Q?BFLz9t6zlFWZb9fcjri9Sl8WT2b23uypEhkL7W4nueePLmr1rQyHQ6jDoUU4?=
 =?us-ascii?Q?kgxU4EPvwtrs8goAjy2bd4LGNbO3EtIOcAC5v+uXRZ9r76mQvI5MhyZa+DjP?=
 =?us-ascii?Q?9NwJz40a6kkUgGl9Eh/le6s/MJd+chgAUsu7TFvuOWlavk3XoD6doX7jwo+r?=
 =?us-ascii?Q?X4S5Y5QQsz0UYlUB7MA9chGnpGDhALq4vt8RwkU962t057Qho/xKgr6o06il?=
 =?us-ascii?Q?7aGpy/8a2MErUkbjeGxhvLzvB7rJqyaEjKsUPzS8V/MhCcvXX3Sq?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 78c6631b-1094-4c63-ede4-08df02ab0ee4
X-MS-Exchange-CrossTenant-AuthSource: TYRPR01MB13588.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2026 13:16:22.5642
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u8pi+3YKzFgHFv/7YzuPXjnEXMg13ngoQ7LdFTjghLcObCNfZybcH/D6asVWn7f/TO0i2Nlss+pIkJKOLaU0ti2mYkIfeLpI5lqR8NZI/sEnN6UrV3GKzt+oBpCwG/cv
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB8495

Enable USB2.0 support on the RZ/G3E EVK board. The USB1B_1A_HOST and
USB5_4_HOST connectors support host operation only, while USB0_OTG
supports both host and peripheral operation.

renesas-smarc2.dtsi is shared by all boards based on the RZ SMARC
Carrier II Board. USB2.0 is not yet supported on the RZ/G3L SMARC
EVK, so disable the common USB2.0 nodes in its board DTS until proper
support is added.

Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
v1->v2:
 - Disabled RZ/G3L common nodes from r9a08g046l48-smarc.dts in this way
   we can drop placeholder patch.
 - Update commit body.
 - Improved usb20_pins, usb21_pins comments.

 .../boot/dts/renesas/r9a08g046l48-smarc.dts   | 20 +++++++++
 .../boot/dts/renesas/r9a09g047e57-smarc.dts   | 45 +++++++++++++++++++
 .../boot/dts/renesas/renesas-smarc2.dtsi      | 25 +++++++++++
 3 files changed, 90 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts b/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts
index 5289efd1a430..ccd6e6394532 100644
--- a/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts
+++ b/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts
@@ -71,6 +71,18 @@ codec_dai: codec {
 #endif
 };
 
+&ehci0 {
+	status = "disabled";
+};
+
+&ehci1 {
+	status = "disabled";
+};
+
+&hsusb0 {
+	status = "disabled";
+};
+
 &i2c2 {
 	pinctrl-0 = <&i2c2_pins>;
 	pinctrl-names = "default";
@@ -122,6 +134,14 @@ &keys {
 #endif
 };
 
+&ohci0 {
+	status = "disabled";
+};
+
+&ohci1 {
+	status = "disabled";
+};
+
 &pinctrl {
 	audio_clk_pins: audio-clock {
 		pinmux = <RZG3L_PORT_PINMUX(H, 4, 6)>, /* AUDIO_CLK_B */
diff --git a/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts b/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts
index 4eed095b683b..5bf0be20aa66 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts
+++ b/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts
@@ -296,6 +296,28 @@ sd1-data {
 		};
 	};
 
+	usb20_pins: usb20 {
+		ovc {
+			pinmux = <RZG3E_PORT_PINMUX(0, 0, 12)>; /* USB20_OVRCURN */
+			bias-pull-up;
+		};
+
+		vbus {
+			pinmux = <RZG3E_PORT_PINMUX(0, 1, 12)>; /* USB20_VBUSEN */
+		};
+	};
+
+	usb21_pins: usb21 {
+		ovc {
+			pinmux = <RZG3E_PORT_PINMUX(G, 6, 12)>; /* USB21_OVRCURN */
+			bias-pull-up;
+		};
+
+		vbus {
+			pinmux = <RZG3E_PORT_PINMUX(K, 3, 12)>; /* USB21_VBUSEN */
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

