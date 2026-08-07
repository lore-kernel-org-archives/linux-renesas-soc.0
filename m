Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011005.outbound.protection.outlook.com [40.107.74.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 749D241834B;
	Fri,  7 Aug 2026 10:05:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786097146; cv=fail; b=A7On1NpbPtnBpSLQ7V/OXmzF8E3N3thL+sBMduCCD0OvXGWyofPjcB0CU7BoylUces3aOYJZE1Yi08kaJOMNypSWL4lb00ywXSdAbYYQaiyJX8TJGOcLtxP8fJ72d4/9swulTat8O++JarAFZoKMwZg80J22RA7JvLzy6+JzwP0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786097146; c=relaxed/simple;
	bh=BCixQHkxppqZsA4QbXTOjlRwbwnjIxmh3KrrucGcRFA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=NVrPqabBX3SwmoH2WO74w1pimbqTau88KDg0lXQERSRPqghVliR0FZWN61f4hYzUUCKcZ/T9oAlKQBRy0+6hsh5U7MaEdKIvnmS9K1nrZVtEeodJVeI5BOseygeQVNZBTO2Kht3aXoK+30g2EbfkuKfqm6c3VQBDolWOtkRYAyg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=ONWiaJLM; arc=fail smtp.client-ip=40.107.74.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="ONWiaJLM"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PNEC2y0ufGw6xlTn8WJvgQkga7nENdEKOOSNsGl6YTVAAmf7uKsBazmF5J1NB8RzuMOw8it13VJTvio/QjDxPSrx05Qq8DvpGLZwk1fa0BqWFLZTyDSkh8UU+Om9YhPwb5u7Qc/F+7aZwASk0t3s5o/C+5snTCRK4IJr8VWVdGf3jZdZPfrXfmaqckPd2X1m2swySMT1z/2JwbnDnHhAleZH8bZaAlQX3argMfksfXI0XTTYrRTv6Ph2qGH0iNWhq0QteiscnJW2NE9hWWzS24AdlB9YgBgFsLGjmrX/RQH+DmYCal0nq6pYrgSWO+tInLuYCizj/7NSC8nZrbR5IQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SEKd1w52/BbDHiOHeZEVHnCHJAIEED8i6UYtCMD1B+g=;
 b=Ix/0romrRUNyAhSW1x2/uEm7rB0HpwRL9F1mhIgj6ZO953q7Cyr7nYRV4skyIyVL2aiHqtoIaFoNnJwU/MFgE4V+eeuqGaSIl31IXAzN0U2toaMdMlPQHhi9hrEihZcCuRvF5ZxuekcXOvLahhL538Hp8TiTZiZuN6Hn8Wx56Sjoa2B+GNRIKnLP45doJElVuQBkBesgbcFCn6/aJZ3yq20e1trVN057F3Gr0u36CzQMgvKMiJ/P1GLl5e+boVJDt7LE4Nj+SovawtKbPuNkrY641wJ02O3ByHlUqlSmp9ri9OoeWFCwoFqlMlas5cHCRv07yNskZnxvT4/nFLaSSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SEKd1w52/BbDHiOHeZEVHnCHJAIEED8i6UYtCMD1B+g=;
 b=ONWiaJLMHUVMAfmInl4ot+SRFcOl89eTjIpU3lFQZveq9DREYpOss+64o7Cp3H1tfPtTazcjrR9nMbdYDq1OAPOVbW3GWXmqn9ipNisocpn8XW9CbRbLN5BU4lhqnqmS5RxIzfLRMaj4PRl8FcDnBrmSILSAWhz3T2FCzVa1wcM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYRPR01MB13588.jpnprd01.prod.outlook.com (2603:1096:405:18d::7)
 by TYRPR01MB12543.jpnprd01.prod.outlook.com (2603:1096:405:1b0::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.23; Fri, 7 Aug
 2026 10:05:39 +0000
Received: from TYRPR01MB13588.jpnprd01.prod.outlook.com
 ([fe80::2f5b:8560:48ed:3828]) by TYRPR01MB13588.jpnprd01.prod.outlook.com
 ([fe80::2f5b:8560:48ed:3828%4]) with mapi id 15.21.0292.022; Fri, 7 Aug 2026
 10:05:39 +0000
Date: Fri, 7 Aug 2026 12:05:23 +0200
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: Peter Rosin <peda@lysator.liu.se>
Cc: tomm.merciai@gmail.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
	peda@axentia.se, p.zabel@pengutronix.de, ulf.hansson@linaro.org,
	linux-renesas-soc@vger.kernel.org, biju.das.jz@bp.renesas.com,
	Ulf Hansson <ulfh@kernel.org>, Josua Mayer <josua@solid-run.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v12 1/1] mux: Add driver for Renesas RZ/V2H USB VBENCTL
 VBUS_SEL mux
Message-ID: <anWt48Y0yB_J_4Cv@tom-desktop>
References: <cover.1784109616.git.tommaso.merciai.xr@bp.renesas.com>
 <fd55d955abff917123a33842076550dab931b548.1784109616.git.tommaso.merciai.xr@bp.renesas.com>
 <0ff405b3-31a2-4673-abb1-49293b137249@lysator.liu.se>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0ff405b3-31a2-4673-abb1-49293b137249@lysator.liu.se>
X-ClientProxiedBy: FR0P281CA0058.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::19) To TYRPR01MB13588.jpnprd01.prod.outlook.com
 (2603:1096:405:18d::7)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYRPR01MB13588:EE_|TYRPR01MB12543:EE_
X-MS-Office365-Filtering-Correlation-Id: e3efbb4b-1d30-456b-f906-08def46b6edd
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|1800799024|52116014|376014|38350700014|22082099003|18002099003|56012099006|4143699003|11063799006|10067099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	/Nr5cDmAqjuSiVfcXQlyv9NIrc1iNSNRvihHxsI6UUxcP4+qDmOErOkLPe9XxRggKOA1Oj7xHySZJ61B7thmnX5yBPidPgBKN+dRZ6CCj3Yq3kEloadrdzpuEuQVYTr/ALjlDHjVbANn2swyurY9SswTnUmPxbukSjnWcYWNfo+YOAKxKAH8DyQm+rCHEHlRXPhddrsSMY24R4ZqRERavvn7tvCfKEhlVOITFHjEL9MZcOSKmVxU8Rsh3UqwoEgR5jaoQK0VZ6dG3I3DeHfW4kGO8KbGgHY0uOuVck0DaBbrWd5gjO7xXXewWhhkofGSb9wZWhTs/rfIzXll2o6rzDJCGrJc08scvtHeIJQFbFxntHD2Lx1/y085IWnRdofnl6aw17DM/CG7umt9YKCtxHmjEbw3IzCBaf3xgRExZDwrsdjLzPhSCaYl/jQnBPz1rQcmIj7jqdxFxSFLQZ+LNj+NnV2iU789zPTizulncbVY25j30E7cUTc/D4xnKcBTMqZho+cLV8MEWJs9A2yoeVS4Cyq/5LhqT0DfzBR8XEcZdLH1273JTRHk6mxPtmsqveS+OWwtpvsUIUlBDEdDpSXoa9rN2P9ODp0axY8tp7lQeOoiFdzZQ8HutsBh9/CFHsJOG6UIyiXUgkifBMxuZV8Xzff1LZSOENmKuJosXvizMrPFxjQKyPAvrDAzBxBVN/8Q+4otQnH5GTAmvVzvb7IM+no35KHOGn/7x2iZFhY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYRPR01MB13588.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(52116014)(376014)(38350700014)(22082099003)(18002099003)(56012099006)(4143699003)(11063799006)(10067099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Du5LNGEdy39Fl0BTLrpnx1Xj+55qan9H7T9JPf3bNeg5Er9YtJXvLUiiPzLy?=
 =?us-ascii?Q?k1GlLEJGPW/GL2w+Q9gnLWR/0zrAxj4V9yVJC2MnDGCSNNwD1OIUU1XN1pWw?=
 =?us-ascii?Q?YCpmWH1BVmVvEEMDslhMCGi4kd6GE1M/yMahEndlwdb+UaPlHtsVl8r8aIe9?=
 =?us-ascii?Q?eXKWCShCbOvnhkJnegTm1q563gqtav7wiham0N4o0UXSCGkjP+ZGTHmogYh3?=
 =?us-ascii?Q?DiirLRpyS17R9ofy1SmZiMUa2psduW1PAViu+/VLsboedEG5zl30g3Sp4+65?=
 =?us-ascii?Q?XSxKX5ckfnx89JWL+28jgzG/KOw3WPCICEASyJLzWVhA3knL65JPhU0uNVe6?=
 =?us-ascii?Q?NeZWOxpEClE6FMJaPcITRW0v4yBBk2Q+Gax15GMCHMNwoRiuAqH0DQgYbGjB?=
 =?us-ascii?Q?kTZ+Or8FoMiXOyCHaKUCmm/7J+MmUZh/T3Z1vUMrtcwYsSPKOpF6caS9X/c6?=
 =?us-ascii?Q?uJJuPDmJW3YbqUBnjxwnc24qlkI2PoEhROCLORhPPm80vcCgpWCENDacocLL?=
 =?us-ascii?Q?d1oPV4SsB/90htLff2Xmu5hxOElvgf7EXTOI4uP3y3NDEn1l7nBJ31dnlYfQ?=
 =?us-ascii?Q?enrx7PrilpULwGZBRy9G3wGewfxenvYbClol2R8b7OYKhvSwmdbFpgVMibjS?=
 =?us-ascii?Q?4C2eksrwqlbZ+5CQ7pJv5YKX4KsmXGbM+T4BSGzNIocfrGWyLpgxemj/VW7Q?=
 =?us-ascii?Q?KfCtGGXftn/kc+0Hd7VW7DaMxQ33soAXfOx2oRKJFDfy4OlrK3pi0eKPuwtG?=
 =?us-ascii?Q?P8G4wXbsKBgcZ6eDc3vEYKZ5AlnPJ6QvjhAgBX1sFBTmmdycxFVFQlf7Li6X?=
 =?us-ascii?Q?C51l7VLCz8HjLmvujAhlPj7IAMbENqhB/9/BRsc+GDRzihZjmmNYDSU9LklX?=
 =?us-ascii?Q?v5yAHvO0r909Y0WaZ+drzXMbkwFfg6ThPOOdk4jWEchqlp5KKx7gK5CDfKEr?=
 =?us-ascii?Q?0/SxS+g5C1z5byT4iI1Slkg49O6ihALI92Skh4tWIPPeSIueoWxgfy14iLgE?=
 =?us-ascii?Q?vE+J9ucBfvyhcIen2HtS8jy8UD7Aoxl2X/Au4ZG8WKvSw8sJsHdffP+M9FRl?=
 =?us-ascii?Q?+rgS6/UIOkBiFqX5+RFxH47uFlKQJNuTwxVj/wp2h4GkCX6oJkqEwUCbSIfH?=
 =?us-ascii?Q?JvCkazx1Cm78NU6O2qoAfiYkfIC0SQr3Jt4BD/poOcUnQ1QV5quPoqucKmU7?=
 =?us-ascii?Q?6QL5fqJKwQpT5H3fu7UpmY57JGuHzwFzFVP8nY1jQqTmH12q3FSg8vFN0+Sz?=
 =?us-ascii?Q?9joUqMYWRWpho8zv6Jjpa782zdUK39tXZI3PDIUmwojWxUTdCpqk1hlGnr8O?=
 =?us-ascii?Q?LWtP1VSSbxGBJ6X40cUpOOWSruPUJiaOEhBcV7eYQE/bnwZM0sxmFkJI6ZAu?=
 =?us-ascii?Q?BLloNLrzybNki6yg6ROlyt1CHIb3IDjXLGkrlr/T1fw3WzfNls3riuQv9x0e?=
 =?us-ascii?Q?/F08GnmMawjwqJnLcV/FjcvXeNNiWrstpiZo6TAQDpNRagF4G/Bpx2SjTCHz?=
 =?us-ascii?Q?XWmEclgh5oM9wdxvHcEyN4h0jKHRwR7fJeFiuttZkrssUETXsDhjTcp3Trc8?=
 =?us-ascii?Q?kfEln/geUmPbqcJxpuhwq8OIQMOrckuzGSYXg+ozRJ6y4TrNUQ5CBX2utSLy?=
 =?us-ascii?Q?s5zUq825ehIYnZTgEbfGkYRXd5XS+Z7bLlk44Hjax/vUGtnCq90ghhdlcsxt?=
 =?us-ascii?Q?CzM3Al5JtfH1qHDM4lyZiDTm7UouRDHY+EbrgvqXyoDHOiudD2FEimJYxJDe?=
 =?us-ascii?Q?GdzldjW84kT/zSJsZ4JrT82hF8Jvzg7zBVJQImg4G67bnssRWtkd?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e3efbb4b-1d30-456b-f906-08def46b6edd
X-MS-Exchange-CrossTenant-AuthSource: TYRPR01MB13588.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2026 10:05:39.5751
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nd6FqIGMYkrtF8+bIQvWY8Ox/zlw01kq4v1ZuD94nAGyvlCQubqZUgr7d6RzhXJvZIN1QWuSbmJbx5O+htzTdSCnsIJRaqaWA2t+NIejcV4lopGi0rDpFRhhjZkskGhk
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB12543

Hi Peter,
Thanks for your review.

On Fri, Aug 07, 2026 at 08:23:13AM +0200, Peter Rosin wrote:
> Hi!
> 
> Sorry for the late reply.
> 
> On 2026-07-15 12:12, Tommaso Merciai wrote:
> > As per the RZ/V2H(P) HW manual, VBUSEN can be controlled by the VBUS_SEL
> > bit of the VBENCTL Control Register. This register is mapped in the
> > reset framework. The reset driver expose this register as mux-controller
> > and instantiates this driver. The consumer will use the mux API to
> > control the VBUS_SEL bit.
> > 
> > Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
> > Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> > ---
> > v11->v12
> >  - No changes, just rebased on top of next-20260714
> > 
> > v10->v11:
> >  - No changes.
> > 
> > v9->v10:
> >  - No changes.
> > 
> > v8->v9:
> >  - Fixed driver comment year (2025 -> 2026)
> >  - Switch from devm_regmap_init_mmio() to dev_get_regmap().
> >  - Drop unnecessasry include bitops.h, of.h, property.h and
> >    drivers/reset/reset-rzv2h-usb2phy.h headers, driver is now based on regmap.
> >  - Collected PZabel tag.
> > 
> > v7->v8:
> >  - No changes.
> > 
> > v6->v7:
> >  - No changes.
> > 
> > v5->v6:
> >  - No changes.
> > 
> > v4->v5:
> >  - Changed file name to rzv2h-usb-vbenctl.c and Fixed
> >    Makefile, Kconfig, function names accordingly.
> >  - Changed driver .name to "vbenctl" and fix auxiliary_device_id name.
> >  - Updated commit msg.
> > 
> > v3->v4:
> >  - Removed mux_chip->dev.of_node not needed.
> > 
> > v2->v3:
> >  - Added mux_chip->dev.of_node = dev->of_node->child as the mux-controller
> >    is an internal node.
> >  - Fixed auxiliary_device_id name.
> >  - Get rdev using from platform_data.
> >  - Drop struct auxiliary_device adev from reset_rzv2h_usb2phy_adev
> >    as it is needed.
> >  - Drop to_reset_rzv2h_usb2phy_adev() as it is not needed.
> > 
> > v1->v2:
> >  - New patch
> > 
> >  drivers/mux/Kconfig             | 11 +++++
> >  drivers/mux/Makefile            |  2 +
> >  drivers/mux/rzv2h-usb-vbenctl.c | 85 +++++++++++++++++++++++++++++++++
> >  3 files changed, 98 insertions(+)
> >  create mode 100644 drivers/mux/rzv2h-usb-vbenctl.c
> > 
> > diff --git a/drivers/mux/Kconfig b/drivers/mux/Kconfig
> > index 6d17dfa25dad..7f334540c189 100644
> > --- a/drivers/mux/Kconfig
> > +++ b/drivers/mux/Kconfig
> > @@ -70,6 +70,17 @@ config MUX_MMIO
> >  	  To compile the driver as a module, choose M here: the module will
> >  	  be called mux-mmio.
> >  
> > +config MUX_RZV2H_USB_VBENCTL
> 
> Do we really need such a long name? Can we skip at least some part
> of it, e.g. "USB_"? I see little in this driver that relates to
> USB. And then propagate the shorter name to the file name and
> various identifiers of course. Please?

Ok we can go with:

	MUX_RZV2H_VBENCTL

Then propagating:

	rzv2h-vbenctl.c

And functions prefix:

	mux_rzv2h_vbenctl_*


I will do this in v13.


> 
> > +	tristate "Renesas RZ/V2H USB VBENCTL VBUS_SEL mux driver"
> > +	depends on RESET_RZV2H_USB2PHY || COMPILE_TEST
> > +	depends on OF
> 
> Why OF?

Good catch, will drop this in v13.

> 
> > +	select REGMAP
> > +	select AUXILIARY_BUS
> > +	default RESET_RZV2H_USB2PHY
> > +	help
> > +	  Support for USB VBENCTL VBUS_SEL mux implemented on Renesas
> > +	  RZ/V2H SoCs.
> 
> All the other drivers have a boilerplate "module paragraph" here:
> 
> 	  To compile the driver as a module, choose M here: the module will
> 	  be called mux-<gazonk>.
> 
> I see no reason to exclude it here.

Will add this section in v13.

> 
> > +
> >  endmenu
> >  
> >  endif # MULTIPLEXER
> > diff --git a/drivers/mux/Makefile b/drivers/mux/Makefile
> > index 6e9fa47daf56..3bd9b3846835 100644
> > --- a/drivers/mux/Makefile
> > +++ b/drivers/mux/Makefile
> > @@ -8,9 +8,11 @@ mux-adg792a-objs		:= adg792a.o
> >  mux-adgs1408-objs		:= adgs1408.o
> >  mux-gpio-objs			:= gpio.o
> >  mux-mmio-objs			:= mmio.o
> > +mux-rzv2h-usb-vbenctl-objs	:= rzv2h-usb-vbenctl.o
> >  
> >  obj-$(CONFIG_MULTIPLEXER)	+= mux-core.o
> >  obj-$(CONFIG_MUX_ADG792A)	+= mux-adg792a.o
> >  obj-$(CONFIG_MUX_ADGS1408)	+= mux-adgs1408.o
> >  obj-$(CONFIG_MUX_GPIO)		+= mux-gpio.o
> >  obj-$(CONFIG_MUX_MMIO)		+= mux-mmio.o
> > +obj-$(CONFIG_MUX_RZV2H_USB_VBENCTL)	+= mux-rzv2h-usb-vbenctl.o
> > diff --git a/drivers/mux/rzv2h-usb-vbenctl.c b/drivers/mux/rzv2h-usb-vbenctl.c
> > new file mode 100644
> > index 000000000000..79197fddbf74
> > --- /dev/null
> > +++ b/drivers/mux/rzv2h-usb-vbenctl.c
> > @@ -0,0 +1,85 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Renesas RZ/V2H(P) USB VBENCTL VBUS_SEL mux driver
> > + *
> > + * Copyright (C) 2026 Renesas Electronics Corp.
> > + */
> > +
> > +#include <linux/auxiliary_bus.h>
> > +#include <linux/err.h>
> > +#include <linux/module.h>
> > +#include <linux/mux/driver.h>
> > +#include <linux/regmap.h>
> > +
> > +#define RZV2H_VBENCTL		0xf0c
> > +
> > +struct mux_rzv2h_usb_vbenctl_priv {
> > +	struct regmap_field *field;
> > +};
> > +
> > +static int mux_rzv2h_usb_vbenctl_set(struct mux_control *mux, int state)
> > +{
> > +	struct mux_rzv2h_usb_vbenctl_priv *priv = mux_chip_priv(mux->chip);
> > +
> > +	return regmap_field_write(priv->field, state);
> > +}
> > +
> > +static const struct mux_control_ops mux_rzv2h_usb_vbenctl_ops = {
> > +	.set = mux_rzv2h_usb_vbenctl_set,
> > +};
> > +
> > +static int mux_rzv2h_usb_vbenctl_probe(struct auxiliary_device *adev,
> > +				       const struct auxiliary_device_id *id)
> > +{
> > +	struct mux_rzv2h_usb_vbenctl_priv *priv;
> > +	struct device *dev = &adev->dev;
> > +	struct mux_chip *mux_chip;
> > +	struct regmap *regmap;
> > +	struct reg_field reg_field = {
> > +		.reg = RZV2H_VBENCTL,
> > +		.lsb = 0,
> > +		.msb = 0,
> > +	};
> 
> Perhaps
> 
> 	struct reg_field reg_field = REG_FIELD(RZV2H_VBENCTL, 0, 0);

Ok will use this in v13.

> 
> > +	int ret;
> > +
> > +	regmap = dev_get_regmap(adev->dev.parent, NULL);
> 
> Perhaps
> 
> 	regmap = dev_get_regmap(dev->parent, NULL);

Ok, will use this in v13.


> 
> > +	if (!regmap)
> > +		return -ENODEV;
> > +
> > +	mux_chip = devm_mux_chip_alloc(dev, 1, sizeof(*priv));
> > +	if (IS_ERR(mux_chip))
> > +		return PTR_ERR(mux_chip);
> > +
> > +	priv = mux_chip_priv(mux_chip);
> > +
> > +	priv->field = devm_regmap_field_alloc(dev, regmap, reg_field);
> > +	if (IS_ERR(priv->field))
> > +		return PTR_ERR(priv->field);
> > +
> > +	mux_chip->ops = &mux_rzv2h_usb_vbenctl_ops;
> > +	mux_chip->mux[0].states = 2;
> > +	mux_chip->mux[0].idle_state = MUX_IDLE_AS_IS;
> > +
> > +	ret = devm_mux_chip_register(dev, mux_chip);
> > +	if (ret < 0)
> > +		return dev_err_probe(dev, ret, "Failed to register mux chip\n");
> > +
> > +	return 0;
> > +}
> > +
> > +static const struct auxiliary_device_id mux_rzv2h_usb_vbenctl_ids[] = {
> > +	{ .name = "rzv2h_usb2phy_reset.vbenctl" },
> > +	{ /* sentinel */ }
> > +};
> > +MODULE_DEVICE_TABLE(auxiliary, mux_rzv2h_usb_vbenctl_ids);
> > +
> > +static struct auxiliary_driver mux_rzv2h_usb_vbenctl_driver = {
> > +	.name		= "vbenctl",
> > +	.probe		= mux_rzv2h_usb_vbenctl_probe,
> > +	.id_table	= mux_rzv2h_usb_vbenctl_ids,
> > +};
> > +module_auxiliary_driver(mux_rzv2h_usb_vbenctl_driver);
> > +
> 
> I'm not previously familiar with the auxiliary bus. When I read about
> it I find this:
> 
> 	"A key requirement for utilizing the auxiliary bus is that
> 	there is no dependency on a physical bus, device, register
> 	accesses or regmap support."
> 
> That seems to contradict this driver with its dependency on regmap,
> thus violating the above key requirement?

I'm seeing a very close pattern in [1]. clk-imx8ulp-sim-lpav.c create a
regmap for its auxiliary reset and mux driver. 

The parent driver is creating the axuiliary device in [2], this create
"clk_imx8ulp_sim_lpav.reset".

Then later reset-imx8mp-audiomix.c into
imx8mp_audiomix_reset_get_regmap() [3] take the rgmap from the parent.

Also reset-meson-aux.c [4] is aux device and is taking the regmap
from the parent.

IMHO the doc paragraph share why such a device can't be a platform
device or an MFD, matching on the auxiliary bus is a plain
string compare, so no register access is involved in match or bind.

[1] https://elixir.bootlin.com/linux/v7.2-rc6/source/drivers/clk/imx/clk-imx8ulp-sim-lpav.c#L95
[2] https://elixir.bootlin.com/linux/v7.2-rc6/source/drivers/clk/imx/clk-imx8ulp-sim-lpav.c#L123
[3] https://elixir.bootlin.com/linux/v7.2-rc6/source/drivers/reset/reset-imx8mp-audiomix.c#L162
[4] https://elixir.bootlin.com/linux/v7.2-rc6/source/drivers/reset/amlogic/reset-meson-aux.c#L65


Kind regards,
Tommaso

> 
> Cheers,
> Peter
> 
> > +MODULE_DESCRIPTION("RZ/V2H USB VBENCTL VBUS_SEL mux driver");
> > +MODULE_AUTHOR("Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>");
> > +MODULE_LICENSE("GPL");
> 
