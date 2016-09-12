Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from smtp.codeaurora.org ([198.145.29.96]:42371 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932094AbcILIJo (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 12 Sep 2016 04:09:44 -0400
Subject: Re: [PATCH v2] drm/bridge: adv7511: add support for the 2nd chip
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        airlied@linux.ie, dri-devel@lists.freedesktop.org
References: <1580212.O1LYdJFM97@wasted.cogentembedded.com>
Cc: linux-renesas-soc@vger.kernel.org
From: Archit Taneja <architt@codeaurora.org>
Message-ID: <57D662C2.9090304@codeaurora.org>
Date: Mon, 12 Sep 2016 13:39:38 +0530
MIME-Version: 1.0
In-Reply-To: <1580212.O1LYdJFM97@wasted.cogentembedded.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>



On 09/06/2016 01:13 AM, Sergei Shtylyov wrote:
> The Renesas Wheat board has 2 ADV7513 chips on the same I2C bus, however
> the ADV751x driver only supports 1 chip as  it tries to assign the packet/
> EDID/CEC  memory I2C devices  to the fixed I2C addresses. Assign these I2C
> addresses at the fixed offsets (derived from the programming guide) from
> the  main register map address  instead...

Looks good now. Queued to topic/drm-misc after cleaning up the spacing
in the commit message.

Thanks,
Archit

>
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
>
> ---
> The patch is against David Airlie's 'linux.git' repo's 'drm-next' branch.
>
> Changes in version 2:
> - added support for ADV7533 CEC alternate address.
>
>   drivers/gpu/drm/bridge/adv7511/adv7511_drv.c |   12 ++++++------
>   drivers/gpu/drm/bridge/adv7511/adv7533.c     |    5 ++---
>   2 files changed, 8 insertions(+), 9 deletions(-)
>
> Index: linux/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> ===================================================================
> --- linux.orig/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> +++ linux/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> @@ -922,15 +922,13 @@ static int adv7511_parse_dt(struct devic
>   	return 0;
>   }
>
> -static const int edid_i2c_addr = 0x7e;
> -static const int packet_i2c_addr = 0x70;
> -static const int cec_i2c_addr = 0x78;
> -
>   static int adv7511_probe(struct i2c_client *i2c, const struct i2c_device_id *id)
>   {
>   	struct adv7511_link_config link_config;
>   	struct adv7511 *adv7511;
>   	struct device *dev = &i2c->dev;
> +	unsigned int main_i2c_addr = i2c->addr << 1;
> +	unsigned int edid_i2c_addr = main_i2c_addr + 4;
>   	unsigned int val;
>   	int ret;
>
> @@ -991,8 +989,10 @@ static int adv7511_probe(struct i2c_clie
>
>   	regmap_write(adv7511->regmap, ADV7511_REG_EDID_I2C_ADDR, edid_i2c_addr);
>   	regmap_write(adv7511->regmap, ADV7511_REG_PACKET_I2C_ADDR,
> -		     packet_i2c_addr);
> -	regmap_write(adv7511->regmap, ADV7511_REG_CEC_I2C_ADDR, cec_i2c_addr);
> +		     main_i2c_addr - 0xa);
> +	regmap_write(adv7511->regmap, ADV7511_REG_CEC_I2C_ADDR,
> +		     main_i2c_addr - 2);
> +
>   	adv7511_packet_disable(adv7511, 0xffff);
>
>   	adv7511->i2c_main = i2c;
> Index: linux/drivers/gpu/drm/bridge/adv7511/adv7533.c
> ===================================================================
> --- linux.orig/drivers/gpu/drm/bridge/adv7511/adv7533.c
> +++ linux/drivers/gpu/drm/bridge/adv7511/adv7533.c
> @@ -149,13 +149,12 @@ void adv7533_uninit_cec(struct adv7511 *
>   	i2c_unregister_device(adv->i2c_cec);
>   }
>
> -static const int cec_i2c_addr = 0x78;
> -
>   int adv7533_init_cec(struct adv7511 *adv)
>   {
>   	int ret;
>
> -	adv->i2c_cec = i2c_new_dummy(adv->i2c_main->adapter, cec_i2c_addr >> 1);
> +	adv->i2c_cec = i2c_new_dummy(adv->i2c_main->adapter,
> +				     adv->i2c_main->addr - 1);
>   	if (!adv->i2c_cec)
>   		return -ENOMEM;
>
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
>

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
