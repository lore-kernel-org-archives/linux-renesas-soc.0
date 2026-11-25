Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.69.9
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795621929;
	b=Kji98FpVQidq69ynaM4VRiHPKVg1vsKgA4EK3i8j0K6H9xNZBzF3RTbAZ40P5cIbuyGz
	 BAovF5bDdKO5QF0hCV7dwiwyZWoA71PReLOTZWeSsaTYqVJfd2Z9kA+1tA109zCyYXBDb
	 9PaQUKoEA2r4e6DmCW6EKrKjPyBUs5GjfFfnuOA6+kmDuRnLDoVPfBjfAmtC3/0LQLUni
	 i6syKyzXPLtmLGew37AEVK3NIgAl5wLscarTuWKMwpRA82QUAsYMxn1ylNanrSUzhca9v
	 mBLbjTkU/iZ54Ro69fjBt+pVxz/E8D5ORalWTQtm0zsXlnUABRVKare4+x6KeiX+V7Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795621929;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:Content-Type:Content-Disposition:
	 In-Reply-To:X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=GHmmKBGhsUoZscxuoeIWjPW+38jIhpXSz7ghicc1rhg=;
	b=YTdJ71GTrLIgULE6PeGxSfafTSTlLdj3i83MVpF7CwWb1MdBOQ2mHTQvotTSzXWEuUdB
	 WvCMKCmInSOXisgif3Kz/QDSinMgvGWROTeC+xveI1fLgbkBlxEF7pKYRX5oQuJIH+39R
	 1WmCkE/sjB3Ou8Q4Eyg/qUPNYIL34GNVG1uRRCJSOTJHMIG9dUYtSse0h+XujYW8dve/S
	 lhdC5MwGwUJuBfhhTqR7zVI1T8WhmpwhyHOPBgkp0eccWuM9rpZ0zpPXBEHCpIL/sm7jl
	 FsaimCA/ppGC+NQAAPx8oPWYEuWiuSJRmpufkauRdAr4q0FS5lzGqN7K4DfWNTVpRwA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=UvhOTsaa;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.69.9
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010009.outbound.protection.outlook.com [52.101.69.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84F31606A321
	for <linux-renesas-soc@vger.kernel.org>; Wed, 25 Nov 2026 15:52:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 84F31606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=UvhOTsaa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ul/aIv6lp3gGzNADoBC7JdViOjBRtqBRAKboMLgBJ1etroR0BQgCz0LQVP05CnscurEzU+wAQn7J9fBd0sHg6mDAgxLtk9gMibtgGHk90IemjtVZdSC3Cj3kFhwDhMWNLB0/aICEJ1hObuVi045RUQe2/Pb7YmizcOHu87/fgCrGW7gtzKexlMYRnp2HPNvLdEyhQAzrEiuIxWq0ANjJHOTl8GCpv7c0Na1naN8/wXNEu2p6rKy4OWJ8T4uslebgx7Pz9iZjOc4GIdTF7I61AM31GPq014viBmc+raQSDOzp0UJqKZiyz01aAcHqMa+9zFBHI13mvvZqmPBIKWTofw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GHmmKBGhsUoZscxuoeIWjPW+38jIhpXSz7ghicc1rhg=;
 b=uCm069qLZYoVehJcj0N5KusISleWEEzapDxc0H4GYjXinUFiKbCA4KDtkc/PN0RfrVAi4MnfrakDMihucJZJIhgS7IFGdb4HiZjG8M93lZ3IssOm671OBOj/2cEjwhdMFu8vuSEwug+Z3qFOwJj1bZQaZco0w67qmrg3J2F0u1FwnT6cqifmQzxNJKAY8FjOt/YRQxq0QY0LPYObGbJvy3eLk66mN4jg2jel41WDNvSByhLvsoCLWiZ4i8X1F4+8YuZkTGIgvTAzIL7zyWdiiubFzol2IHQUDl4DOZBFB7iPpggmRuCUs6cmAX/+QbaaVWDkx9FiCLYXRgc+M2c1Nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GHmmKBGhsUoZscxuoeIWjPW+38jIhpXSz7ghicc1rhg=;
 b=UvhOTsaa6fGhWlabXc7DXm9w+r/h7UikxX3cF8lt/4feMKoIvK2ccgayleeTpci8LhXSm/29rt5KowOi5i0TZW3ER99+HCiw7imeCXKdo3kZGyiaEF0TqDCzRmMuKi/4rxWrveuCjUtEp1vY7Ta0mg1gYfiSnkSaI6v1anomnXTV2x9cSbyoSRMTKMjawi9o0YjBR59woujdWyA0s/2HzVBjSLRsfNSWjs30+hbxNBKyaaX5RFN8tW7DJJKEr72ShjSlSuP2oVzOZDp7rATvX/sMGaJEe/18CAgX270Ry7KAx1QAXMmaokGleWGg4ro22gSP2xB2zOzHjo5RpZPXVQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by PA4PR04MB7567.eurprd04.prod.outlook.com (2603:10a6:102:e5::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.14; Wed, 25 Nov
 2026 15:52:03 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%4]) with mapi id 15.21.0662.004; Wed, 25 Nov 2026
 15:52:03 +0000
Date: Wed, 25 Nov 2026 10:51:56 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, linux-i3c@lists.infradead.org
Subject: Re: [PATCH] MAINTAINERS: add renesas-soc list for the Renesas I3C
 driver
Message-ID: <awcEHKM-Piug3edH@lizhi-Precision-Tower-5810>
References: <20261125105037.29830-3-wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261125105037.29830-3-wsa+renesas@sang-engineering.com>
X-ClientProxiedBy: PH7PR17CA0024.namprd17.prod.outlook.com
 (2603:10b6:510:324::21) To MI3PR04MB12438.eurprd04.prod.outlook.com
 (2603:10a6:290:76::14)
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
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|PA4PR04MB7567:EE_
X-MS-Office365-Filtering-Correlation-Id: 686a100c-1c9d-42bc-41cb-08df4b0c0cbc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|1800799024|376014|23010399003|366016|22082099003|18002099003|261009223027099003|261009221227099003|56012099006|11063799006|261028144727099003|261026121527099003|261026140227099003|261021121427099003|261022105027099003|10067099003|261102123227099003;
X-Microsoft-Antispam-Message-Info:
	iQ4Yo50WaXSW9OGgSdMLYCKKg7esh+8/ChlbypgaoPRaTu37C2qaODvKpfelTwKHOp/GFZJsCLWQdnTmYiT7aUZw9Ebu0Yd+LS27VdSiS125isK7RaPQFsugMtJQrDzP8Iq99BfdgOGFs3nKGE9AqjvdojuaYK9I814aFUDBFOOmg0gVCBYB7TxTCmXOtJsF8d32R2cOnQEHOQVSWWh7+TqrSjD3N3XioL+sudKKRZM7fEoWH6Wy/75QS4byzYzqMxF7DD9Ni/0p+z4T2+jNAq3Nl9tJGsxix8KfiUQrv+16Foo3wwtdRg6cJni+pKPEc4AqRXCJQ/6YNZfiZDqg2eo0trL/h4ogZLiQcJOrNbnHHWbDsSyhOJ8Ky5e0v5l0JfQDA8qImsaa5W1u+BYOXHIYD3zDw+fo2qCValz2mimNBzwBBOMrNxsuQpGKRLgz8OKrM0AC4DhkryWoPtsnV/Ycb2L1VFXZKm0K6OBtZaV2ZVUASn3u9x5Bayn2YgGhQZYXh/u0Ri+Q6SiYVo5EWPtFyGjqkQcFeFVnrE9yXz/UAalaw6oKOXt6VGGy/BGFsqJsP8GaauftAz2651q6T84pl5mR5Y1fCBbSJGFAtL4DfS9ZDBJU477y/m9S3FDFS5c3HHZzkmB4qf18lcF8vX7jHPu27z0mCO+X5Rk4E3I=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(376014)(23010399003)(366016)(22082099003)(18002099003)(261009223027099003)(261009221227099003)(56012099006)(11063799006)(261028144727099003)(261026121527099003)(261026140227099003)(261021121427099003)(261022105027099003)(10067099003)(261102123227099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?1+wLtTDptR+3JM9145kM1R6jfc0d7Utwb++6/rPxEFdJMUNuLPq1xOD1gDik?=
 =?us-ascii?Q?VNhSPNbwzssJe6m1PPC/ERiRip2JKQEdNg//3AjjXB87/7v7gu/Iv4xJ/MEc?=
 =?us-ascii?Q?P05vMMmXfspZWfCBzkI9/q23+a0qaHMTK9r3xXdTWWJiWeVCRMixBG1kyvvK?=
 =?us-ascii?Q?92sU8KQy9LuozjdlndlBw1drZ0Ifn2/mlkdkJ1LiUbUnKQf2NpuWrSgvJ+DH?=
 =?us-ascii?Q?iQKVa7+T3ZtGHrR+x1lIlf7DBhASynXb+E6wjMrwHBmZJ+9h5KShWhEMgYdl?=
 =?us-ascii?Q?7+3R4+UFeXpOwqceBjfjmdrWLfoPLzkRXJg+DEMwr2RltBA8LTH73NIPP+mU?=
 =?us-ascii?Q?4+vw46jW1HwxfYvu8o3ufsdNrpZ89WNJ5ANiFcHQLX6dkQTkcZUIr2G7wSOX?=
 =?us-ascii?Q?7vYn882zrRKneGJAC6AMJdsjPv+DqI6zJymeoAoUtWCDjIoynXltcd8IqAkk?=
 =?us-ascii?Q?TcKwUNkCTOtX7sTrOVqT3Y+LZBqFxJTTTspsmQ2JtBQkPDetBOAz3Wxfawal?=
 =?us-ascii?Q?O2I3xQJSdbOolwfNAM97T47VTWFWzZpz3BnKzWyNz+JFSuVsvfzg854rlZIi?=
 =?us-ascii?Q?GbC+hai8QghbJCM7II4kWnKQFd6VzHeW25SCMYyyfyhkPhitVF+o+cmL4Jyk?=
 =?us-ascii?Q?Xyqs79XUfkToE0ytlz9mk8Jwf4jkdk5ZI/TGYS5fxU+pD3ESaJzZ6FFV2XnD?=
 =?us-ascii?Q?ZYImFtMpgqow1Br7yDAZRTI6Iwn96gr48eHz+ngByvCVdT8kGJYBoo+Ar4ay?=
 =?us-ascii?Q?QHOs3Rwxc9h9UNE/Rsunvi2NAyt0AI7t89Af6XeGmrkf880fLwsBlztYCj1r?=
 =?us-ascii?Q?hmj4533Jr2G7w2dKBCnm7ykYqjeaHBlQMswQtXk+4NQtAI7OIDY3H2VZXrvy?=
 =?us-ascii?Q?U0Ad+iAEClCYRm2kFIuSsj+knrML6i6zQ09CEGyOOBaBZnSOwUJjBAVIxduv?=
 =?us-ascii?Q?pKVpl0xoHDy+AM/ufIVCSIWZEXBpmkWlrpmqTz6vo3rZdF0ccjyNkPlXDWUc?=
 =?us-ascii?Q?K11QsDutzre9UgR8wC0Vdv13UOct2swR6JsC23tzIJ7S3b5mH4fCX9h4CNkw?=
 =?us-ascii?Q?HdQwOD5iEktt7DOPKs7I1mhuDEz8u0zkdRbkJHNodX2MWgMrDf8rh0bXMTlj?=
 =?us-ascii?Q?deZjE2UKRJFhGNLXWxBSEn67151yLgMsaMFeblLRVB3+XE/JzSxg736bQfkZ?=
 =?us-ascii?Q?v+7i0wxRcFEc60rgXmIdg0eIDbqdx0EiXxKVXKwaUakbakdkUvp8d7XWFCq8?=
 =?us-ascii?Q?AsznbobF8dO5+8cIS8sEXtENcuMqihMSFePH0/QqGrelWmyUH9+rMGHdO1b9?=
 =?us-ascii?Q?d7NQrc9PLD37J/xgWmLYTR3Bc7S3SPKOQG/XcZZcr2uKUZZ1164GtF+JW49a?=
 =?us-ascii?Q?8OPLYkTC2crD+R6Fsb52PPuThAIIbcqib7LAngHmnWuKcFj4A1dC95QOXP02?=
 =?us-ascii?Q?bjgjBBxW4mfc0qJd7klJ9aR4axH3unKcLOBlINgpCFeu5FsVnHUs2+lm6ybH?=
 =?us-ascii?Q?c3WeBk28Moxn2LTJYrVqxkEII2VE0SndKG9dy2o0szGaxETw13T0gY7qNdxd?=
 =?us-ascii?Q?t7fOCF8XtWHMIKYtlaEB17jxylRTKjqqcmjE23/azLBjC7p6COtCFZ2IbVp2?=
 =?us-ascii?Q?pBcaaPEG/895oFOOE5pW/bHtbU0KW0mhwiZ5pzb/Zl7gqQuwNilxgZYotgyF?=
 =?us-ascii?Q?c7IazcFfcdRxvPhEiJIHNHSz19JnV2dkgXUAHBmjMfEfvzfJm0CCs2sHkgsy?=
 =?us-ascii?Q?8DpiKUjrIurnngcTcws90I5g0HM2G5ED4qe0kIEU644A6VBX/t7T?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 686a100c-1c9d-42bc-41cb-08df4b0c0cbc
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2026 15:52:03.6474
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OTSyWiH1b9tuE+ObdVf+d9zG1AmT1is/7L9UA2hpAWoZwYpuJiyY/XvSv/DblfpiiEi/YIC0zlgYIuddNFZhDmFJmR7gSluSh4DOOsbjLRzXuA/CogalW2qol1RUMyUT
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7567

On Wed, Nov 25, 2026 at 11:49:53AM +0100, Wolfram Sang wrote:
> To make them show up in our patchwork instance.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>
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
