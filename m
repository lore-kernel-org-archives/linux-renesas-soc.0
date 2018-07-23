Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lj1-f196.google.com ([209.85.208.196]:43014 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388087AbeGWV5M (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 23 Jul 2018 17:57:12 -0400
Received: by mail-lj1-f196.google.com with SMTP id r13-v6so1707085ljg.10
        for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Jul 2018 13:54:12 -0700 (PDT)
Date: Mon, 23 Jul 2018 22:54:10 +0200
From: Niklas =?iso-8859-1?Q?S=F6derlund?=
        <niklas.soderlund@ragnatech.se>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-i2c@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 12/12] i2c: sh_mobile: use core to detect 'no zero length
 read' quirk
Message-ID: <20180723205410.GI1432@bigcity.dyn.berto.se>
References: <20180723202617.15230-1-wsa+renesas@sang-engineering.com>
 <20180723202617.15230-13-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20180723202617.15230-13-wsa+renesas@sang-engineering.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Wolfram,

Thanks for your work.

On 2018-07-23 22:26:16 +0200, Wolfram Sang wrote:
> And don't reimplement in the driver.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Niklas S�derlund <niklas.soderlund+renesas@ragnatech.se>

> ---
> 
>  drivers/i2c/busses/i2c-sh_mobile.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-sh_mobile.c b/drivers/i2c/busses/i2c-sh_mobile.c
> index 5fda4188a9e5..9c7f6f8ceb22 100644
> --- a/drivers/i2c/busses/i2c-sh_mobile.c
> +++ b/drivers/i2c/busses/i2c-sh_mobile.c
> @@ -613,11 +613,6 @@ static void sh_mobile_i2c_xfer_dma(struct sh_mobile_i2c_data *pd)
>  static int start_ch(struct sh_mobile_i2c_data *pd, struct i2c_msg *usr_msg,
>  		    bool do_init)
>  {
> -	if (usr_msg->len == 0 && (usr_msg->flags & I2C_M_RD)) {
> -		dev_err(pd->dev, "Unsupported zero length i2c read\n");
> -		return -EOPNOTSUPP;
> -	}
> -
>  	if (do_init) {
>  		/* Initialize channel registers */
>  		iic_wr(pd, ICCR, ICCR_SCP);
> @@ -758,6 +753,10 @@ static const struct i2c_algorithm sh_mobile_i2c_algorithm = {
>  	.master_xfer	= sh_mobile_i2c_xfer,
>  };
>  
> +static const struct i2c_adapter_quirks sh_mobile_i2c_quirks = {
> +	.flags = I2C_AQ_NO_ZERO_LEN_READ,
> +};
> +
>  /*
>   * r8a7740 chip has lasting errata on I2C I/O pad reset.
>   * this is work-around for it.
> @@ -925,6 +924,7 @@ static int sh_mobile_i2c_probe(struct platform_device *dev)
>  
>  	adap->owner = THIS_MODULE;
>  	adap->algo = &sh_mobile_i2c_algorithm;
> +	adap->quirks = &sh_mobile_i2c_quirks;
>  	adap->dev.parent = &dev->dev;
>  	adap->retries = 5;
>  	adap->nr = dev->id;
> -- 
> 2.11.0
> 

-- 
Regards,
Niklas S�derlund
