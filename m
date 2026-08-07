Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010048.outbound.protection.outlook.com [52.101.229.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E35F846D57D;
	Fri,  7 Aug 2026 15:27:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786116464; cv=fail; b=KeArkcDJjBBiNAEqm2O8Rq1eKdgAScj7VhzdF5vjX5ELY49ZLH1B5NZY6JutL2v9p6PiIE6soMzBdgsVrbC7Xn2epiauOyWsisznjlWr4rni86yRy/iDGoKru/3ZZLUzfnI03sDLzMHOeKlR5RaOaOGJ1KFNLkfxNDd0Ihkk4CY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786116464; c=relaxed/simple;
	bh=0PT2AfeL5aOGc8knUX28x8J5EN8sLoTgT2TsITIjLNI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=nbXJwoplShtJTIOSAYBC9l9PZEdP46XXT11uQ9TLaE7HtcISPrt/jxwHESZexeAgJFA+B2pzl9vR5cF2dse+GCYxiyOTfH1t4NbODO+oirW4vyzJ4rcvwo1Z78tjdVf5oHOlQEGdS5jSHb7EIi9TGW16xgol1KIoHW1oOdcirM8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=WbAjLde3; arc=fail smtp.client-ip=52.101.229.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="WbAjLde3"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cLVvgrEkr4IvGF1D4KMl1umFTtvr8BvUprgErX746KYPi5tl2J9uwzWs1FJFhy4hjYiW2NZ0RM1DGVyyOZkfybsnFT6vxa3Clwknzh+I9e/Nyln6j9XjpP6B5aEddOeZvCdQpEmU7WYI+SgmYOIYCCuXBcs734DiA7BX+gq8GoYXmDEubKzz1NeUJdruMSVAEDdvcljqD/0T4ovcU18xt/ZEFeccIpDJ7ja27kuTpjIjyO5NajJtZV9jTpCzHwEBoWnKkt7qui6/3Tgnu8i5duee6kqs0NdtGlooRbnER5405f6htMBfPNG7KpBPuD1XHMHFGVuoO7ACKWDcaVpqIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GYjl6V6ewpXl90783F0/5fqaAbS4biqexNAjHpTIoec=;
 b=hDdx7yEW3xoFmXttvJtf/K4olSsr83qQLtc18edawUz28ck0fIOKHjY4Ltc/dFTp/BEkpB785i8RB6cx0zwwXMMcJi59J1fZf+uhFdFhEv4y+2GbYO83eSOfFKufWm7MVl35lQXRuIDuvZ4z51azJtbe4fbIOyLFzdZ7wOwB75yEtYjahinLqO/4zWBFJBQgKMZS0qCLqHaNwJhu0VdPIIi3z0fQoGolv47rs+zgMc1ao/wk2qh06rJXG026BsIBTIol8Z0+/5yK/9zcp1b0bYiiNvLgmvMsfHHeAFaxPWwIJUda1bsLnvjfisYZgx7se0LVed4IgYlZpAN3CC2Cew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GYjl6V6ewpXl90783F0/5fqaAbS4biqexNAjHpTIoec=;
 b=WbAjLde3wk2duY5HZY5ZDw3kUBQjrW68yVK+McqdMV1D87JQnerRH9g8JErsRPIKR6FO2iempMau1+cn7pF4b0yKKod+Cn1ecK5EyzcHZZPGwhKhYp9TY1ahsYqt7N3a1yI8ZunAjIUuBDyGzzgQZlBAh8BgafCpAZ7dEC+bjXs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYRPR01MB13588.jpnprd01.prod.outlook.com (2603:1096:405:18d::7)
 by TY1PR01MB10672.jpnprd01.prod.outlook.com (2603:1096:400:320::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.24; Fri, 7 Aug
 2026 15:27:39 +0000
Received: from TYRPR01MB13588.jpnprd01.prod.outlook.com
 ([fe80::2f5b:8560:48ed:3828]) by TYRPR01MB13588.jpnprd01.prod.outlook.com
 ([fe80::2f5b:8560:48ed:3828%4]) with mapi id 15.21.0292.022; Fri, 7 Aug 2026
 15:27:28 +0000
Date: Fri, 7 Aug 2026 17:27:12 +0200
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
Cc: geert+renesas@glider.be, magnus.damm@gmail.com, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org,
	prabhakar.mahadev-lad.rj@bp.renesas.com, biju.das.jz@bp.renesas.com,
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/5] arm64: dts: renesas: r9a09g047: Switch GBETH TX
 queue scheduling to WRR
Message-ID: <anX5UAtB_PtITkxq@tom-desktop>
References: <20260722085353.136986-1-ovidiu.panait.rb@renesas.com>
 <20260722085353.136986-4-ovidiu.panait.rb@renesas.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260722085353.136986-4-ovidiu.panait.rb@renesas.com>
X-ClientProxiedBy: FR3P281CA0117.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a3::8) To TYRPR01MB13588.jpnprd01.prod.outlook.com
 (2603:1096:405:18d::7)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYRPR01MB13588:EE_|TY1PR01MB10672:EE_
X-MS-Office365-Filtering-Correlation-Id: 050079e5-8af2-4af7-c8ec-08def49863a1
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|1800799024|52116014|376014|10067099003|56012099006|11063799006|4143699003|6133799003|22082099003|18002099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	3nQxPabVUTSX3N4cMWvtdrCKO4t+HpCjaHqqzrq6C5GpIJ3Au6d5ynAqMSRhjDa13pPUlehgCraje56EECsgesfziHbEwyDXeGtv0Dn0acNPTUdwQWs+dNgqrVZC/CDR3CCHMXkvYFC1zPGQHiZSgA1bA2vJtvlyeveSx/SGXOaHRMMwvQoAGPI4UTmY/Y29PWEjArmUN17YWhlgFDwdEUH2yGuHp9tjcTfzGVAQnVLFjM5ITWFoj46sv5YJLZizFGeBoB3sqtubR8cKIsidVI2CihKlrf5t5LZ1UNpzwEVnRR8gPQlnAOb8bd1XEPy8TfmZMna3wul+BfIUHdMGAps4QRZIBlAVEW3XntDapna+IRR2fl2PCENgLikzC+QiDCj1unnbGlLkyqanKm7h7ScIuUxsIKO7OSZ1vPikze8L8Esdz42geLkav5azi5dENjuOrrwfvZ+enLWLQLVJdoYmMFWLr5Okwse7EG0mPzMwRiqFEcmWVzigzA2SZTBUT6AHCcey/yu7QD+4YF6agFGZ4c6AXiJBo1lg9lvq6VbY0kUCZ6EDARFT9Ye22tzg+5rdwOVM2pc4tuUMPyAMYywo7HCkZqvVpCXeWULRTrwx5tWc3c3gZ0aKrKoBQT74Rf8/+yN8Dmkdo7H11/8IUMvueChOwo4rr3BZMARdd2dXhqMeJ81fbBIXssb1WdifEu8umKGoXywvUDfjzg+U6qiwRW5I7Gl3YAiyunKjeM0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYRPR01MB13588.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(52116014)(376014)(10067099003)(56012099006)(11063799006)(4143699003)(6133799003)(22082099003)(18002099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?moFDHvW+SfuqpkP0jtdwrrnpnR38XcHI1XT7gxWgo5F3Aa6WPvSvUa/edEo4?=
 =?us-ascii?Q?xVrZjC86CQRIIcLbNU1IS9nhMBJX1nr8q6PXcvC0ySi0xy96X/o2uWK8XQoo?=
 =?us-ascii?Q?9w5mOjxRMoTvTr5+MefWrz3JhQz4sh092TxyNtqvX/7kM7GkK3hcFCpOLaNS?=
 =?us-ascii?Q?ASQLPupgrNQIZy6AaABvMv+qSsGcRw6oej7Xj4FOBouioWigvvVU/5lqExpI?=
 =?us-ascii?Q?CGqr0VTlSD/arVI3gh3PT4htLsGmwOHp4fOTlnTb//P854Z0vgMwsUiedxOU?=
 =?us-ascii?Q?vmQJvaobu4ea519VONe3c0pGmM/ytSkKWT3+8rDd3m7nL31VkHBRPwxjFW12?=
 =?us-ascii?Q?YtUh6GIQl76SbMbCVsI7QXwNbdDX8nfLxzNPHdiGqyApPrxrNaZFTBNeTcKa?=
 =?us-ascii?Q?PsGDz0+fVAM5AXNmv37HRiDe+7RMo6Bg0MlX7QsSHfaKtlzOPtWpyPOJhNyk?=
 =?us-ascii?Q?maJ6+3K2Q1dqFXLdVQxx4b3daLbIfgIny4IfT3xer46GscLAfpTg3yOcQQio?=
 =?us-ascii?Q?LKWBTT9PQMDH0um9B9nmp30KYyVrMUCAsM/J88FFXidsoKUpj862KpHJpRXR?=
 =?us-ascii?Q?QKlCSdgZ4qLSqXCZtMZ+fYk2iuD5qIWMQU4Kki6eZFGbXmhPv3tDUgI9OXGN?=
 =?us-ascii?Q?Ssn5SFom+U4QJAiR9ZsEu4vutedcNeHOlEp+QVTrFGHdyculaA1Aqv/zqy4I?=
 =?us-ascii?Q?AxP9jwKxh0qQOppsdwY2XHo7tlALlQtvFYdJ1nr3XrLDijvbhoTISNBqyAmC?=
 =?us-ascii?Q?fxyuckNZahRxsPD2G9Lb8+JsMeg1cEyjoIpoztla5BLKYtXW3BtYYIemaN9v?=
 =?us-ascii?Q?l73/y3LBfSiz+NFfrL+O08/BdaZUELhWTnpZZEDZOUXst07sUSkVIjwvlQh6?=
 =?us-ascii?Q?x08+R5wMtjGPjyvrHk8giPj7KCCYxrq+PEFv8652H+H2TiLMFE+Nk/7dBBqW?=
 =?us-ascii?Q?HZi6CqOhPApTGHzFaOKlqeRxAR1kT3XCv+gEUHaFNrxgebb43GOyJPHR7iA9?=
 =?us-ascii?Q?UehxApeM7JjQv7vWR4TtYRhCBkEhbS3MRvvBfzkccfUJYi8y+WdQhwSijDcr?=
 =?us-ascii?Q?vM0v/SXc4gbAGKK2tjYFhUrEpIMDGInSS/PBHKzooBJBlQ4rdVrfuVT0Clmx?=
 =?us-ascii?Q?0GC+Xl4+icwLGIIPx7RGKtK+FCESRxuH8fY+lRguG1q53dedyAuc+l92gxJq?=
 =?us-ascii?Q?g/zfKE6mR890mpqIQfnrb+4P47AzkwsDyp7j7IdAa5rK6zMnKF1DN5ehwVvC?=
 =?us-ascii?Q?BBRddJ6in2gBAhiK7F9H778sE7XYGLePku/V4uDsGr/EIxxTkavQ/+fojW2E?=
 =?us-ascii?Q?9MZ8Sa1lP5yywEPrK1Sn/Dc9XTM34ejjPu16w1q7VcXqUuNoyiWskYQbFVjb?=
 =?us-ascii?Q?zcfwpDVZPB4DzHPVa9vhd7di9yNKNotFcbi4QCQg83MdKdBHkD/TM6aMGRTe?=
 =?us-ascii?Q?y0EA9evVcUDHxfTr/gZikJBoPUvwOC1IuNzlkwkgcPkIMTTbPWy1LeBX5Zk/?=
 =?us-ascii?Q?FAHvxvpTqxZWQz9w+FzKYc7NeWPqBkLuVvz8VbRkAy2SLM/t6Zyt+HwDcAAJ?=
 =?us-ascii?Q?oM85LTdR5NLV5kfPtOfKOrIE5QlPBycqBKCpeUDwdAi0jPUmUybPBJGVTQcL?=
 =?us-ascii?Q?sj48v2SRCvMiBb7XU2VeF2Z9FWrNYXADG07luulT96y3W06DU8+baaIGDKg3?=
 =?us-ascii?Q?IDXOXHWOsZtRQKgBouqx+i2d5mTpxhFx5/bY2/p2hir3lLOSXFrB2dO+dJU2?=
 =?us-ascii?Q?lBCmLyL5v4jizJ8TtkZ/kp3Z6Xq3ruswnohzggWh2J/4KUZjaM9P?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 050079e5-8af2-4af7-c8ec-08def49863a1
X-MS-Exchange-CrossTenant-AuthSource: TYRPR01MB13588.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2026 15:27:28.0999
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y2euM1v0z2gAOHnWVo2KXk4PBNTDo7ifVnhtDRdH92gttUxkMFnQ5/Yrd8R42e2eXepJp65N6zRbdvwmwo5E7bnFTBK+Qh+fA7dfZKsRb8j7o8rymdr57eB6RfjFepaw
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1PR01MB10672

On Wed, Jul 22, 2026 at 08:53:51AM +0000, Ovidiu Panait wrote:
> The GBETH ethernet nodes don't specify a TX scheduling policy, so stmmac
> falls back to Strict Priority. In this configuration the queue with the
> highest priority gets all the traffic, starving the others under load.
> 
> Under sustained UDP TX load with multiple data streams, this starvation
> triggers spurious adapter resets due to TX queue timeouts:
> 
>   iperf3 -c <ip> -i0 -t60 --bind-dev end0 -u -b0 -P4
>   end0: NETDEV WATCHDOG: CPU: 1: transmit queue 1 timed out 5228 ms
>   end0: Reset adapter.
> 
> Investigation shows that only the highest priority queue is advancing
> while the others stall for more than 5 seconds, causing a netdev watchdog
> reset.
> 
> Switch the TX scheduling policy to Weighted-Round-Robin (WRR) so that
> traffic is processed across all queues, eliminating the stalls.
>

Tested on RZ/G3E evk:

Tested-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>

Kind Regards,
Tommaso

> Fixes: 41ffbb1c42d3 ("arm64: dts: renesas: r9a09g047: Add GBETH nodes")
> Signed-off-by: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
> ---
>  arch/arm64/boot/dts/renesas/r9a09g047.dtsi | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/renesas/r9a09g047.dtsi b/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
> index 73757e8e2197..060405d4a2dd 100644
> --- a/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
> @@ -1913,23 +1913,28 @@ queue3 {
>  
>  			mtl_tx_setup0: tx-queues-config {
>  				snps,tx-queues-to-use = <4>;
> +				snps,tx-sched-wrr;
>  
>  				queue0 {
> +					snps,weight = <0x10>;
>  					snps,dcb-algorithm;
>  					snps,priority = <0x1>;
>  				};
>  
>  				queue1 {
> +					snps,weight = <0x12>;
>  					snps,dcb-algorithm;
>  					snps,priority = <0x2>;
>  				};
>  
>  				queue2 {
> +					snps,weight = <0x14>;
>  					snps,dcb-algorithm;
>  					snps,priority = <0x4>;
>  				};
>  
>  				queue3 {
> +					snps,weight = <0x18>;
>  					snps,dcb-algorithm;
>  					snps,priority = <0x8>;
>  				};
> @@ -2013,23 +2018,28 @@ queue3 {
>  
>  			mtl_tx_setup1: tx-queues-config {
>  				snps,tx-queues-to-use = <4>;
> +				snps,tx-sched-wrr;
>  
>  				queue0 {
> +					snps,weight = <0x10>;
>  					snps,dcb-algorithm;
>  					snps,priority = <0x1>;
>  				};
>  
>  				queue1 {
> +					snps,weight = <0x12>;
>  					snps,dcb-algorithm;
>  					snps,priority = <0x2>;
>  				};
>  
>  				queue2 {
> +					snps,weight = <0x14>;
>  					snps,dcb-algorithm;
>  					snps,priority = <0x4>;
>  				};
>  
>  				queue3 {
> +					snps,weight = <0x18>;
>  					snps,dcb-algorithm;
>  					snps,priority = <0x8>;
>  				};
> -- 
> 2.34.1
> 
