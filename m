Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazhn15010016.outbound.protection.outlook.com [52.102.171.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B9AC492504;
	Wed, 22 Jul 2026 08:55:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.102.171.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784710511; cv=fail; b=Y1V1mZ1Ju9ELjlrQEMi7PnrX3uNQ7oCDbvngQINuXetcDCYumIpBEZafzUFQu0Gzc53kB2022pyQbrwRaClv6/WyEo1ZRwhjGN3EJMKPR5ws8m4mJB7nAagyGplhIvZrkwQzLAfS5DU2pq6wIxhAWEDpMseuqvz67heGZrv5Rg0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784710511; c=relaxed/simple;
	bh=Q5Zb15Clk6p0GgilqTveuOcpoKGAFn9bbuQK7eWPM5g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VxAjbiZOq1XjGd+iNbJlrV32qysuRIFVS+kTmT4AB9D/4tT0o5NOhYi3Nkq/HdOkN7h+6MbqSG1woHdjhx5cp6uvoq0erMkbEAReZ0Uky+k5JTZzBBOnYz2sRiqWn5GKzFfqpKiyYyasQHX8Jiq7RXYYOKU+RqAmnMQHnwcDBt4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=JQ4nvbrV; arc=fail smtp.client-ip=52.102.171.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="JQ4nvbrV"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=USyZ6XuvQxniTtvNQnpeCMMw1RM4fv82ueiAHDAM2dHu9r+mXtL8WcTfszyuq9w5XAGHNVyIXtTkH3hvpNT2a71Mn4Lqx2A4q3z7KjNmTv0yEq8eSFtClkZr1FPqjsF+4Ldc/9DoAUoef+HxbqssyDNcaFhAXuZftHVSrezuFPmRciaGE1NDyfn5OD+FiiobcdM64HhLO02/pt+DStGenuiB2fn5BDDAxFmBqu/Su/yy1YELsPu6IXeutZewdMkd26i8UxrPAdafbV6DxGF34h4JzkJlShSfwBLymzikvFvF7IUYO60uLfbaEUYgamIKyGE4+vTLC5J7BRkU7Pk14w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7LCJKLISUthrTrjW2EjBZ8/mdG8fLTbJZyCMTcFYlGg=;
 b=JBmoob5M7gZ/biypGba8njHAmmAUfAcaTU183IrXltif/jJbLKP2A6I+zXpwcwzUOZfBB3JLQf73eZd62+FXCoME2NJUWmPBdIH6xX1lntn2QAtYUg+W6DKlnM8uTgyJYdQ9DCDAVIztF3bLg7X+oiaWAmDJtrS17u1isIPGvU/h47pPHlt5WyL4TYQ1Mw0S8kgBK/mQ/Bz7lbRGql8iGly3AlGWjKUT2hgVVP0btER8KaNkMXppmMBwyt3NVllQlKXfsBBGohi4vqzOSoBdK6gdfkpM4qJoFxf2N9vxt8rK3mpLxW77vN6sFRkYxtrlSypSCGqMRCcFQS4JmuF+jQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 8.62.32.50) smtp.rcpttodomain=bp.renesas.com smtp.mailfrom=renesas.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=renesas.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7LCJKLISUthrTrjW2EjBZ8/mdG8fLTbJZyCMTcFYlGg=;
 b=JQ4nvbrVaFpr3C1Rp/XSix7fLYo+EvlnCqvhbnODBJ4towZ+lNEusQlHbWVxB6PSkFn5SMrysIxfBEU0nm+rSeRyCwS0ZdQhSxiE4PUs7tN/FlMZ/adeDN1yI6W7F9+HIJBrCGMw3QP0N3+YLBWgHEJie2xGrWipprtcXquqPcg=
Received: from TYCP286CA0060.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:2b5::15)
 by TY3PR01MB11307.jpnprd01.prod.outlook.com (2603:1096:400:36f::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Wed, 22 Jul
 2026 08:55:05 +0000
Received: from TY1PEPF0000BAD9.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b5:cafe::49) by TYCP286CA0060.outlook.office365.com
 (2603:1096:400:2b5::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.10 via Frontend Transport; Wed,
 22 Jul 2026 08:55:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 8.62.32.50)
 smtp.mailfrom=renesas.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=renesas.com;
Received-SPF: Pass (protection.outlook.com: domain of renesas.com designates
 8.62.32.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=8.62.32.50; helo=ejcrelay005p.adwin.renesas.com; pr=E
Received: from ejcrelay005p.adwin.renesas.com (8.62.32.50) by
 TY1PEPF0000BAD9.mail.protection.outlook.com (10.167.240.38) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.5
 via Frontend Transport; Wed, 22 Jul 2026 08:55:05 +0000
Received: from vm01.adwin.renesas.com (DEU-5CG20946WF.adwin.renesas.com [10.226.92.34])
	by ejcrelay005p.adwin.renesas.com (Postfix) with ESMTP id 426C930007EE;
	Wed, 22 Jul 2026 17:54:59 +0900 (JST)
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
Subject: [PATCH 5/5] arm64: dts: renesas: r9a09g078: Switch GBETH TX queue scheduling to WRR
Date: Wed, 22 Jul 2026 08:53:53 +0000
Message-ID: <20260722085353.136986-6-ovidiu.panait.rb@renesas.com>
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
X-MS-TrafficTypeDiagnostic: TY1PEPF0000BAD9:EE_|TY3PR01MB11307:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: e1900336-8f28-4c78-98ea-08dee7ceec9e
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|82310400026|36860700016|376014|34020700016|56012099006|11063799006|10067099003|22082099003|18002099003|6133799003|12100799066;
X-Microsoft-Antispam-Message-Info:
	45Aamko0KktbdsYpNoZor5HWdk04Ug2BTaFa3VO9pMLadvPspYR/mYOtSD0IQfJEkh5UKix0sukii2xSZBpDgNkg1QdtXrBjiEaua3aoazUNagvZ9IHB66FTaIUHoHUQSrVEdiX9tfwk5LLAtL73MZpUOdnS6Sy1NdPHM5ND8PoH5V1gWtZzu7FDOGrDCjD33xFjbUdKXtcIivDfEEUnj1SA8PQelasvgoAyYKaqkFFaBtIoGtThq0cH0Qi55/AgkOOeD7jBFIUnMvp29sHVVSxHDl0hwRCS+Uv3isc88HRJULQh5fbzBIy9auu6zh6dR+MXFd+Lk9a7jg+H8Y6br27t3lvytaZhaFGWm1z7VRYHVNQUeywkp20wJN+gpBjivtp9Q6edW/ye1SLu8tIHLock6cl5kd7ULwdkFKIoDOATDEIY3AOCq1vgaMBEbypppV1iMXA3A8FhuXINUOMQuVxRvTPVfdkt6MqhGebxPampOjsX8FY4SURMiraQKj3m4Ds2xDeIO5bEsPtBzyna1gCfZtY0YizAY9TvvCUpRcSaTWg1/05bbcS5ePgeBcrBew0cD3M7JOEYoWRvcEzWtiLDxXgCjBIi9IDU0u0mPLW6/yZHS2McWq6CHajVHNHQWzV9XqcbTYQIUGtq8l/SDHjSa1Z1aifXsASs1fZOPVkaNJPS6fQR3XrPuE/yX+m5xWGZ16yiC2J9gWmgZ3WCmg==
X-Forefront-Antispam-Report:
	CIP:8.62.32.50;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ejcrelay005p.adwin.renesas.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(82310400026)(36860700016)(376014)(34020700016)(56012099006)(11063799006)(10067099003)(22082099003)(18002099003)(6133799003)(12100799066);DIR:OUT;SFP:1501;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	bK7SfdW6IVV4VygcHv4hlZyAPKFFoOjksoNqaq7m6hgl3jvYQReysRtmCec6y5r7a3wY0u43c5cvAPjmCfnBCiz/1+29MP2THkfukih8WhgU8iYKVOh3EefcPi7tPWCFQ96Vx7PMjpiAVSy3qcp6Hhf2HhT6suGBMsE9HViOxsy8wZlwjEvhxG16Ef670gUG2yLmjb3RmDCrCkKDtsjGXISRQXWbD/tlhoTEUGGlag2+49VVQOd2UkAi4lS07h8QKxZcQLJidUDaEwq7QLYO+4BVfLNB92SyvN2+N0d0pmVCBOEcxnEZgt4w6RoueNeha84lfWfIZ4aVQvneV8rOIjKRfx9bnKUbH2Hf5VZdJ3llqj5arovQzVTEpyUabqGs02mlZAWsywh6nJzUZgPiMMcMdOre2FrhsVwpxm3OoIi4Hn4P3nm+z8Lxlg1dEScu
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2026 08:55:05.1771
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e1900336-8f28-4c78-98ea-08dee7ceec9e
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=53d82571-da19-47e4-9cb4-625a166a4a2a;Ip=[8.62.32.50];Helo=[ejcrelay005p.adwin.renesas.com]
X-MS-Exchange-CrossTenant-AuthSource: TY1PEPF0000BAD9.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB11307

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

Fixes: c4698a34993b ("arm64: dts: renesas: r9a09g087: Add GMAC nodes")
Signed-off-by: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
---
 arch/arm64/boot/dts/renesas/r9a09g087.dtsi | 27 ++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g087.dtsi b/arch/arm64/boot/dts/renesas/r9a09g087.dtsi
index e8d4f76949cc..03b976d93e10 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g087.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g087.dtsi
@@ -643,36 +643,45 @@ queue7 {
 
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
@@ -790,36 +799,45 @@ queue7 {
 
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
@@ -937,36 +955,45 @@ queue7 {
 
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

