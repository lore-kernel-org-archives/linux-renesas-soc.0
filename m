Return-Path: <SRS0=L5iE=S4=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69AC9C43218
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 26 Apr 2019 09:34:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 47B422077B
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 26 Apr 2019 09:34:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725995AbfDZJe6 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 26 Apr 2019 05:34:58 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:44302 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725901AbfDZJe6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 26 Apr 2019 05:34:58 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id CE7F725AEA8;
        Fri, 26 Apr 2019 19:34:56 +1000 (AEST)
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id D8C339403ED; Fri, 26 Apr 2019 11:34:54 +0200 (CEST)
Date:   Fri, 26 Apr 2019 11:34:54 +0200
From:   Simon Horman <horms@verge.net.au>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH 3/4] pinctrl: sh-pfc: Add check for empty pinmux
 groups/functions
Message-ID: <20190426093454.pvmc426w5wca2jj3@verge.net.au>
References: <20190425095542.726-1-geert+renesas@glider.be>
 <20190425095542.726-4-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190425095542.726-4-geert+renesas@glider.be>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Apr 25, 2019 at 11:55:41AM +0200, Geert Uytterhoeven wrote:
> The pinmux groups and functions arrays may contain two parts, to ease
> supporting SoCs that expose pin subsets of other related SoCs.  Both
> parts need to be declared with explicit sizes, which thus need to be
> updated when adding support for more groups and functions.
> 
> If a size is too small, the compiler will detect this at build time
> ("excess elements in array initializer").
> If a size is too large, this may go undetected (for pin groups), lead to
> pin controller registration failures (for pin functions: "pinmux ops has
> no name for functionN"), or crash the optional run-time debug code (for
> pin groups).
> 
> Extend the run-time debug code with checks to detect this, to help
> catching bugs early.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

> ---
>  drivers/pinctrl/sh-pfc/core.c | 13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/pinctrl/sh-pfc/core.c b/drivers/pinctrl/sh-pfc/core.c
> index 868b9551438efb0a..889e5af281022e1d 100644
> --- a/drivers/pinctrl/sh-pfc/core.c
> +++ b/drivers/pinctrl/sh-pfc/core.c
> @@ -780,9 +780,15 @@ static void __init sh_pfc_check_info(const struct sh_pfc_soc_info *info)
>  
>  	for (i = 0; i < info->nr_functions; i++) {
>  		func = &info->functions[i];
> +		if (!func->name) {
> +			pr_err("%s: empty function %u\n", drvname, i);
> +			sh_pfc_errors++;

Not strictly related to this patch but did
you consider not having sh_pfc_errors global to this file?

> +			continue;
> +		}
>  		for (j = 0; j < func->nr_groups; j++) {
>  			for (k = 0; k < info->nr_groups; k++) {
> -				if (!strcmp(func->groups[j],
> +				if (info->groups[k].name &&
> +				    !strcmp(func->groups[j],
>  					    info->groups[k].name)) {
>  					refcnts[k]++;
>  					break;
> @@ -798,6 +804,11 @@ static void __init sh_pfc_check_info(const struct sh_pfc_soc_info *info)
>  	}
>  
>  	for (i = 0; i < info->nr_groups; i++) {
> +		if (!info->groups[i].name) {
> +			pr_err("%s: empty group %u\n", drvname, i);
> +			sh_pfc_errors++;
> +			continue;
> +		}
>  		if (!refcnts[i]) {
>  			pr_err("%s: orphan group %s\n", drvname,
>  			       info->groups[i].name);
> -- 
> 2.17.1
> 
