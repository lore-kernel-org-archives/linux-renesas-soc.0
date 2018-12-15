Return-Path: <SRS0=gd9z=OY=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BEB5BC43387
	for <linux-renesas-soc@archiver.kernel.org>; Sat, 15 Dec 2018 17:23:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7D6C52086D
	for <linux-renesas-soc@archiver.kernel.org>; Sat, 15 Dec 2018 17:23:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GnyXzv1s"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727206AbeLORX4 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Sat, 15 Dec 2018 12:23:56 -0500
Received: from mail-pg1-f195.google.com ([209.85.215.195]:39017 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726813AbeLORXz (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 15 Dec 2018 12:23:55 -0500
Received: by mail-pg1-f195.google.com with SMTP id w6so4144240pgl.6;
        Sat, 15 Dec 2018 09:23:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=mYkDJkpPS+ByjVy8cnvMAelTrTbXDtLnV54rWnWUxqI=;
        b=GnyXzv1svipZ4Hjs+rJhw9k8foGdgBjNyZAQVW/Ct7XBcX6IqfZwYa4h3TGLciC4KH
         5nyyEteNBLEEFZ5hcyi04bBfYtZO69cYu04ZeEaP3vKqjpD5jkSbiey2xYht12w++chE
         +JsYhBA1IZhbrmOJe0UwE7vpRRTA5PFE+COhGxibjF2/iV5VEqy1RfXBaojZM+rqz/Nr
         /p5hUevHb96zb37LBCKj836j38PKrlIjf+c258mZDQ1S//j8TUeFd7e9uydSOr1EFQNf
         emV8Wqepru0A/nf9eOsfbfjckW8flhbiAiy55tt216c3v5rQdQBPbVmf/Wmx8FhUkvpW
         +UsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=mYkDJkpPS+ByjVy8cnvMAelTrTbXDtLnV54rWnWUxqI=;
        b=P/H5apJ5BhiiMwkO5h7Y0z6/Migrg+DNz9BiOUMWT9ZZSy99CFxFHSKrJzcDaSAvMW
         5KmnvfGhhO1lyQKPOWZc9FugqwRYaB05wukTb4Ccq4NgtRfg8rbLb3AV/5cXEEp9TumB
         ODXospSilg8HWrm4yJCSFPJEjmWfzbIbJoY/aOdfVfYC2mzoC8LAI5WZc7peXRRk9p2R
         LY++JJrF1NnJ0VAGXnoaLVKEb9m2VTRHkCI6dMy1ydRzzb1spm/OxhcCrF7WqWIH3OFU
         HhlXkSGPRAPWasVUrY3q+cQyniqEvPyXccJmRyEFdPvQBs9hpweYoyQ+xm5UWZA98G1u
         c5Fg==
X-Gm-Message-State: AA+aEWa+JOwFwMG/0Htshz7L6M2QlP1j0dz/Lur0SZrJH7z1KZXB8wg3
        +/Gy7gOq8Bop0zugPMbf3SQ=
X-Google-Smtp-Source: AFSGD/VMeBiw5g4PnX4AuLbf0/ZPYlRrI7yxtxpJaWV9IRqQT5JjT2ZRaPfZrnxKy0TvWKzB3MC5wQ==
X-Received: by 2002:a63:2141:: with SMTP id s1mr6764198pgm.148.1544894634659;
        Sat, 15 Dec 2018 09:23:54 -0800 (PST)
Received: from localhost.localdomain ([2601:644:8201:32e0:7256:81ff:febd:926d])
        by smtp.gmail.com with ESMTPSA id g26sm9839527pfh.61.2018.12.15.09.23.53
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 15 Dec 2018 09:23:54 -0800 (PST)
Date:   Sat, 15 Dec 2018 09:23:52 -0800
From:   Eduardo Valentin <edubezval@gmail.com>
To:     Marek Vasut <marek.vasut@gmail.com>
Cc:     linux-pm@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Zhang Rui <rui.zhang@intel.com>
Subject: Re: [PATCH 1/6] thermal: split
 thermal_zone_of_sensor_register{,_param}()
Message-ID: <20181215172351.GB10311@localhost.localdomain>
References: <20181212014927.25840-1-marek.vasut+renesas@gmail.com>
 <20181212014927.25840-2-marek.vasut+renesas@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181212014927.25840-2-marek.vasut+renesas@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Dec 12, 2018 at 02:49:22AM +0100, Marek Vasut wrote:
> Introduce new thermal_zone_of_sensor_register_params() function, which
> allows passing struct thermal_zone_params into it and convert original
> thermal_zone_of_sensor_register() to call it with params set to NULL.
> 
> Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>

Git complains about mismatch between From: and this SOB.

> Cc: Daniel Lezcano <daniel.lezcano@linaro.org>
> Cc: Eduardo Valentin <edubezval@gmail.com>
> Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Cc: Zhang Rui <rui.zhang@intel.com>
> Cc: linux-renesas-soc@vger.kernel.org
> To: linux-pm@vger.kernel.org

I would prefer if you put your SOB at the bottom.

> ---
>  drivers/thermal/of-thermal.c | 50 +++++++++++++++++++++++++++++++++---
>  include/linux/thermal.h      | 12 +++++++++
>  2 files changed, 59 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/thermal/of-thermal.c b/drivers/thermal/of-thermal.c
> index 4bfdb4a1e47d..eb0ef7a21035 100644
> --- a/drivers/thermal/of-thermal.c
> +++ b/drivers/thermal/of-thermal.c
> @@ -446,7 +446,8 @@ thermal_zone_of_add_sensor(struct device_node *zone,
>  }
>  
>  /**
> - * thermal_zone_of_sensor_register - registers a sensor to a DT thermal zone
> + * thermal_zone_of_sensor_register_params - registers a sensor to a DT thermal
> + *					zone with thermal zone parameters
>   * @dev: a valid struct device pointer of a sensor device. Must contain
>   *       a valid .of_node, for the sensor node.
>   * @sensor_id: a sensor identifier, in case the sensor IP has more
> @@ -454,6 +455,7 @@ thermal_zone_of_add_sensor(struct device_node *zone,
>   * @data: a private pointer (owned by the caller) that will be passed
>   *        back, when a temperature reading is needed.
>   * @ops: struct thermal_zone_of_device_ops *. Must contain at least .get_temp.
> + * @tzp: thermal zone platform parameters
>   *
>   * This function will search the list of thermal zones described in device
>   * tree and look for the zone that refer to the sensor device pointed by
> @@ -478,8 +480,9 @@ thermal_zone_of_add_sensor(struct device_node *zone,
>   * check the return value with help of IS_ERR() helper.
>   */
>  struct thermal_zone_device *
> -thermal_zone_of_sensor_register(struct device *dev, int sensor_id, void *data,
> -				const struct thermal_zone_of_device_ops *ops)
> +thermal_zone_of_sensor_register_params(struct device *dev, int sensor_id,
> +	void *data, const struct thermal_zone_of_device_ops *ops,
> +	struct thermal_zone_params *tzp)
>  {
>  	struct device_node *np, *child, *sensor_np;
>  	struct thermal_zone_device *tzd = ERR_PTR(-ENODEV);
> @@ -533,6 +536,47 @@ thermal_zone_of_sensor_register(struct device *dev, int sensor_id, void *data,
>  
>  	return tzd;
>  }
> +
> +/**
> + * thermal_zone_of_sensor_register - registers a sensor to a DT thermal zone
> + * @dev: a valid struct device pointer of a sensor device. Must contain
> + *       a valid .of_node, for the sensor node.
> + * @sensor_id: a sensor identifier, in case the sensor IP has more
> + *             than one sensors
> + * @data: a private pointer (owned by the caller) that will be passed
> + *        back, when a temperature reading is needed.
> + * @ops: struct thermal_zone_of_device_ops *. Must contain at least .get_temp.
> + *
> + * This function will search the list of thermal zones described in device
> + * tree and look for the zone that refer to the sensor device pointed by
> + * @dev->of_node as temperature providers. For the zone pointing to the
> + * sensor node, the sensor will be added to the DT thermal zone device.
> + *
> + * The thermal zone temperature is provided by the @get_temp function
> + * pointer. When called, it will have the private pointer @data back.
> + *
> + * The thermal zone temperature trend is provided by the @get_trend function
> + * pointer. When called, it will have the private pointer @data back.
> + *
> + * TODO:
> + * 01 - This function must enqueue the new sensor instead of using
> + * it as the only source of temperature values.
> + *
> + * 02 - There must be a way to match the sensor with all thermal zones
> + * that refer to it.
> + *
> + * Return: On success returns a valid struct thermal_zone_device,
> + * otherwise, it returns a corresponding ERR_PTR(). Caller must
> + * check the return value with help of IS_ERR() helper.
> + */
> +
> +struct thermal_zone_device *
> +thermal_zone_of_sensor_register(struct device *dev, int sensor_id, void *data,
> +				const struct thermal_zone_of_device_ops *ops)
> +{
> +	return thermal_zone_of_sensor_register_params(dev, sensor_id, data,
> +						      ops, NULL);
> +}
>  EXPORT_SYMBOL_GPL(thermal_zone_of_sensor_register);
>  
>  /**
> diff --git a/include/linux/thermal.h b/include/linux/thermal.h
> index 5f4705f46c2f..922034eae74b 100644
> --- a/include/linux/thermal.h
> +++ b/include/linux/thermal.h
> @@ -378,6 +378,10 @@ struct thermal_trip {
>  struct thermal_zone_device *
>  thermal_zone_of_sensor_register(struct device *dev, int id, void *data,
>  				const struct thermal_zone_of_device_ops *ops);
> +struct thermal_zone_device *
> +thermal_zone_of_sensor_register_params(struct device *dev, int id, void *data,
> +			const struct thermal_zone_of_device_ops *ops,
> +			struct thermal_zone_params *tzp);
>  void thermal_zone_of_sensor_unregister(struct device *dev,
>  				       struct thermal_zone_device *tz);
>  struct thermal_zone_device *devm_thermal_zone_of_sensor_register(
> @@ -393,6 +397,14 @@ thermal_zone_of_sensor_register(struct device *dev, int id, void *data,
>  	return ERR_PTR(-ENODEV);
>  }
>  
> +static inline struct thermal_zone_device *
> +thermal_zone_of_sensor_register_params(struct device *dev, int id, void *data,
> +			const struct thermal_zone_of_device_ops *ops,
> +			struct thermal_zone_params *tzp)
> +{
> +	return ERR_PTR(-ENODEV);
> +}
> +
>  static inline
>  void thermal_zone_of_sensor_unregister(struct device *dev,
>  				       struct thermal_zone_device *tz)
> -- 
> 2.18.0
> 
