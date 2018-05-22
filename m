Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-eopbgr30115.outbound.protection.outlook.com ([40.107.3.115]:32469
        "EHLO EUR03-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1750707AbeEVHNu (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 22 May 2018 03:13:50 -0400
Subject: Re: [PATCH v2 2/2] i2c: mux: demux-pinctrl: add symlinks to the demux
 device in sysfs
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-i2c@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
References: <20180521072939.2836-1-wsa+renesas@sang-engineering.com>
 <20180521072939.2836-3-wsa+renesas@sang-engineering.com>
From: Peter Rosin <peda@axentia.se>
Message-ID: <6641706f-fe9e-8d92-48c5-ebd4453c51c3@axentia.se>
Date: Tue, 22 May 2018 09:13:44 +0200
MIME-Version: 1.0
In-Reply-To: <20180521072939.2836-3-wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 2018-05-21 09:29, Wolfram Sang wrote:
> Similar to mux devices, create special symlinks to connect the demuxed
> bus with the demux device.

Hmm, now that I have slept on it, I find this a bit odd. For muxes, all
channels and the parent are always present. Here, that is not the case.
And don't get me wrong, I see why that is the case, but that doesn't
mean that I like it. It would be so much nicer and less disruptive if
the client devices were not unbound and rebound (which I think they are,
right?) on every master switch.

In some cases I think it might be possible to make the switch automatic
and seamless, e.g. if there are two masters and one of them is faster
but has some glitch(es), and the other is slower but complete (or at
least complete enough).

The demuxer could then switch to the slower master automatically, on
a transaction-by-transaction basis, in order to avoid the glitch(es).
Yes, it would have to work a bit differently etc etc, but I don't see
any reason why it can't be done. But you probably know more than I on
that part of the I2C code...

Anyway, since this is ABI (and should be documented) I think it would
be good if it could accommodate the automatic master switch case too.
And for that to work, the "channel-0" name is wrong. I think channel-N
should be reserved for the actual masters, in the order given in the
devicetree (I know that you currently can't establish these links since
you unbind the inactive masters, but that unbind can probably not happen
for the automatic switch case?). There could then be some other symlink,
e.g. "current" or "master" or something like that, that reflects the
present situation (your "channel-0").

What do you think?

Cheers,
Peter

> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
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
> 
