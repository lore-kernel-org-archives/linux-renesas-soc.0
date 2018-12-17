Return-Path: <SRS0=IwST=O2=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55497C43387
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 17 Dec 2018 11:45:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 25FBA206A2
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 17 Dec 2018 11:45:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="AQ7/0oCl"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731759AbeLQLpj (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 17 Dec 2018 06:45:39 -0500
Received: from kirsty.vergenet.net ([202.4.237.240]:39029 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726642AbeLQLpj (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 17 Dec 2018 06:45:39 -0500
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id AD1DB25B781;
        Mon, 17 Dec 2018 22:45:36 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1545047137; bh=qruX90xiysWfC7UmVanhzYs1lhPA85pdY2eU5fEPZ38=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=AQ7/0oCl5iATuCGhu04aWdfJ1+5ps5MgRREVKOjQthkd52ySUoUIoN1vjpdZ0SZSm
         M1+Zs7FYVB5WpAhhCWbW6EWK961tGm08KCJapkPuiSVQ1hFqcaJgGT3u4wJMkyfn3r
         Iwc8v6Uk4Jq+rzrWGS44ETktkYdMgCfsqB07b1/g=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 1A37C94048A; Mon, 17 Dec 2018 12:45:35 +0100 (CET)
Date:   Mon, 17 Dec 2018 12:45:35 +0100
From:   Simon Horman <horms@verge.net.au>
To:     Marek Vasut <marek.vasut@gmail.com>
Cc:     linux-pm@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Eduardo Valentin <edubezval@gmail.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Zhang Rui <rui.zhang@intel.com>
Subject: Re: [PATCH V2 5/6] thermal: rcar_thermal: Convert to
 devm_thermal_zone_of_sensor_register_params()
Message-ID: <20181217114534.6mer5eto67vlyzph@verge.net.au>
References: <20181215023010.2857-1-marek.vasut+renesas@gmail.com>
 <20181215023010.2857-6-marek.vasut+renesas@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181215023010.2857-6-marek.vasut+renesas@gmail.com>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Sat, Dec 15, 2018 at 03:30:09AM +0100, Marek Vasut wrote:
> Convert the rcar code to devm_thermal_zone_of_sensor_register_params(),
> no functional change.
> 
> Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
> Cc: Daniel Lezcano <daniel.lezcano@linaro.org>
> Cc: Eduardo Valentin <edubezval@gmail.com>
> Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Cc: Zhang Rui <rui.zhang@intel.com>
> Cc: linux-renesas-soc@vger.kernel.org
> To: linux-pm@vger.kernel.org

This patch looks good to me, though I'm not sure why { } need
to be introduced into the 4th hunk.

That notwithstanding:

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

> ---
> V2: No change
> ---
>  drivers/thermal/rcar_thermal.c | 33 +++++++++++++--------------------
>  1 file changed, 13 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/thermal/rcar_thermal.c b/drivers/thermal/rcar_thermal.c
> index 8014a207d8d9..ec70c2119c77 100644
> --- a/drivers/thermal/rcar_thermal.c
> +++ b/drivers/thermal/rcar_thermal.c
> @@ -19,8 +19,6 @@
>  #include <linux/spinlock.h>
>  #include <linux/thermal.h>
>  
> -#include "thermal_hwmon.h"
> -
>  #define IDLE_INTERVAL	5000
>  
>  #define COMMON_STR	0x00
> @@ -54,6 +52,10 @@ struct rcar_thermal_chip {
>  	unsigned int nirqs;
>  };
>  
> +static struct thermal_zone_params rcar_thermal_params = {
> +	.no_hwmon	= false,
> +};
> +
>  static const struct rcar_thermal_chip rcar_thermal = {
>  	.use_of_thermal = 0,
>  	.has_filonoff = 1,
> @@ -458,9 +460,7 @@ static int rcar_thermal_remove(struct platform_device *pdev)
>  	rcar_thermal_for_each_priv(priv, common) {
>  		rcar_thermal_irq_disable(priv);
>  		cancel_delayed_work_sync(&priv->work);
> -		if (priv->chip->use_of_thermal)
> -			thermal_remove_hwmon_sysfs(priv->zone);
> -		else
> +		if (!priv->chip->use_of_thermal)
>  			thermal_zone_device_unregister(priv->zone);
>  	}
>  
> @@ -554,16 +554,20 @@ static int rcar_thermal_probe(struct platform_device *pdev)
>  		if (ret < 0)
>  			goto error_unregister;
>  
> -		if (chip->use_of_thermal)
> -			priv->zone = devm_thermal_zone_of_sensor_register(
> +		if (chip->use_of_thermal) {
> +			priv->zone =
> +				devm_thermal_zone_of_sensor_register_params(
>  						dev, i, priv,
> -						&rcar_thermal_zone_of_ops);
> -		else
> +						&rcar_thermal_zone_of_ops,
> +						&rcar_thermal_params);
> +		} else {
>  			priv->zone = thermal_zone_device_register(
>  						"rcar_thermal",
>  						1, 0, priv,
>  						&rcar_thermal_zone_ops, NULL, 0,
>  						idle);
> +		}
> +
>  		if (IS_ERR(priv->zone)) {
>  			dev_err(dev, "can't register thermal zone\n");
>  			ret = PTR_ERR(priv->zone);
> @@ -571,17 +575,6 @@ static int rcar_thermal_probe(struct platform_device *pdev)
>  			goto error_unregister;
>  		}
>  
> -		if (chip->use_of_thermal) {
> -			/*
> -			 * thermal_zone doesn't enable hwmon as default,
> -			 * but, enable it here to keep compatible
> -			 */
> -			priv->zone->tzp->no_hwmon = false;
> -			ret = thermal_add_hwmon_sysfs(priv->zone);
> -			if (ret)
> -				goto error_unregister;
> -		}
> -
>  		rcar_thermal_irq_enable(priv);
>  
>  		list_move_tail(&priv->list, &common->head);
> -- 
> 2.18.0
> 
