Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazhn15011020.outbound.protection.outlook.com [52.102.171.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80AA948165E;
	Wed, 22 Jul 2026 08:54:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.102.171.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784710495; cv=fail; b=ljtYPZAtml2gqaEX9wIV0vDpDUg6D//4UuO3Xzuf+10ehigC6V9/mmoHe0CvUOyIT59qqVb5NjpApwJUMvjuNvSwrvyBAKD5ls31dkBCe9HuJ0b10p090WLIWfCR5z2oVYOQt5wQ6I8kgEJd02ymgBe9DSO82udr5VQ6Y2VTNAg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784710495; c=relaxed/simple;
	bh=oJkFBPRaq4gLYkA4y3Pyml9BXcJLr4yEianFiyrej0k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EVXnWwI3BjtFZm+kYMrT1Xg10OT/fsICCumAUJdnsvbbt6kXmAgC/BaC69tG8NWckCtaomi39h63WWwa0rUb39K22/75thgPC1ZYizDduj5E65bqHxIlIUDR4symbEKyCF7l8iI+GLg4kt/QOF0GluaY76Q1V+iyUVk9MxWTTx4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=hB/oKFEW; arc=fail smtp.client-ip=52.102.171.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="hB/oKFEW"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RM47WMO+LabvnXWExExSDJuOVcP3j6DCgEvCi+zm8veLue9s7Tz8N/kA5Hb+K7xUtHiO8VbzIR9CVP2pyyEq35pceTN7GNfNXZdbLKFvH0l6odzfDZFbxyiNLOivOzaV9EjVqYpNuLP2p+1XCsjvZLXug/y/PeS/WpvZ7f8JZ7DAY5V9QsHg7wgyZnoh3pPjDEqs2HxUf68t4Ama/jkCP06lJNV6p4VoQwTluQCqe6CGRJU75KmlFEG97ZZTxSKkKQUbZnHfANMsXJbZ/Of78VfCMAbyAxG4F7KTVKra2lX0Z+Dz8/EcWFnelIjNG1xjTDHADHoqBh8MthUM4QN0RQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NKmVE2hkp8hhy/6XeKVyYAOZYxfIxxoWBxQ1T5V2d5I=;
 b=hBnms7vSRiV12VWLG0XG/Jtpu5dIlZ42tInlL63OluOd5cEXQLxWEzmaQOVP+S0hjd3l9S+HndGfO6vscSzGnSRmHR8py9jF07pysqm3qn/dv+ri4G9N/9LgXSN1oJ1XrDSfYTGDKp2PK/3FqDK11dElxdSz2EjL/3zpYCb9r1holfJswqv344RReMlg9ZqdIJMnpGQweNujjXgA0CzvmsiJADa6N3TMdBYM9AW/ElAvCpJyGw/5N7IniAAroix7DpdzHzDJXiU6069ivIcLQyS4xkcycAdMRKRUi6bzwTx6vyAwjeJenAwTHYdO2y/2jCxcxS2i8/oqTcCnBUKI/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 8.62.32.50) smtp.rcpttodomain=bp.renesas.com smtp.mailfrom=renesas.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=renesas.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NKmVE2hkp8hhy/6XeKVyYAOZYxfIxxoWBxQ1T5V2d5I=;
 b=hB/oKFEWqfULCrOrqJXJNmA3zavcQQPzgF+8diVPRI4VAE0dJtHbg3D8xvz+HvIYUvtiomPSSP5YXN2vykMRutdtoLYzlZEWIn4hElbcqr/ThQCGnXE4t2AwogVNeNNAoLOzjGdMotZfFml0rME8atS2wdSZQ93CorGBgnGxhQI=
Received: from OS0P286CA0048.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:9e::17)
 by TYWPR01MB10096.jpnprd01.prod.outlook.com (2603:1096:400:1e1::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Wed, 22 Jul
 2026 08:54:48 +0000
Received: from OS1PEPF0000D216.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:9e:cafe::55) by OS0P286CA0048.outlook.office365.com
 (2603:1096:604:9e::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.10 via Frontend Transport; Wed,
 22 Jul 2026 08:54:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 8.62.32.50)
 smtp.mailfrom=renesas.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=renesas.com;
Received-SPF: Pass (protection.outlook.com: domain of renesas.com designates
 8.62.32.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=8.62.32.50; helo=ejcrelay005p.adwin.renesas.com; pr=E
Received: from ejcrelay005p.adwin.renesas.com (8.62.32.50) by
 OS1PEPF0000D216.mail.protection.outlook.com (10.167.240.23) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.5
 via Frontend Transport; Wed, 22 Jul 2026 08:54:48 +0000
Received: from vm01.adwin.renesas.com (DEU-5CG20946WF.adwin.renesas.com [10.226.92.34])
	by ejcrelay005p.adwin.renesas.com (Postfix) with ESMTP id 4BB3330007EE;
	Wed, 22 Jul 2026 17:54:42 +0900 (JST)
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
Subject: [PATCH 2/5] arm64: dts: renesas: r9a09g056: Switch GBETH TX queue scheduling to WRR
Date: Wed, 22 Jul 2026 08:53:50 +0000
Message-ID: <20260722085353.136986-3-ovidiu.panait.rb@renesas.com>
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
X-MS-TrafficTypeDiagnostic: OS1PEPF0000D216:EE_|TYWPR01MB10096:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 8895e422-8fa9-4cc1-6aff-08dee7cee292
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|34020700016|82310400026|23010399003|1800799024|36860700016|376014|6133799003|56012099006|11063799006|10067099003|22082099003|18002099003|12100799066;
X-Microsoft-Antispam-Message-Info:
	la0kqRL5wLa9I3MyzJDJSiODUt6eMdC+NySZBSdWDkX5vRESiPxZ99DRG6Zoa4IAZeKX8NfOSs0z6SreIlJ2BiTi+2eceDMv0FnHKtSej7aK/1VinD17SyKflydcqcpnbHLodkKMD1lMGh1HeNDMmagu4EerqVAAXKSWgi0PiGmuJCQnlCfjD+15amr2x2hW2E/NSt6Us/nrwBIvQZcn1pqJhu29lxx4QwufXxbfy+54SavLzEwewkoFUIloMghPLjzDgQQBh+gw9R1um0jBk3Xax/IMEhk4nnl5M6s2M7zRastn8anMGhe6c4aBZUBhCfnZPYa14Q4W9e4OmwYObZY4g7wBgTp6DaRS+rbdbAuZBy+IQPihdn/wplcsH876BBYQ+mzgXOlXhay+2ddRiiVs5KRiveLdKBC/1OH1w43I44aHOjlDl8KfaZtj3tn6cdKMI4d5th+Xd0PoPmSinz1H4Dpg9gXkGWp1ix3Xyi+2DgCohZrbFUdtG6MWaNRcHwLV0/jjlTYqtSdQVPFjbJualJbSQW3fcG5s+anX7AqfHPvgk5HwkvruHsr4GOPeAVNQ8dpwTrZAsMzziM5pbCg2uptFRQATBasCG15q2kG258nRQ9pZpdqeWZbFEWcY6pT5OL/SJzZVJbDmwe1faRp7nK95vmCxzJSxxfXRQshhr+rvq/tm0nWkfyk0NCBicCdpfjIGHyEeTH8ijPXPCw==
X-Forefront-Antispam-Report:
	CIP:8.62.32.50;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ejcrelay005p.adwin.renesas.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(34020700016)(82310400026)(23010399003)(1800799024)(36860700016)(376014)(6133799003)(56012099006)(11063799006)(10067099003)(22082099003)(18002099003)(12100799066);DIR:OUT;SFP:1501;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	vYWffjZzMGILTWKoOnEqyRywyUHVySfUcFBI4C+pkjlkc+mWJuh77aMnO1N+3EoRm3oWXtSynSUxptM5dhGeWojkIOj/LQym8krRRvXKDuUgvKrsqmIGpBMtgORys5f+bDDigaH1fK1mb0jj8IHmLPh+E83Akl9/HMREVnom1HFYjNtvpbaklJCkXivzOv6qdC/SilJizMk4xFVRqvjhzK+RYLWJJFmNEwiTXOMOa6FdbzkUS/kPdCwxBNgvOh5W8PcG8C/TRjSX58NQA5UU5SRLTCI7BeMqgGX+mMGY+rv8TfYDf8DxQvL8SV9sbimBAE2qK/op356jUOExKiaROxkP9U0FqvE5JRiKbMkp4WkIMbMLADSwdbv7quQzUUUqWKt4+lZIzE/KsGFaRJcsSQWSYKydR8S5c3zvamX9azIhEeVa9PEL3P2GMorUQdFk
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2026 08:54:48.3087
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8895e422-8fa9-4cc1-6aff-08dee7cee292
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=53d82571-da19-47e4-9cb4-625a166a4a2a;Ip=[8.62.32.50];Helo=[ejcrelay005p.adwin.renesas.com]
X-MS-Exchange-CrossTenant-AuthSource: OS1PEPF0000D216.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB10096

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

Fixes: c8c8a57c5b40 ("arm64: dts: renesas: r9a09g056: Add GBETH nodes")
Signed-off-by: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
---
 arch/arm64/boot/dts/renesas/r9a09g056.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g056.dtsi b/arch/arm64/boot/dts/renesas/r9a09g056.dtsi
index 76fa34ff3d07..77c2221a9e2a 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g056.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g056.dtsi
@@ -1585,23 +1585,28 @@ queue3 {
 
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
@@ -1686,23 +1691,28 @@ queue3 {
 
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

