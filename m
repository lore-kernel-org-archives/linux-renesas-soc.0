Return-Path: <SRS0=VX+A=O3=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7332BC43387
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 18 Dec 2018 11:05:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 40256217D9
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 18 Dec 2018 11:05:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="O0Ymc6fH"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726426AbeLRLFE (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 18 Dec 2018 06:05:04 -0500
Received: from kirsty.vergenet.net ([202.4.237.240]:54291 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726370AbeLRLFD (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 18 Dec 2018 06:05:03 -0500
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 761BC25B75B;
        Tue, 18 Dec 2018 22:05:01 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1545131101; bh=48wjUr0QD8am264EKcOGrEJ97jtqkgE0D9mwlgsXINA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=O0Ymc6fHcCSGlPqSjUHu8+UbosouQJB564i5tCg+giIawWvp4vGfFA45Sfvg1HTZg
         nldL2DjpzxZB4OXFRYYXsoA577M7i2STDBD28/646tGAJ7mGsiLyKXzrEmnO942Wkz
         jmn2hmpUijTF/uwVGJQ4Ugm360mUDHwRbMe2B23s=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id C1730940274; Tue, 18 Dec 2018 12:04:59 +0100 (CET)
Date:   Tue, 18 Dec 2018 12:04:59 +0100
From:   Simon Horman <horms@verge.net.au>
To:     marek.vasut@gmail.com
Cc:     linux-pm@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Eduardo Valentin <edubezval@gmail.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Zhang Rui <rui.zhang@intel.com>,
        Marek Vasut <marek.vasut+renesas@gmail.com>
Subject: Re: [PATCH V3 3/6] thermal: Register hwmon in
 thermal_zone_of_sensor_register_param()
Message-ID: <20181218110459.aekxcjocyg7b3lge@verge.net.au>
References: <20181217155644.29278-1-marek.vasut@gmail.com>
 <20181217155644.29278-4-marek.vasut@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181217155644.29278-4-marek.vasut@gmail.com>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Dec 17, 2018 at 04:56:41PM +0100, marek.vasut@gmail.com wrote:
> From: Marek Vasut <marek.vasut@gmail.com>
> 
> Register hwmon sysfs interface in thermal_zone_of_sensor_register_param()
> in case thermal_zone_params->no_hwmon is set to false. This behavior is
> the same as thermal_zone_device_register().

As per v2:

If it is the same then is there any value in a helper function?

Regardless, this patch looks good to me.

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

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
> ---
>  drivers/thermal/of-thermal.c | 12 +++++++++++-
>  1 file changed, 11 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/thermal/of-thermal.c b/drivers/thermal/of-thermal.c
> index e1a303a5698c..5ccff7b678de 100644
> --- a/drivers/thermal/of-thermal.c
> +++ b/drivers/thermal/of-thermal.c
> @@ -15,6 +15,7 @@
>  #include <linux/string.h>
>  
>  #include "thermal_core.h"
> +#include "thermal_hwmon.h"
>  
>  /***   Private data structures to represent thermal device tree data ***/
>  
> @@ -521,8 +522,15 @@ thermal_zone_of_sensor_register_params(struct device *dev, int sensor_id,
>  		if (sensor_specs.np == sensor_np && id == sensor_id) {
>  			tzd = thermal_zone_of_add_sensor(child, sensor_np,
>  							 data, ops);
> -			if (!IS_ERR(tzd))
> +			if (!IS_ERR(tzd)) {
> +				tzd->tzp = tzp;
>  				tzd->ops->set_mode(tzd, THERMAL_DEVICE_ENABLED);
> +				if (!tzp || !tzp->no_hwmon) {
> +					ret = thermal_add_hwmon_sysfs(tzd);
> +					if (ret)
> +						tzd = ERR_PTR(ret);
> +				}
> +			}
>  
>  			of_node_put(sensor_specs.np);
>  			of_node_put(child);
> @@ -605,6 +613,8 @@ void thermal_zone_of_sensor_unregister(struct device *dev,
>  
>  	tz = tzd->devdata;
>  
> +	thermal_remove_hwmon_sysfs(tzd);
> +
>  	/* no __thermal_zone, nothing to be done */
>  	if (!tz)
>  		return;
> -- 
> 2.18.0
> 
