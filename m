Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazhn15010016.outbound.protection.outlook.com [52.102.194.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7F3C494A16;
	Wed, 22 Jul 2026 08:55:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.102.194.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784710506; cv=fail; b=jHMOVcRQ9AMS/r8Tce2mGuekzsFOPNNNPqZsO9CvTStMM3DT0NsHh7yQoIEJnFs+6L36paPyoo9cAXv4jJBFkjHyfCwi2wFkxIYZxBtxKz3hcrHQfdXFIVRc9//OJV7voePzJgcnxkF6uEeFS0mmcWnZbQJ0m/AJfEv2lSb8CS0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784710506; c=relaxed/simple;
	bh=NH+ZLb15N0PkicadtRfO15BdPQ901thkcQkyo14Wy4A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PbPxkO1b4bqPmYdlFA+gKrjA8VLYaDzOsauRY4a/zzdAY8CZtZaEuWSX49StaSs0ZNJRA+kPQFBLmK2h25yyHMqvLMoX+V6IADrXOV4YH11dXeDMMGSNSleFYg66AV+3DeFciMyOKOacGHvL7z5Dok/JBi28Q4mwa+CkFd941k0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=fyUynp8b; arc=fail smtp.client-ip=52.102.194.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="fyUynp8b"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DqGH6wlXBs9bA99pDp8ukdvTQ4Dq+Vpp7KjTjM3niz2nLmVZ3ditqCynzuPyufOhtWq916ILp+dPjgxHqOP/mIKRrwLDxRe+SAmn8vsixNxfiCm24J+Bw4lxyJYZuzQ2B6igEh0loaZcABhgdY8dr1l/YHdt0WtiWQmXFMf/qnexvq+5NBYssWMM8Bu3RzsVvZjrwvUeuSDzOxFC/inY59y58qSomuovq3MivvKtFJ2ATkrzB1xQR21MzThzBheHXmfBzXbCeRwnJM+c1kW/xlj2cm0da9mPHfLlq9ZNtwa6e3x2WA1pMzJa/fAjM27P+EHDuN2Eg6gWfOqzD3akPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nBUk2WCSTTM8eCQXijBVuNGUQY7tGHaa2+AELzqPCt4=;
 b=mTNf6fHbo7xmKc/Xt2sZjzsV33YY46ZluiT0dqtYFWY8RdwFoniRqY71jIhamjJPQfrUlXhbFeoU0mw4d6Pl1AkVRNv9e1ex9aOgB/Lz4jwcQeDYBQV1MTeLGx+WksoKFt6uJlsrqxHioa1pkV6hkkuG2BdCplwDHU3tILV7BFYR0Uq+Z0uUxCIVqIy/yKajrrGfmyezp2yU1LrBjeFwD4wE4orNdf11bCegU2hc+388u8dUCJSlXWE3Nl3fV7OCI0MacAiTNBt3tONYFh7NhssFqccZxpH/VkJYY2+JwQFx6B7ASCBPRki5Peg+eka2Vz7oafk8aZD3Xixhm+SEyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 8.62.32.50) smtp.rcpttodomain=bp.renesas.com smtp.mailfrom=renesas.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=renesas.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nBUk2WCSTTM8eCQXijBVuNGUQY7tGHaa2+AELzqPCt4=;
 b=fyUynp8bht6SxiMyJNaf+JicY8XRkD41dlEiaYyouVjdaX44ln/Jwmh/jxvCE+td12pH2GG6OGubRbW1Jhk9+jTJWhpcmWCPOlQ2XJRapGLD2rsa19FUL5JCNfWff/fZl2r8Ee3oEQlYAsUA9qb516hoDg6Wwv2zbQVQgzUkso4=
Received: from TY6PR01CA0008.jpnprd01.prod.outlook.com (2603:1096:405:3bc::19)
 by OSCPR01MB12601.jpnprd01.prod.outlook.com (2603:1096:604:33c::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Wed, 22 Jul
 2026 08:54:59 +0000
Received: from TYO1EPF00005024.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:3bc:cafe::43) by TY6PR01CA0008.outlook.office365.com
 (2603:1096:405:3bc::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.10 via Frontend Transport; Wed,
 22 Jul 2026 08:54:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 8.62.32.50)
 smtp.mailfrom=renesas.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=renesas.com;
Received-SPF: Pass (protection.outlook.com: domain of renesas.com designates
 8.62.32.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=8.62.32.50; helo=ejcrelay005p.adwin.renesas.com; pr=E
Received: from ejcrelay005p.adwin.renesas.com (8.62.32.50) by
 TYO1EPF00005024.mail.protection.outlook.com (10.167.240.21) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.5
 via Frontend Transport; Wed, 22 Jul 2026 08:54:59 +0000
Received: from vm01.adwin.renesas.com (DEU-5CG20946WF.adwin.renesas.com [10.226.92.34])
	by ejcrelay005p.adwin.renesas.com (Postfix) with ESMTP id 9E40B30007EE;
	Wed, 22 Jul 2026 17:54:54 +0900 (JST)
From: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
To: geert+renesas@glider.be,
	magnus.damm@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	biju.das.jz@bp.renesas.com
Cc: linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ovidiu Panait <ovidiu.panait.rb@renesas.com>
Subject: [PATCH 4/5] arm64: dts: renesas: r9a09g077: Switch GBETH TX queue scheduling to WRR
Date: Wed, 22 Jul 2026 08:53:52 +0000
Message-ID: <20260722085353.136986-5-ovidiu.panait.rb@renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260722085353.136986-1-ovidiu.panait.rb@renesas.com>
References: <20260722085353.136986-1-ovidiu.panait.rb@renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYO1EPF00005024:EE_|OSCPR01MB12601:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: ed9b789e-09e6-4a84-ccbf-08dee7cee940
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700016|23010399003|34020700016|1800799024|82310400026|56012099006|11063799006|10067099003|6133799003|22082099003|18002099003|12100799066;
X-Microsoft-Antispam-Message-Info:
	EgC/TJjZxPL5ra9jaZV69+iEdv3IIqmNoaqZ9+6De+LkkxEvOnrYGmwz+dt2r66ajCx48XXBf3VWDg3XJcKktq8fDltPBiG7+Jkab5v6a8Y97u7/lpwRAbtcejw6iCzWud7JI88ivGEqz//dN6qrkfsv22EMpwJOt68/FbNh7MnUX4SALMLPsrkLJfJsjFkwfujdonstFxuU6nZRKOcRHpQ9P6xuYyMFBRKeSHaPI8ACNGFaDcTessxJayBJ7QpB6UT4TKlJPi2Zr4z4WQ5SfcoUCLU17sEp7X4ZDkWW/ZQIKJT0Aktgb2d5gXEfMdqo7zMTEtbHYMUkz13Rgfb/1bCKV7MupIVTC+8tdfrMsigkADIpa5Oiud+WVUoS+s4DmeDw26nPmmZGMcRVg9ivbuXQZoOAqFaK+b42nd4vREys5qMOHLbAlOeFCEUkMd3fJzX8E6dAlDQJBqnTWvJyeImRelLHhWiqVQaDOwhxoE/OIK/8J0euroADD40ACBSp+CFGa/GuOUHgwTUxI8tN8hQp7guAP9xkcDqCkQwGBkxfIanmG5SonjzY2qqds48CqdDFKQxiEWB6/xNrY4tLLIDKChej8HdcexbKo3lo7Zu7wfmu4m74rzN8Jy+8nW7pJd94sNB3cmC+M1MFN5/qKMvPdnXAztt7B+iaL+GtT0vFWVYHlQN6hmirhpxXeRyQQ1LtFRNj3o6D5zOSU0ML8g==
X-Forefront-Antispam-Report:
	CIP:8.62.32.50;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ejcrelay005p.adwin.renesas.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700016)(23010399003)(34020700016)(1800799024)(82310400026)(56012099006)(11063799006)(10067099003)(6133799003)(22082099003)(18002099003)(12100799066);DIR:OUT;SFP:1501;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	QiZcyewcjwnhFIfQBVjvX4PyXllAHS1SYP3KDHTOplvvsxogvtBoGMbu6opT50gkD2fdOFP92j2gV4Z/r/U5ULQkqA2I8276HSRineQKiH/yXJatNif4FIHpSq1uvMURYt8VBBg1T7Hez/LgJVXg9vqXOuiNK5z4dPs3t5D48nd6boRu4iu/g7EHScxDB2OGyIzA5n0nnM9DTQdQ4pYwUwcsWe/Xukm+OSRJ0r/IR+CUzulbqQjvTdCoYc8nGGJavNNg0mTN7mdk+L2fkz+UDRgJBReE+1HDA7+38RdakZ8QUAdF1VVPq/UEjh613Ln3QYOY6Oba2yHx9fOFM6oVjKt2d3s2z4k2aF3macnQp0cwW5WKynI9oPVXueNidJTXyav7c7QGVYq4UgrV8ZcGdysL/nWgKRhrty3wuF61knblMWThxbHS/AQIzQ2AY3cM
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2026 08:54:59.5291
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ed9b789e-09e6-4a84-ccbf-08dee7cee940
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=53d82571-da19-47e4-9cb4-625a166a4a2a;Ip=[8.62.32.50];Helo=[ejcrelay005p.adwin.renesas.com]
X-MS-Exchange-CrossTenant-AuthSource: TYO1EPF00005024.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB12601

The GBETH ethernet nodes don't specify a TX scheduling policy, so stmmac
falls back to Strict Priority. In this configuration the queue with the
highest priority gets all the traffic, starving the others under load.

Under sustained UDP TX load with multiple data streams, this starvation
triggers spurious adapter resets due to TX queue timeouts:

  iperf3 -c <ip> -i0 -t60 --bind-dev end0 -u -b0 -P4
  end0: NETDEV WATCHDOG: CPU: 1: transmit queue 1 timed out 5228 ms
  end0: Reset adapter.

Investigation shows that only the highest priority queue is advancing
while the others stall for more than 5 seconds, causing a netdev watchdog
reset.

Switch the TX scheduling policy to Weighted-Round-Robin (WRR) so that
traffic is processed across all queues, eliminating the stalls.

Fixes: 394c1e24a4cf ("arm64: dts: renesas: r9a09g077: Add GMAC nodes")
Signed-off-by: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
---
 arch/arm64/boot/dts/renesas/r9a09g077.dtsi | 27 ++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g077.dtsi b/arch/arm64/boot/dts/renesas/r9a09g077.dtsi
index 40494159831d..bac39390ead7 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g077.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g077.dtsi
@@ -642,36 +642,45 @@ queue7 {
 
 			mtl_tx_setup0: tx-queues-config {
 				snps,tx-queues-to-use = <8>;
+				snps,tx-sched-wrr;
 
 				queue0 {
+					snps,weight = <0x10>;
 					snps,dcb-algorithm;
 				};
 
 				queue1 {
+					snps,weight = <0x11>;
 					snps,dcb-algorithm;
 				};
 
 				queue2 {
+					snps,weight = <0x12>;
 					snps,dcb-algorithm;
 				};
 
 				queue3 {
+					snps,weight = <0x13>;
 					snps,dcb-algorithm;
 				};
 
 				queue4 {
+					snps,weight = <0x14>;
 					snps,dcb-algorithm;
 				};
 
 				queue5 {
+					snps,weight = <0x15>;
 					snps,dcb-algorithm;
 				};
 
 				queue6 {
+					snps,weight = <0x16>;
 					snps,dcb-algorithm;
 				};
 
 				queue7 {
+					snps,weight = <0x17>;
 					snps,dcb-algorithm;
 				};
 			};
@@ -788,36 +797,45 @@ queue7 {
 
 			mtl_tx_setup1: tx-queues-config {
 				snps,tx-queues-to-use = <8>;
+				snps,tx-sched-wrr;
 
 				queue0 {
+					snps,weight = <0x10>;
 					snps,dcb-algorithm;
 				};
 
 				queue1 {
+					snps,weight = <0x11>;
 					snps,dcb-algorithm;
 				};
 
 				queue2 {
+					snps,weight = <0x12>;
 					snps,dcb-algorithm;
 				};
 
 				queue3 {
+					snps,weight = <0x13>;
 					snps,dcb-algorithm;
 				};
 
 				queue4 {
+					snps,weight = <0x14>;
 					snps,dcb-algorithm;
 				};
 
 				queue5 {
+					snps,weight = <0x15>;
 					snps,dcb-algorithm;
 				};
 
 				queue6 {
+					snps,weight = <0x16>;
 					snps,dcb-algorithm;
 				};
 
 				queue7 {
+					snps,weight = <0x17>;
 					snps,dcb-algorithm;
 				};
 			};
@@ -934,36 +952,45 @@ queue7 {
 
 			mtl_tx_setup2: tx-queues-config {
 				snps,tx-queues-to-use = <8>;
+				snps,tx-sched-wrr;
 
 				queue0 {
+					snps,weight = <0x10>;
 					snps,dcb-algorithm;
 				};
 
 				queue1 {
+					snps,weight = <0x11>;
 					snps,dcb-algorithm;
 				};
 
 				queue2 {
+					snps,weight = <0x12>;
 					snps,dcb-algorithm;
 				};
 
 				queue3 {
+					snps,weight = <0x13>;
 					snps,dcb-algorithm;
 				};
 
 				queue4 {
+					snps,weight = <0x14>;
 					snps,dcb-algorithm;
 				};
 
 				queue5 {
+					snps,weight = <0x15>;
 					snps,dcb-algorithm;
 				};
 
 				queue6 {
+					snps,weight = <0x16>;
 					snps,dcb-algorithm;
 				};
 
 				queue7 {
+					snps,weight = <0x17>;
 					snps,dcb-algorithm;
 				};
 			};
-- 
2.34.1

