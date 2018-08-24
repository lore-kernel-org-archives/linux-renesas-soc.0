Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf1-f68.google.com ([209.85.167.68]:36625 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726407AbeHXTQb (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 24 Aug 2018 15:16:31 -0400
Received: by mail-lf1-f68.google.com with SMTP id c21-v6so7020115lfh.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 24 Aug 2018 08:41:19 -0700 (PDT)
Date: Fri, 24 Aug 2018 17:41:17 +0200
From: Niklas =?iso-8859-1?Q?S=F6derlund?=
        <niklas.soderlund@ragnatech.se>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-i2c@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Jun Gao <jun.gao@mediatek.com>,
        Yingjoe Chen <yingjoe.chen@mediatek.com>
Subject: Re: [PATCH 2/3] i2c: sh_mobile: define start_ch() void as it only
 returns 0 anyhow
Message-ID: <20180824154117.GB1493@bigcity.dyn.berto.se>
References: <20180824145246.19987-1-wsa+renesas@sang-engineering.com>
 <20180824145246.19987-3-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20180824145246.19987-3-wsa+renesas@sang-engineering.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Wolfram,

Thanks for your work.

On 2018-08-24 16:52:45 +0200, Wolfram Sang wrote:
> After various refactoring over the years, start_ch() doesn't return
> errno anymore, so make the function return void. This saves the error
> handling when calling it which in turn eases cleanup of resources of a
> future patch.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Niklas S�derlund <niklas.soderlund+renesas@ragnatech.se>

> ---
>  drivers/i2c/busses/i2c-sh_mobile.c | 9 +++------
>  1 file changed, 3 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-sh_mobile.c b/drivers/i2c/busses/i2c-sh_mobile.c
> index 16c35d474398..456581e3c1d2 100644
> --- a/drivers/i2c/busses/i2c-sh_mobile.c
> +++ b/drivers/i2c/busses/i2c-sh_mobile.c
> @@ -610,8 +610,8 @@ static void sh_mobile_i2c_xfer_dma(struct sh_mobile_i2c_data *pd)
>  	dma_async_issue_pending(chan);
>  }
>  
> -static int start_ch(struct sh_mobile_i2c_data *pd, struct i2c_msg *usr_msg,
> -		    bool do_init)
> +static void start_ch(struct sh_mobile_i2c_data *pd, struct i2c_msg *usr_msg,
> +		     bool do_init)
>  {
>  	if (do_init) {
>  		/* Initialize channel registers */
> @@ -635,7 +635,6 @@ static int start_ch(struct sh_mobile_i2c_data *pd, struct i2c_msg *usr_msg,
>  
>  	/* Enable all interrupts to begin with */
>  	iic_wr(pd, ICIC, ICIC_DTEE | ICIC_WAITE | ICIC_ALE | ICIC_TACKE);
> -	return 0;
>  }
>  
>  static int poll_dte(struct sh_mobile_i2c_data *pd)
> @@ -706,9 +705,7 @@ static int sh_mobile_i2c_xfer(struct i2c_adapter *adapter,
>  		pd->send_stop = i == num - 1 || msg->flags & I2C_M_STOP;
>  		pd->stop_after_dma = false;
>  
> -		err = start_ch(pd, msg, do_start);
> -		if (err)
> -			break;
> +		start_ch(pd, msg, do_start);
>  
>  		if (do_start)
>  			i2c_op(pd, OP_START, 0);
> -- 
> 2.11.0
> 

-- 
Regards,
Niklas S�derlund
