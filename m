Return-Path: <SRS0=L5iE=S4=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 440AEC43218
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 26 Apr 2019 09:29:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 12BEB2077B
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 26 Apr 2019 09:29:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725971AbfDZJ3I (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 26 Apr 2019 05:29:08 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:44054 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725985AbfDZJ3I (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 26 Apr 2019 05:29:08 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 8CD4925AEA8;
        Fri, 26 Apr 2019 19:29:06 +1000 (AEST)
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id C26669403ED; Fri, 26 Apr 2019 11:29:03 +0200 (CEST)
Date:   Fri, 26 Apr 2019 11:29:03 +0200
From:   Simon Horman <horms@verge.net.au>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH 2/4] pinctrl: sh-pfc: Mark run-time debug code __init
Message-ID: <20190426092903.26etzdv2lylb5jcb@verge.net.au>
References: <20190425095542.726-1-geert+renesas@glider.be>
 <20190425095542.726-3-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190425095542.726-3-geert+renesas@glider.be>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Apr 25, 2019 at 11:55:40AM +0200, Geert Uytterhoeven wrote:
> All run-time debug code is called from sh_pfc_init(), which is __init.
> 
> Fixes: 6161b39a14380815 ("pinctrl: sh-pfc: Validate pinmux tables at runtime when debugging")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

> ---
>  drivers/pinctrl/sh-pfc/core.c | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/pinctrl/sh-pfc/core.c b/drivers/pinctrl/sh-pfc/core.c
> index 18d7f6d9402093d4..868b9551438efb0a 100644
> --- a/drivers/pinctrl/sh-pfc/core.c
> +++ b/drivers/pinctrl/sh-pfc/core.c
> @@ -717,7 +717,7 @@ static int sh_pfc_suspend_init(struct sh_pfc *pfc) { return 0; }
>  #endif /* CONFIG_PM_SLEEP && CONFIG_ARM_PSCI_FW */
>  
>  #ifdef DEBUG
> -static bool is0s(const u16 *enum_ids, unsigned int n)
> +static bool __init is0s(const u16 *enum_ids, unsigned int n)
>  {
>  	unsigned int i;
>  
> @@ -728,11 +728,11 @@ static bool is0s(const u16 *enum_ids, unsigned int n)
>  	return true;
>  }
>  
> -static unsigned int sh_pfc_errors;
> -static unsigned int sh_pfc_warnings;
> +static unsigned int sh_pfc_errors __initdata = 0;
> +static unsigned int sh_pfc_warnings __initdata = 0;
>  
> -static void sh_pfc_check_cfg_reg(const char *drvname,
> -				 const struct pinmux_cfg_reg *cfg_reg)
> +static void __init sh_pfc_check_cfg_reg(const char *drvname,
> +					const struct pinmux_cfg_reg *cfg_reg)
>  {
>  	unsigned int i, n, rw, fw;
>  
> @@ -764,7 +764,7 @@ static void sh_pfc_check_cfg_reg(const char *drvname,
>  	}
>  }
>  
> -static void sh_pfc_check_info(const struct sh_pfc_soc_info *info)
> +static void __init sh_pfc_check_info(const struct sh_pfc_soc_info *info)
>  {
>  	const struct sh_pfc_function *func;
>  	const char *drvname = info->name;
> @@ -816,7 +816,7 @@ static void sh_pfc_check_info(const struct sh_pfc_soc_info *info)
>  		sh_pfc_check_cfg_reg(drvname, &info->cfg_regs[i]);
>  }
>  
> -static void sh_pfc_check_driver(const struct platform_driver *pdrv)
> +static void __init sh_pfc_check_driver(const struct platform_driver *pdrv)
>  {
>  	unsigned int i;
>  
> -- 
> 2.17.1
> 
