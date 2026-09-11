Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010049.outbound.protection.outlook.com [52.101.229.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C90248663E;
	Fri, 11 Sep 2026 13:37:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789133872; cv=fail; b=cLmyczpkSS8rwpGnLHtamISJUe8bsht2x8SfTaPAD3ht7YeFaqheDVwPM4uUfC6+uF7YlJIhIqHDJXDogYoEpPFNkDpHjeoYv34wIIuwHjMfbUzBxwFJKmFyLdZzaPl/c167JbTO/I0hxTci7m7nVCgDO6STnwCqm1njDJf8Cgk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789133872; c=relaxed/simple;
	bh=T2HvJQq6QOJMuILnLPd4vVQYmETVOUrni6wspm5NoGI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IE+Mxb3+QbsRQ6QnT8dReTb5JfmcVQp5fTW9PUzRTKelPVDS4247qh5DJZFvmWG7u+syPDiem7+/hIdMM15NECcoLdt96dZAjysJGKyvRBEinSHqEEecG7s6yORVWV9bEYuT90QfZeDgCEi7Mex8Ww/C0jT3Mz1H33iaZTAg1ro=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=GeRIuiG5; arc=fail smtp.client-ip=52.101.229.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="GeRIuiG5"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lF9D34nqzrWnxuq5GMizeaGyf5vEb6WxhNe3BWWjAekmOpess6c57I262bMlLV/dt3Mulr/6Lha3NZ1Twk6AKAGZqsv/TcP29FFxqc0v1nMAj63WGspPsaHvd5xiT5gX9PMVnpqR1h9dNs9R5cEkngyLXYR8Bft9ka02A0Uto280HjJERJz9prc92HUD/7qzZW6/fbxo6w7V4eKne5aLBqouZsb2JwvPbEVcPDmyrlstc5F/A7J9jl19dsk1td4ERsaPYaugmIrMUmfYEZaRb9vb3wjCo/uFGIykaWJ1X+glwhYD3yLwoSpDYHIsw4uYJGpwXDVT3BaQ3yHYqrd0Mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hyM+pxBqhkUvTyDRalh7G9hsNGFXECiFKq05KSI6aPk=;
 b=myW+E44nv8kfrxaOHAtR15tNAWIz4FYFXRysvVXvVG9pFlbWGwnX1IrzOsfVTGIude+qm3TUEq0MAGcPUX8T3qjFgf6GqsQdoD+i4sOn57//fCBqwnNp4kRXTs2xgr/vEqZFExyaIQ8N2Mk2MeYEWMraIVvrqIoobptFo5EaRMgquP46Q7CZu7Skj/9XoHsBxligM2qzhM2vyh3QFa3ei0eR512IDv3EyZQkJEfWV3QdiBU9TA8TGZdMZG/YMFARfwpCE0YXlu2W4MtBUKmfpUwDe8UB0PKV8cf9GKk+3gLZhHcY1oAVE5m0tQVCPQYPt3srCe+tkK4DmXDGbqewYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 8.62.32.50) smtp.rcpttodomain=bp.renesas.com smtp.mailfrom=bp.renesas.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=bp.renesas.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hyM+pxBqhkUvTyDRalh7G9hsNGFXECiFKq05KSI6aPk=;
 b=GeRIuiG5Q3NNRC9/IeeYIfeTbBvtPBoV2cYbm5b6f4DoxDnq75ITsu1BHw6JMZB+A8XecSFKDlXH9ObEXR8US1vhQ2yZ1kYgOgtADFK3PlTHkbDUwCmpe7l8B9ItSWkhIqyW+zxqLN9FPavZisxaeAAF5uL044uGn0qRCtH44M8=
Received: from TYCP286CA0039.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:29d::13)
 by TYYPR01MB10609.jpnprd01.prod.outlook.com (2603:1096:400:2f5::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.9; Fri, 11 Sep
 2026 13:37:41 +0000
Received: from TYO1EPF00005020.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:29d:cafe::44) by TYCP286CA0039.outlook.office365.com
 (2603:1096:400:29d::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.9 via Frontend Transport; Fri, 11
 Sep 2026 13:37:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 8.62.32.50)
 smtp.mailfrom=bp.renesas.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=bp.renesas.com;
Received-SPF: Pass (protection.outlook.com: domain of bp.renesas.com
 designates 8.62.32.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=8.62.32.50; helo=ejcrelay004p.adwin.renesas.com; pr=E
Received: from ejcrelay004p.adwin.renesas.com (8.62.32.50) by
 TYO1EPF00005020.mail.protection.outlook.com (10.167.240.5) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.5
 via Frontend Transport; Fri, 11 Sep 2026 13:37:41 +0000
Received: from biju-VirtualBox.adwin.renesas.com (ree-0065939.adwin.renesas.com [10.226.92.175])
	by ejcrelay004p.adwin.renesas.com (Postfix) with ESMTP id 2D83B3000250;
	Fri, 11 Sep 2026 22:37:35 +0900 (JST)
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
Subject: [PATCH 5/5] arm64: dts: renesas: r9a08g046: Enable TSU
Date: Fri, 11 Sep 2026 14:36:48 +0100
Message-ID: <20260911133653.115553-6-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260911133653.115553-1-biju.das.jz@bp.renesas.com>
References: <20260911133653.115553-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYO1EPF00005020:EE_|TYYPR01MB10609:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: bec6b10b-cb18-41a6-b2e7-08df1009da63
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|23010399003|36860700016|376014|22082099003|18002099003|56012099006|10067099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	mEAPqn2I2eLObK6clgt/rBOszBT/0wuQ64IIjlUkNPsIyaJUp3ya7wORrofaNHttwiV6m1lqjmyr5aIJO1+ahkchP4RL3FrcuF8KM1s7NMMSjbM3OZwmjROSeuuu7Wtol8rDkSQKHFZg5Y3j+Z47PmPgBTuwDDBc/7ZqlV0B5kxP5tiJQ1bGTMl+Ssns8nyS5gC47l3qzTdtH6SZchNoQYkEEYF357+XGn3MW/u4CxFuYGujYvDvq/eMEZy6IxA37Uw/gNc+jOvZnMKF4oiXmZYsuaDZslX9+3lAkqZIZeLfcsXqLEX/oXKPrI6/s18wLD6lpbuiJou5YKHE7Q8yjCWmR0R3yuBVoIqjmm1lFIPCYTZ0h5nqL3hT5jMHKNbYT/IAyNFfLtCcinQ45UjsWnP+CBC7NdC3wmp2aMY8jT/ITFvHUuhGKoVuca2uzT0Q5WJjf06zSbF64kQGUceuGujL6DITWTJzRb0Yfgmx5Oiu/JADExgG2eYpnXFfvlwcfq4G7pU+PoLweF8pCXEiGbL3X6p1Jpkdjf21pavUpqvXn2TddIO5CtbTQuMBDdmTxAIP65LVrZUdRubaXp+dIQ+w92N1x7zsfhcmY3K/veqomIWUQ3Hb4Y4Ks7MS/NF9mH3ekDuDWwxYuqSqPTEJ4Tge2COW/hT2lMTP+bhpEUGT1D4iL2i8OC8RvoDqiezPu0nup4CsNLdVUq+F0uWqkw==
X-Forefront-Antispam-Report:
	CIP:8.62.32.50;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ejcrelay004p.adwin.renesas.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(23010399003)(36860700016)(376014)(22082099003)(18002099003)(56012099006)(10067099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	g+snbzlyk9J9RsxHsps/3xnHqK9fQg27n1FatABrjwkG4o+rus2adShC0UztmmvfsBYMvDE/xFQdzNkG/tMHUhJm+pKm2JIsEKArV0AABLkdVVX/PFVjZO6c2TD4DzsMoUQnOU2VrbE9M5hDSlN3Sp8S2QZNxm/s4/g/Q+6J4rC+bLnCbbNmPlVo3fJtBFyhv9uHX3irmMFteKXFPOBSjDKCn9TQWA0ygzkQdgurkrFoYpOq96KwgYGU5bgNENLoUbMQKIuBMol5V/y5qvxnM6kTFUUQg1qfXQJ5JgBP/VUtCGTFndbv+15tPYuti/s3RYdODdzeAaz/wduxcvqN0LGQPxgDchL8ystdiPBBYtq+FnRH3KuZS0stcmvi2hUKAP0PplXZcSz08AXZOseMbXmp6hPj9BBwJfXzsX7mJtlsV4rONyyy1CXit+xMnI6A
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2026 13:37:41.4114
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bec6b10b-cb18-41a6-b2e7-08df1009da63
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=53d82571-da19-47e4-9cb4-625a166a4a2a;Ip=[8.62.32.50];Helo=[ejcrelay004p.adwin.renesas.com]
X-MS-Exchange-CrossTenant-AuthSource: TYO1EPF00005020.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB10609

Add #cooling-cells to the CPU nodes, and describe the ADC1 (used
exclusively by the TSU) and TSU nodes along with a CPU thermal zone
using passive and critical trip points, with CPU frequency cooling
maps for thermal mitigation.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/r9a08g046.dtsi | 66 ++++++++++++++++++++++
 1 file changed, 66 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a08g046.dtsi b/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
index 53e68b1c3258..29ce1ab2a57f 100644
--- a/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
@@ -179,6 +179,7 @@ cpu0: cpu@0 {
 			next-level-cache = <&L3_CA55>;
 			enable-method = "psci";
 			clocks = <&cpg CPG_CORE R9A08G046_CLK_IC0>;
+			#cooling-cells = <2>;
 			operating-points-v2 = <&cluster0_opp>;
 		};
 
@@ -189,6 +190,7 @@ cpu1: cpu@100 {
 			next-level-cache = <&L3_CA55>;
 			enable-method = "psci";
 			clocks = <&cpg CPG_CORE R9A08G046_CLK_IC1>;
+			#cooling-cells = <2>;
 			operating-points-v2 = <&cluster0_opp>;
 		};
 
@@ -199,6 +201,7 @@ cpu2: cpu@200 {
 			next-level-cache = <&L3_CA55>;
 			enable-method = "psci";
 			clocks = <&cpg CPG_CORE R9A08G046_CLK_IC2>;
+			#cooling-cells = <2>;
 			operating-points-v2 = <&cluster0_opp>;
 		};
 
@@ -209,6 +212,7 @@ cpu3: cpu@300 {
 			next-level-cache = <&L3_CA55>;
 			enable-method = "psci";
 			clocks = <&cpg CPG_CORE R9A08G046_CLK_IC3>;
+			#cooling-cells = <2>;
 			operating-points-v2 = <&cluster0_opp>;
 		};
 
@@ -374,6 +378,37 @@ scif5: serial@1004e000 {
 			status = "disabled";
 		};
 
+		adc1: adc@108c0000 {
+			compatible = "renesas,r9a08g046-adc1";
+			reg = <0 0x108c0000 0 0x10000>;
+			interrupts = <GIC_SPI 378 IRQ_TYPE_EDGE_RISING>;
+			clocks = <&cpg CPG_MOD R9A08G046_ADC1_ADCLK>,
+				 <&cpg CPG_MOD R9A08G046_ADC1_PCLK>;
+			clock-names = "adclk", "pclk";
+			resets = <&cpg R9A08G046_ADC1_PRESETN>,
+				 <&cpg R9A08G046_ADC1_ADRST_N>;
+			reset-names = "presetn", "adrst-n";
+			power-domains = <&cpg>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			#io-channel-cells = <1>;
+
+			channel@8 {
+				reg = <8>;
+			};
+		};
+
+		tsu: thermal@108d0000 {
+			compatible = "renesas,r9a08g046-tsu";
+			reg = <0 0x108d0000 0 0x10000>;
+			clocks = <&cpg CPG_MOD R9A08G046_TSU_PCLK>;
+			resets = <&cpg R9A08G046_TSU_PRESETN>;
+			power-domains = <&cpg>;
+			#thermal-sensor-cells = <0>;
+			io-channels = <&adc1 0>;
+			io-channel-names = "tsu";
+		};
+
 		i2c0: i2c@100ae000 {
 			compatible = "renesas,riic-r9a08g046", "renesas,riic-r9a09g057";
 			reg = <0 0x100ae000 0 0x400>;
@@ -1570,6 +1605,37 @@ stmmac_axi_setup: stmmac-axi-config {
 		snps,blen = <16 8 4 0 0 0 0>;
 	};
 
+	thermal-zones {
+		cpu-thermal {
+			polling-delay = <1000>;
+			polling-delay-passive = <250>;
+			thermal-sensors = <&tsu>;
+
+			cooling-maps {
+				map0 {
+					trip = <&target>;
+					cooling-device = <&cpu0 0 3>, <&cpu1 0 3>,
+							 <&cpu2 0 3>, <&cpu3 0 3>;
+					contribution = <1024>;
+				};
+			};
+
+			trips {
+				sensor_crit: sensor-crit {
+					temperature = <120000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+
+				target: trip-point {
+					temperature = <95000>;
+					hysteresis = <1000>;
+					type = "passive";
+				};
+			};
+		};
+	};
+
 	timer {
 		compatible = "arm,armv8-timer";
 		interrupts = <GIC_PPI 13 IRQ_TYPE_LEVEL_LOW>,
-- 
2.43.0

