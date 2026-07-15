Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013062.outbound.protection.outlook.com [52.101.83.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EDF4282F25;
	Wed, 15 Jul 2026 16:54:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784134486; cv=fail; b=e/LrWzt2J5bYnW6hJzOjnTqakXvMO86kLx2P+AAncXyjRNkibuWVTrTq9bH35TarBNfxRcsWPTEEgMAoRER5lqAIBoKMazzdPGSLKSPpz466amluog4Zz9c020zkVpZuFY5auf9G0eJv0Xzis1nA9DwHAngc84OeYO2QRyPluaU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784134486; c=relaxed/simple;
	bh=D9EMq1VqfYKij3K2tfvF3rKQI7BHLMuilpkYYgVGud8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Gk/aCCfdWjLOJY399+p8duz0VX4SCmUHLnaTttQLjOKzrNRRbXlhsJOX94Gqr1kE31ih6eLyVlzxDdkDVxNkxm2a4iO71z7zQutSLFTS4vZ0+Mrml4TnLqzpLB6/pCQGGlYY65ROxslMHiCoAOfm5oBhCnm2Wvz9AvODFz6+lTw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=kLlH55Dm; arc=fail smtp.client-ip=52.101.83.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="kLlH55Dm"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Jcf/t1nAIpANs8+JmyJwAG0DqcT+VMHrz67W2sTIl0WbsTEx2yMuNz/f/ojduIwA57ws2MBVbHNHSxXacr+EOs3dSiz4UDfbCZjuybg7Neem8NWuRPaQhLLO4sHpSUgV3zMEbUpDqgWZo56BfhC8bWpmPESp1kM0/j+9iLcMDV04wouDo4balUf3bmNOCEKFuzz0TegaJyYxbteDmdf5602qmDU6pJueV25NI/Ys1DsfRStFSrzB7nGp83Yd44NpFvYaiXmJ+bRM3BRU0qHuq5mbW11HPPoIKtSJfuCo9CUQofEvIYCf7JmbjQuD3Pn32CmJbU3fiPK+Pq/ndwHRgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Eoa8MkDPp8ssx13FiVVkWSS1PweQhxGXHFbD/yoq83w=;
 b=bdptgWz860wG+ZxjvPzqQzpAp5ykdcOZ/tBDD9lLHNc8ACRljvG3x/Q+HPUrm/aUteUrWAd+iX1WMHc3qXRSjVQE6hOvmVgRnbKXZNJJKeS0F7u+7lkU4M7hyCrsivwy2ojQ7f1kXQNZy0Lm5ZjJHac+HaTn7auhTqLswnSGF+Knh4gHqbMFtNKn1nlSpSScnaSNUYXedbcORv1XKG2HKZbsZYiYppQA4atZfA8GziCSygqyzllu2FwIuO5eb561F5fxh+LVbQSu7+bDBxSMb115uJyhhXI9KX54jN/ssmGaOgkKCnrTQM2esFcSEzWGCqmXH1J3+tJyQhExdTjTbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Eoa8MkDPp8ssx13FiVVkWSS1PweQhxGXHFbD/yoq83w=;
 b=kLlH55Dm/4BiNZcAguZf6zmEhQq9vkEG0hRM+68VFIPdRHXVXIpp5Iz1PHVSGQXcJ7r8QMHNsRrOyLdHcz5+VzmDRvQfJxUs3LohO7PdbD76E4Y7C7OWaV+W5N6NnfHxdRY4ezWE8/xa/hoGPMMKhR0Ri4xJtw+j0/FSKW6WRaj9bUp2Oil5hEKw+DZC8LEsgMbjBZK0CoIWL3bsCJMjdLfpD5km5RxHpG+c6krxCm2rSWrvAVtl4ths/0nw4yB07UtjZ/ME02d9sSSWsBkm3FV7EKwBzUwKfX077KsWrGVqBzW1IdQcGPdnzYLS5SKMJgOMZnoRjEn84ooQXoxu/g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AS1PR04MB9479.eurprd04.prod.outlook.com (2603:10a6:20b:4d7::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.9; Wed, 15 Jul
 2026 16:54:41 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0202.018; Wed, 15 Jul 2026
 16:54:41 +0000
Date: Wed, 15 Jul 2026 12:54:33 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: wsa+renesas@sang-engineering.com, tommaso.merciai.xr@bp.renesas.com,
	alexandre.belloni@bootlin.com, Frank.Li@nxp.com,
	p.zabel@pengutronix.de, linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: Re: [PATCH v5 17/17] i3c: renesas: Add runtime PM support
Message-ID: <ale7SS4VZ8aIwhJ3@lizhi-Precision-Tower-5810>
References: <20260713130545.568657-1-claudiu.beznea+renesas@tuxon.dev>
 <20260713130545.568657-18-claudiu.beznea+renesas@tuxon.dev>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260713130545.568657-18-claudiu.beznea+renesas@tuxon.dev>
X-ClientProxiedBy: SN7PR04CA0011.namprd04.prod.outlook.com
 (2603:10b6:806:f2::16) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AS1PR04MB9479:EE_
X-MS-Office365-Filtering-Correlation-Id: 103f712b-bc32-4ac9-f59e-08dee291c377
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|23010399003|19092799006|56012099006|11063799006|4143699003|10067099003|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	TfJV1ObkXrVgwJn4pYw0LJm1O+PEnPSiWd+5Fmb+gMlrCoioXCnSeVWAn8Ut6fPlq+whGlIsBEvxziZbkIgX5G/T23eYSw0ehtezvltG6ODU9FdcYVnRmc+05JBRRGMYsd9ufdNjunHcvKYDgDFakpsM/btXpxME6DT7esR+on7rsRIr1frVH0dQO1SSUMHnjT6kOZa247WdmxHbxMil+O0ucH/BCt/L2rsp7qZ8F3Y0EdwRTYRUJlmix8IKgujIVq1NvnIOqMuUjR8OCAEAeekXRzyHqFS3hfYPnMVlgqZktJog/Vq6wl4WZzXoSDp3ABa2R/oNjKcO9S/NgwemUwlyqLTHCg+cbQbGiEjYnV2+tNhOLIAQYYLrVGHuMAxVUObPNHysgHRk8kKiVeqoqWfSZuHnUoj5aWrRGB7HErF6ayOA8QnfryCn/VqXqHK3FpGlu+0Mv8IPzWKqi+cFNK0Wy1iF7tTnfwHJvWcSNgZKGIOzzWPdfJXrgBvCZwr/T/aFAFfxz4PDN9qQl+K1mViQ/cDCehsKOGm+sKGcZOJwz/cOodm+Duwi7HyshrNKuNmwsiHxxK9VClDFu21enHbaxjXyYW9n6BABAissnLl4po/E+Ndg0A7uNV1Jc/Ib9xXNP4lJHbmNLTwuJAtM4mK61QQnl+9juWCn3+QufS0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(19092799006)(56012099006)(11063799006)(4143699003)(10067099003)(6133799003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?K32GT+W7DhmFW3+5vEWM6n3BQcu4nRwnGs9tJdaBYMxfTmv5W8LDEGIloXop?=
 =?us-ascii?Q?8GuSo0954xt6BNlEY7/m6Wdo1nVvZ/LuaSJlPrEMmFnaYMCoDD2ebbGWRFfp?=
 =?us-ascii?Q?WrxpC0g+As5Y7+lhvSzbE/QbGi5Z71GuTC+CkeEWnQkPJS1Ivb38RDqLhVw8?=
 =?us-ascii?Q?Yje+jwAaazQKWKA2XZw/6X4a/lissQ/02KIgbi6naU/2P0Bp0jIp0qMimCEy?=
 =?us-ascii?Q?LroyseJNkw77TzX1K5sbgCLSkenDeojFblY8K200pJo31/e/8fpZeJXpeAr1?=
 =?us-ascii?Q?yFMEr02JLYy5VAKX3ygcA/otkzf2ytrVwGB785/TZU+2bz6q9WfoSEVYdUXP?=
 =?us-ascii?Q?tolxRzSnJRIK4+jTCRQCu5Cz+cCKA3JZeGxhPliqumNLiNJLDTZq4sKVsZrF?=
 =?us-ascii?Q?0timFqbjC8Oaq8BkmMVkb+xSqyVzyGK1wd/UG5PRxlY0KWGhpom2+dT91rQY?=
 =?us-ascii?Q?709NrHu16q1PdHwtsoKTe/zYnQJRITf0dfoajqeZylB1XaDzOMz5y7aC7Z0O?=
 =?us-ascii?Q?S87elst1OGHus3AbTJ5T+XujO19/xCz+OyO+HfLaAJtd7CeGGyOSSGjPAfHz?=
 =?us-ascii?Q?ktkjSj5wvfee2UdE/hamMdFHfry6lGLt4Slg+sUQBdZOGRE2vbtWMPAkgjCV?=
 =?us-ascii?Q?T8o4BP8igPlZXnvUCO4JDNmdZvCHogLLNvkuInRUMEqkPgtvX+TLJSVfZALe?=
 =?us-ascii?Q?F6h4QanCphafNSSosTJfF7sWXmNN0UMzH6/uZBussmnjyn5hMchcs9HUvd0M?=
 =?us-ascii?Q?5PrfuhuuC5hzIvK98zo6dZPaN9KnKahs/wvV22fueqFy6IBMvuC1441PaP3u?=
 =?us-ascii?Q?eK6c1OgDLaXla/U6CQUVYK4ARW24A9ckCIFaafAKjk0eSDqNx3PQfqreHRKr?=
 =?us-ascii?Q?hQDcOdr9/P5M8uEro4eSgg37m6DaCKSWVyHY1+s7sz1XdxvD7egSXYvZn0Bh?=
 =?us-ascii?Q?yPNSjl7B0zbcl5ypfp1+OlAqtLy7wzoOQnLXTllutegjKWSFYfHq6n+dHAPP?=
 =?us-ascii?Q?+5Lc7gu31S13a1tUhhSaPPt0QJj4kSVg+vVoieP9y9wrgkWaDUbP3HZdxxsp?=
 =?us-ascii?Q?29fb9gOoHt2wog56a84Du27NzaV0RiUphbEPT63CRJY5AA/OgPZGpmkT/Gr8?=
 =?us-ascii?Q?PI7I36vJiNOryFrVMblG7A8Z7PE1bBjj5c+6MAhDUEBMhdDsMF9X9slVayFT?=
 =?us-ascii?Q?eSg7ackO77UsJYS/WtZDGHqY7fqr2MbI/4trXv9RziyfNgpwvvuEyEvufQGH?=
 =?us-ascii?Q?68OzrxAHSQwaceZjKjajQIStTPuxi8ybmVKj3hwzLVXso2bcuN0+AMn7d0q1?=
 =?us-ascii?Q?3rgSdVJTSktQfI8smfxBdloqfNqRjxcTepsKIVqaUXh7zZIY7EbjShcdtbcM?=
 =?us-ascii?Q?cJ2w5hTjgX1L9pkT5dV7jV2kPWctsIkweF+gNPzDyNbuHKkB5DU2kq/HzcSs?=
 =?us-ascii?Q?o0O/adS2Z16Ah/tP17qk5vwW3gyvS5KUx2pcp4rdi7G1cddejj+3Jw9uXNOG?=
 =?us-ascii?Q?+RmbXMcolwPN7BoMyhAy98WvVDC2Sj3NyjN1xVyr2oFdYzWessred5EgFIlD?=
 =?us-ascii?Q?UH0q2eEPWQpg9wTl0L8HAxGYdqo79GQwdVqOcerOrZe2RBPldrsOuL5vX5BL?=
 =?us-ascii?Q?DU4Z2kpa6nuHFfnqw/2hLeqhzVtsy8wPZtWpKKgzG39irTuY3EvNCv0792/S?=
 =?us-ascii?Q?qorrdNFducGoVNFDgmpZteMZcwEJ+W+HJCMiWn0vlUCGlkL6UznOnpAvJqkH?=
 =?us-ascii?Q?wYuvQ+f5NbayPI0KL3uIz6gF8nKes/gLOd2rDkgwoxEIjC2q3HMS?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 103f712b-bc32-4ac9-f59e-08dee291c377
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2026 16:54:41.2908
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: D4h2hwZcoOfRfRBz4GXkc8XyXTHzYKPbamFew8JUP/AQqT1oUqQg4V98A03s1Xvss4+9HC4kLLRh7LqzPPmOo94TuxOAPZr2m3eA0BHWVKzm3EbGkCXOIQVVsR0nG0zQ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9479

On Mon, Jul 13, 2026 at 04:05:45PM +0300, Claudiu Beznea wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> On the SoCs where the Renesas I3C driver is enabled (RZ/G3S and RZ/G3E),
> the clocks of the IP are managed through a clock PM domain. To keep the
> I3C code simpler, the explicit clock handling was dropped along with the
> addition of runtime PM support, in favor of the runtime PM APIs. Only the
> code for getting tclk was preserved, as it is necessary to compute the
> I3C clock rate.
>
> All the APIs provided to the I3C subsystem through struct
> i3c_master_controller_ops are guarded with runtime PM APIs to
> enable/disable the controller at runtime.
>
> As the Renesas I3C driver implements an asynchronous transmit model by
> preparing a transfer and waiting for its completion through the ISR,
> renesas_i3c_abort_xfer() was added to disable interrupts and clear any
> pending IRQ status bits when there is no completion in the defined
> timeout. Along with this, renesas_i3c_wait_xfer() return type was changed
> to unsigned long.
>
> Add runtime PM support for the Renesas I3C driver.
>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> ---
>
> Changes in v5:
> - updated renesas_i3c_irqs_mask_and_clear() to use the
>   renesas_i3c_irqs_mask_and_clear_locked() introduced in patch 1 from
>   this series
>
> Changes in v4:
> - renamed renesas_i3c_abort_xfer() from v3 to
>   renesas_i3c_irqs_mask_and_clear(); along with it renamed local varibles
>   abort_xfer to xfer_failed
>
> Changes in v3:
> - dropped the RPM resume/suspend in renesas_i3c_suspend() to read the
>   DATBASn registers as the DATBASn register are not used on suspend/resume
>   path anymore in this version
>
> Changes in v2:
> - dropped the runtime suspend/resume functions as for now, there will be
>   no pinctrl sleep state described in DT
> - do not synchronize the IRQs in renesas_i3c_abort_xfer() as some handlers
>   may re-enable interrupts; instead just disable the interrupts and clean
>   any status bits that the IRQ handlers are touching; with this the
>   struct renesas_i3c::{irqs, num_irqs} and the associated code was removed
> - dropped the renesas_i3c_dont_use_autosuspend() along with the
>   devm_add_action_or_reset() call to set it since the same operation is
>   done by the devres cleanup helper of devm_pm_runtime_enable()
> - adjusted the renesas_i3c_suspend() with RPM calls to save the DATBAS
>   registers
> - use pm_runtime_resume_and_get() in renesas_i3c_resume() to avoid
>   mixing gotos with cleanup helpers
> - adjusted the patch description to reflect these changes
>
...
>
> @@ -1384,12 +1458,16 @@ static int renesas_i3c_probe(struct platform_device *pdev)
>  	if (IS_ERR(i3c->regs))
>  		return PTR_ERR(i3c->regs);
>
> -	ret = devm_clk_bulk_get_all_enabled(&pdev->dev, &i3c->clks);
> -	if (ret <= RENESAS_I3C_TCLK_IDX)
> -		return dev_err_probe(&pdev->dev, ret < 0 ? ret : -EINVAL,
> -				     "Failed to get clocks (need > %d, got %d)\n",
> -				     RENESAS_I3C_TCLK_IDX, ret);
> -	i3c->num_clks = ret;
> +	i3c->tclk = devm_clk_get(&pdev->dev, "tclk");

only one tclk? you remove devm_clk_bulk_get_all_enabled()

Frank
