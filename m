Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010014.outbound.protection.outlook.com [52.101.228.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B76CD471CFD;
	Wed,  5 Aug 2026 13:35:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785936913; cv=fail; b=ortMqdI9wnonWluI1G5CJ2vbzaQlgJnxWypKG/cAIGh4KNCN13j19AIBYP784lXSTKswGdue7quC+ZXmyOuVU6TNs4nxMW+U1vcH9aqhxn2KyoEuTL64U/tJcSxLJ+gvR/oIzT4+IWpEZSjSo0cUbqsBRpEtSKFGzjUiejDTbO0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785936913; c=relaxed/simple;
	bh=3JoqYXx0ah+spgKglaSu8jPW4Y+lzxGbPtF5Usc0RkU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=ESlTa8VTk80pS4UoYUxh43uacx2i+980txPiW1XRKqNaJUVAuWq3oT6reFtFWmRtIjgv0fJhmSGYQlFI3ateaWUVBVNV5Y+TPS4E5e1PLr01SXIUqtL72JG/xuzndhLvMumeIxUOQhi+/DTv+hiw699VgJqH3Q4iP37mluhIroo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=K1ojxkSN; arc=fail smtp.client-ip=52.101.228.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="K1ojxkSN"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FmVRFBobRcyPCuaViWbEY7wwaTlzb1viJO1XhKq+Ns5GkH6VBEhOlyq1MpH6tNFnGzcOiZM+OhGBIhHGQV/k6k1DfDClPMud0pboD6RKvAWGiy0lOE0GvhIFAVJVcVsvuuqJ0kBpBFBPhurZjAqidzHojNiZByx90E32N+dwuTuRVejdzQiqeNq3+lndIOMSuG02+KQ1w6NOA/oC0ATSvzKMLKfZXpgo8DMsfqWNs35dXAdK4lHS4seSiZ9u8cHFWsj5lLcXDZeJ6JE2IdbrMZWkqQkRYSwLjGfnjsIDTQvaEv4BQd8lB+1eeS7M4B4OG5UWKjNe5NIHZftDnxhpEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k2lANBFf2tSMwGkiPIsk+pHNF4bN/+t4zJMv+NMbD7U=;
 b=gCW+VFvenijT+CqfABYzS/eHoUqev6QnfWRMne77KOhq6TcYpXX4Dt8SzXslTPhVWyVy/glaukD9mQKYcII2g8Me5lhFeGun179E9Iou2kwqm1FOKQoCYZy19uWhiaCq1vN8IrjVrtRHEjQRlE8HkJ6eLg/DHt/wR9SEpdouUwEWr6+urhOwQnUR5QX5qGDE9byqVFvnwdka7IGjbcJOegQFn+G8wEuNq8CIUkbkvn8xCrGVcq6TtViy0nk4Z6oOfJxduB1meGouQaKB08573cQ1pUe1wJSsUVFWLhoD4wCcU24PUM8blrpsdJsn5QsX9dbaPU5W+rULEwYzlvDs1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k2lANBFf2tSMwGkiPIsk+pHNF4bN/+t4zJMv+NMbD7U=;
 b=K1ojxkSNBJ/c90qGBW2SwHS4W89NNeWdd75g2nx+x6E3y/Ny61d3u55moO7oDvJEWQxMDtOVnmksLqZIlapvNB8jjJVQVZfNFUuL/S6tS/U7sJ9nWaO5+bZJQQQgYFFpHre+OLEq5dP38/XCZgOpUkghDB6p6ZasAHSJMXiIsDo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYRPR01MB13588.jpnprd01.prod.outlook.com (2603:1096:405:18d::7)
 by TY3PR01MB10401.jpnprd01.prod.outlook.com (2603:1096:400:252::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.19; Wed, 5 Aug
 2026 13:35:06 +0000
Received: from TYRPR01MB13588.jpnprd01.prod.outlook.com
 ([fe80::2f5b:8560:48ed:3828]) by TYRPR01MB13588.jpnprd01.prod.outlook.com
 ([fe80::2f5b:8560:48ed:3828%4]) with mapi id 15.21.0292.018; Wed, 5 Aug 2026
 13:34:55 +0000
Date: Wed, 5 Aug 2026 15:34:29 +0200
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, tomm.merciai@gmail.com,
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
Message-ID: <anM75cMK3_799SWo@tom-desktop>
References: <20260803132828.3249424-1-tommaso.merciai.xr@bp.renesas.com>
 <20260803132828.3249424-2-tommaso.merciai.xr@bp.renesas.com>
 <44c150f6-b04e-4515-ba71-63780c56c38d@kernel.org>
 <anDNtrL-eL6VUD94@tom-desktop>
 <8c5f0e53-2515-4744-ac6a-a4c94f2ae2b8@kernel.org>
 <anMkwfGAW5fBSAEf@tom-desktop>
 <CAMuHMdVzvnz-XrgJ2+UrAA-Gj6XjAnz9Q0HqrNCuVQF3+v9X-g@mail.gmail.com>
 <anM1KUoFC1ltRsje@tom-desktop>
 <368eb87a-bb12-4943-85f9-cda8a7835317@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <368eb87a-bb12-4943-85f9-cda8a7835317@kernel.org>
X-ClientProxiedBy: FR0P281CA0191.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ab::14) To TYRPR01MB13588.jpnprd01.prod.outlook.com
 (2603:1096:405:18d::7)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYRPR01MB13588:EE_|TY3PR01MB10401:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ba3fbdd-0186-48f7-eb87-08def2f655b5
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|7416014|52116014|23010399003|22082099003|18002099003|11063799006|5023799004|56012099006|4143699003|3023799007|10067099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	ldMqcdgVRBSYf3iVvCG3e2BoTS7DVSaQVOoZgZtCtimZCRII5N2ESQAbSlZLgO6r3YPg0fc+Ot7mZuiqzPTj/Hjtb37vaIfkxlOgc8av7qcBVEUKJBpmq1qaJ/ykCSa0q3M37dp4tel+2lnW2zhSlOHDpoKg9CzemECTbLUZlwAjGXH0kwX+YcOCAAluQk1MXy4iT6CMoY6DygqaYCrYEPQdjDvqNpxXwXDowI0SGgQ47Ao5fcLkDnOQBA0Bjtjb4rJIvPSfelmyMat+jrk1hgmbge3zpjCdn1hSPUht4fqjbKRg19jZAGnRrS5gyg37dnFG5yOTtzQ/yBRAraIejAcmsKsWt+X2csJQGOym9/eCunCQfR3sOHIqrOWvMG3tTj6754RsO1Gh3+nq/p6xbNhR0vP4MQIqnaam+1UEZQFPyi5AQLgxg1wJ8EH/wEXUlMfOowN0sCEm3/heVBNtS8eb8XisTGrCDhI/qQ63wyrH2SVnXZ0Gcvh156A6SjTxIp+0nEIteKPsOIswVvlg+IsIppx+VvCoVsoYGQttaasY/v4VnlhfQ8475K1benSa6Ip7JASKuV3+rDUuR5mE3+bH7J6MxZfEFmZ/HHaNEdV7U0ugtC7YCGB6Dh6hBsTDcdPP1R6yFf1k09qkWBSQ7tvHbiZ53Ds3dnl4Rl3Rq3K8kjnrj4vIQZBY41801IUZOlV04vRp6ZJkR5j462cWx0nGnLarU88LimH84K/7t20=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYRPR01MB13588.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(52116014)(23010399003)(22082099003)(18002099003)(11063799006)(5023799004)(56012099006)(4143699003)(3023799007)(10067099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?H63fLVDI73LoUVQK9/5ru/pLYZ4+CdqR9hO3M1SGFgvLV//spyhkVMG1R1pA?=
 =?us-ascii?Q?f1ZSgzcPfIEwpp+nwlJj5e45QJ/1xu7Yna/pJC4r1zg28LEMW2BRzXe0kyv6?=
 =?us-ascii?Q?E7r8s/evU/DiqRKdvJ6cEKmhI8k4bEt+5vlXLPjRcBK41T3bLdCuOecgrFAJ?=
 =?us-ascii?Q?ykdo7PH07NVm43fvL6plRYo7lEV++7SoLh1fFxIgIZQPaB7y5A/c66gkwwSL?=
 =?us-ascii?Q?FGh2RtjhkY7qVCan4grzFcxR7/5LueLk6WygA1UpEhn8ReTb+omhwwKIgB81?=
 =?us-ascii?Q?GxKYB8Wd6+JCKKcWH58z3068MMkMGYe835eh0eviDcRqu9LavB7AyoTxla7U?=
 =?us-ascii?Q?NznfMQagme+JZrk+cqBxhtlHQ+08aFNP1hokC4iVpW54hHGtFPCZRKM9GICs?=
 =?us-ascii?Q?gonwnT+J5M+PE9HPdvnLjdxSvHoLIzMdTtcbnNEMCh38CYdr4TqBNayuWKDS?=
 =?us-ascii?Q?mfpYJ+iG/VRvVLCkwLDJObr+Vzhw8o6lWz0dBv7CmQGRoHMlcHSvv58/bKJj?=
 =?us-ascii?Q?SqUETRblMDoZ7SWvvKaKE7CAybYzns09hIeaSnMseHr3CF991N7r3gYnF+0R?=
 =?us-ascii?Q?5De5C8OkrKdmwiqEbxyIPTVme7VAz1/Op6F5/3BGuI9/iwjfEPzi5Hk7Vgx2?=
 =?us-ascii?Q?jhaaZMxjFYwLUj2GV/wPFeqMuYALGT3XOpeE1kdPTBHBp9Gasi2stwTlkSI1?=
 =?us-ascii?Q?6jCOcz1BZWpOel9WvlToeNs8z4nd6ivgzdEvf0VFZXj+x4MLA3itOE9wCjEd?=
 =?us-ascii?Q?1O7O9ewkQxiIOfgkvPz3hIH8CnRykPVuO6Z9l/U1InZa/CNlpnC9bydd21ki?=
 =?us-ascii?Q?J/F+6k6qiEZ9i2h+eLPTXw6mB5yWdmnVoncUbDndKSG9Ui2XrTf+LVQM/t78?=
 =?us-ascii?Q?9eKXKJBF8pDoR65ywFlEiZn7Rd/rgzfu9Dpu/qnnQvu5JFHZLxbrvutIrp2p?=
 =?us-ascii?Q?06mV1D911qtO0xX8zQROpaYtL0+VaQbecNexE2c5Jnttxulb06AqNlLNXTkh?=
 =?us-ascii?Q?CSTqTbhH0GBtlNJKa2N5ckmrAMZ+L/XrH95I8bCgUU18ZC8bLyHNKxGp+jEB?=
 =?us-ascii?Q?2CoMlh1bvu4EOeU9uVdoJ1kmblXWw6OATPFYlti3B0QSzBAVLZJqoPES3Gah?=
 =?us-ascii?Q?Ar80ArlFNXf3lx0dvgbUJBGRxFqkzQu21I9e8kSi+mVuAfom6S2OcKuoktdn?=
 =?us-ascii?Q?aEOa3I3jXbYSOp95GbubRe2u+Hy4pwmCzldzSwmsmpxXd/OKZqTr/xZcgxoY?=
 =?us-ascii?Q?lFNcRNumD1UIyz9OwDO88B/ubiXE2VDT73dgHXiMYQqeP0kiRdevseYlxDkl?=
 =?us-ascii?Q?aOrziuMvKPFsjysO/2/VjVP4HI8SHeda1ySuKrSqgvAZ7WAWBxQb3K8HJGlY?=
 =?us-ascii?Q?UQkmsksXCaxA9ZIxxlGvKor0dfgE1Qq4NBoBd/8eXxKbQg8VYmlbiGpGrXqW?=
 =?us-ascii?Q?CAHEWyYJwU1MErb/2JJn5oSl3cQA73iENEzNoCQ0IJh7ThdXjiRMdz2QdxtP?=
 =?us-ascii?Q?7/Nh+UbM5gvQLEFQAVELy94a2cIHZmOmgFUMfz60mBsdGG1nt02LTBW5ou7b?=
 =?us-ascii?Q?Rk3u35mjvsZKAaSg2wkuxrSS70VOE87sMhYSqtmMZyLE1+Y5HblvCdCFO3+l?=
 =?us-ascii?Q?zw5eShupq1FrD4xAP+Trw4B6WhMbqjtj4y5+pUSs4u0RyCT+TwTXmCZDVJhl?=
 =?us-ascii?Q?q0zcpiDt7fnOmaKs4L569sWMZgsEQae2RTt/5AdSVZqBt02LsYqQ4OvZ7sMG?=
 =?us-ascii?Q?2xB5s9FD5UUlgLXVMUmody9X1aDA4d0jBo5kp6sv+J3GljQaqrcY?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ba3fbdd-0186-48f7-eb87-08def2f655b5
X-MS-Exchange-CrossTenant-AuthSource: TYRPR01MB13588.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2026 13:34:55.1266
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: USkf8VKnO4FVTu0H1vrTtrP76nSA5xNdHE3Kn3hFd5D1EQAqqpETi2bL7ujcJd3cZF151UJEtzKK5GlnlsVkdqDz3zXpDJTXwbls/H1/1cIot9HD2YlW/68FY4xeY3vQ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB10401

On Wed, Aug 05, 2026 at 03:19:17PM +0200, Krzysztof Kozlowski wrote:
> On 05/08/2026 15:05, Tommaso Merciai wrote:
> >>>>>>> +  clock-frequency:
> >>>>>>> +    description: for audio_clkout
> >>>>>>
> >>>>>> Incomplete, missing type/ref, constraints.
> >>>>>
> >>>>> renesas,r9a09g047-sound is handled by sound/soc/renesas/rcar/core.c [1],
> >>>>> and "clock-frequency" is read by rsnd_adg_get_clkout() [2]. The same
> >>>>> property is already documented for R-Car in
> >>>>> Documentation/devicetree/bindings/sound/renesas,rsnd.yaml [3].
> >>>>
> >>>> But was the property rejected? I am repeating myself...
> >>>
> >>> Looking into this further, I found that you already asked to drop this
> >>> property during the v5 review [1].
> 
> So my review was applied to the bindings only and undocumented ABI came
> in? Great, cannot stress how happy I am.
> 
> 
> >>>
> >>> Thanks for pointing it out.
> >>>
> >>> For context: the sound module contains an audio clock generator (ADG) which
> >>> generates an output clock from the external audio clocks and outputs it in
> >>> to the AUDIO_CLKOUT pin, that mostly supply master clock to codec.
> >>>
> >>> "clock-frequency" is array of the possible rates provided by
> >>> AUDIO_CLKOUT to the codec master clock.
> >>> Based on the playback rate it will request either 44.1kHz or 48kHz.
> >>>
> >>> I will drop "clock-frequency" property from r9a09g047e57-smarc.dts, where
> >>> AUDIO_CLKOUT output pin is not wired.
> >>>
> >>> But for boards that populates AUDIO_CLKOUT we need this property,
> >>> Could you suggest how to model this properly?
> >>
> >> Isn't this output the single clock output of the sound module's clock
> >> provider (#clocks-cells = <0>)? Hence can't the consumer driver set
> >> the clock rate?
> > 
> > Yes you are correct.
> > 
> >>
> >> If the consumer driver cannot set the clock rate, but depends on a
> >> fixed clock rate, it can configure this in DT using assigned-clocks
> >> and assigned-clock-rates, right?
> > 
> > The clock driven on the AUDIO_CLKOUT pin does not have a fixed rate.
> > Depending on the playback rate it is a multiple of either 44.1 kHz or
> > 48 kHz.
> 
> So the playback rate of 44.1 sets one frequency and playback rate of 48
> sets other. Feels pretty dynamic so job for the drivers? I miss the
> point why drivers cannot request proper rate.

Can you please confirm is 12288000Hz(for 48kHz) and  11289600Hz(44.1kHz) are
the mclk required for all the commercially available Audio codecs in the market?
 
If yes, we can dynamically do it in the driver, otherwise it is static/design time stuff.


Kind regards,
Tommaso

> 
> 
> Best regards,
> Krzysztof
