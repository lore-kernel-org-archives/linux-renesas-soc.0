Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazhn15011013.outbound.protection.outlook.com [52.102.194.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 650104C040E;
	Wed, 22 Jul 2026 08:54:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.102.194.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784710488; cv=fail; b=U9sjJ7UslQytp6oF/a1hlIrmQAXRILzi1lZ8LQ8Ll21W4MWoNaGkeegQ3qJBEfEn1ORgWFZfQlHv2CtucP3B/M79UoXaY0zTkE6SYYKrPpeSmzx9U0cpTklD7LtHhNcFhdMhqJ6ZJFK8mOLZ+SkgfFEh/ihJCFytbJWUylX08iY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784710488; c=relaxed/simple;
	bh=oEE2ncfGF6HAqEOUxhzcWYxE5WkiUBI5zQwzS/Jo3YY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jIQjQYTb+R53fB3UKorqIaOaNiGycN3zzgD3kMUzEpObsFwPlgjKnSWSyUZ6YW10Gg8TPCtrw1S1YeZhICpRIrRkxOyKgJxXzyjwSxczg+yY1Zqd0cmKmyEpZmi2D8cYOGzQvopnyePIzC1jryGzRRWgH4I1/VaLfujIr0njKsE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=cXc57CTr; arc=fail smtp.client-ip=52.102.194.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="cXc57CTr"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QTkraHRVEeq/G1Ksw0HOTE50QvcI6yJrChQiVghe3JHPJWNqlhCc6fJesRRe1wTGgpjFGdeDaJEU8lCDs4TttyshjrB4eTniH1p5d9AWw4e/buSB/2yam+U4b6pWsgsE9e8uySsRJDTp+c/LHfMVx3u+ofnHf7iy4vHqQOw660hIMDxKKVW3TmulPKaZpTAGwU/hrTGKxnjMbFALFxMwggK/Ps851wo+YkzrKs4ykv4b1hdIfxtEC+0qP44ju/xru3jwdWlyQn26VhxkJ/mg3ir7B5PPD2RfgkCLqoiJ9SK30X3VB9+PPyCHJ8IEunYIX+4K5MxTNocF2e6P36vgKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bvHomws9SNhpzuuhSfZoZ41eSwGBiivMUxYHwEPwZd4=;
 b=Pa/7IYWKyEwMKQexClJXgRbWVZHgMTwli0xRT6mepquT67enRx+tDRXMt6yd0eZDS2Hqhbf49sSoj5rClIr0W/s3DGPbz4iNBTA/MI7dcOSEJt+ZBfiMAxyT/mFtd1ez7pqlG//Mj0/cxBVzXItj8SFcbhf9RxaBQZ01JjaLH2rJ8+p7954F8J3H3bDt0KrmqlrTU1hjR6bS2KgeF8a/F+ccoj5YsZ+hCrnJT5To0EQR1kiuu3pd8QBsSVfnjR6Ujd1z/RDvtRU5IK0Wrw9yWjScxgSLcUYFIdpc3+5kn/U7c6NGiuPhGlOgRgFSgfCeRMTkFjakw29nwI8b7KuGKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 8.62.32.50) smtp.rcpttodomain=bp.renesas.com smtp.mailfrom=renesas.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=renesas.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bvHomws9SNhpzuuhSfZoZ41eSwGBiivMUxYHwEPwZd4=;
 b=cXc57CTrmnLbAG5SDke1NcoS39/yIgO/GF6DPXpNoAS1hO4nXL0FPKUofUhdutPhkaNZh8BV6b+wZKLd3m0QEVCYnTe/6/8aa5KNXi3XqJT8uiK77iEkk4NFGpdlFxf+abXVNYl0LReP6ftOPMBErLxMwnCQHJUR3gZ2l9l2Vd8=
Received: from TYCP286CA0330.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:3b7::19)
 by TYYPR01MB16327.jpnprd01.prod.outlook.com (2603:1096:405:2de::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Wed, 22 Jul
 2026 08:54:42 +0000
Received: from TY2PEPF00005623.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3b7:cafe::3e) by TYCP286CA0330.outlook.office365.com
 (2603:1096:400:3b7::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.10 via Frontend Transport; Wed,
 22 Jul 2026 08:54:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 8.62.32.50)
 smtp.mailfrom=renesas.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=renesas.com;
Received-SPF: Pass (protection.outlook.com: domain of renesas.com designates
 8.62.32.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=8.62.32.50; helo=ejcrelay005p.adwin.renesas.com; pr=E
Received: from ejcrelay005p.adwin.renesas.com (8.62.32.50) by
 TY2PEPF00005623.mail.protection.outlook.com (10.167.240.54) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.5
 via Frontend Transport; Wed, 22 Jul 2026 08:54:42 +0000
Received: from vm01.adwin.renesas.com (DEU-5CG20946WF.adwin.renesas.com [10.226.92.34])
	by ejcrelay005p.adwin.renesas.com (Postfix) with ESMTP id A485530007EE;
	Wed, 22 Jul 2026 17:54:37 +0900 (JST)
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
Subject: [PATCH 1/5] arm64: dts: renesas: r9a09g057: Switch GBETH TX queue scheduling to WRR
Date: Wed, 22 Jul 2026 08:53:49 +0000
Message-ID: <20260722085353.136986-2-ovidiu.panait.rb@renesas.com>
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
X-MS-TrafficTypeDiagnostic: TY2PEPF00005623:EE_|TYYPR01MB16327:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 7d199a64-b1f0-4194-89b6-08dee7cedf29
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|82310400026|1800799024|34020700016|376014|36860700016|6133799003|56012099006|11063799006|10067099003|22082099003|18002099003|12100799066;
X-Microsoft-Antispam-Message-Info:
	MWXmvX6BfKcW9X2Lm9+arzXw50yJJJvRhJaPR7nJGNMHjeuzPrXDGXWO+iKNYcz5PlcKGgxnX+fgWWVsTAShy3cXJyFhIjCIwMyZWTx8NdJfyGctZF9T91i6DgBMWgHJsUR4IRtIlUOAl5EmE7znoQbYMfUS1wypNyPwuTeFqA/nX6A2VCC1UmNh5EOE8aWAqmfLUkuyEfZmgrOFTOGJbVLGjKhjP9G9SshnFJfKcqSzSb2BGI8KQJF9vF7p0ZgHAlmbqDro0Y/ee/OKq6B4X4dg5ELvLGxXVC7bOcv8WTvdS3A8Tdc3gmepWxVrkBDTL2nJBO68ynW7FjO4fee4PIHs6WVG7oEr+YUIyxk14N3BleE0iHk94YZOeFOVrMpuepkRbbmfI7vBQDj8rIWCKp3GnQrjhPfUzwKx0LzML6mRg6qnm+ZMGVLnRgLnwArwW1Iw2eYH8iLshQges7JwUKtHi6eQ4jJYwAcIDz3WHF8e5AW4mHCa4wcmz7/+2LUdPdV3uRKIYKQtfobtaDGg0gLdANFLiiirTuaBA6nTVrUVDazDUBCq6AGw9s/AdP6qki3CpLSw8ggWmPCQkNlxYNKRfoEefpVTo5gCHhw+d3cApIyM6LbVrLfbCXPS6NpTyzd9I7nRVgYrlVvSi5yINW7zBtLZmzeWn2pUMdZAXNgMVaMrjcOvbBocyFYcJGnYgzHC+cKgR7rKkeQtocRTsA==
X-Forefront-Antispam-Report:
	CIP:8.62.32.50;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ejcrelay005p.adwin.renesas.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(82310400026)(1800799024)(34020700016)(376014)(36860700016)(6133799003)(56012099006)(11063799006)(10067099003)(22082099003)(18002099003)(12100799066);DIR:OUT;SFP:1501;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	ybkFauWOaBRDpTAJmvImOxTUl5iuB0oUBdoWDMsw2MxLynPnFnKo+3ojkqWINZQALcjAIHQGqju4lPUkD4wVQOKB4yt8A67fl/vAGPKjVi7tGYuMZa3hz+X6vOrwaxPK2CIk3bhL/OS1NBM3+MbgjfOe7DI8ir6XtN2+An4inl6aegcstN0jaKfefAFOjyvfbSyc12Neh3VFs9UbLlsidcpBd78PoshfVD0p/JuACkKU+3QF/yey/B0lWWPDBKXK8D0vjmmroQ+J7b3AKerrUi9A9aUQrz2wt5kqucThtX2GD3JFVEcT/M9hX00Kug5pX3diQRJjn7LhbrcfBLGSydwMTTNWObI6bE/1MdeyykkW6KWTYxnWuIoABDJi+TF6/bCDMyoK0wHvvfEe77d1/x6e7GCGKKb9lij4sWPfM8uBtsMenl6PKl0EV1G7eN5m
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2026 08:54:42.6002
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d199a64-b1f0-4194-89b6-08dee7cedf29
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=53d82571-da19-47e4-9cb4-625a166a4a2a;Ip=[8.62.32.50];Helo=[ejcrelay005p.adwin.renesas.com]
X-MS-Exchange-CrossTenant-AuthSource: TY2PEPF00005623.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB16327

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

Fixes: 050ee38d0002 ("arm64: dts: renesas: r9a09g057: Add GBETH nodes")
Signed-off-by: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
---
 arch/arm64/boot/dts/renesas/r9a09g057.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g057.dtsi b/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
index 639693d464a7..188ce9f9c7c2 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
@@ -1715,23 +1715,28 @@ queue3 {
 
 			mtl_tx_setup0: tx-queues-config {
 				snps,tx-queues-to-use = <4>;
+				snps,tx-sched-wrr;
 
 				queue0 {
+					snps,weight = <0x10>;
 					snps,dcb-algorithm;
 					snps,priority = <0x1>;
 				};
 
 				queue1 {
+					snps,weight = <0x12>;
 					snps,dcb-algorithm;
 					snps,priority = <0x2>;
 				};
 
 				queue2 {
+					snps,weight = <0x14>;
 					snps,dcb-algorithm;
 					snps,priority = <0x4>;
 				};
 
 				queue3 {
+					snps,weight = <0x18>;
 					snps,dcb-algorithm;
 					snps,priority = <0x8>;
 				};
@@ -1816,23 +1821,28 @@ queue3 {
 
 			mtl_tx_setup1: tx-queues-config {
 				snps,tx-queues-to-use = <4>;
+				snps,tx-sched-wrr;
 
 				queue0 {
+					snps,weight = <0x10>;
 					snps,dcb-algorithm;
 					snps,priority = <0x1>;
 				};
 
 				queue1 {
+					snps,weight = <0x12>;
 					snps,dcb-algorithm;
 					snps,priority = <0x2>;
 				};
 
 				queue2 {
+					snps,weight = <0x14>;
 					snps,dcb-algorithm;
 					snps,priority = <0x4>;
 				};
 
 				queue3 {
+					snps,weight = <0x18>;
 					snps,dcb-algorithm;
 					snps,priority = <0x8>;
 				};
-- 
2.34.1

