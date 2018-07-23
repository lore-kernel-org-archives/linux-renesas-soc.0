Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lj1-f194.google.com ([209.85.208.194]:41115 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728357AbeGWVrS (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 23 Jul 2018 17:47:18 -0400
Received: by mail-lj1-f194.google.com with SMTP id y17-v6so1678826ljy.8
        for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Jul 2018 13:44:21 -0700 (PDT)
Date: Mon, 23 Jul 2018 22:44:18 +0200
From: Niklas =?iso-8859-1?Q?S=F6derlund?=
        <niklas.soderlund@ragnatech.se>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-i2c@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Wolfram Sang <wsa@the-dreams.de>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 01/12] i2c: quirks: add zero length checks
Message-ID: <20180723204418.GG1432@bigcity.dyn.berto.se>
References: <20180723202617.15230-1-wsa+renesas@sang-engineering.com>
 <20180723202617.15230-2-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20180723202617.15230-2-wsa+renesas@sang-engineering.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Wolfram,

Thanks for your patch.

On 2018-07-23 22:26:05 +0200, Wolfram Sang wrote:
> Some adapters do not support a message length of 0. Add this as a quirk
> so drivers don't have to open code it.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
> 
> Only build tested.

Was this not tested when you also tested i2c-rcar and i2c-sh_mobile 
drivers? In any case I think this change make much sens.

Reviewed-by: Niklas S�derlund <niklas.soderlund+renesas@ragnatech.se>

> 
>  drivers/i2c/i2c-core-base.c | 6 ++++++
>  include/linux/i2c.h         | 4 ++++
>  2 files changed, 10 insertions(+)
> 
> diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
> index 02d6f27b19e4..a26b3e9cc441 100644
> --- a/drivers/i2c/i2c-core-base.c
> +++ b/drivers/i2c/i2c-core-base.c
> @@ -1839,9 +1839,15 @@ static int i2c_check_for_quirks(struct i2c_adapter *adap, struct i2c_msg *msgs,
>  		if (msgs[i].flags & I2C_M_RD) {
>  			if (do_len_check && i2c_quirk_exceeded(len, q->max_read_len))
>  				return i2c_quirk_error(adap, &msgs[i], "msg too long");
> +
> +			if (q->flags & I2C_AQ_NO_ZERO_LEN_READ && len == 0)
> +				return i2c_quirk_error(adap, &msgs[i], "no zero length");
>  		} else {
>  			if (do_len_check && i2c_quirk_exceeded(len, q->max_write_len))
>  				return i2c_quirk_error(adap, &msgs[i], "msg too long");
> +
> +			if (q->flags & I2C_AQ_NO_ZERO_LEN_WRITE && len == 0)
> +				return i2c_quirk_error(adap, &msgs[i], "no zero length");
>  		}
>  	}
>  
> diff --git a/include/linux/i2c.h b/include/linux/i2c.h
> index bc8d42f8544f..2a98d0886d2e 100644
> --- a/include/linux/i2c.h
> +++ b/include/linux/i2c.h
> @@ -661,6 +661,10 @@ struct i2c_adapter_quirks {
>  					 I2C_AQ_COMB_READ_SECOND | I2C_AQ_COMB_SAME_ADDR)
>  /* clock stretching is not supported */
>  #define I2C_AQ_NO_CLK_STRETCH		BIT(4)
> +/* message cannot have length of 0 */
> +#define I2C_AQ_NO_ZERO_LEN_READ		BIT(5)
> +#define I2C_AQ_NO_ZERO_LEN_WRITE	BIT(6)
> +#define I2C_AQ_NO_ZERO_LEN		(I2C_AQ_NO_ZERO_LEN_READ | I2C_AQ_NO_ZERO_LEN_WRITE)
>  
>  /*
>   * i2c_adapter is the structure used to identify a physical i2c bus along
> -- 
> 2.11.0
> 

-- 
Regards,
Niklas S�derlund
