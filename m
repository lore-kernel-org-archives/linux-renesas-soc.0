Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010050.outbound.protection.outlook.com [52.101.228.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0BC34973BB;
	Mon, 21 Sep 2026 13:20:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789996835; cv=fail; b=hY2p5NFc9AUPDy2YjyFV/S8d/ZrCRI3itrrs2IK9GcjIgE/ta1vzDwQA9YqBQgzg4SVWmMrIia+sGnpFwqxiXIz+Yp3PGjYPXBuuiS9vTjxPBBM7/aiFzdLUvMuFc8Hqj3ourtAHrkiFnArnka7A0p+MkRR0ewbacGsEvYBbCbM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789996835; c=relaxed/simple;
	bh=5ROr1XZgS0ycpzduXtW5DaJ8DdkYvN7ITCY++QtHcZQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=g5kK3nKnQKMWoEUMv7mczKVulKalcztAmmDoGtsgrL0H7HJcymlRaM9S0pV2DCevRoGlrOmKyhDzOCFf0/zm0J47fmzaQs4Bqf4SS/xkHli8Mvn5Lou43EDm2JJiTLlvq4S0JE1J8fJl2RGLhqQvtIga1Mc3MQixfsvJZkCVtpk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=vNBhTcdA; arc=fail smtp.client-ip=52.101.228.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="vNBhTcdA"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=me6HdRhxfX1faUQvX4cAiIA20nAj3LIV/tGPawYmAV68o+83IrVf7usqsnf6Dz//DeR/4IJ4b5Gfu2df2PFcEdkpzoHgQUgw2Jf7IbsCl/SLD1KYtrpw8qqjV6w26FFZMiaMxaIpX0GzRJzb1XSp4JKhT/NrtRUhyH+V6pElCSAl4dHNTKMXZ8jeor0ytk59WFWnU99dLQUhj0gFbEtB+RY8Bk3l0X/Zm7JsXimXffcqkE3zNk9hBGT1BtWwvKBHIyHyXP6WQ83o/eN6ESgsFTvuCQegSIMC+XZsVFELyIztTDviKQPxSNE+gkV6aS+NMIOJhABRZ4p89foLK2ADrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uP7VAPGaANGJ7i/XaCoClWIY8SLcyPfMOD/g4oMoKrU=;
 b=vR3NBwqFv/i45Uv0xbTPuOSRH2djNpxGd7l3nBDeegGb9dRi/MJOWMzAbbcIHuKG5+4XoN34Ip83NTqPV+Z4GSbfpe2HuxDt6CndC6eOIG7fCAYsmMjM7/bfVrvf6nfkeThRPpyKhvTUpj1ifOdmOyyWQ41FPbT3pjwxKkEPfolc2DiRFJRPxA90+6aqOwUxKQJqPoPmQKZCnVj46J2O3C4nvekoPH2RwtphoZkLD2qzwo73rZw4tX9YXeRWM0SvValntVv4iwzFRPhXl+ZrAytoHubthZK0VN/AqlmyBdHmFeQF4+gpizWrnILELPU+y0gIun1uK7/P4ZU+yDBOEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 8.62.32.50) smtp.rcpttodomain=bp.renesas.com smtp.mailfrom=bp.renesas.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=bp.renesas.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uP7VAPGaANGJ7i/XaCoClWIY8SLcyPfMOD/g4oMoKrU=;
 b=vNBhTcdAsCXPhKzajl8tW8Ab3gO56eOVugufkQUUKhYoshHZ5j8W3a0xZXcjV5GpPObaSraq2uZ1wb1QDrcPUTosP3wiYZ+4K1VwWYORoQuXmxuVL1MQ4nL1ZX7L7WyvVDcQEmQxQN1QbZfILeAEn99pLtPMfv8+44m+N5rbUMo=
Received: from TYCPR01CA0167.jpnprd01.prod.outlook.com (2603:1096:400:2b2::7)
 by OSZPR01MB6664.jpnprd01.prod.outlook.com (2603:1096:604:110::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Mon, 21 Sep
 2026 13:20:30 +0000
Received: from TY1PEPF0000BAD9.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b2:cafe::4a) by TYCPR01CA0167.outlook.office365.com
 (2603:1096:400:2b2::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.16 via Frontend Transport; Mon,
 21 Sep 2026 13:20:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 8.62.32.50)
 smtp.mailfrom=bp.renesas.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=bp.renesas.com;
Received-SPF: Pass (protection.outlook.com: domain of bp.renesas.com
 designates 8.62.32.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=8.62.32.50; helo=ejcrelay005p.adwin.renesas.com; pr=E
Received: from ejcrelay005p.adwin.renesas.com (8.62.32.50) by
 TY1PEPF0000BAD9.mail.protection.outlook.com (10.167.240.38) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.8
 via Frontend Transport; Mon, 21 Sep 2026 13:20:30 +0000
Received: from biju-VirtualBox.adwin.renesas.com (unknown [10.226.93.82])
	by ejcrelay005p.adwin.renesas.com (Postfix) with ESMTP id 8533F3000283;
	Mon, 21 Sep 2026 22:20:24 +0900 (JST)
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
Subject: [PATCH 4/5] arm64: dts: renesas: r9a08g046: Add CANFD node
Date: Mon, 21 Sep 2026 14:19:46 +0100
Message-ID: <20260921131951.187981-5-biju.das.jz@bp.renesas.com>
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
X-MS-TrafficTypeDiagnostic: TY1PEPF0000BAD9:EE_|OSZPR01MB6664:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 8d181b6c-40b3-4750-7109-08df17e31bc0
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|376014|1800799024|23010399003|10067099003|56012099006|3023799007|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	IjNuk41ExOKYxmRm4Jq+LS1S65UKIiF0VOcbVp4nYIQ49ku87C8b9UMQpogx6Oqb2xbxJjROGa3fMC9wN/KFWy7N+gJP2URztGi6xqRB/bJ6g7GnKXhBU48HhvDaU0/kMVA0C8k86Jq8M+45oVxL3UYPQgpJVvXPSV9muQ+iIysfZ8ZT51uwJoXzdrBXnbZ/OJrpcl3FG/2fXYyfaXyPYu3RHrlQwr0z6gXxpOqCG37vjzh3adF8m8kphDOGBjHPsB+fRitDX3LyuclRzrMd8JA9t0ehwsEIuB7RhGS1JBXt1lGI12C1yn2yNkX9bYv8Lx8PCbL4mSSQ7imHsVNwSf3u+Iefs0duA6r86tuF/GkEfHxDQOE59kFq8Oq5Xx2b5we+aD5oXqlnGmnnPVeRFlcSCHpagGr2Bpz4Zzue8vXvjlbFlWt+au7HHf4Vy6jecUYHAbARenV95DZDnInFjrtTsadtcNq+XQmFAKmr0qIRII+aixAk+1Uf1EL0U7jWCHJO8/c+6nz3ED0OIHxHbG02qpiBCX8j4IfYJrTI8dQPP2kZrO/VYvhMdXNN48JQel4A3S1biGMrOCW2f8XTT68l88GdDVL0w1F/Pzxd8R4A8TBAGQbvzP6CFs/vasqTKoP4/Sl4dnJzvUKKyViUIASM3ZoJK5QFGgm379uz+6IL6gh6cRspVb7xO9iWrZGTcKZYbvsVFGQguSQmKW74Iw==
X-Forefront-Antispam-Report:
	CIP:8.62.32.50;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ejcrelay005p.adwin.renesas.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(376014)(1800799024)(23010399003)(10067099003)(56012099006)(3023799007)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	acz+gdUFZ9NCkwA9lct2a9RTTlRHCsnAZghN5ycLPmwu4cQ3HJaZjA1S74GKSM/XhjKxOSmHVJki0OdVCZvOvJiz5sBjQOad5mYi/aWS0FnztxKaKMvVVwZ6KKVGG2rPJN8fhRRq5P4s9QVCztkTieDZMBZH0I5dupJ4MUu73q9Rtdf+2ArxCAbQnKJJldNA8XyDpCbD/rBeFdsS7d5CD4T4Z0UcDUZIz/mPrb/4tvpoC4qWPEt8y1rVIRVlGl0U6pqvDrM5ww4xjkqIyAjRz7UU1lUnH6ohIXbCWYf7gsRNdrn7iAYmrWd46de/kJI/E9WvZQkCbmvKMBCzh2XuDfhYQovIEwWcT8Jwx69e4Mqpk2IeSmodW5Aat9kzk4YV4aTcFSq4STLrvmexRp9oIKLeBNxfCCklV/HX7aVjI1siJagjhqwc7PWM7T/kOltH
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2026 13:20:30.0012
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d181b6c-40b3-4750-7109-08df17e31bc0
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=53d82571-da19-47e4-9cb4-625a166a4a2a;Ip=[8.62.32.50];Helo=[ejcrelay005p.adwin.renesas.com]
X-MS-Exchange-CrossTenant-AuthSource: TY1PEPF0000BAD9.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB6664

Replace the CANFD placeholder with the full node description:
interrupts, clocks (fck, ram_clk, can_clk), resets, power-domain,
and three disabled channel sub-nodes.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/r9a08g046.dtsi | 43 +++++++++++++++++++++-
 1 file changed, 42 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/renesas/r9a08g046.dtsi b/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
index 29ce1ab2a57f..6fe3a5440468 100644
--- a/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
@@ -28,6 +28,13 @@ audio_clk2: audio2-clk {
 		clock-frequency = <0>;
 	};
 
+	can_clk: can-clk {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		/* This value must be overridden by boards that provide it. */
+		clock-frequency = <0>;
+	};
+
 	cluster0_opp: opp-table-0 {
 		compatible = "operating-points-v2";
 
@@ -651,8 +658,42 @@ rsci3: serial@100f3000 {
 		};
 
 		canfd: can@100c0000 {
+			compatible = "renesas,r9a08g046-canfd", "renesas,r9a08g045-canfd";
 			reg = <0 0x100c0000 0 0x20000>;
-			/* placeholder */
+			interrupts = <GIC_SPI 455 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 456 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 457 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 458 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 459 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 463 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 464 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 465 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 469 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 470 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 471 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "g_err", "g_recc",
+					  "ch0_err", "ch0_rec", "ch0_trx",
+					  "ch1_err", "ch1_rec", "ch1_trx",
+					  "ch2_err", "ch2_rec", "ch2_trx";
+			clocks = <&cpg CPG_MOD R9A08G046_CANFD_PCLK>,
+				 <&cpg CPG_MOD R9A08G046_CANFD_CLK_RAM>,
+				 <&can_clk>;
+			clock-names = "fck", "ram_clk", "can_clk";
+			resets = <&cpg R9A08G046_CANFD_RSTP_N>,
+				 <&cpg R9A08G046_CANFD_RSTC_N>;
+			reset-names = "rstp_n", "rstc_n";
+			power-domains = <&cpg>;
+			status = "disabled";
+
+			channel0 {
+				status = "disabled";
+			};
+			channel1 {
+				status = "disabled";
+			};
+			channel2 {
+				status = "disabled";
+			};
 		};
 
 		ssi0: ssi@100e4000 {
-- 
2.43.0

