Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:56825 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754458AbeEWIs1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 23 May 2018 04:48:27 -0400
Date: Wed, 23 May 2018 10:48:21 +0200
From: Simon Horman <horms@verge.net.au>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-i2c@vger.kernel.org, Peter Rosin <peda@axentia.se>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 2/2] i2c: mux: demux-pinctrl: add symlinks to the
 demux device in sysfs
Message-ID: <20180523084820.cdebd2kxritr5rm2@verge.net.au>
References: <20180521072939.2836-1-wsa+renesas@sang-engineering.com>
 <20180521072939.2836-3-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180521072939.2836-3-wsa+renesas@sang-engineering.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Mon, May 21, 2018 at 09:29:39AM +0200, Wolfram Sang wrote:
> Similar to mux devices, create special symlinks to connect the demuxed
> bus with the demux device.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Nit below not withstanding:

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

> ---
> 
> Changes since v1:
> * check sysfs_create_link and print WARN if something fails
> 
>  drivers/i2c/muxes/i2c-demux-pinctrl.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/drivers/i2c/muxes/i2c-demux-pinctrl.c b/drivers/i2c/muxes/i2c-demux-pinctrl.c
> index 035032e20327..13d1461703f3 100644
> --- a/drivers/i2c/muxes/i2c-demux-pinctrl.c
> +++ b/drivers/i2c/muxes/i2c-demux-pinctrl.c
> @@ -116,6 +116,13 @@ static int i2c_demux_activate_master(struct i2c_demux_pinctrl_priv *priv, u32 ne
>  	if (ret < 0)
>  		goto err_with_put;
>  
> +	WARN(sysfs_create_link(&priv->cur_adap.dev.kobj, &priv->dev->kobj,
> +			       "demux_device"),
> +	     "can't create symlink to mux device\n");
> +	WARN(sysfs_create_link(&priv->dev->kobj, &priv->cur_adap.dev.kobj,
> +			       "channel-0"),
> +	     "can't create symlink to channel 0\n");
> +

Personally I'd rather not rely on side-effects from WARN statements,
but perhaps thats just me.

>  	return 0;
>  
>   err_with_put:
> @@ -135,6 +142,9 @@ static int i2c_demux_deactivate_master(struct i2c_demux_pinctrl_priv *priv)
>  	if (cur < 0)
>  		return 0;
>  
> +	sysfs_remove_link(&priv->dev->kobj, "channel-0");
> +	sysfs_remove_link(&priv->cur_adap.dev.kobj, "demux_device");
> +
>  	i2c_del_adapter(&priv->cur_adap);
>  	i2c_put_adapter(priv->chan[cur].parent_adap);
>  
> -- 
> 2.11.0
> 
