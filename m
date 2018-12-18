Return-Path: <SRS0=VX+A=O3=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62BD4C43387
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 18 Dec 2018 11:06:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3120E217D9
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 18 Dec 2018 11:06:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="Vr0IA3M6"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726395AbeLRLGD (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 18 Dec 2018 06:06:03 -0500
Received: from kirsty.vergenet.net ([202.4.237.240]:54325 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726370AbeLRLGD (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 18 Dec 2018 06:06:03 -0500
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id B1B1425B75B;
        Tue, 18 Dec 2018 22:05:59 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1545131160; bh=mGMOztSiBCINR3it0mmOHUIkj80TAN5zcEPivANKXcM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Vr0IA3M6LLNDGyWUTuahZjOYeUJlwRu5Z7Q9f0/6pJu35hTXO1EkKRic3GyfmXb2b
         f+uK4skn/eg+bIykPinPVWCMgL46oeQq9D5i8o5HYym/c4XoT7sXFN+1qddNZXpuNz
         FERFLdhZb4eqnoRhPXZ9/sP6bn2J0XewxyH89QWE=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id E7B1F940274; Tue, 18 Dec 2018 12:05:57 +0100 (CET)
Date:   Tue, 18 Dec 2018 12:05:57 +0100
From:   Simon Horman <horms@verge.net.au>
To:     marek.vasut@gmail.com
Cc:     linux-pm@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Eduardo Valentin <edubezval@gmail.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Zhang Rui <rui.zhang@intel.com>,
        Marek Vasut <marek.vasut+renesas@gmail.com>
Subject: Re: [PATCH V3 5/6] thermal: rcar_thermal: Convert to
 devm_thermal_zone_of_sensor_register_params()
Message-ID: <20181218110557.rrkrurhuruvzfak2@verge.net.au>
References: <20181217155644.29278-1-marek.vasut@gmail.com>
 <20181217155644.29278-6-marek.vasut@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181217155644.29278-6-marek.vasut@gmail.com>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Dec 17, 2018 at 04:56:43PM +0100, marek.vasut@gmail.com wrote:
> From: Marek Vasut <marek.vasut@gmail.com>
> 
> Convert the rcar code to devm_thermal_zone_of_sensor_register_params(),
> no functional change.
> 
> From: Marek Vasut <marek.vasut+renesas@gmail.com>
> Cc: Daniel Lezcano <daniel.lezcano@linaro.org>
> Cc: Eduardo Valentin <edubezval@gmail.com>
> Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Cc: Zhang Rui <rui.zhang@intel.com>
> Cc: linux-renesas-soc@vger.kernel.org
> To: linux-pm@vger.kernel.org
> Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
> ---
> V2: No change
> V3: - Work around the From line and SoB line checkpatch warning
>     - Reorder the SoB line at the end

As per v2:

This patch looks good to me, though I'm not sure why { } need
to be introduced into the 4th hunk.

That notwithstanding:

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

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
