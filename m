Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf1-f65.google.com ([209.85.167.65]:36620 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728930AbeI1POc (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 28 Sep 2018 11:14:32 -0400
Received: by mail-lf1-f65.google.com with SMTP id v17-v6so4397797lfe.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 28 Sep 2018 01:51:48 -0700 (PDT)
Date: Fri, 28 Sep 2018 10:51:45 +0200
From: Niklas =?iso-8859-1?Q?S=F6derlund?=
        <niklas.soderlund@ragnatech.se>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Zhang Rui <rui.zhang@intel.com>,
        Eduardo Valentin <edubezval@gmail.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Support Opensource <support.opensource@diasemi.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
        Arjan van de Ven <arjan@linux.intel.com>,
        Jacob Pan <jacob.jun.pan@linux.intel.com>,
        linux-pm@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] thermal: rcar_thermal: Prevent hardware access
 during system suspend
Message-ID: <20180928085145.GB24305@bigcity.dyn.berto.se>
References: <20180927113235.30354-1-geert+renesas@glider.be>
 <20180927113235.30354-2-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20180927113235.30354-2-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Geert,

Thanks for your patch.

On 2018-09-27 13:32:33 +0200, Geert Uytterhoeven wrote:
> On r8a7791/koelsch, sometimes the following message is printed during
> system suspend:
> 
>     rcar_thermal e61f0000.thermal: thermal sensor was broken
> 
> This happens if the workqueue runs while the device is already
> suspended.  Fix this by using the freezable system workqueue instead,
> cfr. commit 51e20d0e3a60cf46 ("thermal: Prevent polling from happening
> during system suspend").
> 
> Fixes: e0a5172e9eec7f0d ("thermal: rcar: add interrupt support")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Niklas S�derlund <niklas.soderlund+renesas@ragnatech.se>

> ---
>  drivers/thermal/rcar_thermal.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/thermal/rcar_thermal.c b/drivers/thermal/rcar_thermal.c
> index 78f932822d381c9d..ea132e122b174757 100644
> --- a/drivers/thermal/rcar_thermal.c
> +++ b/drivers/thermal/rcar_thermal.c
> @@ -434,8 +434,8 @@ static irqreturn_t rcar_thermal_irq(int irq, void *data)
>  	rcar_thermal_for_each_priv(priv, common) {
>  		if (rcar_thermal_had_changed(priv, status)) {
>  			rcar_thermal_irq_disable(priv);
> -			schedule_delayed_work(&priv->work,
> -					      msecs_to_jiffies(300));
> +			queue_delayed_work(system_freezable_wq, &priv->work,
> +					   msecs_to_jiffies(300));
>  		}
>  	}
>  
> -- 
> 2.17.1
> 

-- 
Regards,
Niklas S�derlund
