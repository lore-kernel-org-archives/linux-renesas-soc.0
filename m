Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010000.outbound.protection.outlook.com [52.101.229.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 490403F9A10;
	Tue, 25 Aug 2026 10:13:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.0
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787652800; cv=fail; b=DWebGi/Q71ub50JrU+iXz0OEdy3o/SL5H5ACjmnplhPTtmXPNgBC6f1lH9ff4i12Xpb5jeiERRwT6DvybTyCxqmKyTRIqJ0JBClS+Ro4X0bvlgTA6jFvuFu4ztQ/A9HoGkHnbO3IUDDGpOV63a6wVfYbjtLihep0DCV2J3aCDDs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787652800; c=relaxed/simple;
	bh=/q9dJzFZm3JvXBn1+/gdoHIcHB9/32gCTT2+ln1Ig+4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Tg/UdGW41Nn4Oh/umY/Hg4reKg8hE8UDLjsuemtsZNTFA54yu94ydels4UMnquLM/qHjWRGBMMwd+hjPxaKJh7w4XoF+j4wCH7pTHN3wV8BbqqitYPBrtQc3eynzvNXM3TUc6wlWhaCeZp38rAKCiz4oa2Tw+sYpmAlElHZmSV0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=ryuNOhFl; arc=fail smtp.client-ip=52.101.229.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="ryuNOhFl"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DLvz/ggXbFD5o4qhToDZEF5rmGd9j/+qaXuEVNKFiTudYmOs8T4GwD/P/AmsGJ0ZtdGkg3JvhwvaG8obIzXNVGcTZwTDtEiFuqv+MunnRxkHXtB3Yg1iK4+3p4oK1Yz0S6h3+K79cbNaRo+j9izDhgRCLXblNjzTsRhhYKphAnY5wJFpz+J7dspweUfiMwJgSuHGS7OFy9xgypXnR7DnSl1c8zzoLy8BX+3ndOXp7+83ThZ37MyHPBf4cDlTuEI/tKh49YkId/3QF3NgXV9L0p0irYr7LwC7dpGVdzW4LtoNrY0uG/Gz0rdVOsUQNKvEkUhEf+TjHKtLfG0OWOKGcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KaZUWWEfMw3mXqTK4O9+6WrAwMXxaxJOBJ35eWWEffY=;
 b=MwyplD9bXLuDMTCaOUD/3rcdpPPzzZemkbqAE2gYrTA7S8PksZfmQdwFkZd6zne1NLRjvQGX+XPldnAS/qQQTFQO5ET75ikxHFp6TzzLLUrRXgfHnqxeC+3WutNDcUrf8vQqE1dvV7thtx7VbgE4X94gKU9POtXxEf7Tnn5lg/LevE449HD+/80kQZ7GQszGxx9glLQJmKp6XmSPRLZQFf9A2HLbmRqMaIlU6twTYMl07dphOJY+xNCPlAshSqqCZzMsOqWnvY/g80O1C4ksZgrfe7y5fbXozMahh1YJtdl528xEHFWfsxH0nlCMcL0tjIKdPAbwHKa5OvzRUhXxrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KaZUWWEfMw3mXqTK4O9+6WrAwMXxaxJOBJ35eWWEffY=;
 b=ryuNOhFlPIUjRiNjtigUoLloIIIYQZHWtppW8LTq6ILjb30VamsO7hvdBiEiWFySwHyOb585dqXlBD3BU2o52tb7+Wen1M213rxZBH2+ahNMSrdHbCNNK6jszZPJMq7Hwc7RRs/z78ESLhRp+jLKBVYs9XZfkEj6+0VkNQOjrwA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYRPR01MB13588.jpnprd01.prod.outlook.com (2603:1096:405:18d::7)
 by TYRPR01MB15097.jpnprd01.prod.outlook.com (2603:1096:405:224::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Tue, 25 Aug
 2026 10:13:13 +0000
Received: from TYRPR01MB13588.jpnprd01.prod.outlook.com
 ([fe80::2f5b:8560:48ed:3828]) by TYRPR01MB13588.jpnprd01.prod.outlook.com
 ([fe80::2f5b:8560:48ed:3828%4]) with mapi id 15.21.0339.012; Tue, 25 Aug 2026
 10:13:13 +0000
Date: Tue, 25 Aug 2026 12:12:59 +0200
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: tomm.merciai@gmail.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
	linux-renesas-soc@vger.kernel.org, biju.das.jz@bp.renesas.com,
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] arm64: dts: renesas: r9a08g046: Add USB2.0
 placeholder nodes
Message-ID: <ao1qq7HOKvoOC8-F@tom-desktop>
References: <cover.1787062965.git.tommaso.merciai.xr@bp.renesas.com>
 <aec1fce5558c6c88725fe710a2f9e4b1eb9e8d64.1787062965.git.tommaso.merciai.xr@bp.renesas.com>
 <CAMuHMdUUAcrUbYV+_CFp5sZ1gQtn5eHzswZPvfZs=-=FX44DVg@mail.gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdUUAcrUbYV+_CFp5sZ1gQtn5eHzswZPvfZs=-=FX44DVg@mail.gmail.com>
X-ClientProxiedBy: FR3P281CA0018.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1d::11) To TYRPR01MB13588.jpnprd01.prod.outlook.com
 (2603:1096:405:18d::7)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYRPR01MB13588:EE_|TYRPR01MB15097:EE_
X-MS-Office365-Filtering-Correlation-Id: c43f698d-4fa3-48fa-e573-08df029178c9
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|23010399003|18002099003|22082099003|11063799006|56012099006|38350700014|4143699003|10067099003;
X-Microsoft-Antispam-Message-Info:
	ezvhHAz8vGR54FeMUf1bZmyUJQRWQY09KasXKdFUVn3U6nxTT0lF3F8jpHh1lHLl50PMEmP+u2afcWi2YNp0+cKbFSXTY0gSXXtum60SvXKZR/OXKG53vn4hcqdLpxflj+KLJeDFFHFi4+c6BkRzX56P5G2Nu/Q01T0atWOuVF0xVR1kCJV0O9s5CAtck1VSXOU+bbXhyEk5ZPCbzbc27p7KTQidwNjtQi5Eu5cadiW4owPcaYRgIf+tRSflpP7XGB2CB1X+w4Dfn87XxHU7qilEvioNmfacTcyGl6dfc/V8Wp38ouDaSQ1cddiJvp9xk8PMtU1fGAfqGUd1SNragFJVdNDiyRiNEYUvVnFjXUaqJ/qeFPTAtIPjHFAd2oDaJs0aMhgcQ454cKSnIsma8ii5FUzUqNuKR0inOxrovSVhzLNcmzUHtJuf+Md+e/jZ8aJ0+lMftyvnJbaeDWUzKszjyqmtpGiAwKeVggzxZiiwP7sZR2kJ0OqfzJCpEl5FksuHfgC9Z/FIOret5VX7MOF2wtgG/gWj63ov80Lb379onvLfeZMsgAHZhow1Jwab/dlzZbRWi6OdBN2IEgRhE7yvOp8zEoq5Tpxk6mIuGe1hXVVHFqaHlzXiKcGKzK8LyfEpwZWwH43R51BQTEWmnsOdbr92pXX5h3qhrc5xRWRvYoMybf6vYm/LDpSpdF+Dusa3kuQapvNSygHrBdjwpZTaoyyLCmocrzOp8UYjl2Y=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYRPR01MB13588.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(23010399003)(18002099003)(22082099003)(11063799006)(56012099006)(38350700014)(4143699003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?f/WJBA1XBUa7bEY3WD6eQ3WKzmTchvF8EeOaSYRGph16w8xb0g7GvXbVM7Ve?=
 =?us-ascii?Q?vylVxVYTC2TY9bDLT7YVrJMRjJNiIe3Mjnz4EkM5esOxhlUA/qjagOc4PTfF?=
 =?us-ascii?Q?LfFE4m1UeQsKwDbCc6d6jtgIkkInkeuIFBvS+xAWPNSu0+5kJ0qqeRiQLfSj?=
 =?us-ascii?Q?BNmdhT4sltY8Jf6vN3Z6rPPqcqfjTL/azVdOVVCBO9oRqr6vxKh440OkFoJC?=
 =?us-ascii?Q?hRPckFXR3Vno1ys2PahOAoH7ZIWrBIyhVs4P6tOq6EL5fFSM5qNhjhNMhtth?=
 =?us-ascii?Q?hBBuw3luZxZSUx9WlhMA0lR7vcNpyEkgxR/mnaWTW4gPPjcyMiiiNeZWLq+O?=
 =?us-ascii?Q?X6BAFPLVNmyUplV+2da3y98D0FdlHUbkCW2fCoYGWCCadRbpIP/BeGoozFAL?=
 =?us-ascii?Q?0gmHZvvoxC8cMhJw+uiFUekJuEOlzX9ubLVMfl1VWrvQ2v4bVPVEqV0HWB9d?=
 =?us-ascii?Q?ClbadYtSykBhbChcLw1+EplRYsALJaLKM9dgAwZNk6/UGDbg5dDmdIcziBtd?=
 =?us-ascii?Q?+dhiA8DJpFQQo/DY+CxwWqS70F7CtJ7pZPxMxlQ0Hdz9AUrImfA7aSuZijhf?=
 =?us-ascii?Q?uvmEexcvZYHBY79soFolbNvGwGEB/4TiLQeblS/gBo1RIqVTSzojRXkGNvsF?=
 =?us-ascii?Q?hSKvvQ8UkrtHsWsFUpXgembHNeqlkJF6cStqp5J+15Py2fW+nxXiHHN0SKo5?=
 =?us-ascii?Q?3M3OcipJjLnxoJW3ohMPM0EmzNxKMzZbAkcHflZCHw1vGAiRjhO82+XCVGBC?=
 =?us-ascii?Q?utLVC1cojzw4aUXLu9fubk2uuDkhyL3ncq8Z10etAN9bTBbPu9wASGjZgWX0?=
 =?us-ascii?Q?JhaHbJhm0gMHaUEyUsZbMS9f34auCrPBodp87J67/c0mWlVkWHwT5FNi8MUm?=
 =?us-ascii?Q?LnIJHBRGVaVlrHoS/QmWQBf8oO+6hYWyYaqDoBFBOBAqWsbBwHnK3bdow2ML?=
 =?us-ascii?Q?yOgA01ZGQSMfnGoQRGBwOueH8dX1gXFYMeM+qvleLoB3mOPNnQeMwee6G8sw?=
 =?us-ascii?Q?lirjzL7Ki2s+1mwORbQR+gAZiXryVJIxFIeTWpPoxI1668H9+RY0CQpZwn3B?=
 =?us-ascii?Q?ePq9lNEYqfUcK5qVvGa6DABAxsD8yL4D7ycbTD5g3x0CNFlWaYHLvcK2V4Ar?=
 =?us-ascii?Q?42JB2apOyVWcyjREDCf5WNOo9/5iYsozsFjqwebAIM9ty7IcTooXZ37SJgxJ?=
 =?us-ascii?Q?GeH9f0upBeHiPoRG7cmk6MIVPxQA2CsGUJKvyjSer/X56bo9PGWWqJzHAHpp?=
 =?us-ascii?Q?zYFWiEI4p5pgwSQ7tWfVTRj7VHZIECUKycLXi5RPl4ElNJzhqie+Em1+1ms6?=
 =?us-ascii?Q?ts+Ze1OlFAVg8n22SBuEll2+ZooqnPjsswa4r2Ak6ZyDDfUR8oWy2TIr7yiv?=
 =?us-ascii?Q?cftZF3Eq77u7WJvnyR4s7d0OpDdm6B+RLgQr7UdFXq71qqhiTVBiPL69YzAC?=
 =?us-ascii?Q?y0jQtzXApTfQARzdRB04oFr5mSzbsWNdsLRrTyiANjjZAGOtfeRwGGAiehTj?=
 =?us-ascii?Q?C9exwaDQgQezxfZ/AYTna2OWDsk8cWu402m62TNhlFWmcN1B0+u9e//DbiZd?=
 =?us-ascii?Q?Vvg5dhvSC2UWT1SQheignjUi2Q5r4F+1pNyCzUNa7j4OSAY1wz7SrhKU9fN3?=
 =?us-ascii?Q?YsKxfiC50QAvFaQ5xA37VpVT3Jgz0bdx+/YYjPh5BqbceTCSMroanDk3SWC2?=
 =?us-ascii?Q?tUW/CK2/FpJwB2JJgJCk5hV2XtCXU1ejcbnG7IeYNhFGt8U20Z/1+LQlNS12?=
 =?us-ascii?Q?gXFN7Z+b2yqkCzJpo9HO69a6E3RD8EaSQp0Aex5XhfTzeYYfcEpN?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c43f698d-4fa3-48fa-e573-08df029178c9
X-MS-Exchange-CrossTenant-AuthSource: TYRPR01MB13588.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2026 10:13:13.1700
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PAvfopfVq4eUcLx48O/xwlQ5iLUcknPoMKalydYZ4kkZzWfF1yXW7+X8VFPQi8PqX+78co5BFVCnyrwCAsC+s4zL1NPxSFtY+puyTuziZ1YbCN4msLL8HmA9oJUujMhz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB15097

Hi Geert,
Thanks for your review.

On Mon, Aug 24, 2026 at 04:36:10PM +0200, Geert Uytterhoeven wrote:
> Hi Tommaso,
> 
> On Tue, 18 Aug 2026 at 16:29, Tommaso Merciai
> <tommaso.merciai.xr@bp.renesas.com> wrote:
> > The USB2.0 wiring on the RZ SMARC Carrier-II board is the same for the
> > RZ/G3E and RZ/G3L SoMs, so the nodes belong in the shared
> > renesas-smarc2.dtsi. Enabling them there breaks the RZ/G3L SMARC EVK
> > build, as the r9a08g046 (RZ/G3L) SoC DTSI describes neither the USB2.0
> > host (OHCI/EHCI) nor function (HSUSB) instances:
> >
> > Error: arch/arm64/boot/dts/renesas/renesas-smarc2.dtsi:94.1-7 Label or path ehci0 not found
> > Error: arch/arm64/boot/dts/renesas/renesas-smarc2.dtsi:99.1-7 Label or path ehci1 not found
> > Error: arch/arm64/boot/dts/renesas/renesas-smarc2.dtsi:104.1-8 Label or path hsusb0 not found
> > Error: arch/arm64/boot/dts/renesas/renesas-smarc2.dtsi:114.1-7 Label or path ohci0 not found
> > Error: arch/arm64/boot/dts/renesas/renesas-smarc2.dtsi:119.1-7 Label or path ohci1 not found
> >
> > Add minimal placeholder nodes carrying only the reg property.
> > The remaining properties will be filled in once USB2.0 support for
> > RZ/G3L is complete.
> >
> > Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> > ---
> >  arch/arm64/boot/dts/renesas/r9a08g046.dtsi | 25 ++++++++++++++++++++++
> 
> FTR, this conflicts with Biju's "[PATCH v7 6/9] arm64: dts: renesas:
> r9a08g046: Add USB2.0 host/phy device nodes". which does add the real
> device nodes.
> 
> [1] https://lore.kernel.org/20260812141940.246223-7-biju.das.jz@bp.renesas.com

I will send v2 picking [2] and [3] from [1], then I will rework [4] to
properly disable common nodes from arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts.

In this way we can drop this patch.

[2] https://lore.kernel.org/all/20260812141940.246223-7-biju.das.jz@bp.renesas.com/
[3] https://lore.kernel.org/all/20260812141940.246223-8-biju.das.jz@bp.renesas.com/
[4] https://patchwork.kernel.org/project/linux-renesas-soc/patch/c2a9a45078773cd022cfec77578ed68c57921c73.1787062965.git.tommaso.merciai.xr@bp.renesas.com/


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
