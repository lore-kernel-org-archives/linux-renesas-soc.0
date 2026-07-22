Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazhn15011013.outbound.protection.outlook.com [52.102.194.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45F8F4A2E0E;
	Wed, 22 Jul 2026 08:54:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.102.194.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784710484; cv=fail; b=WeGXAnnfAmGrzCnl1ADOfllQL/8XWXMV3Q+hvi4YfBZuNK1ryUkifkNZ9wYHGPKo3SQzU5jVJCJsoLJYCNjZqBQ9N57QLB7hnzKaTuk1OnHoeRw/b5g3kFo53RdGGnajfyyJ60FnWXi4FHrGtSxFJi8FEPRFE6fM9m1hisPIKyY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784710484; c=relaxed/simple;
	bh=zKDLjmgpHWBfQxVCmx+pL9FsygcbAWWsvurKHgiFcZs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=oJ97TKchbhtKEPYT5nJ4xBA++clx+XCqC/ASaiq0ZwGNdzZDda/jlcTM0xReQTIK2sdZNoEgZCPeBw7IXJ46a+Pic5xqJhqmI94FiLh7TWbLMBHj3GLbI4CgmFUvUAqPnFCGRwQ+LOw14xgVD4A2DHuCnocoLT2k5Q+ThaHZ3iM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=iSLEmunf; arc=fail smtp.client-ip=52.102.194.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="iSLEmunf"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=whvk4yODtDsJhYeRVVMIZihclo/rw8CRXvmHguHVv/mHAfLcEaE0DFQX2GO0BCRVLr6rJte5ltEyPfY696pQk7ES5UpplFTvTQgP3oO4lhsZK9usKvWL20Xc//578jfSxjZ+1R1YBegfA70ZT1N5NjWqJDQ95KZpUBZl/EcunTWQcJ5j0L0kkIjJwiU3I2Juu6yC5MZjE15nZWMm6LvbdRx5iyP5EqE9fXSIqoBWwkUM/cewaGA1K8l/2ubALqgldYADQpZs5TAObls55PzHd4i2mLxyKAiFQ9PLBdMZrkhrPSUEs9gq2mjFECCnFNAyr8JV34SxVBikXRuIg86D5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tN5DgPKSU0cvuVUgTkuMxOEcucdxIKnV6HsSO2MVQjg=;
 b=VwW2cfFL2W9TbNO+7egLFcTFiYeL2WCVqedrMc8tgWBAxjbN2xXBepw+d12TEmsGc92JoOMNLO+QhAtcdsnfjJ7lqfdBbgbyhJD0eoTTJQt0lmbxPnwwChD/IUY4maeXSb3yIvgh91fdF3A0yVCe/gyi1zbN23gh3i6MuzCddf4QgTKYQalKUIAQDCtqPf0pmPIx94lgtdjYrRhfe2q2y+7lh9c036Oo4tpgTSz66Dac49PPMByo+D7ZwXU7W/FGCaklY1PELHbdP/b6yh0NtY0qbc+LZtwBnVryY+gk56r5CtBZIAf9lIZ7d9K9vdbUdiR5frHJKbStyYeazAZS9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 8.62.32.50) smtp.rcpttodomain=bp.renesas.com smtp.mailfrom=renesas.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=renesas.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tN5DgPKSU0cvuVUgTkuMxOEcucdxIKnV6HsSO2MVQjg=;
 b=iSLEmunfm8HS/b01AXWQXkdJ9X1tSfAlEw/4TobCzU9CnQu+RpPCwpT4sd68laLz11goDqjHD4SVIdi0uL3KQBQc8OtvBia3eyDFWE4ApwB/+INiB5xf0/ePS0+wDETJ1tTxBFwiGYWe6xE86McsxgEHpzT3CYCaGx9E8qjC6Y0=
Received: from OS0P286CA0053.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:9e::22)
 by TYRPR01MB14147.jpnprd01.prod.outlook.com (2603:1096:405:21d::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Wed, 22 Jul
 2026 08:54:37 +0000
Received: from OS1PEPF0000D216.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:9e:cafe::42) by OS0P286CA0053.outlook.office365.com
 (2603:1096:604:9e::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.10 via Frontend Transport; Wed,
 22 Jul 2026 08:54:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 8.62.32.50)
 smtp.mailfrom=renesas.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=renesas.com;
Received-SPF: Pass (protection.outlook.com: domain of renesas.com designates
 8.62.32.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=8.62.32.50; helo=ejcrelay005p.adwin.renesas.com; pr=E
Received: from ejcrelay005p.adwin.renesas.com (8.62.32.50) by
 OS1PEPF0000D216.mail.protection.outlook.com (10.167.240.23) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.5
 via Frontend Transport; Wed, 22 Jul 2026 08:54:37 +0000
Received: from vm01.adwin.renesas.com (DEU-5CG20946WF.adwin.renesas.com [10.226.92.34])
	by ejcrelay005p.adwin.renesas.com (Postfix) with ESMTP id 080FD30007EE;
	Wed, 22 Jul 2026 17:54:31 +0900 (JST)
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
Subject: [PATCH 0/5] Fix GBETH TX scheduling policy for RZ/{V2H, V2N, G3E, T2H, N2H}
Date: Wed, 22 Jul 2026 08:53:48 +0000
Message-ID: <20260722085353.136986-1-ovidiu.panait.rb@renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS1PEPF0000D216:EE_|TYRPR01MB14147:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 732d3b78-cb91-4780-1b23-08dee7cedbfe
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|34020700016|36860700016|376014|23010399003|82310400026|56012099006|11063799006|10067099003|6133799003|18002099003|12100799066;
X-Microsoft-Antispam-Message-Info:
	TqdifdDXs+BudHh13gKh9pHnxDj1/OISqwehE7FnWiIfUJ0u7RBbkCg5FukYoAI+sqRyVWl1Nddsqxi3XFp3VNR7pBrJh7a8nv18RYqMksrg1W5BbHkz0N4rRfZ2uYV4K8+b89ZPUQQ5bvIXyepQ7ZdXgqV48FYwTUBHfhMKto1uq3ypj4sv3RsFCSO5ec66xKO8w7OiimThOzylp/5I1qyPE3IQLnHlINnoQ/KtJ9FL8toHxxc5U69/iCoeVCQcZehwSdzRzHFXKr70MQMWpsQcXuDFMErPwyhrNguMX9dGb31vAxSpunaM06svD7W02hpoHCcm/XRpJzHfUdcS+a30ASCYyahdRFd+uF2pBpyzfJTow0yhm3yq/6S6biApilzDbTkurbHZhh3Ic1MNs52VXG/CXXKqvg2vr/4TVbRZW/dEJoZJeOurEyhPUsC+ZbXtAIU4kv8ciNrIXJw4Olufddyn68QnmMIdBmhEiKOdJ3CK3MzFFoxz9qmUPjI7+a0myDLfD/nIno7+xE1rJWvd9tGpKSfQ7L/XLoC44HxLwy2WpQY5Xv0dwMQBYQ/CQ3F166hItjGLREraFNGJW4EnMYfXhfNKxfk+j7hkH6Lis7A9VDjhu5cy+siUFIwniO8ekYQUlml9ObJOthPwJ1kDhV+yjNLOLd11Jwq/ddzU71viMA7gWD69AbVbP92nahFQLFlxyOH8+wsgMfS45A==
X-Forefront-Antispam-Report:
	CIP:8.62.32.50;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ejcrelay005p.adwin.renesas.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(34020700016)(36860700016)(376014)(23010399003)(82310400026)(56012099006)(11063799006)(10067099003)(6133799003)(18002099003)(12100799066);DIR:OUT;SFP:1501;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	17yFe42H/3nJw2IPdlxYb7ole1QODRkNSH0n4jXslx8fstGLDTSokDAteSq0J1LHdb9pJrKK433cjghRkFZo/qAkwoSjj+Jp/V9yTjNcNm30Uztr0WD0ViSSraTE49nF5/sihOLgbkPVFlEcMm0zsf6CNY48yNr1gKktLbZQ5e7/PkToFuimTWiBu1Hc0WfHtY8amcXPoZv9wBTi3Kjppqz7tWAXktk0HJhHD2w+D5qqHuG7Gwb8+5QodiMwCR8J2YvmAAOOe6FyOF3zfjvgbBW03FYtY+OOQdcE1jXPkCg7OY485jJuVOGw55OGEMYSytRv/c6OHEZSucQDy1zJSpibALfKsoFmk0eXxHbni03B6PSQa9cQDsBcTY6XJqr5+gtNht1gyuaqAzH+1949ei+b9vx7qoU8oVxIGB8ObT733nrvqddfAk1Daqca+OPE
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2026 08:54:37.2676
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 732d3b78-cb91-4780-1b23-08dee7cedbfe
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=53d82571-da19-47e4-9cb4-625a166a4a2a;Ip=[8.62.32.50];Helo=[ejcrelay005p.adwin.renesas.com]
X-MS-Exchange-CrossTenant-AuthSource: OS1PEPF0000D216.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB14147

This series switches the GBETH TX scheduling policy to
Weighted-Round-Robin (WRR) on RZ/V2H, RZ/V2N, RZ/G3E, RZ/T2H and RZ/N2H
SoCs.

Since the GBETH nodes don't currently specify a TX scheduling policy,
stmmac falls back to Strict Priority. In that configuration the highest
priority queue gets all the traffic and starves the others under load.

Under sustained UDP TX load with multiple data streams, this starvation
triggers adapter resets due to TX queue timeouts:

  iperf3 -c <ip> -i0 -t60 --bind-dev end0 -u -b0 -P4
  end0: NETDEV WATCHDOG: CPU: 1: transmit queue 1 timed out 5228 ms
  end0: Reset adapter.

Investigation showed that only the highest priority queue advances while
the others stall for more than 5 seconds, causing the netdev watchdog
reset.

Ovidiu Panait (5):
  arm64: dts: renesas: r9a09g057: Switch GBETH TX queue scheduling to
    WRR
  arm64: dts: renesas: r9a09g056: Switch GBETH TX queue scheduling to
    WRR
  arm64: dts: renesas: r9a09g047: Switch GBETH TX queue scheduling to
    WRR
  arm64: dts: renesas: r9a09g077: Switch GBETH TX queue scheduling to
    WRR
  arm64: dts: renesas: r9a09g078: Switch GBETH TX queue scheduling to
    WRR

 arch/arm64/boot/dts/renesas/r9a09g047.dtsi | 10 ++++++++
 arch/arm64/boot/dts/renesas/r9a09g056.dtsi | 10 ++++++++
 arch/arm64/boot/dts/renesas/r9a09g057.dtsi | 10 ++++++++
 arch/arm64/boot/dts/renesas/r9a09g077.dtsi | 27 ++++++++++++++++++++++
 arch/arm64/boot/dts/renesas/r9a09g087.dtsi | 27 ++++++++++++++++++++++
 5 files changed, 84 insertions(+)

-- 
2.34.1

