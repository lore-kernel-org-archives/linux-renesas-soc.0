Return-Path: <SRS0=VX+A=O3=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0632EC43387
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 18 Dec 2018 21:44:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C4D61218A4
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 18 Dec 2018 21:44:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AMLCKBVx"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727104AbeLRVos (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 18 Dec 2018 16:44:48 -0500
Received: from mail-pg1-f196.google.com ([209.85.215.196]:37477 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727243AbeLRVon (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 18 Dec 2018 16:44:43 -0500
Received: by mail-pg1-f196.google.com with SMTP id c25so6911722pgb.4;
        Tue, 18 Dec 2018 13:44:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=lbKbgU9EzIkRhDIDDz4+Oj44Vn9gcoUiaF+LT1M+YJI=;
        b=AMLCKBVxa/wNz8J4cTbqK1+R798jsdUeHNGnoWpStVXLp1+8w7FO3uuFCavc8UskPV
         ccIBMQuEpJ50rdNFyfGbjfqPb486tgl9/nEaUZr8CtBZcUjx1JcwMGZXBNAxnOpSCFg5
         KycgR7Kstpks2LJp5r8N99Em4vGn4ZLjRNanErQpEItI1qQ6UTzHfLbvNpxvTASMLkii
         GT9HJoA+NHbCNMT1NyaMeiaj8iel3sDLvIEkPw5tuLQFOpdim9bYD655J1o+rDTIrrqC
         kFvu5N1rbX+8tspKcoYQi5jzWe+U6RXwUz8Y8gDzkW0t4zz4GRtqSeqvuJtx4sUdasaa
         tIUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=lbKbgU9EzIkRhDIDDz4+Oj44Vn9gcoUiaF+LT1M+YJI=;
        b=Pf2yNZ4s5KwZSHcB0Q1jmp5eKkrd76XKToRvJjQlmJKnFZRYHQXcZSca6oC86ggkvp
         e/YCY1ycBevggKfw9IpdvUTsG26yAMERhuW0P+8SFLTz4KpzxA9RyhSVCHjOjRnsq0aY
         n7sBERJy1eq+xtOTIeubd9+WsIwzHBk30ufC7zQFImhpZkec5kegybBxf+knJ3zimERf
         Sfs0Ibx43fGLaqKtoup0Z9kCS6R9yEQLCuF8x5/tcIBvGc6ybSxkuwPj+YgYvXqXRtKK
         2nUfiEwEOCj2vy7dscNJk7Ol5I32g/yLOfW21d02TRq4nEnzpbWf+POp4gTjVosvVpbC
         DfdA==
X-Gm-Message-State: AA+aEWZylO1rgvzFKvNusQ165HAS5uKQat4a1KyioUasuiXEz8SRGqb6
        xJqeag22n7jO/ojIj+Kl5Es=
X-Google-Smtp-Source: AFSGD/V0bPzlCcr3LfsvaSI63q0iwwRPJfkqw2Dm/weRoIZkI5LTdqk4yrtqbPeJIsb096T0fXwLgg==
X-Received: by 2002:a63:d301:: with SMTP id b1mr17359813pgg.61.1545169482681;
        Tue, 18 Dec 2018 13:44:42 -0800 (PST)
Received: from localhost.localdomain ([207.86.76.174])
        by smtp.gmail.com with ESMTPSA id g185sm20908179pfc.174.2018.12.18.13.44.41
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 18 Dec 2018 13:44:42 -0800 (PST)
Date:   Tue, 18 Dec 2018 13:44:40 -0800
From:   Eduardo Valentin <edubezval@gmail.com>
To:     marek.vasut@gmail.com
Cc:     linux-pm@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Zhang Rui <rui.zhang@intel.com>,
        Marek Vasut <marek.vasut+renesas@gmail.com>
Subject: Re: [PATCH V3 3/6] thermal: Register hwmon in
 thermal_zone_of_sensor_register_param()
Message-ID: <20181218214439.GB8850@localhost.localdomain>
References: <20181217155644.29278-1-marek.vasut@gmail.com>
 <20181217155644.29278-4-marek.vasut@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181217155644.29278-4-marek.vasut@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
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

So, here you will overwrite what was done in of_parse_thermal_zones().
That means, after this point, property like sustainable power, slope and
offset are gone.

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
