Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f41.google.com ([209.85.215.41]:32863 "EHLO
        mail-lf0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755046AbdCGKhW (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 7 Mar 2017 05:37:22 -0500
Received: by mail-lf0-f41.google.com with SMTP id a6so84902369lfa.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 07 Mar 2017 02:37:21 -0800 (PST)
From: "Niklas =?iso-8859-1?Q?S=F6derlund?=" <niklas.soderlund@ragnatech.se>
Date: Tue, 7 Mar 2017 11:27:31 +0100
To: linux-pm@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, Zhang Rui <rui.zhang@intel.com>,
        Eduardo Valentin <edubezval@gmail.com>
Subject: Re: [PATCH 1/7] thermal: rcar_gen3_thermal: add delay in
 .thermal_init on r8a7796
Message-ID: <20170307102731.GH20587@bigcity.dyn.berto.se>
References: <20170306200401.29923-1-niklas.soderlund+renesas@ragnatech.se>
 <20170306200401.29923-2-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20170306200401.29923-2-niklas.soderlund+renesas@ragnatech.se>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 2017-03-06 21:03:55 +0100, Niklas S�derlund wrote:
> The .thermal_init needs to be delayed a short amount of to allow for the
> TEMP register to contain something useful. If it's not delayed theses
> warnings are common during boot:
> 
> thermal thermal_zone0: failed to read out thermal zone (-5)
> thermal thermal_zone1: failed to read out thermal zone (-5)
> thermal thermal_zone2: failed to read out thermal zone (-5)
> 
> The warnings are triggered by the first call to .get_temp while the TEMP
> register contains 0 and rcar_gen3_thermal_get_temp() returns -EIO since
> a TEMP value of 0 will result in a temperature reading which is out of
> specifications.
> 
> This should have been done in the initial commit which adds the driver
> as the same issue was found and corrected for r8a7795.
> 
> Signed-off-by: Niklas S�derlund <niklas.soderlund+renesas@ragnatech.se>

I forgot this tag for this patch, will update if there is a need for v2.

Fixes: 564e73d283af9d4c ("thermal: rcar_gen3_thermal: Add R-Car Gen3 thermal driver")

> ---
>  drivers/thermal/rcar_gen3_thermal.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/thermal/rcar_gen3_thermal.c b/drivers/thermal/rcar_gen3_thermal.c
> index d33c845244b1d819..ec477d47d0bae8e5 100644
> --- a/drivers/thermal/rcar_gen3_thermal.c
> +++ b/drivers/thermal/rcar_gen3_thermal.c
> @@ -222,6 +222,8 @@ static void r8a7796_thermal_init(struct rcar_gen3_thermal_tsc *tsc)
>  	reg_val = rcar_gen3_thermal_read(tsc, REG_GEN3_THCTR);
>  	reg_val |= THCTR_THSST;
>  	rcar_gen3_thermal_write(tsc, REG_GEN3_THCTR, reg_val);
> +
> +	usleep_range(1000, 2000);
>  }
>  
>  static const struct rcar_gen3_thermal_data r8a7795_data = {
> -- 
> 2.12.0
> 

-- 
Regards,
Niklas S�derlund
