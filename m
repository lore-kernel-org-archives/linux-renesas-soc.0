Return-Path: <SRS0=L5iE=S4=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 275CFC43219
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 26 Apr 2019 09:21:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E751620679
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 26 Apr 2019 09:21:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725877AbfDZJVq (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 26 Apr 2019 05:21:46 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:43632 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725800AbfDZJVq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 26 Apr 2019 05:21:46 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id A516A25AEA8;
        Fri, 26 Apr 2019 19:21:43 +1000 (AEST)
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 783DF9403ED; Fri, 26 Apr 2019 11:21:39 +0200 (CEST)
Date:   Fri, 26 Apr 2019 11:21:39 +0200
From:   Simon Horman <horms@verge.net.au>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH 1/4] pinctrl: sh-pfc: Correct printk level of group
 referral warning
Message-ID: <20190426092139.5mwjtmm5fnpek6bb@verge.net.au>
References: <20190425095542.726-1-geert+renesas@glider.be>
 <20190425095542.726-2-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190425095542.726-2-geert+renesas@glider.be>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Apr 25, 2019 at 11:55:39AM +0200, Geert Uytterhoeven wrote:
> Fixes: 6161b39a14380815 ("pinctrl: sh-pfc: Validate pinmux tables at runtime when debugging")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

This looks good to me

Reviewed-by: Simon Horman <simon.horman@netronome.com>

But I do wonder if "referred" should be "referenced"

> ---
>  drivers/pinctrl/sh-pfc/core.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/pinctrl/sh-pfc/core.c b/drivers/pinctrl/sh-pfc/core.c
> index 3f989f5cb021ecbc..18d7f6d9402093d4 100644
> --- a/drivers/pinctrl/sh-pfc/core.c
> +++ b/drivers/pinctrl/sh-pfc/core.c
> @@ -803,8 +803,8 @@ static void sh_pfc_check_info(const struct sh_pfc_soc_info *info)
>  			       info->groups[i].name);
>  			sh_pfc_errors++;
>  		} else if (refcnts[i] > 1) {
> -			pr_err("%s: group %s referred by %u functions\n",
> -			       drvname, info->groups[i].name, refcnts[i]);
> +			pr_warn("%s: group %s referred by %u functions\n",
> +				drvname, info->groups[i].name, refcnts[i]);
>  			sh_pfc_warnings++;
>  		}
>  	}
> -- 
> 2.17.1
> 
