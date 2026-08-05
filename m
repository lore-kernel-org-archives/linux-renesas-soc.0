Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010064.outbound.protection.outlook.com [52.101.229.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2744447815;
	Wed,  5 Aug 2026 11:56:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785930980; cv=fail; b=VUUay10FsiZHBurFbr9cGVkanjsGaDAQUzfjCNjFS42l/PvT6zoFYIvkVLd3PRrmWq2146oiFRKDiPmVqlUZWY1DqBllLBpDiXpRuQtpMCovRdXQ9ANVFKtdY4TPZP1ov4upB5/cGVKHX0BLN8ClanBSH7eo8IhJqAnvl7v++lI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785930980; c=relaxed/simple;
	bh=FRY8dsLB8u7PGcmMbQnEHmM+hlAU6oLDhPrgU+iP6cc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=BE93BF9dMVxrzC8qbX80bHJblFMmM1Bf9w/FQpHdw2LIHY1zq6JUV9yN7knNkZ0ZyQ+BIQnMw7lwoPzHPWRCQYutqpUWghvzP73PAsQ4U3aRhzW82B2ZMWKoQLcwoQDg7x1Rcw2+kJng9Apd8gq4xikEDr56rbYA0jG8zRVmp18=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=g/6RnSAl; arc=fail smtp.client-ip=52.101.229.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="g/6RnSAl"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nFM33tZih79uq7obK+YerTzTen3FQbcSH8gTQwDnLW8Fbxc6rQO+Hzn7c/IQCgID/i0BMH7cw9KDRdiU1F/XX71mn9Kvvik8XL0dM2n1A+KCItJC1gmpCdmKRm87pn9H5++dEL19/RrEHvG3t0dr9OvLb6A+qKMKLkyOCbK1iJqkME07f503bOJbyo/bP/G4jcC3rsR7F967Ept8m4ii7KW1JCOMNJvEG1yWRAGDTmhVVz7VbYwkKxgyOkpgkXD4he8mzVZwX8MqS4rFZB9h7iQTDrdxxD4shQyZyKY4n3HOTama/BLpmDyGn+U9VaTJVSLz9DopDfPgqZjm30kcQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CUyBlb4Y9hTcG80FRldzN2cQRiKlwv5sZ4QJGnQ1MFY=;
 b=BrJ6QebYH9A/m0XzGeD+amjjWmEnKbAFJmadjz6ZcM0P7A8yzPJ+sOC2oomPHdGHGmJQ9zd1J4R1qtdrzHJ0Kntw0ppSJOOtTeoXDipU1VMcxu4kTWS6+Imk43Va7WWZEgqcNag+MeDmFTDkdudGl/3ezFa16u5BZcvTPuo3AWDDQTX3cskOBKSTmOn2sxwgiJyuFkrq5k8eN+hvkk693X1ugtYVfwNGrVXPrCXDcN1fO51ot7fFL0B3gl6hmXRox5Agm68n520QWyzjJ3vaLUlFhIGpZmDJIujHhk+13cL0GwCkT/5MzfE+ksvBKfFHGbTkFfkyiSz+0LJ1BXYvQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CUyBlb4Y9hTcG80FRldzN2cQRiKlwv5sZ4QJGnQ1MFY=;
 b=g/6RnSAlEeE75K8xynpXxyZZShLfNffBzK6oY6fvtt6qhtn0Ts0W0NcI5w3ORUHg5Cgw12XO1QXpUZfDM7v17ikS+IOoSCNTrLVv/z48O3vI/tp6gcKWsVWm2teiibUO22wDmIfsnTF4+9x5uWPqmNpzWAN0VdaJ5wOsznat9v4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYRPR01MB13588.jpnprd01.prod.outlook.com (2603:1096:405:18d::7)
 by TYWPR01MB10536.jpnprd01.prod.outlook.com (2603:1096:400:29f::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.19; Wed, 5 Aug
 2026 11:56:14 +0000
Received: from TYRPR01MB13588.jpnprd01.prod.outlook.com
 ([fe80::2f5b:8560:48ed:3828]) by TYRPR01MB13588.jpnprd01.prod.outlook.com
 ([fe80::2f5b:8560:48ed:3828%4]) with mapi id 15.21.0292.015; Wed, 5 Aug 2026
 11:56:14 +0000
Date: Wed, 5 Aug 2026 13:55:45 +0200
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: tomm.merciai@gmail.com, linux-renesas-soc@vger.kernel.org,
	biju.das.jz@bp.renesas.com, Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	John Madieu <john.madieu.xa@bp.renesas.com>,
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] ASoC: dt-bindings: renesas,r9a09g047-sound: Document
 audio_clkout clock-frequency
Message-ID: <anMkwfGAW5fBSAEf@tom-desktop>
References: <20260803132828.3249424-1-tommaso.merciai.xr@bp.renesas.com>
 <20260803132828.3249424-2-tommaso.merciai.xr@bp.renesas.com>
 <44c150f6-b04e-4515-ba71-63780c56c38d@kernel.org>
 <anDNtrL-eL6VUD94@tom-desktop>
 <8c5f0e53-2515-4744-ac6a-a4c94f2ae2b8@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8c5f0e53-2515-4744-ac6a-a4c94f2ae2b8@kernel.org>
X-ClientProxiedBy: FR5P281CA0059.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f0::13) To TYRPR01MB13588.jpnprd01.prod.outlook.com
 (2603:1096:405:18d::7)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYRPR01MB13588:EE_|TYWPR01MB10536:EE_
X-MS-Office365-Filtering-Correlation-Id: b332f6d1-fe5c-474e-a014-08def2e88c62
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|23010399003|366016|1800799024|38350700014|10067099003|11063799006|5023799004|56012099006|4143699003|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	YYEPDqsjjaQyf2pqXKbMBvN77OKRgY3msyPs/gVziO4HB8RaBCKdOK3vvNKPLL3Qu3Su5mOi48dDvlxJcmkJaiJmvmENO/TGzdiPVBqHSBY1iQXrx4RFdFWioTCIsXcsNB7CmbUk1CfNKld4/b34iDoGdYf4NjG510KPiyW19jSa8V7/B1DVKPmaTlaHNFTB4ZBCj2bo8xVhImXEj8SGxquATVcghIY6TS2ST+f/w/SPlfxDg0zSk7Xb1fhPvZyfWx7y7/lc2wg+X1VSjpPC8+5jPYjnh3WWhP4Y9XkI6helwsxPeCJXCoa2GbdY7PNGw3RpJb9L2XbLASoQjihiUFX5l5QLhIzfhenAzrSD6zx/aAYwm4cm7eBKvUCHxL31q+TFDx1qyZpFiZojeT5PVrnS44rpqeTtI+R6dJEElHEUuOQnQwTlPz4HoX+PftSU9Q1Xntn14FIzYV7r/XMcpPBYw38FdRaSpEaZYByFFFuUVPWkmGawLb3NyHXwJ9NuRYzORSwClQc8JEibGoAuUQ9oyp74RCoO+oiQB5GZpUhCgHJTHsQQLUYdb/0Vq4b/vzGKkZmn/YivQ2GhiBMz74NpiIy98C/2w2+m2NdsWKeOlUyjBGbNfrZUMSCzHNKMAdezna5eHvJTNSDHshTtmHmt7cMGiNF25SJNBncjsYb2dDkR4iizIyHP6m+Il8QW2LDkzLXPv3Lkc/sAVbVUcTOaSm0B1gT08Z0Ypv6KUKk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYRPR01MB13588.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(23010399003)(366016)(1800799024)(38350700014)(10067099003)(11063799006)(5023799004)(56012099006)(4143699003)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?OLcGnUE4GqbXFWg71XW3gBm6JutQxhwjn52j+HupwoSatw1Nrbvl2IaaYu+A?=
 =?us-ascii?Q?Oml4ErJk7ME9hvBbECQ0SRRwTXvipHEybb1BXZaqruDLqpJTO4OFubdefZDP?=
 =?us-ascii?Q?qPxU7eY60U/yiKtP8OErRos+DHX1aGy7mmi1B2wM7gbtLoSJr4Jc+nX447Al?=
 =?us-ascii?Q?VgWrk3uUE2K6msbZX5GJMJPSfhbfJ1895yZ7bSIZeZaTpFaU4cLiMMyST4bD?=
 =?us-ascii?Q?7fy1rDkC6s2ooINSWnlqCOI8qLwIpdy6xaIhdHLQ2E1k5G0xhzjzHDzVMZx8?=
 =?us-ascii?Q?XJBBPXVzdr0SMNYgRa1VK1gZWH5JN8+/AQooIOXQvHWbvAFb5VAakGQozmY2?=
 =?us-ascii?Q?pEv62vul6whgXo7JjoaKbB5RU3mf98BZCj0fiYgDaK87vUrJ8OaavNmRP4p1?=
 =?us-ascii?Q?zoLL5F+F7DPeZkiwt1io2wmNFrtmwGVWoEOAGj6rYYnG4iNTBKrsNKrglCK5?=
 =?us-ascii?Q?aIFXVro7W0zDn73uZZWPhODHm+TaXmbImsWBfJNBW956qCYJQdgO53XKiL7x?=
 =?us-ascii?Q?sJn8gVncRhFVNyAc6KrZiYjiebkbGLyI44oPQwNo346tFsBU3dZap3U0tITS?=
 =?us-ascii?Q?vfN1eOwig1DKWxig2FIApzB+WhZ4eA6Cl0mfZYBSU9QJn57iz7BjyBvuRBip?=
 =?us-ascii?Q?FqAbS7AkUSstt9c6rFmRjVZaF/kLII9zgG3QVGDmzRTQu73GvmctxArHq1EI?=
 =?us-ascii?Q?VuhJbNiznuETZ9Tv9XbrPkEoy2UFJejSHJvvHZKUM0uJYIE1ERdL/sPz48dP?=
 =?us-ascii?Q?VkCibmYCDfJbM32afhMxIMhuPXwtojezMsDEgO5hXJHscCIXC/5k4EE+f2Tm?=
 =?us-ascii?Q?iSgkBmGyJrN7ND8VQOQsMP5J7F+hfh2cqMVNQ6FoLP2ZAr0IUoPw0Io+ByjB?=
 =?us-ascii?Q?71zbcRQoWSHWok9rmVmTwLKm8gxzcAN0CAlPqFs5PxI8FVQVn5hB5MlcKOnk?=
 =?us-ascii?Q?SQeBk+oaozDzNrrSrOaTUWBarNiWeoaNp1gLoxCw/ScrwZl4ccAE9Z+yYIXp?=
 =?us-ascii?Q?CUP/4heisjWQ30SD5thrJ7DhkqlaRW7nbFgf2ojsFQ6ZHdeqvg1FgNNnjsqq?=
 =?us-ascii?Q?zFzPw5xaAMKbvmaUYV3MTDSR4wA36AZdDSNedJfX6iu9IZ5RLTzVuZst7YF/?=
 =?us-ascii?Q?zFpQ2KNEV8kPfh26pcGHP/sNU+q+9QO+Y+owdKYZWeGkh6pQvJ/fpRUt/BFt?=
 =?us-ascii?Q?ajkeVdzWe/OnQ2ipQq3jAXDAM9K9tCp6063GZ9x4JnAJjCcxM6qS0uSkG39y?=
 =?us-ascii?Q?4M3FDn/h3hiOUFQKaKklJ4lYjB0Qte6nsVunhgz5s293Q7qlT3b7R4Z3qd8d?=
 =?us-ascii?Q?kgtf1vOIncOUj8UivIMhSEmsHzwrM/bfU2a3fnljMBpULdIy7v2KrPTVEWyV?=
 =?us-ascii?Q?Y2x+GweVn6SSZqMdTMOtEMzjFKzcusNvTz7TFLWZI+OQO4kUG/y5I1EWaqrY?=
 =?us-ascii?Q?BG3TvLtyNLq75AgoEEmO/7RNG5QZU/dXxmcNizIU/zcXIfw9P0aQTwyP0CCe?=
 =?us-ascii?Q?0qV5YDmUidVMz1I16OmZkIglaU4B9a+d93+g88D4flJFiqjYygsaCuWN6tl5?=
 =?us-ascii?Q?a6EBLR9cnvM+yxil3wTNoWUV/oIZPdWaauQBaKh5yNtm9zWCmSXgqWm++rMT?=
 =?us-ascii?Q?nDqzNId5jQDPBBrkFOwy5Z70lQxKsC/YU16Gjz0HkKc6IzQLHt2yxOdcMfrq?=
 =?us-ascii?Q?n5tpYU3/vhYH55LxT53KRHA+vnfEhNMgIcCoUkQLaeLeoRsfxWHiDLkmscJ8?=
 =?us-ascii?Q?XxE8AJP5DwRNX6TRAzStl0Ab+N5C0Y5tgfzjqr4CIu0cMdN/wnUn?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b332f6d1-fe5c-474e-a014-08def2e88c62
X-MS-Exchange-CrossTenant-AuthSource: TYRPR01MB13588.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2026 11:56:13.8345
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fPlRyEPTvcHrATknza9m3CIdtpf36QtURIQDrpa0Q4Z9Cn8F1Z1s4vcoKo3EVnnTYnM9pWbWeU9DIx1qVvsn2cpDxb7/KhzToMp78pOeNk/JkPXz+LvFJRY0eMlybHEK
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB10536

On Tue, Aug 04, 2026 at 08:20:29AM +0200, Krzysztof Kozlowski wrote:
> On 03/08/2026 19:19, Tommaso Merciai wrote:
> > Hi Krzysztof,
> > Thanks for your review.
> > 
> > On Mon, Aug 03, 2026 at 03:32:48PM +0200, Krzysztof Kozlowski wrote:
> >> On 03/08/2026 15:28, Tommaso Merciai wrote:
> >>> r9a09g047e57-smarc.dts set clock-frequency for the audio_clkout output,
> >>> but the binding never declared it, so dtbs_check fails:
> >>>
> >>>   sound@13c00000 (renesas,r9a09g047-sound): Unevaluated properties
> >>>   are not allowed ('clock-frequency' was unexpected)
> >>
> >> Maybe the DTS is wrong, because property was rejected? Did you check
> >> this? You cannot document ABI post-factum if it was rejected.
> >>
> >>
> >>>
> >>> clock-cells is fixed to 0, so only a single audio_clkout applies.
> >>>
> >>> Fixes: a86fd3c20218 ("ASoC: dt-bindings: sound: Add DT binding for RZ/G3E sound")
> >>> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> >>> ---
> >>>  .../devicetree/bindings/sound/renesas,r9a09g047-sound.yaml     | 3 +++
> >>>  1 file changed, 3 insertions(+)
> >>>
> >>> diff --git a/Documentation/devicetree/bindings/sound/renesas,r9a09g047-sound.yaml b/Documentation/devicetree/bindings/sound/renesas,r9a09g047-sound.yaml
> >>> index d7fa16554698..6e2b2c93b4b7 100644
> >>> --- a/Documentation/devicetree/bindings/sound/renesas,r9a09g047-sound.yaml
> >>> +++ b/Documentation/devicetree/bindings/sound/renesas,r9a09g047-sound.yaml
> >>> @@ -42,6 +42,9 @@ properties:
> >>>    "#clock-cells":
> >>>      const: 0
> >>>  
> >>> +  clock-frequency:
> >>> +    description: for audio_clkout
> >>
> >> Incomplete, missing type/ref, constraints.
> > 
> > renesas,r9a09g047-sound is handled by sound/soc/renesas/rcar/core.c [1],
> > and "clock-frequency" is read by rsnd_adg_get_clkout() [2]. The same
> > property is already documented for R-Car in
> > Documentation/devicetree/bindings/sound/renesas,rsnd.yaml [3].
> 
> But was the property rejected? I am repeating myself...

Looking into this further, I found that you already asked to drop this
property during the v5 review [1].

Thanks for pointing it out.

For context: the sound module contains an audio clock generator (ADG) which
generates an output clock from the external audio clocks and outputs it in
to the AUDIO_CLKOUT pin, that mostly supply master clock to codec.

"clock-frequency" is array of the possible rates provided by
AUDIO_CLKOUT to the codec master clock.
Based on the playback rate it will request either 44.1kHz or 48kHz.

I will drop "clock-frequency" property from r9a09g047e57-smarc.dts, where
AUDIO_CLKOUT output pin is not wired.

But for boards that populates AUDIO_CLKOUT we need this property,
Could you suggest how to model this properly?

Thanks for your time.

[1] https://lore.kernel.org/all/20260417-energetic-practical-frigatebird-5b93ad@quoll/

Kind regards,
Tommaso

> 
> Best regards,
> Krzysztof
