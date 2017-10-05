Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail.free-electrons.com ([62.4.15.54]:33930 "EHLO
        mail.free-electrons.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751278AbdJEHYo (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 5 Oct 2017 03:24:44 -0400
Date: Thu, 5 Oct 2017 09:24:42 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Richard Weinberger <richard@nod.at>,
        David Woodhouse <dwmw2@infradead.org>,
        Brian Norris <computersforpeace@gmail.com>,
        Marek Vasut <marek.vasut@gmail.com>,
        Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
        linux-mtd@lists.infradead.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] mtd: nand: sh_flctl: Use of_device_get_match_data()
 helper
Message-ID: <20171005092442.5126afcb@bbrezillon>
In-Reply-To: <1507119543-12723-1-git-send-email-geert+renesas@glider.be>
References: <1507119543-12723-1-git-send-email-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed,  4 Oct 2017 14:19:03 +0200
Geert Uytterhoeven <geert+renesas@glider.be> wrote:

> Use the of_device_get_match_data() helper instead of open coding.
> While at it, make config const so the cast can be dropped.
> 

Applied.

Thanks,

Boris

> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  drivers/mtd/nand/sh_flctl.c | 9 +++------
>  1 file changed, 3 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/mtd/nand/sh_flctl.c b/drivers/mtd/nand/sh_flctl.c
> index e7f3c98487e620bc..3c5008a4f5f33acc 100644
> --- a/drivers/mtd/nand/sh_flctl.c
> +++ b/drivers/mtd/nand/sh_flctl.c
> @@ -1094,14 +1094,11 @@ MODULE_DEVICE_TABLE(of, of_flctl_match);
>  
>  static struct sh_flctl_platform_data *flctl_parse_dt(struct device *dev)
>  {
> -	const struct of_device_id *match;
> -	struct flctl_soc_config *config;
> +	const struct flctl_soc_config *config;
>  	struct sh_flctl_platform_data *pdata;
>  
> -	match = of_match_device(of_flctl_match, dev);
> -	if (match)
> -		config = (struct flctl_soc_config *)match->data;
> -	else {
> +	config = of_device_get_match_data(dev);
> +	if (!config) {
>  		dev_err(dev, "%s: no OF configuration attached\n", __func__);
>  		return NULL;
>  	}
