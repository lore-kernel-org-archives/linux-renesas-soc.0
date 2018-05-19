Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-eopbgr50136.outbound.protection.outlook.com ([40.107.5.136]:43008
        "EHLO EUR03-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1752546AbeESVkK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 19 May 2018 17:40:10 -0400
Subject: Re: [PATCH 1/2] i2c: mux: demux-pinctrl: use proper parent device for
 demux adapter
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-i2c@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
References: <20180430115544.22903-1-wsa+renesas@sang-engineering.com>
 <20180430115544.22903-2-wsa+renesas@sang-engineering.com>
From: Peter Rosin <peda@axentia.se>
Message-ID: <12bff5fc-dee4-e0bf-2dde-96201a8cd1fb@axentia.se>
Date: Sat, 19 May 2018 23:40:04 +0200
MIME-Version: 1.0
In-Reply-To: <20180430115544.22903-2-wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 2018-04-30 13:55, Wolfram Sang wrote:
> Due to a typo, the wrong parent device was assigned to the newly created
> demuxing adapter device. It got connected to the demuxing platform
> device but not to the selected parent I2C adapter device. Fix it to get
> a proper parent-child relationship of the demuxed busses, needed also for
> proper PM.
> 

Should this one have a Fixes: tag? Should it go to current or next? Is
a backport to stable good enough?

Cheers,
Peter

> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>  drivers/i2c/muxes/i2c-demux-pinctrl.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/i2c/muxes/i2c-demux-pinctrl.c b/drivers/i2c/muxes/i2c-demux-pinctrl.c
> index 428de4c97fb2..035032e20327 100644
> --- a/drivers/i2c/muxes/i2c-demux-pinctrl.c
> +++ b/drivers/i2c/muxes/i2c-demux-pinctrl.c
> @@ -106,7 +106,7 @@ static int i2c_demux_activate_master(struct i2c_demux_pinctrl_priv *priv, u32 ne
>  	priv->cur_adap.owner = THIS_MODULE;
>  	priv->cur_adap.algo = &priv->algo;
>  	priv->cur_adap.algo_data = priv;
> -	priv->cur_adap.dev.parent = priv->dev;
> +	priv->cur_adap.dev.parent = &adap->dev;
>  	priv->cur_adap.class = adap->class;
>  	priv->cur_adap.retries = adap->retries;
>  	priv->cur_adap.timeout = adap->timeout;
> 
