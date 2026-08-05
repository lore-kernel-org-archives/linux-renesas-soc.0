Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010032.outbound.protection.outlook.com [52.101.229.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D676D361970;
	Wed,  5 Aug 2026 16:12:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785946369; cv=fail; b=ZAkxDtfHBVYHF0i/0h21c/cN8W9uvXqL/JSyJksgOq+M4ahhwwCIrEFEe/sI1z3d8IDMwGeKWqr1JfRflqcwMoO/PlmAuNF8TSmX14ZDD2gCqkXHkO++NTz67bMEDvtlLrxoYyX957pVfpuL40Zoq5KVsCq3wtfNn74LQiGPUpg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785946369; c=relaxed/simple;
	bh=8cocr5OiZsh0D/QMqAhI3rU7zOXEo4/L/T1fXOMgiNk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=BYbY2M4Dflnloq2kfgBUxIa7vuTC11JLcaj+uIMwfqA75RwxHc9GFuKgY4B6AkSAdpqXK8oJCEUCyd6Cye5p0NIg4wGbSTGcHxSJxeNjQTmiMlWOcR5szr1mZ9O0UIQC0dqouYeXGh4lTPWKOVlgUFE61aMpnxtWSlNMi2Dci0Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=UIT+hLUL; arc=fail smtp.client-ip=52.101.229.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="UIT+hLUL"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kqacTkDxLXGbL7FV2Znnsv3lICu6yBBZEU52GFg1aHSnBGwL+Jz3+ePup6uoqxZ3+nnFrC+EfCLidIPqyJayO9eGm1AGelpRcR1YckXwX40Zhx13PE7CdOfHbOeGvqbuEUoxL3QGk33LvT86fV6h4GjW1+JmH1+87D++VuwxNnYasLSVcfMRIi86TNotCvz5QejChXUvsQoRLnndZ2AHHriw9sBWPU76i5vZvc9c5o5H+J2YWJpxqOkRPvrCjvDnzwbYFL5Tfk+upvy6nYssmNWQZjLyr1JzU4EC9C30EE7AgkAeo158y5FfsIY+x9SWWdB3ftv7hjDVNMZgEB/H9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ejiA847ndqwimUaB5MPkv6ql5WBQrNEu3v5YZ/wJVeA=;
 b=Nx4GmjuuORqoC6hDxffLAb05wakQR9H6hHGmKQAc+daJSy08DiRACVncuH0nB7cm/IChz8TnDrWdGBsdO9cDnYNGGjn5ZtDMWBiJReU6YUqYkmHSdqejE3XObRtNlAHh302PuvgwtOMcqxtfPCOXsmBnV8y/aosDuyMCiD+e0aN9gkxP4BCdPQLVoAZLk3xQEfrYgFqSOdcM2rQG/ZBTBAWcMMlTOni1OcSgUhjrLpX5BqiwUDjGOw2HVaov/ZwMM9UrDWxj/V02lxNjTLtiDvy4bqUVEZk/96VFhQEFzBqVDZ5kaPDQMBL1aM8YwU8J1jwSzH9fEYavGfU+Mxt4QA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ejiA847ndqwimUaB5MPkv6ql5WBQrNEu3v5YZ/wJVeA=;
 b=UIT+hLULeOZ6U1k8NL/XRg2NVxlSm091cSMq5wj8xh5HIZXHMW7qr7yEUC316EAoHIHLHVVUaykdOh8nv4vr3aCx4M4vAdW/sGIFRF6pliCVSeeY9cDa1/4JiPIKdgqc8du/Uzzm3+sdTCUXsfQYRTaGMnpNUBf8j5TxBublVHs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYRPR01MB13588.jpnprd01.prod.outlook.com (2603:1096:405:18d::7)
 by OS9PR01MB12423.jpnprd01.prod.outlook.com (2603:1096:604:2e9::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.19; Wed, 5 Aug
 2026 16:12:40 +0000
Received: from TYRPR01MB13588.jpnprd01.prod.outlook.com
 ([fe80::2f5b:8560:48ed:3828]) by TYRPR01MB13588.jpnprd01.prod.outlook.com
 ([fe80::2f5b:8560:48ed:3828%4]) with mapi id 15.21.0292.018; Wed, 5 Aug 2026
 16:12:40 +0000
Date: Wed, 5 Aug 2026 18:12:26 +0200
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: Biju <biju.das.au@gmail.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v2 11/16] arm64: dts: renesas: r9a08g046: Add fcpvd node
Message-ID: <anNg6h_2YCY87ND_@tom-desktop>
References: <20260729125516.230757-1-biju.das.jz@bp.renesas.com>
 <20260729125516.230757-12-biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260729125516.230757-12-biju.das.jz@bp.renesas.com>
X-ClientProxiedBy: FR4P281CA0176.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b7::7) To TYRPR01MB13588.jpnprd01.prod.outlook.com
 (2603:1096:405:18d::7)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYRPR01MB13588:EE_|OS9PR01MB12423:EE_
X-MS-Office365-Filtering-Correlation-Id: d446cab2-d1bd-4396-0f9d-08def30c5f7f
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|376014|1800799024|52116014|4143699003|56012099006|11063799006|10067099003|22082099003|18002099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	WEfiZlstWPHvPIoeK5K5oOLakTh0gxtCcbXaUjTqEtDqcvI66WbZYMfrs2sDwf19SJb47g2u9Ra7YDqm6JgaNJeWnv/PEP8i1QXp9BAT8BTy577dTwOaziE/Db7PQMjX5gQYqWY0Ou/A9KP9vEN2AUBG+YnpLlxEgfmuRX0GqRNUrSXOfDSJyvRu7y6FeILNzNj20NN9sP0ESBaEAQZtH4SqItKC74gB4Yu0+4VO/fU0MDyjiFNlPqd7j1VNnB7vnFNCvluAJO6jS4VmX2lxH67IsPY43X3sKRhYHbs9ktv18ErrG+UlYE/BqOYzAosyvt7BWThda7bz3j52rcfslAeSZYtnLTfofblGVxKHDbNrFJ8tOVjK+Td2DDxP2Iw5gdnaFhRO719GYC96uoupFxxIhEMT1HkmKdHsMkxHCEgEB/uOVsQO2HWumfEsASSRGfYVEMk+AGGd83Lvfd7EDd6RzFrIzZz4BAE8ByBUkiNVIjTJrYRbZfKHHBVXiPJ/QFI9yA/9mnMP/YOlmjSnQRkEQL6xy9BzqzPGE/1CFbngYJ22VGU+cXgVgXkA8sA3n6H9Chx69IT2srt5wedDSCrPNcUXGKDVUbomhVpXu5JARyxjkf79JPDq6e8Lj6qwf6ejzT0WHp7/Zj0AZ+wUvMY6vE0InepAuD98RJ0StNrQa4h4Wtor/rk1GpsD/m96aCud9fOCwxlBjviChVlZWnphMFLW2Z6OjF1OVxUzrGA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYRPR01MB13588.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(52116014)(4143699003)(56012099006)(11063799006)(10067099003)(22082099003)(18002099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ZDEiFAAupzRjixyI+SnEzdTZuIUMIRvNuygZF6gxeDeWDvxgnQz+4i7f7YqN?=
 =?us-ascii?Q?Qld4IMph6lGwHmmD43eOzm6mxmHP2Pyxidegah2DZn8j05IV2bhKGyR9wVqq?=
 =?us-ascii?Q?1t8aZGAJcf6WQpqpA5mjuOf9Ao3zv8oXtt1qjhG7xJseeS7IsH3dPtu1QBeT?=
 =?us-ascii?Q?itlZMnSJMoVpgZQ+rBJqh8zC4mS96Lj6CeeahrFwTJk8h+gLxdGQLIFlK2kV?=
 =?us-ascii?Q?m/wJneiP87YiklQPtcuUq5NtEfOhrgskuvBXPy4e7cc0nJTLEy/Ntm8HCwOd?=
 =?us-ascii?Q?Y0uAEuUvA8bnY543mMCszNc2hk8iFWARRdxLfuH4gf6Udw0kGMInxuaAnNXG?=
 =?us-ascii?Q?nJvqluE0yDIiBhoG79oijczaJfJvZmbbYcb9e52pbm9FOe+ZQF7Tf4a9ySS4?=
 =?us-ascii?Q?V8fBjMmKwYxy4CNPWRzKwNQJi1TMQ60tXxsvfUI5q9kTg0n52ES5S0mni1jK?=
 =?us-ascii?Q?BvQey8sRJ3iETL3YEP/HAg1ypWzxs8c72QDuS6G6UTBxjXv+TCVficcWm4ZE?=
 =?us-ascii?Q?lCVF3nDSDUoqlQ8S6UZJbB3t1nZu8H6WsmIKUU0JwD5ArH9Crb515M9GA7AY?=
 =?us-ascii?Q?NL56rJuBCKQcsca8R8/og2MKCOSQGc73WXSNNnimqCAt7GqIbWuP245sYfxQ?=
 =?us-ascii?Q?tdcP+RMksFlW1FIE3lA4GS0AO6Qo44NAhR1KQqW9gfe1dhRA21Oyysusq6Ig?=
 =?us-ascii?Q?SCiK4FgjfBXcL/G+h251qYUb5X9cg2Aq7urogaLLnBCXQakr7TkVL0b4gpdH?=
 =?us-ascii?Q?Gg3FNSdj8CVuTXjA4zBCftQasc5Whpy7bgf4t8YaH+pQeNEONX6BpBh8ItEf?=
 =?us-ascii?Q?+U1RC78cH1P6yn/QfbZm9e2fYv1ReRocoNgojPnv9Fi7/qI9sMCOxr6z03LX?=
 =?us-ascii?Q?CTYteLZSEpEf7cb5fwrgZ1MwVeSJB1i2yT9fPeIguSCTS7ooa6j4d1alDAVH?=
 =?us-ascii?Q?ztTgjbY9Y3h16ys2pvXSBef3LJuNMH3de2k1tmiZlgCm01RR4Nb8hfUfnFOA?=
 =?us-ascii?Q?UUWbgpVI1gWmLvB79CoJurYBcyOyFkviNXfBdQnCOYWCGoe2w5fCHDsI6ETr?=
 =?us-ascii?Q?tYFk/6IRFnciXhyxUpxsXrhnQvSdoK+7ylWUnk3d/ApyAtZUxM///knadAU7?=
 =?us-ascii?Q?/cDuWq2fRfLV14HaIA++Tjqf4CiDDu2ATNNrqw1j2I6t75qrX64TFLYZAFjJ?=
 =?us-ascii?Q?Gp1UBjWj7e6KKeQsgPpcSwe/4TwhRouq+D+B6nqC57HNkkNaKCTwHX0d1ZZe?=
 =?us-ascii?Q?CivwmapOXyvj4rEAAeF/zDKeIK+qeGnng4Asax3sJV1KSXxFyRMo436i3nxi?=
 =?us-ascii?Q?znF/XjIxSa8bu2LAWb44hZVlABke9o/9zBUf7818cADVPiXPxTbuDOCxu6P/?=
 =?us-ascii?Q?caUCYKKr4G1ShBypJeZTE1oWAAC/pLkeCta/4rIIqCCYiMfpJJcxb4Dl+3hT?=
 =?us-ascii?Q?Xoy78chtzR4MHdyVfFFqzlnESJxknAIVSHqKdfucFTupSdtuLHqEB2G7li58?=
 =?us-ascii?Q?mnQltPPL9qN4kt0RiNpV+uNydSyTuCsghs8qQmKy83HdjtH43E2n908h4sip?=
 =?us-ascii?Q?10zKOXapT8hcZIr2K4Y9evsxYE2Trn7/ZSwaHopJEA2J/BT2CC1cWE2/oNaC?=
 =?us-ascii?Q?lGAOrcsyL3mtzRnxvDXlBrH8YMAd6RQZIbYloU1/1Af6cZk1xGGBYw7WPSLT?=
 =?us-ascii?Q?s9J9cGkKdnEw31yYHTmiBkQ/K7QLdV9sN0vTh6PqPjwTmXQRmzxIWpL70rFp?=
 =?us-ascii?Q?YNhJI1IRq6CQcLRC22uabBDxR8qyJviDB5TxMx9LGPIs847WiemJ?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d446cab2-d1bd-4396-0f9d-08def30c5f7f
X-MS-Exchange-CrossTenant-AuthSource: TYRPR01MB13588.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2026 16:12:40.3837
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hiqazQgeAnwMwlWu7fV701gSUwREJvCpBEpsLcKkp9Lz8KgSn+q+YIXGb2NHZsehnTKjJM1wfewWJfX0wDyjw5M7GTw6/1b4qAefYHp6jRy/66qaGBKtRSmJNIILjNYW
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB12423

On Wed, Jul 29, 2026 at 01:55:03PM +0100, Biju wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
> 
> Add fcpvd node to RZ/G3L SoC DTSI.
> 

Reviewed-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>

Kind regards,
Tommaso

> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v1->v2:
>  * No change.
> ---
>  arch/arm64/boot/dts/renesas/r9a08g046.dtsi | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/renesas/r9a08g046.dtsi b/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
> index bf0dbac66d14..03693f01228a 100644
> --- a/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
> @@ -696,6 +696,17 @@ ssi3: ssi@100e4c00 {
>  			status = "disabled";
>  		};
>  
> +		fcpvd: fcp@10880000 {
> +			compatible = "renesas,r9a08g046-fcpvd", "renesas,fcpv";
> +			reg = <0 0x10880000 0 0x10000>;
> +			clocks = <&cpg CPG_MOD R9A08G046_LCDC_CLK_A>,
> +				 <&cpg CPG_MOD R9A08G046_LCDC_CLK_P>,
> +				 <&cpg CPG_MOD R9A08G046_LCDC_CLK_D>;
> +			clock-names = "aclk", "pclk", "vclk";
> +			resets = <&cpg R9A08G046_LCDC_RESET_N>;
> +			power-domains = <&cpg>;
> +		};
> +
>  		gpu: gpu@108b0000 {
>  			compatible = "renesas,r9a08g046-mali",
>  				     "arm,mali-bifrost";
> -- 
> 2.43.0
> 
