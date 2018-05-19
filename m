Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-eopbgr50114.outbound.protection.outlook.com ([40.107.5.114]:30800
        "EHLO EUR03-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1752546AbeESVkg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 19 May 2018 17:40:36 -0400
Subject: Re: [PATCH 2/2] i2c: mux: demux-pinctrl: add symlinks to the demux
 device in sysfs
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-i2c@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
References: <20180430115544.22903-1-wsa+renesas@sang-engineering.com>
 <20180430115544.22903-3-wsa+renesas@sang-engineering.com>
From: Peter Rosin <peda@axentia.se>
Message-ID: <9acf7b0c-d390-1bde-5f00-fcaa5a01f27b@axentia.se>
Date: Sat, 19 May 2018 23:40:31 +0200
MIME-Version: 1.0
In-Reply-To: <20180430115544.22903-3-wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 2018-04-30 13:55, Wolfram Sang wrote:
> Similar to mux devices, create special symlinks to connect the demuxed
> bus with the demux device.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>  drivers/i2c/muxes/i2c-demux-pinctrl.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/i2c/muxes/i2c-demux-pinctrl.c b/drivers/i2c/muxes/i2c-demux-pinctrl.c
> index 035032e20327..d5e7d4aa6ee1 100644
> --- a/drivers/i2c/muxes/i2c-demux-pinctrl.c
> +++ b/drivers/i2c/muxes/i2c-demux-pinctrl.c
> @@ -116,6 +116,11 @@ static int i2c_demux_activate_master(struct i2c_demux_pinctrl_priv *priv, u32 ne
>  	if (ret < 0)
>  		goto err_with_put;
>  
> +	sysfs_create_link(&priv->cur_adap.dev.kobj, &priv->dev->kobj,
> +			       "demux_device");
> +	sysfs_create_link(&priv->dev->kobj, &priv->cur_adap.dev.kobj,
> +			       "channel-0");
> +

>From sysfs.h:
int __must_check sysfs_create_link(...);

Cheers,
Peter

>  	return 0;
>  
>   err_with_put:
> @@ -135,6 +140,9 @@ static int i2c_demux_deactivate_master(struct i2c_demux_pinctrl_priv *priv)
>  	if (cur < 0)
>  		return 0;
>  
> +	sysfs_remove_link(&priv->dev->kobj, "channel-0");
> +	sysfs_remove_link(&priv->cur_adap.dev.kobj, "demux_device");
> +
>  	i2c_del_adapter(&priv->cur_adap);
>  	i2c_put_adapter(priv->chan[cur].parent_adap);
>  
> 
