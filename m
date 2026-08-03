Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011070.outbound.protection.outlook.com [40.107.74.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D2F4421242;
	Mon,  3 Aug 2026 17:20:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785777609; cv=fail; b=U7g0X400em5bnTg5zwJxcCnXQw7NkrIJamnnNWte8ukaI/emV3F22NCno3hCtIVapJfRBmmJ8QIy84neOSU5fiCyOyJ1hN+uVvNmu7UiPKAhAooucll/5zu9oxw+025zEU+Pi4a4RLx0GxkcvxONIvnTqwSWzKnJ+TfbNmKCAko=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785777609; c=relaxed/simple;
	bh=8Fk9OghUClbAc0KKEiieKVffYyCDqAPNSp9shg2wmlo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=pvqglquhDZ5bl2T2Sxt6GjjM6lExxwZMyLMUDS7Ajg62tKEqeohQfRvSvT/rKGOx4L+M4BeuhXo3b9JevGjLfJVa47/Jq0PvzyM5rwCfoFIxerihjyF9XzwkgZSTOI895yE1cl2PNnKh738325aYrHch+1AE3/DzYviYuV2NZt0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=cPVIn+5I; arc=fail smtp.client-ip=40.107.74.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="cPVIn+5I"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wlGKvRaE+Xd6srTborL3vB0RsuFET7ItQo3HngD3TVcl660cDAO+f9eOAtmNS8QRqBSKi9wctECbXn8UNGxg96m1B86g/qqmOq6wbBwfDyM9hY8FzN1BfFrY4CVn1R10yif0H692ZWIrJjwbqmbAdd7CXPx2A/L+JA9+Rlxew0Ub6uLAGCQOmTSW1BTpKghmNRaCaQJd3vfA5n1LfVFNNBegzfeXf7Y1EqczPoAxa1bkklD1Wd8z6pAPU978i1oi2MKVVYyWzp0s1sdjtYOG2zWEkPtKvlEkCVeK9MUkxp3NYA8BEpxOWJQw3dNBnWILOXexC/GY8R1I/H/JsWUwtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VUCJcuEVM7ZYrn9JbsuiiSkNnzuXnHaeFLC44ASEQP4=;
 b=UMeBKsjk9DQ6NwJQ5rEPzKzFGjhuMBow1sYABv/NDH/qVcEsCb00Mr6vu8vXSkSH6iZAI0rXtgWpGDPQVs4OQnpEWHA3xUzXMyiSLPUIByyDkpO2DY3YZCpoal3DtPVqE+gZuaQhOpRymHDYH1wYkN4K52NtIbPAyEaA1y5maHOsAQF+3jHqh0rPS5AWJAVnDVRFWJVIXfw+T54+sm6QHDQq8B1d6EWxMTo+qVrgps5LfUSQb1oQtUHlzINkkEGvWziwQZ9+f/Iqanl9TVXM5MTlqUUCn9NCQ8eTztg71ihmhx1PdWQrJr4OO8qEt8HejonlYab1psB6OY8hYCucGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VUCJcuEVM7ZYrn9JbsuiiSkNnzuXnHaeFLC44ASEQP4=;
 b=cPVIn+5I8fQpgferZ0XLJpZNn4qkJ6MmogdB4i/XVxYlcYajjnmLfHB8ky8LHFMkwPJTpurx0jrXDgl2pdb7jAI1NGrMhFhnW+0jPav1j+DGAIik9O1hd9JcZBVF1Qgb5xEhs0XRhIcqN19yuQyHRIuEGjIak23nfVqK5k5M7as=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYRPR01MB13588.jpnprd01.prod.outlook.com (2603:1096:405:18d::7)
 by TYCPR01MB18583.jpnprd01.prod.outlook.com (2603:1096:405:3f1::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.18; Mon, 3 Aug
 2026 17:20:03 +0000
Received: from TYRPR01MB13588.jpnprd01.prod.outlook.com
 ([fe80::2f5b:8560:48ed:3828]) by TYRPR01MB13588.jpnprd01.prod.outlook.com
 ([fe80::2f5b:8560:48ed:3828%4]) with mapi id 15.21.0270.016; Mon, 3 Aug 2026
 17:20:03 +0000
Date: Mon, 3 Aug 2026 19:19:50 +0200
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
Message-ID: <anDNtrL-eL6VUD94@tom-desktop>
References: <20260803132828.3249424-1-tommaso.merciai.xr@bp.renesas.com>
 <20260803132828.3249424-2-tommaso.merciai.xr@bp.renesas.com>
 <44c150f6-b04e-4515-ba71-63780c56c38d@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <44c150f6-b04e-4515-ba71-63780c56c38d@kernel.org>
X-ClientProxiedBy: FR5P281CA0020.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f1::19) To TYRPR01MB13588.jpnprd01.prod.outlook.com
 (2603:1096:405:18d::7)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYRPR01MB13588:EE_|TYCPR01MB18583:EE_
X-MS-Office365-Filtering-Correlation-Id: 4f188bb9-4240-406e-7d34-08def18374b2
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|7416014|52116014|1800799024|366016|38350700014|4143699003|56012099006|11063799006|3023799007|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	lhiJx3xWuoJjMqYAxdKk1lKK/tnQyhhWAGegF4eZBaSLNKbGELLgc7AUjxWLpBcZWNqlzA/pfNGxZcXTCv8zKYmIVzOvXkCjNULCnus6buHN7W3rlHUZeUIuoRY5RrmRlZTmgPvQbkGfJaZKy8CyzL6fMzAyeyU10a4VIVBN5Nj9jU0B5K7DVFldGunQKwnLGi62Ga9PYjxv9+Gg/funIRzYjsNHxM8LN4Jw2B0F14NeoxyUzxyOPuAq4iYPL8rj6FOcXXfCx1s0EM6xKs0wy942jP06EPrdTolyDd0INbpTyprtCxHjORMGuZyqxqN1bD6wZ0Q6NJ3LgVdwGB4fA0Doa0ipG44CMpPXjRdD3wmXuuCOGe0aJFEJwUpuSxQDqWRSkzTHew20OyXK+ApjmgvAdOLo3ZABvALt9i3bbFrmA4GMtQQD29YNUrU+1Kn5qKHMdNklIzYyc6fze3UMg9BPSQULxp+LfxFyzkGbKqstPknYgkIpUYrtNP79bhfIYsj1gTMLmnWAUmSdcx5KrxeeANY9wR+7xeY9hpV+vLMOdN+xzKkZE+O8dtdAjT/dgUl2T75BhM9b+txniJpAeQ4EdQoDHN/Vr56drfGIPDwHy/u1E0JRC6yV+yR2ssiVwStbT40IaAH6Iz1arhIRa2Vgp1GJxW3eOmdsx2yIIno=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYRPR01MB13588.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(7416014)(52116014)(1800799024)(366016)(38350700014)(4143699003)(56012099006)(11063799006)(3023799007)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?S1PXNfEjGj4730qChvpob83OKEcZNIM4oVrX8dxTpl5sEErhPNyzENCyoVHL?=
 =?us-ascii?Q?Tox0inprS+jqIDVUMqK8Z1PyCuHUW48LZ2I9yF72okMXilTmYGhCXUl+mN0u?=
 =?us-ascii?Q?oddiCCYF/wDL8NKPsCVU9zZADIX6Qly7YD4QjgTw6kJNK+xAGmB8fCDScGa9?=
 =?us-ascii?Q?pPOFdpRTP7ZkVkOTWxFivZppxBpB3XRw62GStEmbBQEqLQPN1WDsoJx8RVpR?=
 =?us-ascii?Q?WsgR86oToiNHQILjgzML36/Z4u/dL5F9HcT04OZE9Am0Dp+EUhTPikhL2gd6?=
 =?us-ascii?Q?e5hf0I+z4UDEf5bwMXBQy0/lRKTq0TDi+vYXh3fJwSiB/Fg/YtvxxZRSU9xH?=
 =?us-ascii?Q?ihmHplJofcTu2WSXBk6qA/n/LfUJ/L3RmFrqEsIfyuqgYsiaSxMhE4iGnyKC?=
 =?us-ascii?Q?3jrTR2AwsvoqhQzB1zc6OSN0RxuICp0HJFgh21DQTyDTLc6/wIqzUDRfnoAI?=
 =?us-ascii?Q?LUkcFnuZ/5ZkNYej2TklA2P3mqeCo03UwECTD7W0UsPZVV1WrY8vJCvEblyn?=
 =?us-ascii?Q?3LlUNE+7J34caj/mJQvuWxGFeGQ5XYvKrr0V+EzMFeIlH0KR+j20YCyV+TBq?=
 =?us-ascii?Q?dap9cKFMMG5BQgYFx+u+aP6jHKzoEdXnwyVO2bnLmEWG5xyT9DVp4ayYDUSr?=
 =?us-ascii?Q?gqc4CwFSJY21QzDCzKOESftOgHjdRyHMq3uosfGkdAr39ZFgk7Q7sQBkuVO4?=
 =?us-ascii?Q?AI/j6h+boSY78x0yl6mlf1N8/QNo96eOYXxtO6wZdfimSZsGk6msrcd18hrs?=
 =?us-ascii?Q?IHkgl1shalbTR4Yt0HpkOCk1Zp8gaxw9MYcFEwjql1rWIgjM33FN0j1pI58C?=
 =?us-ascii?Q?22YdQfzyaF0yEiM/Xfx/KcTjnEu3hz84WowkVQYxZTeUZ8RO/bByTDb038N0?=
 =?us-ascii?Q?iFs4qJt9vO278a0629QpYUe1WFeQ8eqI4xrzJHB3zCQO3+ZdeWwWNEOr0TIG?=
 =?us-ascii?Q?7eWgiTzmJLqiy5bBEhkseVBFA4U6i2UMRDWO0ErY43FD2UHWVEvAT7BqZP4b?=
 =?us-ascii?Q?Y2T/GQByRONDjNBRMkIXDq7H+wj5VVMw/G7Tx87qpsw+2FdexqkuuMclV/8R?=
 =?us-ascii?Q?U8fA7aGcXPW5kmKFH1L8QF7SLSd+MxuQGY23c/Y2PSSJM3DFJ7CGG1eTIy1a?=
 =?us-ascii?Q?eqvW6bpXyX/wHqH7pKOS/795tePFMJ99BqEIaP3hftKOJv2X0z7b8M8Yist0?=
 =?us-ascii?Q?Wz02x6wSlglPOjH3djev6XLahtb6mN4IcnTsTLvKtUkxb5EYMcYokwG2Ku1N?=
 =?us-ascii?Q?LJwHk522bMHbUBuFzdjwsm+S1CjaeNV89mbIHw9OKH34BPagYqLmjBZzOWzZ?=
 =?us-ascii?Q?v+1KHdiSWf4H92yINNwvY+PVnCI+r+M47DWdIOcp+jyLqph04izGp91ncsp0?=
 =?us-ascii?Q?HXu+b2aYA7jKLqITplSQQyfE88UtTJnm47UYtCRAJShxtgqzoxRH3x3uGGje?=
 =?us-ascii?Q?RKsfDBra9X98RFN6ORxhNdUvs8VhlEVU6njVhSnEWeiJMPACDqFTEEh2tNPN?=
 =?us-ascii?Q?SJjZdzvvDZCtRFr/HxmoyraIRj2zU3IlEkHp4Z8MULfStVkUIIPMSQAwlQID?=
 =?us-ascii?Q?+t32BM799dVbpTejJbFP/VMTyDljd/ztOYPY3kEN8o9bttvSO7CeWMX7HK4a?=
 =?us-ascii?Q?/Mge0jbULDFl/glibuGk8i8Wk3AMtsh0Mk3BlIsyQULexQfIwNf6DC5YQ8MP?=
 =?us-ascii?Q?FTOQi6YX8pB4IFWZUiEVypYvRPUK/UK1V3aMoXG+UHAWZ6vnB0UmB7zcLOAB?=
 =?us-ascii?Q?T0XUUSA8gVnQHDhFCX+iz/GIjwyJbL+LTyd1bLxKk6CHxpZ5T4cw?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f188bb9-4240-406e-7d34-08def18374b2
X-MS-Exchange-CrossTenant-AuthSource: TYRPR01MB13588.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2026 17:20:03.5890
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WB5GhyZ/bDVZpyq/9mRknszvf4yXrMWZElPLEhGHCNco7c5qMo+LjXr6wHOkpeJXDSzMHF6qVI6l0xnNK6D2GZJn3slRaXWnlf7DZlPcBklIE8h0pZ8D/KQ5Ak24l4ia
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB18583

Hi Krzysztof,
Thanks for your review.

On Mon, Aug 03, 2026 at 03:32:48PM +0200, Krzysztof Kozlowski wrote:
> On 03/08/2026 15:28, Tommaso Merciai wrote:
> > r9a09g047e57-smarc.dts set clock-frequency for the audio_clkout output,
> > but the binding never declared it, so dtbs_check fails:
> > 
> >   sound@13c00000 (renesas,r9a09g047-sound): Unevaluated properties
> >   are not allowed ('clock-frequency' was unexpected)
> 
> Maybe the DTS is wrong, because property was rejected? Did you check
> this? You cannot document ABI post-factum if it was rejected.
> 
> 
> > 
> > clock-cells is fixed to 0, so only a single audio_clkout applies.
> > 
> > Fixes: a86fd3c20218 ("ASoC: dt-bindings: sound: Add DT binding for RZ/G3E sound")
> > Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> > ---
> >  .../devicetree/bindings/sound/renesas,r9a09g047-sound.yaml     | 3 +++
> >  1 file changed, 3 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/sound/renesas,r9a09g047-sound.yaml b/Documentation/devicetree/bindings/sound/renesas,r9a09g047-sound.yaml
> > index d7fa16554698..6e2b2c93b4b7 100644
> > --- a/Documentation/devicetree/bindings/sound/renesas,r9a09g047-sound.yaml
> > +++ b/Documentation/devicetree/bindings/sound/renesas,r9a09g047-sound.yaml
> > @@ -42,6 +42,9 @@ properties:
> >    "#clock-cells":
> >      const: 0
> >  
> > +  clock-frequency:
> > +    description: for audio_clkout
> 
> Incomplete, missing type/ref, constraints.

renesas,r9a09g047-sound is handled by sound/soc/renesas/rcar/core.c [1],
and "clock-frequency" is read by rsnd_adg_get_clkout() [2]. The same
property is already documented for R-Car in
Documentation/devicetree/bindings/sound/renesas,rsnd.yaml [3].

Please correct me if I'm missing somenthing.

[1] https://elixir.bootlin.com/linux/v7.2-rc5/source/sound/soc/renesas/rcar/core.c#L109
[2] https://elixir.bootlin.com/linux/v7.2-rc5/source/sound/soc/renesas/rcar/adg.c#L690
[3] https://elixir.bootlin.com/linux/v7.2-rc5/source/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml#L89

Kind regards,
Tommaso

> 
> Best regards,
> Krzysztof
