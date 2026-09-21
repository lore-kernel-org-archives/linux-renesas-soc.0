Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011048.outbound.protection.outlook.com [52.101.125.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41DFB49BD9B;
	Mon, 21 Sep 2026 13:20:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789996842; cv=fail; b=mmYQ5sMJZYY+CEQRbd9wFn0LDkXR4hwXRShuJOcR4m6sgExEhnqQAd8NXq1aaKGF1iQbyG+1ngMrdcrMJuhtJGR1LLK4UzrcRsboP02WLc+oLMpVm+1e8ooZlKHU3XDQsgJDqNB9XQJFgNVhlGwDjjR1BZmvS6mTn6z79bAybOc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789996842; c=relaxed/simple;
	bh=qMP2PR4MCqug1v7uY+UfIUhvoxFoYopY0V5dTPrGosc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ptQzVYlG1VoOh6yQhbIPXzSSInv8aRw0CmbSRoIJCdN1+4GhjJro/3Brj6BO6B2gQdEaCylqNQgWLwYPFFKfMa+kVll8uPMAGraKt7OIIJmPGnQo8t47oHLmYm1K1dm/V/7MiYl+TjtG6LXn3mcf+btqfN+5ribqoSmYl0unh2o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=EDkNDJIy; arc=fail smtp.client-ip=52.101.125.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="EDkNDJIy"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B4MEQ9aKBDfIiHkQ3AauzR1G+BeAYWUvs5cI2ZJ/qtCbe3ld15BQiBWOMCJKJCTAdbWb+KwTHC5eXShJFqfgqquzAiEldI4bBZ5v/7e4Ua82M0p0pgEyBEK/63ItEazGzaF9BDNFYudD2iD3mhS8MkM4oR2NoRToelcn6LpVlO0FBM98nLn9ukJT1cJnUHP79IhKc9nk1dEmLzWtMWKl0YMCCDBq0mZUxH/DZnyB35oGbiQnC6u8lYIiAQ/PCHQjGfxYPzG4SjKSbmfxVAzBsDIJZiBWarwsUfzP1+PkaeyS02xkqP2w2pyx07pE2XQJ/NvwRM17RveDlC+nxQ9mYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qlKEwHGQ4sWs3SgjQGdfc6Zn2DFtsjq33c+wSNN+4Z0=;
 b=LQPoldNJiNGrhGUL+PR5uF5GpuK3anKAbtTyHj+QRlJuveC6/3olQkC3tszz1fb3M7n61E03/y9nYVK2HJoxSp/gOIJowKZLynBS7HzNR1FXxv1aoZwJHkfEN6bNlOgeQMr9DiRlDpCn05VyZ0yrbBoFIGYH0dAwXrBTAQL7umhKFrmx8X4REw5vpdfpVQ3gG80PScGj/NT7IY3mKFGwl9rwrATzyYZZkNBbK+jf6cCUaPfVB2HeyB9UpoPxt+G9iS0gnFuvRw3toY+rzHFRb9HeQ5YchM9pqpo35nj6H/5N53JSZud8c8KJEWr/g7X4S4cqEiQ7NES2GSSh1HSunA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 8.62.32.50) smtp.rcpttodomain=bp.renesas.com smtp.mailfrom=bp.renesas.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=bp.renesas.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qlKEwHGQ4sWs3SgjQGdfc6Zn2DFtsjq33c+wSNN+4Z0=;
 b=EDkNDJIyyMPukidzQdygjoIeOudoIPWpliqwFAxBh0pfZvbmnauyYFS7bkPGKWH9dH8K5KsWVrl2AUWP3ZYvqlzRwB26vxk2F6MQ0eu9Hml9ePNFARSKj/hoxKWWt6BQXffjlIVwE0n9j37KP+ksQ+laAUkDV3eZ1IR4xrdd9Zk=
Received: from TYCP286CA0076.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:2b3::13)
 by OSOPR01MB12296.jpnprd01.prod.outlook.com (2603:1096:604:2d6::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Mon, 21 Sep
 2026 13:20:36 +0000
Received: from TY2PEPF00005621.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b3:cafe::41) by TYCP286CA0076.outlook.office365.com
 (2603:1096:400:2b3::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.16 via Frontend Transport; Mon,
 21 Sep 2026 13:20:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 8.62.32.50)
 smtp.mailfrom=bp.renesas.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=bp.renesas.com;
Received-SPF: Pass (protection.outlook.com: domain of bp.renesas.com
 designates 8.62.32.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=8.62.32.50; helo=ejcrelay005p.adwin.renesas.com; pr=E
Received: from ejcrelay005p.adwin.renesas.com (8.62.32.50) by
 TY2PEPF00005621.mail.protection.outlook.com (10.167.240.52) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.8
 via Frontend Transport; Mon, 21 Sep 2026 13:20:36 +0000
Received: from biju-VirtualBox.adwin.renesas.com (unknown [10.226.93.82])
	by ejcrelay005p.adwin.renesas.com (Postfix) with ESMTP id C3AF73000283;
	Mon, 21 Sep 2026 22:20:30 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	Chris Paterson <Chris.Paterson2@renesas.com>,
	Biju Das <biju.das@bp.renesas.com>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 5/5] arm64: dts: renesas: r9a08g046l48-smarc: Enable CANFD
Date: Mon, 21 Sep 2026 14:19:47 +0100
Message-ID: <20260921131951.187981-6-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260921131951.187981-1-biju.das.jz@bp.renesas.com>
References: <20260921131951.187981-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY2PEPF00005621:EE_|OSOPR01MB12296:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 685af8c2-26ac-4c7f-7e83-08df17e31f85
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|23010399003|1800799024|36860700016|22082099003|18002099003|56012099006|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info:
	CmIzKSqtz+ke7Xezk0imu3y7wQpI1hvXWQ2bLeOc3hWVkz+vKqGLcyB+AQKl5d/ruY4A+AipW7LdSijomkm//bS4nDgyCqiRGaZQPC5rcJHhA5jF3AcuxCWCrCd34YeQDoeciDqsWsoXTO/No9di9BUfLcf5ciJ9UeXyNXa1qN7KflX32iS5jcI/UAup5TD627UTTgihLt69TUl/QvOhhbTmHub5IQtYv/BmTvPOdPIO5M5EJpkdEsrHBs0JbayovLZQ5VEdGBp9NHPVWOweS1YSf6O8nvVxcjyEOEReGBalCrqhC4pyAA4TMaysxeUVZfvF8nr6O1xWlWgPCoImMEriAJSI6xk6lKIFcQnyQD3rSXvimpb8CgCMEAFqpqN0A0MmG/a+x9UrPxHwwu0gPvSaD4xNXPik0vUNpH2TnRGsnRntfckDCE6WAZbNqkGkvJyYeL5xIHlt8eg+QIcyYpdShdJrcXTponxiy5mlClec42rjMODlZVNJ5mlBEOX3qtRUQ0lIOaSCp/PC9NVzWp/V+siUkW4BCaocDoREvXDNktMPZLwUn44E+Ed1ugFO4hg+Cj1wXk8W6B1ZiHIHVkPJPuQwSBCwsjHCiwouB8OwS2IjtmQfhLqYA6qEXqWeYKZw6AgxrgycsASg0kmeejuv9KzLLIr6LaE8J2PMGDaLwTBHWGe2r90SCoBp8CyL72pnADUbElyD1atwbYQFlg==
X-Forefront-Antispam-Report:
	CIP:8.62.32.50;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ejcrelay005p.adwin.renesas.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(23010399003)(1800799024)(36860700016)(22082099003)(18002099003)(56012099006)(11063799006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	XLLBYs478V71mjg5asBjZgeEYBfU679/+Tax71RgcIyAtwxVT11vq8ii9oh1AUmJfJwnLkMnz+2+B83OVIuPlMknU8NqxgPObMgi5xvDJTntbin5RTzNcHIfzHB937JDbDlVm0UMTKQXDDUKXfsv2KYIpFhRGNUYPv6YwxGMXk1jIATaR5MvjXmpwEKZImQftM6s4sCMkqDiKfum5Kn7A8IP9dV3YbaWzNJi01VopaHjSYGHesO7khJo8dF96x83Cs4KlP6hlNHeNpp0G3BcGabrpiYDq7vZWjJBOrURwBDkwOjpVVP8OjpcyUC33KOAHSBly7pcOttj2kVdG041U54vt6nDZV0bDrord61F7hNXZEQ2y392vX2VCu7/y8JCP4ql5lHWkBqctw643IDGPqZhJUtFR8DRVW36Z/nsJMoFUf3Cl7xpT0ltjsCuCDE3
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2026 13:20:36.3263
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 685af8c2-26ac-4c7f-7e83-08df17e31f85
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=53d82571-da19-47e4-9cb4-625a166a4a2a;Ip=[8.62.32.50];Helo=[ejcrelay005p.adwin.renesas.com]
X-MS-Exchange-CrossTenant-AuthSource: TY2PEPF00005621.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSOPR01MB12296

Enable CANFD channel0 and channel1 on the SMARC carrier board.

Channel0 is always enabled, while channel1 is guarded by SW_DPI_EN
since it shares pins with the DPI interface. The CAN transceiver's
standby GPIOs are conditionally wired up based on the carrier-board
switch settings (SW_GPIO8_CAN0_STB, SW_GPIO9_CAN1_STB).

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 .../boot/dts/renesas/r9a08g046l48-smarc.dts   | 46 +++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts b/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts
index a155967e1f68..22402c2bde7a 100644
--- a/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts
+++ b/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts
@@ -13,6 +13,8 @@
 #define SW_SD2_EN		0
 #define SW_DPI_EN		0
 #define SW_GPIO4		1
+#define SW_GPIO8_CAN0_STB	0
+#define SW_GPIO9_CAN1_STB	0
 #define SW_I3C_EN		0
 #define SW_SER0_PMOD		1
 #define SW_SDIO_M2E		0
@@ -94,6 +96,38 @@ vqmmc-wifi-pvdd {
 #endif
 };
 
+&canfd {
+	pinctrl-0 = <&canfd_pins>;
+	pinctrl-names = "default";
+
+	channel0 {
+		phys = <&can_transceiver 0>;
+		status = "okay";
+	};
+
+#if (!SW_DPI_EN)
+	channel1 {
+		phys = <&can_transceiver 1>;
+		status = "okay";
+	};
+#endif
+};
+
+&can_transceiver {
+	standby-gpios =
+#if (!SW_DPI_EN) && (!SW_SD2_EN) && (SW_GPIO8_CAN0_STB)
+			<&pinctrl RZG3L_GPIO(K, 0) GPIO_ACTIVE_HIGH>,
+#else
+			<0>,
+#endif
+#if (!SW_SD2_EN) && (SW_GPIO9_CAN1_STB)
+			<&pinctrl RZG3L_GPIO(K, 1) GPIO_ACTIVE_HIGH>;
+#else
+			<0>;
+#endif
+	status = "okay";
+};
+
 &ehci0 {
 	dr_mode = "otg";
 	status = "okay";
@@ -185,6 +219,18 @@ audio_clk_pins: audio-clock {
 			 <RZG3L_PORT_PINMUX(H, 5, 6)>; /* AUDIO_CLK_C */
 	};
 
+	canfd_pins: canfd {
+		can0_pins: can0 {
+			pinmux = <RZG3L_PORT_PINMUX(3, 2, 3)>, /* CAN_RX0 */
+				 <RZG3L_PORT_PINMUX(3, 3, 3)>; /* CAN_TX0 */
+		};
+
+		can1_pins: can1 {
+			pinmux = <RZG3L_PORT_PINMUX(5, 2, 3)>, /* CAN_RX1 */
+				 <RZG3L_PORT_PINMUX(5, 3, 3)>; /* CAN_TX1 */
+		};
+	};
+
 	i2c2_pins: i2c2 {
 		pinmux = <RZG3L_PORT_PINMUX(A, 4, 4)>, /* RIIC2_SCL */
 			 <RZG3L_PORT_PINMUX(A, 5, 4)>; /* RIIC2_SDA */
-- 
2.43.0

