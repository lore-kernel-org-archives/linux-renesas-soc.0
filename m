Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011014.outbound.protection.outlook.com [40.107.74.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92D8D3E8326;
	Wed,  5 Aug 2026 13:07:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785935223; cv=fail; b=Lqces4Ukq79BNBgV/7uUXlDGy5B25YhILIvxrtHkcXM2x4XTYnCbp+Eu6TVmr3+qPFQeovJMCIPMhG39K9UrUUETnh+BNhwm88h9tiAksv4eeBkFOhsqW/kNMrHl7ZNTGOj/1TZKSKX5CjnfWoFcchNTMalAm6tfrsLV0wrvfSM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785935223; c=relaxed/simple;
	bh=9xpMPi13OUa9tXLsZF00PliRqmVU8yLthoGhg1Humpo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=GJwKIxW19UIqKmZS+jgi7gbxMLEZqyO6cMVJ382JnmAcnzjHPBYEmKyTZqdmmtu6lQmkPUx+38hFJNQQqQcau7B/HeFsvtssB7I59gvXBfH2/oYLmjlnCb1Bv7g5Q7p6QjYH6o9PF1Rv+LpdLR068hzUB8McCGY9uq9Ph3AbVsE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=MqYyMdn2; arc=fail smtp.client-ip=40.107.74.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="MqYyMdn2"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Dcr0fVVLpmwhOp+j4xi3TK2O4oDG40l/EgjxhxedeLiF+0Ynf10vIIYY4snNkYYbkSezwmxzpMB9a+K/aIY1TNeEZviTcZJPWA80zioezxwZOrRAPXwpHdYI1THPPsT7xy/Ro7aQfMOlLppmhCnfr8U+yH9qUcVOaCfnHGaUsXr/NlFB9aF6dw5N5ZjCAndfCPEOXs6UED114oi6rnYvCVOVP625EkVuwdTxTI34imbZHz/ciCPKK2Z52hwI0i2Kb9Fr4zU0ZsXYFoJ8QnIz36BYB7ldyn6Z4bHdIiQ2K9Cqzl42maUnnoPJTXKMvBkL5xBicA/g+1eod3O1qfACXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eNVPDQR+WLozExBYL4FQ9CWEyWkuXBcNBDjTGMrVm4A=;
 b=myysb8ons6nQ6aKEcUIRdWlqVSpi4ZMTlUf+ogPLXZogbVLJg6/lbojNNbrN0ye5e2YijLPm7vNrhTZXWXwhf90pdQ7X9VJmZrhFuJsI6IdnufSFMQn+stc51dvdLlIzByF7hv0nvq7SPIGlxwfVe2f14K9b3U31GDTcZuMR/f0CpGkLGxyRhChx/sgvoitleYHqcn2zP+67GA2IGrKYhqGfLa4n4Kvmw3j4V8HAb507FV5XtlOhcaDH1svbZDsmGcVzAt3/5fE6ms6sEyYEFafh4s75aycVy/bW+BOGhFCTvvNHD9eX9A6U7bNx92Dx5YbKNtgvQXmjVAjq2t4Zbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eNVPDQR+WLozExBYL4FQ9CWEyWkuXBcNBDjTGMrVm4A=;
 b=MqYyMdn2eez8UrmLcnUa2vLjbk7AZc5duJVH8R2FFTUxjq6MUJzK8wUpaMKl/wZ/JereckKkeJBJ8gE8ZzwSQu88BpF6cfu1iTOcZgZf2rdSAdeexFEpOYv9Px18A0yMVb7smv8ssc9yGXEZLObrCqxQiLV6tuaNz9b4T4HIU4U=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from OS7PR01MB13601.jpnprd01.prod.outlook.com
 (2603:1096:604:35d::12) by TYYPR01MB16362.jpnprd01.prod.outlook.com
 (2603:1096:405:14b::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.18; Wed, 5 Aug
 2026 13:06:57 +0000
Received: from OS7PR01MB13601.jpnprd01.prod.outlook.com
 ([fe80::35e3:29ad:b9cf:a3d8]) by OS7PR01MB13601.jpnprd01.prod.outlook.com
 ([fe80::35e3:29ad:b9cf:a3d8%7]) with mapi id 15.21.0292.018; Wed, 5 Aug 2026
 13:06:51 +0000
Date: Wed, 5 Aug 2026 15:05:45 +0200
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, tomm.merciai@gmail.com,
	linux-renesas-soc@vger.kernel.org, biju.das.jz@bp.renesas.com,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	John Madieu <john.madieu.xa@bp.renesas.com>,
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] ASoC: dt-bindings: renesas,r9a09g047-sound: Document
 audio_clkout clock-frequency
Message-ID: <anM1KUoFC1ltRsje@tom-desktop>
References: <20260803132828.3249424-1-tommaso.merciai.xr@bp.renesas.com>
 <20260803132828.3249424-2-tommaso.merciai.xr@bp.renesas.com>
 <44c150f6-b04e-4515-ba71-63780c56c38d@kernel.org>
 <anDNtrL-eL6VUD94@tom-desktop>
 <8c5f0e53-2515-4744-ac6a-a4c94f2ae2b8@kernel.org>
 <anMkwfGAW5fBSAEf@tom-desktop>
 <CAMuHMdVzvnz-XrgJ2+UrAA-Gj6XjAnz9Q0HqrNCuVQF3+v9X-g@mail.gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdVzvnz-XrgJ2+UrAA-Gj6XjAnz9Q0HqrNCuVQF3+v9X-g@mail.gmail.com>
X-ClientProxiedBy: FR0P281CA0138.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:96::7) To TYRPR01MB13588.jpnprd01.prod.outlook.com
 (2603:1096:405:18d::7)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS7PR01MB13601:EE_|TYYPR01MB16362:EE_
X-MS-Office365-Filtering-Correlation-Id: 25cee82f-14f6-4416-72bb-08def2f261ee
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|52116014|7416014|1800799024|23010399003|56012099006|4143699003|3023799007|5023799004|11063799006|22082099003|18002099003|10067099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	y91DhR2EJoctTnXVU7m2PkITlYBSD3QytMcobuT+WM8ggTALOJMrqwi9jJNvVNZYOPR1rDz/QCniP3/WWutxQJnUe6U8LkmrRgTkyA4zq0tXIflpe0JeBMTsxifrYSVYDg31lbZo4qAX8gbbbgIiOJo8JcLhAyB87kNlEStD7feGdbXr8cDOJS50g6PHZXRgoUAdCMYDh44Crrh0CG9uYYp6enLA2oL1prv/LW1ne2FaeWmKOutnZS99x+bzqdsjoHFzlrBuaCK8Cw39iZO3MZTozebYfrV8XAhR1glwZ3VTmNNYUf9kX/uXuHNUyrFs5d5xIPwmOYOByQcoNhdwIjsbS10NJtV77epMUr4Dts87WJJ4b5/XACl4yWB8uimPW+eoWmohJqBu7Kv6LqeOXb4Wo+KTABhW6XqiW5hr+eW+o5K7C5vMargzStLP/MJLn4FU7z5nNbZarLcTKTXWhCDGMuBGB8Me8i1vmEDQd8I1UjWXWef8MYkZ8pkJd5Xe/2Hre4uBa/ek8UKhEwG/yxzwpca1hLhY+BfuSFbpgB39MIh73jU+wjQ29fQldBObGjyRbYIddnR4OT+99fCFbUEiHItZL2wejCJdF4PREetklKwBbfcRQdbwfMC3wYgBuaRhRHpQT1tDnA6eE/7J/VPB7ywZMsJ5N5GgE2y9Ymg0o3bdfI8xlsVX05KFFhTTiBFHJVwL+1qYbuSdl2Iis/++/R4ChUAUg/qmKL/BMBo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS7PR01MB13601.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(7416014)(1800799024)(23010399003)(56012099006)(4143699003)(3023799007)(5023799004)(11063799006)(22082099003)(18002099003)(10067099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?5IPgXAjQp3Bskfr46S6HYwYoJ9Tu/4RW9uS/xgYaX74KkYDM9aYPLroMts7s?=
 =?us-ascii?Q?LvdEZ0X/O1MpYX9E/nn/XPkeDxn4JuhJAYdfU/6T/qULnpZqgFaVA7RPqavK?=
 =?us-ascii?Q?wS+5aTmCyyF5ozMFujZcNNiZGdiJUATI2tBmLrthWMrK+oxFMdurQWb6QAlv?=
 =?us-ascii?Q?Y6ESixXWSVFxjfq41d6BTSmXjRJDgwniHOQlLlgN1w4OREWkWajEVXK4NSHj?=
 =?us-ascii?Q?aHdWajRea9UJ4q2W896DcwHDGh+ieZhG59Na79csQBw3Nklbu7PUlNgfHJpM?=
 =?us-ascii?Q?xFQbFpMR8EEUfmiNZu1a22J72kDYlX2eYKPn4bAwvYYevH0vMOF9jr3ichVl?=
 =?us-ascii?Q?TIyG5keD2dP6qN7aB8UD0Kh9ncuFjeKprU3bv45hZECDIx0MSV2vfpLnVWhN?=
 =?us-ascii?Q?bf36oCsSNfNO3fThfSmjeemCAIKlR0rK3rrYhv9v+aD14bzoIbJXM3ZZdelS?=
 =?us-ascii?Q?dgTbnDbz8Uh9dQmwbm7nnj8N2wX9e7kWVg37H8jPGZ+x3O+5J6g7rKT7ucY9?=
 =?us-ascii?Q?JYDYqEfsguJza8rxQtj8YlryUg6N2AsVODXgs/FjM2md9UGK6BmqcUSSFA8z?=
 =?us-ascii?Q?NTbWVArysf/N4xuq47xSVfkn5p3y+k6NeQRqIUdWYs8dmkrcbFTpcdxYgMGc?=
 =?us-ascii?Q?81kaweXk3HItaxvhwpdwpUOKzXfYjF/qbDH/99G7KZ7E2lrOhZ2DM6Vi6AkK?=
 =?us-ascii?Q?suXUb2+L3EBJnrddFjtRPr4UWJztVEOqBjIkgGUbRD5jfPjUP6YHSI8f2wk0?=
 =?us-ascii?Q?V0wE6xi7nVB3bEwsjaT89A6gfzRFy9u3G0x+H/qepqniKeQppAtafmwYxr2u?=
 =?us-ascii?Q?nlc/nhJjpzG9ZLySfkdVJZh2XePSL/x//ALifqFWMjeoOvd90ThpQZhew6V3?=
 =?us-ascii?Q?azSgZXuzwubrxWQfs5PLjH9xX8I7+bD8PVmcHWyF9sA9HcWLlY/jNF8Lo5kH?=
 =?us-ascii?Q?Y5cOdX6Ndpm30ekouV+qWLnEAnYa0IYwcZHmP/26iPb6Goth7XH1sGjHFJB9?=
 =?us-ascii?Q?wkd8LVntxVgGqAvL7HAC/V+4zfqTabAgefybp/BAXsBkxwsiWrRKYLHYUTnh?=
 =?us-ascii?Q?WCyrfFa79HnaOF3J/WoQvQyY2uLcbc8KowXY0/gOP5N/YwP/44Dj5zhusODv?=
 =?us-ascii?Q?kU9+D6Jdl3+WLg31+3Ej20+P0d+0W+t3R5Kv9YN1iTHao9+WpxbvXAQBlD3c?=
 =?us-ascii?Q?zKBF4cGjwvejJ1EVfU5yXY4L2uz13u1J3tDEHJewJRQSa7z6YCe+TTqfHyzN?=
 =?us-ascii?Q?6taCeN0162WLbu+T5b2O25e0g8dzU5kvGH7joyDKSvYNcl2vEVflyFHONJT3?=
 =?us-ascii?Q?fQ3r+cuyWxN6ORXhOeMJiujy575wiZOm59f7YW/9lCFpYkvc897fx9bz2lsJ?=
 =?us-ascii?Q?Pclc+Huwu7qCA++xJbUZQz0Zn4AD6kDo3eCqru4iyyjhTy+UiGKYFXCD/uuK?=
 =?us-ascii?Q?wuvDC3Z53e5tCcv1E1Cx2Bu8nwVbMEJz14RUkOzphcT9ZYAfjJbGUGmYu3e+?=
 =?us-ascii?Q?T7s1KTJy1Mrh+jO5ilbv5YJZocopxzOd6JB78MDWWKXYMLM0JNuULlyH0CVg?=
 =?us-ascii?Q?5WLcni+NKrFzPxYyL8WXSaWVrY/iboO275ryn3GuD4KxLe5f+4KrypEYtwRL?=
 =?us-ascii?Q?3yM2pmJ5qBkZK34HzGtyXEOtJaN0VhHw1tRoBHEUvkjJyjXrDnhLHWaXIovN?=
 =?us-ascii?Q?qKr4z2jlLVDc9bNq5oH9ybmmhWo+NQ4Lzm2Rw1qB7uTi0JK/W1jBM/bf+d3N?=
 =?us-ascii?Q?rDKRtVis83g2KxMxFxW1BQcedyGUFUDHCecSzkUJOmkxqD2tObjS?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 25cee82f-14f6-4416-72bb-08def2f261ee
X-MS-Exchange-CrossTenant-AuthSource: TYRPR01MB13588.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2026 13:06:50.8388
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MjXCqQqw9rXTTyObDK/yuPTu1+FKpr2B9v6KbD84lE0f4/OnB6axZ3iz/b6lIUjh3CDQPpQO+s0tVph+7uyM7gRoYpww2r4xPhgf73G2/C2nMQk84GdUHHCArjN0BVhb
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB16362

Hi Geert,

On Wed, Aug 05, 2026 at 02:02:42PM +0200, Geert Uytterhoeven wrote:
> Hi Tommaso,
> 
> On Wed, 5 Aug 2026 at 13:56, Tommaso Merciai
> <tommaso.merciai.xr@bp.renesas.com> wrote:
> > On Tue, Aug 04, 2026 at 08:20:29AM +0200, Krzysztof Kozlowski wrote:
> > > On 03/08/2026 19:19, Tommaso Merciai wrote:
> > > > Hi Krzysztof,
> > > > Thanks for your review.
> > > >
> > > > On Mon, Aug 03, 2026 at 03:32:48PM +0200, Krzysztof Kozlowski wrote:
> > > >> On 03/08/2026 15:28, Tommaso Merciai wrote:
> > > >>> r9a09g047e57-smarc.dts set clock-frequency for the audio_clkout output,
> > > >>> but the binding never declared it, so dtbs_check fails:
> > > >>>
> > > >>>   sound@13c00000 (renesas,r9a09g047-sound): Unevaluated properties
> > > >>>   are not allowed ('clock-frequency' was unexpected)
> > > >>
> > > >> Maybe the DTS is wrong, because property was rejected? Did you check
> > > >> this? You cannot document ABI post-factum if it was rejected.
> > > >>
> > > >>
> > > >>>
> > > >>> clock-cells is fixed to 0, so only a single audio_clkout applies.
> > > >>>
> > > >>> Fixes: a86fd3c20218 ("ASoC: dt-bindings: sound: Add DT binding for RZ/G3E sound")
> > > >>> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> > > >>> ---
> > > >>>  .../devicetree/bindings/sound/renesas,r9a09g047-sound.yaml     | 3 +++
> > > >>>  1 file changed, 3 insertions(+)
> > > >>>
> > > >>> diff --git a/Documentation/devicetree/bindings/sound/renesas,r9a09g047-sound.yaml b/Documentation/devicetree/bindings/sound/renesas,r9a09g047-sound.yaml
> > > >>> index d7fa16554698..6e2b2c93b4b7 100644
> > > >>> --- a/Documentation/devicetree/bindings/sound/renesas,r9a09g047-sound.yaml
> > > >>> +++ b/Documentation/devicetree/bindings/sound/renesas,r9a09g047-sound.yaml
> > > >>> @@ -42,6 +42,9 @@ properties:
> > > >>>    "#clock-cells":
> > > >>>      const: 0
> > > >>>
> > > >>> +  clock-frequency:
> > > >>> +    description: for audio_clkout
> > > >>
> > > >> Incomplete, missing type/ref, constraints.
> > > >
> > > > renesas,r9a09g047-sound is handled by sound/soc/renesas/rcar/core.c [1],
> > > > and "clock-frequency" is read by rsnd_adg_get_clkout() [2]. The same
> > > > property is already documented for R-Car in
> > > > Documentation/devicetree/bindings/sound/renesas,rsnd.yaml [3].
> > >
> > > But was the property rejected? I am repeating myself...
> >
> > Looking into this further, I found that you already asked to drop this
> > property during the v5 review [1].
> >
> > Thanks for pointing it out.
> >
> > For context: the sound module contains an audio clock generator (ADG) which
> > generates an output clock from the external audio clocks and outputs it in
> > to the AUDIO_CLKOUT pin, that mostly supply master clock to codec.
> >
> > "clock-frequency" is array of the possible rates provided by
> > AUDIO_CLKOUT to the codec master clock.
> > Based on the playback rate it will request either 44.1kHz or 48kHz.
> >
> > I will drop "clock-frequency" property from r9a09g047e57-smarc.dts, where
> > AUDIO_CLKOUT output pin is not wired.
> >
> > But for boards that populates AUDIO_CLKOUT we need this property,
> > Could you suggest how to model this properly?
> 
> Isn't this output the single clock output of the sound module's clock
> provider (#clocks-cells = <0>)? Hence can't the consumer driver set
> the clock rate?

Yes you are correct.

> 
> If the consumer driver cannot set the clock rate, but depends on a
> fixed clock rate, it can configure this in DT using assigned-clocks
> and assigned-clock-rates, right?

The clock driven on the AUDIO_CLKOUT pin does not have a fixed rate.
Depending on the playback rate it is a multiple of either 44.1 kHz or
48 kHz.

Below is an example from arch/arm64/boot/dts/renesas/ulcb.dtsi. There
audio_clk_a is 22579200, a multiple of 44.1 kHz, and the audio_clk_b input
comes from the cs2000, which is set to 24576000, a multiple of 48 kHz.

The codec consuming AUDIO_CLKOUT needs 11289600 for the 44.1 kHz family
and 12288000 for the 48 kHz one, which is what clock-frequency describes.

Hence it is not a fixed rate clock.


From arch/arm64/boot/dts/renesas/ulcb.dtsi:
---
&audio_clk_a {
	clock-frequency = <22579200>;
};

cs2000: clock-controller@4f {
	clocks = <&audio_clkout>, <&x12_clk>;
	clock-names = "clk_in", "ref_clk";

	assigned-clocks = <&cs2000>;
	assigned-clock-rates = <24576000>;
};

ak4613: codec@10 {
	clocks = <&rcar_sound 3>;
};

&rcar_sound {
	pinctrl-0 = <&sound_pins>, <&sound_clk_pins>;
	pinctrl-names = "default";

	/* audio_clkout0/1/2/3 */
	#clock-cells = <1>;
	clock-frequency = <12288000 11289600>;

	status = "okay";

	/* update <audio_clk_b> to <cs2000> */
	clocks = <&cpg CPG_MOD 1005>,
		 <&cpg CPG_MOD 1006>, <&cpg CPG_MOD 1007>,
		 <&cpg CPG_MOD 1008>, <&cpg CPG_MOD 1009>,
		 <&cpg CPG_MOD 1010>, <&cpg CPG_MOD 1011>,
		 <&cpg CPG_MOD 1012>, <&cpg CPG_MOD 1013>,
		 <&cpg CPG_MOD 1014>, <&cpg CPG_MOD 1015>,
		 <&cpg CPG_MOD 1022>, <&cpg CPG_MOD 1023>,
		 <&cpg CPG_MOD 1024>, <&cpg CPG_MOD 1025>,
		 <&cpg CPG_MOD 1026>, <&cpg CPG_MOD 1027>,
		 <&cpg CPG_MOD 1028>, <&cpg CPG_MOD 1029>,
		 <&cpg CPG_MOD 1030>, <&cpg CPG_MOD 1031>,
		 <&cpg CPG_MOD 1020>, <&cpg CPG_MOD 1021>,
		 <&cpg CPG_MOD 1020>, <&cpg CPG_MOD 1021>,
		 <&cpg CPG_MOD 1019>, <&cpg CPG_MOD 1018>,
		 <&audio_clk_a>, <&cs2000>,
		 <&audio_clk_c>,
		 <&cpg CPG_MOD 922>;
};


Kind regards,
Tommaso

> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 
> -- 
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> 
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds
> 
