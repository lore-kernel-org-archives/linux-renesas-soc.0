Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.229.66
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795607176;
	b=yraipJPczTnl/3Ncd3vEy5H4xJ9XkbpHgQJTSSsj0wPqK4hGTHxdTmUMD1GRdFD8hfqG
	 EYiUckYa7JxhyysIxyxWbnnLkPxMjJ2g0yb+v3vbJJJiJIXXWqAZz9XzRynUSwH3tRQfC
	 oUrLWkkaLWbwy7US1/bluzhnnfrw5Qxj7Xvp4gfUnzlz1aFO8MnsrZmddCJjJ9qxmp0S+
	 z+n9vZJRY+zXdN3lqI4Axeoq/i8zWsWvh3OYfi6Yrm7xBUmyQur7tKT2Vc4Weu4Yjgfgv
	 wgdQLOSWPrqivCZHuIkXDx+8OHMm6VCTLNJJ50D2gLVyq0KnRmigPfApsjtqKiUIekA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795607176;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:Content-Type:Content-Disposition:
	 In-Reply-To:X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-LD-Processed:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=Anh8DKmWoM+FlyHmwpo6kzUlMPaKPMKOv+rfw0IhtLw=;
	b=x8EEXsL3zFCW2UM2ie16t4/86eyiLlhQtfZI5usvEJGAa6ISCuFo3nFgX9OtKtCWQcMp
	 WybUcopxKvF3sxtJC6k60C2qO3u+ejXyO9c3/TnwItCGKhaI4nK/VVNQ3pSUwqOyRjSva
	 Ukk2+/mamOz5cA1HB2LuJqmaH6q/5+ahpm4WBufwXQp2nfjFOmf8P8TtU46pwwQyBrN5M
	 JzGnccUp61jbdQ3dEakN/npaPnzCM6kuCLZtTw4rKrt0whQfDGeVh6+xZU/AsV2KR1RH7
	 jVzgLTFyZjhStpIKn8BMXqPFdGRXmvqWiVHOjA6BeCYXcai8SZUtnzTm35ijsFeNAoA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bp.renesas.com;
	spf=pass smtp.mailfrom=bp.renesas.com;
	dkim=pass header.d=bp.renesas.com header.i=@bp.renesas.com header.a=rsa-sha256 header.s=selector1 header.b=lbFz+O8F;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.229.66
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010066.outbound.protection.outlook.com [52.101.229.66])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8B92606A31E
	for <linux-renesas-soc@vger.kernel.org>; Wed, 25 Nov 2026 11:46:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B8B92606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.a=rsa-sha256 header.s=selector1 header.b=lbFz+O8F
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W9nCsNZjWTttSKBNvJKuX7lEWkCbHpEu6DgTzznOvzDp/DmrrC5grVrfTfvVJ63fhuwC8igujYjdcPNL+NEbU7oMm9n4PoMS8AEUJdP6j+5zKiAQxrVcoqhKX/2Jm/5fy1PVJzlVXf7jEM8WMS+xSw/41DdtnRWwBZ7c9deruN9liIn7Cb9Nc+Z0UakDwSTjL1JarOmUwv6hvSq0GoxJh1ahDlc1Wu+xSs84ZwOwPqspPVOeTaya59m1HijVxgtaC+JGQkD2wB3SPiZ2mNeh9RtgI+Ze+CLC+6glyvgIR41SU85nEmFtWbyCsXM0/ZUuQOaQj28D60fch68gdsGBfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Anh8DKmWoM+FlyHmwpo6kzUlMPaKPMKOv+rfw0IhtLw=;
 b=khspIpW33fkRR5Zhk3znVfhH7r3xvEL2GuglAeHIllggS/eF5tZ4XcSSa6hChtCXFxO0gxFAsGBxgQ+UgWPN0qFsR47zKnMXU+874HFM1OrR7nFpwgK/NQizZoa8QOQu/3moZW6LABB3hjItyjKMoP/iQQP46K/MOJSd6viYe7YOP5Ts9u4rCMF4EXIoRaLUBbLniQx49F3PcWanAFsJ3l4vZT3nb2+9deNv4ErVHuEHAXmF5SzgFyNB/i1NDQWBtmvoOv5KzXWPbMPb7rn1+kUSfab6g4jMdnG5mINshJemUrWCoiMV/eUD7C6PHXxRu1GL2B+KIGzzIdp1kdC3DA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Anh8DKmWoM+FlyHmwpo6kzUlMPaKPMKOv+rfw0IhtLw=;
 b=lbFz+O8Fz36OAXKWpTmYzlyCemQDNLcW+Cx0E3yb2Zw/piDKCx+BlRUcF9a2EKd7LTb5/O59xQr3gNejb9ZVRW04jY3YDPQPGxTYjWRSBBB6FB6hjmnnnyRTW2Wvm/m5OxgMgOTrOb4pecqk+Qtmt+/9Eja1c587NupmbjPtdpI=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TY7PR01MB045388.jpnprd01.prod.outlook.com
 (2603:1096:403:405::18) by TYCPR01MB11897.jpnprd01.prod.outlook.com
 (2603:1096:400:3e0::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.6; Wed, 25 Nov
 2026 11:46:13 +0000
Received: from TY7PR01MB045388.jpnprd01.prod.outlook.com
 ([fe80::efc7:876a:53ee:a019]) by TY7PR01MB045388.jpnprd01.prod.outlook.com
 ([fe80::efc7:876a:53ee:a019%6]) with mapi id 15.21.0662.004; Wed, 25 Nov 2026
 11:46:12 +0000
Date: Wed, 25 Nov 2026 12:45:53 +0100
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, linux-i3c@lists.infradead.org
Subject: Re: [PATCH] MAINTAINERS: add renesas-soc list for the Renesas I3C
 driver
Message-ID: <awbKcUn-C_K1WZpW@tom-desktop>
References: <20261125105037.29830-3-wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261125105037.29830-3-wsa+renesas@sang-engineering.com>
X-ClientProxiedBy: FR4P281CA0382.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f7::20) To TY7PR01MB045388.jpnprd01.prod.outlook.com
 (2603:1096:403:405::18)
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Post: <mailto:linux-renesas-soc@vger.kernel.org>
List-Help: <mailto:linux-renesas-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-renesas-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY7PR01MB045388:EE_|TYCPR01MB11897:EE_
X-MS-Office365-Filtering-Correlation-Id: 9895a7cb-b1f1-4960-13f6-08df4ae9b447
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|23010399003|38350700014|56012099006|10067099003|11063799006|261022105027099003|261026140227099003|261026121527099003|261021121427099003|261028144727099003|261102123227099003|261009221227099003|261009223027099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	uGsgFcDr8s8kY69qhUkE+jeVzhGq/B/8sbM6XtiLQcR1FG4tyEaBhx6hYEgecGi+HXc2shMeoVvmQw3hwVwz5IXGqhKiLTkun/cVCXkiTB7YWXA1AVIhOj+7S/gatjoFxY83Sa1LS5xihIKJZyN8AZcWirQTHxIR/mOAWR27J/sq2bWQAzlqSlWVS4njnq9UIPosodW64ImUr8u3EybivsCGRMRB68+/p4F6ApwJO/NkiCsWWlCOcyINYx0AGPhtcNkygl+UtzsZ0s+cUvkR0Uy6lFzovBlQMvJhv8TZpNNiJJayCZiamYleyl8VA34Iy5hXTjZqLR3AuGbR542w8fB1s3BLkYhUs4ZYvkCr2mjeSvsjUqLYD2d5IqJbLkFMvv+jb+ENUgJJFQBitMkBZZzHsjWbAQylGNeNPbmkK7f7AhY6TFlrFiLhdiGes8Anv+BeypZ0tkpnEu84xQ25HIyQcClZ0UY0X8UV/ivOrLs/SiITZ2uZkkcKuUu+ejKWLR5oEq2+abulYKiZ1uWPgOczFVuW+dMzq6nwYyfcPDY+b2E1fzAxFOmmDSCLT3IsbVzBB5AXNW1HCYJH1OBWLLJfyPQU05fwkV8YOAhUjFYMi0lGrc6Y1SETg7CGCT+hQwcegBbRFyRZMEZ0j2AWbI87Jkwq/7wv5hOIWGNRZ0kU4v1QFHRZylZ4UmYF3YkNXhNcWL+N3Ao+iuCEQAeO6CuEE04aw/rANMvl2NKR6CE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7PR01MB045388.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(23010399003)(38350700014)(56012099006)(10067099003)(11063799006)(261022105027099003)(261026140227099003)(261026121527099003)(261021121427099003)(261028144727099003)(261102123227099003)(261009221227099003)(261009223027099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?IsGhWT6OTmh8Zbclfd3JmfJFlScsnrRgil1lFnfC9eTQxjkqSSZUNfRSGs1M?=
 =?us-ascii?Q?Tlngs7l5uQhsVjHUM9qahx7Chz/PZNAhro/ROLVY4iAYjgWUDSQwAJ4F5MIC?=
 =?us-ascii?Q?PkB7steS0dn97IEb9aA9nq5wH5ttpZzt+34PUycxV7K8GENGC6IRhQj7ZMBD?=
 =?us-ascii?Q?zXxksNFpM11+FJiqbmy/4Y8tn3gREU5GWBS/xunytPeh7IAhq5ou1LcV7Xi2?=
 =?us-ascii?Q?3P97hv6igGDT9Y3fVJnUtR/TJY8tR9jUm/3+zGXRTblx3vWmCMPTqQ96BQJb?=
 =?us-ascii?Q?PKqxqHfvSVSFS0667K/8Lawo4I+ESrbDW1q6Guujbbz9LnU87z7a4Jo4pQ/c?=
 =?us-ascii?Q?F6GIMTW5UjzFfnPs2N9Xu1V0qRpubIJA3GBZki+59cYeX6M/Zmyx2WhYG5rw?=
 =?us-ascii?Q?lpTKdSvxpMnwa8Wtpv2qdQdHFu2KVhKGV/0qcp9tbOj2ADz2k5YXxT8dSdfx?=
 =?us-ascii?Q?nooFAShOgXibuHPcFdIi16A0eCMUss2y0TAgkx9feq25Nq5xgHa7nrnL1o9t?=
 =?us-ascii?Q?p6bRL8H+rj1bxr15ThKrJVnX/QbqC9Y3WxP3nS5/T4up64GCSM5aOhNNagsv?=
 =?us-ascii?Q?+/ycq4oSAn41MFZuoBhXWdCnF+I9tTL2HK8Q3Le8EwEjkr934TX/spiCPMGP?=
 =?us-ascii?Q?tXp+PuYhbjRlnmcVnuUy+CF5jqKkjqPznLWNjZknfKaWiNxv6EgRL3sf4xmA?=
 =?us-ascii?Q?CXA9xOMPa5qqYoaDrSQgdoh4wtcKJM6xuGrW2GOBUl9k1KUIA+UJqKH6pAok?=
 =?us-ascii?Q?d77fHr1ElvAekWbW/df194LcNvLMYTR6Yn5LxiKWoRtehabCCval1ZErOG7q?=
 =?us-ascii?Q?Q/J0e4yDRQod44AwL+fMdNcOSeky6xlqoM7X6Jd+JWE2dsUDiyCamZSwArfG?=
 =?us-ascii?Q?+DgJHzJA5Az9l/5YKMJTtM3qngZ1HGmGU2kLcP/7l/ZDv60lBemrJxv9KWpR?=
 =?us-ascii?Q?jNC+acXlsekq+hjKCB1p8mUKikJKANMBGXEXDBDl+hPYjbUMDcPh9/pTwMIB?=
 =?us-ascii?Q?Zb7Qn+oh6I2uaJo5N4icwazohsQlQtgJZsaR1gZTI4qtVdcDyLltzM6qp9i8?=
 =?us-ascii?Q?B95VdEsNsm86dgula50jcNvaaTtDxT6Mmr4PLcxJbUFTsEQGdxv3I00IKTgY?=
 =?us-ascii?Q?A5JpU6CmlprYn75IUHdvZ6ANPHWNtNLuvCfvvQa3qZrvD9BImaYOO8NtqVEV?=
 =?us-ascii?Q?8TB5IQOKlZnnixaL4YCCA+JUf9tpGnbSqJj0s6n8Ypzw2ZdUpqNzwDQl/6ms?=
 =?us-ascii?Q?b6C/KdtJEYv1xgBxWL0dYNFjE4xJuEFbW9YfFKOnVhqWCDh9nTQ5X4cQvCCq?=
 =?us-ascii?Q?0cc7cvx4GxL0ZMBw7tiOp36D9AIbWQY9aJanudIfCUUsYtxjrQufZ4zvcR8v?=
 =?us-ascii?Q?YJLB5Mtl7gKM+m6ZyXKFLYjwyOtGldt+2NPizv29bwxKuoYquZ2wapTbBvZs?=
 =?us-ascii?Q?Q4xQZND1Aq45sl3ajKlwp8OIkYBrdhf2RudmUwrKHvFmU5MzfL2gJjNXK0xA?=
 =?us-ascii?Q?oehD+dTEGoFrcUz2AKIxUh8LoKG3qsS0pIi2gJYsagAHDK5qC3Six5zbeIam?=
 =?us-ascii?Q?CMQM6KOEw1TDC9+ofT8cz7cPCoYaOitG+WM007QquzELqisSGbftMwQlO2an?=
 =?us-ascii?Q?nazi5e/r1joTT8wvXYRd6zBhXrFW5enVTbyvtoCAD7Rq3p9FlKfOvwxtMkrF?=
 =?us-ascii?Q?ipqQRSYxMiJDK4uRSSzimvupDk3vxJI5iOvXBMRADNOPLSWN+EMXAmVzfxJI?=
 =?us-ascii?Q?RhbD42fHzFKOZNN0ViFX3CdhXIUF5iIbscKtIPF5vzngyKEFhCcu?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9895a7cb-b1f1-4960-13f6-08df4ae9b447
X-MS-Exchange-CrossTenant-AuthSource: TY7PR01MB045388.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2026 11:46:12.4276
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1m5pxc/VGkp8/W1WdyFVQpYzV/fMmXmIMBmO9Uf/wkHTX6kwtXn+2v7WMKtTTIWci2AXSIR93d1+QHt5F27+fVVi0LNg6dvfqRxJ+/GRVQkKxqh9G4glhVLcXAimgscX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB11897

Hi Wolfram,

On Wed, Nov 25, 2026 at 11:49:53AM +0100, Wolfram Sang wrote:
> To make them show up in our patchwork instance.

Thanks for this.
Reviewed-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>

Kind regards,
Tommaso

> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
> 
> I missed a patch because of this missing entry. Should go via the I3C
> tree, I assume.
> 
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index ccbcdc0799b9..dd48e2268aba 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -12707,6 +12707,7 @@ F:	drivers/i3c/master/i3c-master-cdns.c
>  I3C DRIVER FOR RENESAS
>  M:	Wolfram Sang <wsa+renesas@sang-engineering.com>
>  M:	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> +L:	linux-renesas-soc@vger.kernel.org
>  S:	Supported
>  F:	Documentation/devicetree/bindings/i3c/renesas,i3c.yaml
>  F:	drivers/i3c/master/renesas-i3c.c
> -- 
> 2.53.0
> 
> 
