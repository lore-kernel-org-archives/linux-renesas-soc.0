Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazhn15010016.outbound.protection.outlook.com [52.102.171.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A5D64D990C;
	Wed, 22 Jul 2026 08:54:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.102.171.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784710499; cv=fail; b=dMC88rtPXPW7l45FGgYCEtF+T5fWu01kSnTpJ2o8/CB+r7DsfioyQ5Eywjw96/LTFdkGuwduptFUwxbWgIPOSSMng6qdP6c2ZU4+DDLGF6qwOMwD1VPOJgncEbY4WNi4H2HwPUn4ANMfcz7VMBbIxuVjfg21mL61ZtPsLyw0/2g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784710499; c=relaxed/simple;
	bh=EOEyRFrSzanFA1rUOpncx+QQrIK8aWjm5JzfsmiwWvw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oMbf/M45bMXVfiOXzo62abTEFYDRSRlofzYRrcQdPkKuBAcyY9fq39Gx/IBDQg5nyb3pHZg8ancZH0ngIlMVKS2UOa43BM/b1TSsU82OyzFZ9d63j3B9ZCk9yZvNsAWY7V4bj99zG4a9iBS75VhOvhccwbKld6ECyEjwY7qUHFE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=jsqxW5CX; arc=fail smtp.client-ip=52.102.171.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="jsqxW5CX"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u6bHlzlDviUdpks4/iwewoAmMXfmWcFBM4lnEoGWDE02FAFj4UUtUycUVejDKba1Wfmj7qSsGjoQqNCX79tEK7t+xGLQqWag8yLXzQazgxui/WKEG5lbMd4HnsqDUA7w2BKQqKhxFb4P1HsJnCpMfXDXtm/6IfUiT+lIVwQirySjsHr636KZP7DkoGhs3iWfIHTWEwAt/MmhuY8WZDhb/qOxXUsOmIXBsyLIRsb1/Si+Z7dHrOSYHqVPaGnTc+InjYfQSiw2tRmNleqkemFyChh3Epysy1SAF52ZV8BjSzkD/8vBaHlrls88gOKOJk2PbgfxHx0N8RXAn/s4SYIrag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8htD/TyoIXXkR9eke73sYVkzVlAu3BDWTxKwwaYapd0=;
 b=IAgVIQdWkt7edHVDiLOimVIzP8xls9X8LClf8HDX9LZvhKBiueuvQUTuVnq4p1DbZ/eHoydMogOa24i/EFhXUGmkGKPTFN1xOG5/phjNsQ5ICO68IIy534U4qWr36e30ccRVmBJUM1gjbA+TXYWUAdmKL6TRgVtUO56LBaiOxttRZHXSGKClGpM5lfmUf5S0UyLh+7a7eYeh2P7QkgrrlDJsY9vtSFwpoWa4epN2C9L7fpK1S9tjBVa2/+1Kd/WiMnJwfsoY3N8Imng8uU9SX6YGGjUiOA73hTCe4ieP0LIAdG0AV5Kc8Kr5NWtj396WtJsANgGzXvkDfnrJX6CYbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 8.62.32.50) smtp.rcpttodomain=bp.renesas.com smtp.mailfrom=renesas.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=renesas.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8htD/TyoIXXkR9eke73sYVkzVlAu3BDWTxKwwaYapd0=;
 b=jsqxW5CXBXwVDF4P+X+D3wARaZeiaNbHol5q8pzX3LoBh6qtGBCGdAU/YwDc8vBYmtBXymLqShpNEi33wI+m6ypRNWdbPXH3yBTmT9kz2IxoZg6Bl60ZE0SaXUVOoYZCgeGobDrzmlPVp+VNJGCw8GJDOWURI/ryYCmVFv9abw4=
Received: from OS3P286CA0021.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:1f4::17)
 by OS9PR01MB18585.jpnprd01.prod.outlook.com (2603:1096:604:4a1::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Wed, 22 Jul
 2026 08:54:54 +0000
Received: from OS1PEPF0000D214.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:1f4:cafe::9a) by OS3P286CA0021.outlook.office365.com
 (2603:1096:604:1f4::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.10 via Frontend Transport; Wed,
 22 Jul 2026 08:54:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 8.62.32.50)
 smtp.mailfrom=renesas.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=renesas.com;
Received-SPF: Pass (protection.outlook.com: domain of renesas.com designates
 8.62.32.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=8.62.32.50; helo=ejcrelay005p.adwin.renesas.com; pr=E
Received: from ejcrelay005p.adwin.renesas.com (8.62.32.50) by
 OS1PEPF0000D214.mail.protection.outlook.com (10.167.240.21) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.5
 via Frontend Transport; Wed, 22 Jul 2026 08:54:54 +0000
Received: from vm01.adwin.renesas.com (DEU-5CG20946WF.adwin.renesas.com [10.226.92.34])
	by ejcrelay005p.adwin.renesas.com (Postfix) with ESMTP id EB11E30007EE;
	Wed, 22 Jul 2026 17:54:48 +0900 (JST)
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
Subject: [PATCH 3/5] arm64: dts: renesas: r9a09g047: Switch GBETH TX queue scheduling to WRR
Date: Wed, 22 Jul 2026 08:53:51 +0000
Message-ID: <20260722085353.136986-4-ovidiu.panait.rb@renesas.com>
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
X-MS-TrafficTypeDiagnostic: OS1PEPF0000D214:EE_|OS9PR01MB18585:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 4492acd2-ae27-40b3-c3ed-08dee7cee5f8
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|34020700016|1800799024|36860700016|376014|23010399003|82310400026|11063799006|56012099006|10067099003|6133799003|18002099003|22082099003|12100799066;
X-Microsoft-Antispam-Message-Info:
	Xg7jVUbX8SyPcMjd32WgzzJWvw2OUtTsOXFFTgMpPh+fwZy5YtHM3DXw2JGbo8bEyqW8jVB00zHuxzxy5CljRiwtEBcq0ou7ryUvcHk/2MHKKkQgG6YXdw8UgNK/nyrXOSXoRGvHoW59jRZJJyxLJzmZvlY7VyxEe7RR3eOiX9lX5GxTxeB04rsNZJjT9qqN5UL1csOfQwmpwvyFTRXozwVs7SF+PlkEroOupSgFSOrG3iCBBsKLL0B2AurRMlh8dWENuwVg6L73UB57BCjytSDnDMeX6/gAfpb8HFG59RTOqq2u1cyZlzGLGvtyQuz+GWlCvKxb1HARl5P6Pdq0D56XFK+1j2EL1GLCbGolAtIgwl/dQR9Ly5D9Un7YNYCMsV3XkE4XzQqPGZ5j9FKgMJGD3jMSWWvJiAdSAMQATwCGKQLRHUzMF8U+CeON1ylO+N9W3Mwj8KVKEZjHZjaonRo/44sJuj5I2VTnWHLssZt9tyFcpQ4LPv7CraNwso6kuQEF94pt5UaK+QQqdxdBnCITXv7sflEPl/MpCBCf6P77RF8zRfuvwlsiYI9k8ckMonw90zkTFoMAdYDmC23evh1yqn+wVAbChP+a9TH1kXNrIc/VdDulWe4EXXwCA5OX1Ayt+jkBkxwhzDfsOgyusmUpGJaRZJxWRsqc2bLFnDBEb+GFi9bUdKWdYIWIpRZfO2go3rFHKLLPzWuPOgjVCQ==
X-Forefront-Antispam-Report:
	CIP:8.62.32.50;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ejcrelay005p.adwin.renesas.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(34020700016)(1800799024)(36860700016)(376014)(23010399003)(82310400026)(11063799006)(56012099006)(10067099003)(6133799003)(18002099003)(22082099003)(12100799066);DIR:OUT;SFP:1501;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	6fDudjFQA7fuiFm08E0ok0gjtKtaAa4fud1l6feIsriCDvYe4knWnBpHEnbFT5TdYBKxjxLAMEKdY7jxOB5ohbkifNp9jBvMHMazQ4uHv8U9VgXcalDzRLprs3VjHRo7SIv2rADyHWD9BlK9AHNNZGePsXCW04ux52MtMPn8LOP848BlE8TPCMp/NCuM6pUCXLr8+3Aw1F1KHApBm8KEaARtlSXyk/FCTGmC+XNoPb2i2AnuPwbsyPwaNFdy7l81xBWyM+7Jra3kfnGC6SIMhyj648iNLNDnd7vWS1JIwmxbYJ5VycsTOQdk33JSWjw71MFWnkrG/a0EgH3vkxvXKIb/qYK09ACrEiKd42OK3LLpQn/M73t/N3krq8ZbAQ7Uoksv4QUaqrC8WSqQakJZXDGPisg8CaGZcsA3obzE4m86iFYWcacuXNfNbat0Av9v
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2026 08:54:54.0103
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4492acd2-ae27-40b3-c3ed-08dee7cee5f8
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=53d82571-da19-47e4-9cb4-625a166a4a2a;Ip=[8.62.32.50];Helo=[ejcrelay005p.adwin.renesas.com]
X-MS-Exchange-CrossTenant-AuthSource: OS1PEPF0000D214.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB18585

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

Fixes: 41ffbb1c42d3 ("arm64: dts: renesas: r9a09g047: Add GBETH nodes")
Signed-off-by: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
---
 arch/arm64/boot/dts/renesas/r9a09g047.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g047.dtsi b/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
index 73757e8e2197..060405d4a2dd 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
@@ -1913,23 +1913,28 @@ queue3 {
 
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
@@ -2013,23 +2018,28 @@ queue3 {
 
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

