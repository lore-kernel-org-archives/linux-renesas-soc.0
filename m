Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011057.outbound.protection.outlook.com [40.107.74.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A21846AF08;
	Wed,  5 Aug 2026 16:15:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785946518; cv=fail; b=K6pCln4ryld0mkZPN1BGgbIRn3rRluDHa7ydg2GHOBkYVo6zFsMrCRfUXur880mmObgYjtC8Ty25SeHZBatiXljKZEV9gryf06sc6lN8MteWn9Zi6e7aCJBzvBe1O9DB9/SbjD9nH9sGZ4TSjqk/MIXbEFoTnZH0r9Zyk284gNg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785946518; c=relaxed/simple;
	bh=GJ4OCYsS9dV7VBs5m+yS2U/Y+DgCg064Z3kSIHj3idE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=NeS4VDjyV0xZ6pbT1AJjaQu5MXLE/BtdayEZA+C0JyVzLL7xWvxFG6YbkzZn089LLntb2Kl1rbrPKyCxlPUGi3As1e8j3SXjQb7QHlmOWFwMhVRqnZ5OpVsw3svH8Coi3HC8aiVgLo3ZIqYvpMg3rRycPEbOUfv+LNRtAK0DBZ0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=jneUjUDl; arc=fail smtp.client-ip=40.107.74.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="jneUjUDl"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jUq9DTOFZjsKZ0ZLXPKinB8Ye++cfMLzapRnJACRaqQpaGcc6CcGvbW3pM1Axpf4YAkTa05ji9xMLN2oT4ZZ7A/eCwrFAOncO83qAUWSX+ldmjEOD3OT81nUYRXikct5goF0TEP2hirOSI5UrCuiTbNJ6q479lBrY2scdeCtuQ4tm+VsmlzSIBexojNauBjBJW6JEVU/ChiEbvF517RK9gUPSa+xBnoWF3AuJti4lkEkBSUw9A5a8xUtKU6Oxwo/xphfyKLYVsPUPxDlza1wZW62DT0FU8zNNcgTouLi4rggexO82NZBd/7bGlUUJBjmwqNzD5cG8+YMV8TEHQRUnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XvCRN5k6CMIqTwxvtlBlt0ML1JJ4vB8rsazVWyH6T8M=;
 b=Acg5gDYdS3qDYasWI8WgY3E429HAtbJc696ngRN8abYk1B8aDQ3IRJE+I+1Os13VgBfQS7GuNHQ4W2eTrcxIXCL9N3vsqc+rAgAcWP4bkHJlpOwL2szYX9aQJ3JlhEKSH+FJlFojabosL2i94goqdjvGmAnE/7G3Ntu59M40bFgP22+jD0YpSw7DGr8A6wu5yqxy76T7PS08vNFouvdSsOx2xxiBKHV8s8idMVS5+QbbAx7bqgHZGeEbLRGJSlh+ZKzpHXG4AYfxfI9u35pom2QrKJHcRoUUi1uliGg9+AUJ+g0sA/1sZd5kX544z6g89Oz88lGayBGJdwfoSYJd+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XvCRN5k6CMIqTwxvtlBlt0ML1JJ4vB8rsazVWyH6T8M=;
 b=jneUjUDl3T5YWiBR+8b3O+Jn3j43EMNn1G73QBu14Uyq1JLOCkRbSTaOuN3mHGNDUbPmYP0JZTOAdExQM6/h+Z/huXgvcYy+Jw6iUyz0iNAb4gx1E5ZwL8o4kLFdaBD4+bqmLpWjT1GMXSaO0bNiipXjEkqj+E6a+CNiYEwzH4M=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYRPR01MB13588.jpnprd01.prod.outlook.com (2603:1096:405:18d::7)
 by OS9PR01MB12423.jpnprd01.prod.outlook.com (2603:1096:604:2e9::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.19; Wed, 5 Aug
 2026 16:15:00 +0000
Received: from TYRPR01MB13588.jpnprd01.prod.outlook.com
 ([fe80::2f5b:8560:48ed:3828]) by TYRPR01MB13588.jpnprd01.prod.outlook.com
 ([fe80::2f5b:8560:48ed:3828%4]) with mapi id 15.21.0292.018; Wed, 5 Aug 2026
 16:15:00 +0000
Date: Wed, 5 Aug 2026 18:14:50 +0200
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
Subject: Re: [PATCH v2 12/16] arm64: dts: renesas: r9a08g046: Add vspd node
Message-ID: <anNhevluIbqegUi_@tom-desktop>
References: <20260729125516.230757-1-biju.das.jz@bp.renesas.com>
 <20260729125516.230757-13-biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260729125516.230757-13-biju.das.jz@bp.renesas.com>
X-ClientProxiedBy: FR0P281CA0161.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b3::8) To TYRPR01MB13588.jpnprd01.prod.outlook.com
 (2603:1096:405:18d::7)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYRPR01MB13588:EE_|OS9PR01MB12423:EE_
X-MS-Office365-Filtering-Correlation-Id: c620c428-52be-4be6-3527-08def30cb2f2
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|376014|1800799024|52116014|4143699003|56012099006|11063799006|10067099003|22082099003|18002099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	NGDPl8VMIcAeBP3M4p4NrnY3+LRCVNLqccj7te5SIDFh43g68+5ueLNJx8a5t6qoTbLiGzyDZjU4UTf1tRz/CY/ouIy09mPz7gb2ZQvgiBP+oV/M/lRXw+QcZGq37bvu2umXsFBRN71X3/0O2GSlXtkJWXDN8dZ/CZQlOzLr+Q5V0DnCT7ivu/KeEeRVkJyfgyHLzi2Kp+rHxAEhn5pnuWwbnw0Ntu/Rr7mKzy//P40/5wsq89J8GJowWarBccBiczzj7x7xqGZR8IMDXDcm+9/x+1Pbl/9oyBJZCB39OOc1Fl0hQ29/vT+kGBLwBMqJwimVWENP2rP8qtBPxzYTSZRQuFGkOZyukha2PeWIYOgwi8w+Sb2uDXNoi6Oz1WRDJ/H40mJ8qK33+AM9ibbyfvgyqYenQL9xpHUTaIL6wscr/lKbwGeDac/Lva8jNR28B1vRUMnzZ+BJqVdEHsQ+3VLz46C1S6DshDrndJGONrRzRyZ0LLrGBmi1ZZCYOM82b4TVxjJRx9SBDK1q90Nq8RwGLHfdODeJPPuIluPmdr9jp/Z+8xJVGy5nTaQoYJJJyqBmPPQCzgGDNkiii3tRvyvJUqQ8KLR/npFohro8p0nENQKI4gQ9seVQ1FiKR9G5uAmI6wM+on2sCwLTqymSk+39UL7CkgonA8u2afpNQubtOBghv+28ghFluo8XYJR3ZXDBcF6IxGJAQfVdfvY4u98MniKM38VsIMLgbIOOkcA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYRPR01MB13588.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(52116014)(4143699003)(56012099006)(11063799006)(10067099003)(22082099003)(18002099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?mDYp/bvUj70sIzIM7T1ZrlV3DDZgVmI1uMy68GenzsRexk3e6wz2irGrk+EF?=
 =?us-ascii?Q?oKdJA0YU51J+ncU+s0SBBGCkLHEMhgzM21gM4YRGW+eQ2bZOWsE4EeLxmZtK?=
 =?us-ascii?Q?bLQEa3bObTsKTk/CrsqGOfycTVeISB4TEKKr1qIvFUgUcv5Vy5UZKgDF9hzB?=
 =?us-ascii?Q?wQjeoa2Z0+aaswuLFrGE0cqfu4e82riJk1gZaEiBcT4hjAElAmh+93jZS7gy?=
 =?us-ascii?Q?VXdgDwv/Or3syDNttRq09pymlNxuyHi6QWzE4D6JGu6pk5JVHlYF8AFOXDoY?=
 =?us-ascii?Q?qJA9gopkx2AWOJSPPCQ5IaLel+YwmM+QPTHH+YWUHDbeW+VE+SjXyEBr2vLd?=
 =?us-ascii?Q?ARXE8bY+qRKdP38AIxykn5b3LxlK5TG2guJvShGqgXz9UorWmWzkp4CfdM79?=
 =?us-ascii?Q?2JPqiFtzwxnlFz+PET0hcE518po2GJ062LXQqlEnkD/j7iiQZFJOJolW+QP5?=
 =?us-ascii?Q?6lSUaVPO+Z+cGauvcPXtQ9HN072F0AMRtbjO/2MXTua3qTZVL/CezZdLojij?=
 =?us-ascii?Q?T/oCsvwGWYXFw7YDzPXnQQIug9446huOiB6OsclWxPZ15upfDPvazQ8F1IFs?=
 =?us-ascii?Q?0INLkRN3BMkSO8PmAUs5L48oqENKG59z/HBKdaLx+l0JR/eww0LtVgtYqgdu?=
 =?us-ascii?Q?cuKLOaFKquZmI2ZACvyvY+tnMw/3KcPJA3RDbs7eTRVRG07V8kJdJ52t9sTu?=
 =?us-ascii?Q?0qEBIlxFkIqLiphy4qgvVf+K/GogKb9F9D3Z81mIDM0cFb6t0MessTtjo367?=
 =?us-ascii?Q?FskWzrHGTEx96sKoWrssIENfiKc4XoMSSvvv8pYYG4urmHvcbQ8Cgp6ksal1?=
 =?us-ascii?Q?nT1TDzRIO786cY91F7gX9vGjhCgkn/9iS5L18wuw2Q79ZCJJW58tZo0j1OMM?=
 =?us-ascii?Q?3PnCPOFQVhx1dLC2cGoTiYJVRgw3juYIirno+Z5S0A+wKHsDqDK56+YmuIMx?=
 =?us-ascii?Q?E7cI4pyCSYju6Qr51w9T5RRjiHcfl+2itw4vffclnYlnKETigm46IDmQ+4tl?=
 =?us-ascii?Q?eqqLvyrBIl68glyKBntZ5QyreMtq0WeQ9HGXD6Ul7jDU8QXbtTmG4h9WGzgz?=
 =?us-ascii?Q?IeXBgoAxXC0qx8xN2TfgolKBs8y4O7/DyudqY+zUjOdgnVGJtFyKTpEA2m/9?=
 =?us-ascii?Q?5tjh3VB028vKbnv4W+jwDx1EM+OCVQdt5GX0CkW4wX1gJkdDv1lajoYXJ7Dx?=
 =?us-ascii?Q?EvSIcB6t4/3+knSIp180G5hAiKNqcrbSWylzeOC70dg2TUlUWpNjGfWJw8Zl?=
 =?us-ascii?Q?SO04osG2RDKAJ81gJRKoLyPvUqeNhqwtDTz/ixLbL01JyVjCWFKZIhtGsKMY?=
 =?us-ascii?Q?wkn2WaXA+nZUnFCqn58ondQAf+Da26/Tk2pUdENUSlTi/IWGcVtz2/Q9IFMP?=
 =?us-ascii?Q?6IiRbZIz1wjKT4bt+Qqq9wasTbXNq8jfv3iJJq6Bxs4uIPKLy9v2LWl4E2WE?=
 =?us-ascii?Q?FsLa3upcIJpmGEWXemaPSBE89Y+x+FSksSUCLpFR4wAmpoovx7EyXrogtkA6?=
 =?us-ascii?Q?phRE+PXAe7VyPr9peZSyIgA09/uqeRejHh/RBQDWGsFSzLQesDxHPpc3sXI4?=
 =?us-ascii?Q?9WVSR2WezBLu2RYGOHrh/ICfE7rFUQ6BNuT1QJymZ6QDCYYmrztsvRR1yKAd?=
 =?us-ascii?Q?zAy3Dy5e5GdTmMUndlojx2Hfs4qkv2XoD1Qxkt4jpcwWhjJxJG76keezQkVd?=
 =?us-ascii?Q?BTr+WwN6O5zdtIlvtoKyfJB9urTQqs6gnP/UjtGUEPQCdya2LSGoMxs+Qoph?=
 =?us-ascii?Q?JA/0jjvB0OtxYnwAPeiV5jbpvpGCH/g5B8zZk2GSO9QCl5mbg/pj?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c620c428-52be-4be6-3527-08def30cb2f2
X-MS-Exchange-CrossTenant-AuthSource: TYRPR01MB13588.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2026 16:15:00.4401
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PWX6cbxhDV+hQUkvIXsnrA3UkCXVelqCfxJr32eIlV568K5BE4Ktg8WtNjunxCUgdSiuQCWpu83uu82fGfT3LYOWiWkAzE7bSvlsH5d4Ft0qnNqVjhS3VoGshj52qF9h
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB12423

On Wed, Jul 29, 2026 at 01:55:04PM +0100, Biju wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
> 
> Add vspd node to RZ/G3L SoC DTSI.
>

Reviewed-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>

Kind regards,
Tommaso

> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v1->v2:
>  * No change.
> ---
>  arch/arm64/boot/dts/renesas/r9a08g046.dtsi | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/renesas/r9a08g046.dtsi b/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
> index 03693f01228a..14c7f0b0b2a6 100644
> --- a/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
> @@ -696,6 +696,20 @@ ssi3: ssi@100e4c00 {
>  			status = "disabled";
>  		};
>  
> +		vspd: vsp@10870000 {
> +			compatible = "renesas,r9a08g046-vsp2",
> +				     "renesas,r9a07g044-vsp2";
> +			reg = <0 0x10870000 0 0x10000>;
> +			interrupts = <GIC_SPI 177 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&cpg CPG_MOD R9A08G046_LCDC_CLK_A>,
> +				 <&cpg CPG_MOD R9A08G046_LCDC_CLK_P>,
> +				 <&cpg CPG_MOD R9A08G046_LCDC_CLK_D>;
> +			clock-names = "aclk", "pclk", "vclk";
> +			resets = <&cpg R9A08G046_LCDC_RESET_N>;
> +			power-domains = <&cpg>;
> +			renesas,fcp = <&fcpvd>;
> +		};
> +
>  		fcpvd: fcp@10880000 {
>  			compatible = "renesas,r9a08g046-fcpvd", "renesas,fcpv";
>  			reg = <0 0x10880000 0 0x10000>;
> -- 
> 2.43.0
> 
