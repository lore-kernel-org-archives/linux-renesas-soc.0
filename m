Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f68.google.com ([209.85.215.68]:40441 "EHLO
        mail-lf0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751034AbeBIPeo (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 9 Feb 2018 10:34:44 -0500
Received: by mail-lf0-f68.google.com with SMTP id i24so8627201lfc.7
        for <linux-renesas-soc@vger.kernel.org>; Fri, 09 Feb 2018 07:34:43 -0800 (PST)
Date: Fri, 9 Feb 2018 16:34:41 +0100
From: Niklas =?iso-8859-1?Q?S=F6derlund?=
        <niklas.soderlund@ragnatech.se>
To: Kieran Bingham <kbingham@kernel.org>
Cc: Kieran Bingham <kieran.bingham@ideasonboard.com>,
        linux-renesas-soc@vger.kernel.org, linux-media@vger.kernel.org,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] media: i2c: adv748x: Fix cleanup jump on chip
 identification
Message-ID: <20180209153441.GD7666@bigcity.dyn.berto.se>
References: <1518037895-10921-1-git-send-email-kbingham@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1518037895-10921-1-git-send-email-kbingham@kernel.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Kieran,

Thanks for your patch.

On 2018-02-07 21:11:35 +0000, Kieran Bingham wrote:
> From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> 
> The error handling for the adv748x_identify_chip() call erroneously
> jumps to the err_cleanup_clients label before the clients have been
> established.
> 
> Correct this by jumping to the next (and correct) label in the cleanup
> code: err_cleanup_dt.
> 
> Fixes: 3e89586a64df ("media: i2c: adv748x: add adv748x driver")
> 
> Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

Reviewed-by: Niklas S�derlund <niklas.soderlund+renesas@ragnatech.se>

> ---
>  drivers/media/i2c/adv748x/adv748x-core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/i2c/adv748x/adv748x-core.c b/drivers/media/i2c/adv748x/adv748x-core.c
> index 6d62b817ed00..6ccaad7e9eca 100644
> --- a/drivers/media/i2c/adv748x/adv748x-core.c
> +++ b/drivers/media/i2c/adv748x/adv748x-core.c
> @@ -651,7 +651,7 @@ static int adv748x_probe(struct i2c_client *client,
>  	ret = adv748x_identify_chip(state);
>  	if (ret) {
>  		adv_err(state, "Failed to identify chip");
> -		goto err_cleanup_clients;
> +		goto err_cleanup_dt;
>  	}
>  
>  	/* Configure remaining pages as I2C clients with regmap access */
> -- 
> 2.7.4
> 

-- 
Regards,
Niklas S�derlund
