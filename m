Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-eopbgr00096.outbound.protection.outlook.com ([40.107.0.96]:63285
        "EHLO EUR02-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1752553AbeESWAH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 19 May 2018 18:00:07 -0400
Subject: Re: [PATCH] i2c: mux: demux-pinctrl: disable PM user interface
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-i2c@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org, linux-pm@vger.kernel.org,
        "Rafael J. Wysocki" <rafael@kernel.org>
References: <20180430120842.28110-1-wsa+renesas@sang-engineering.com>
From: Peter Rosin <peda@axentia.se>
Message-ID: <e0be4d76-4c17-6955-5106-eb36b09c3b19@axentia.se>
Date: Sat, 19 May 2018 23:59:57 +0200
MIME-Version: 1.0
In-Reply-To: <20180430120842.28110-1-wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 2018-04-30 14:08, Wolfram Sang wrote:
> The demux device is only a logical device with no children. So, no
> RuntimePM is needed, let's disable the sysfs interface for it.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
> 
> I think it is proper to just disable the interface without enabling RPM at all.
> USB and PCIE core do this as well. Still, adding PM and Rafael to CC in case we
> all got it wrong.

Sounds ok to me. I'm not fluent with PM stuff, but I trust your judgement.

Applied to i2c-mux/for-next.

Cheers,
Peter

>  drivers/i2c/muxes/i2c-demux-pinctrl.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/i2c/muxes/i2c-demux-pinctrl.c b/drivers/i2c/muxes/i2c-demux-pinctrl.c
> index 61440a9507e4..d5e7d4aa6ee1 100644
> --- a/drivers/i2c/muxes/i2c-demux-pinctrl.c
> +++ b/drivers/i2c/muxes/i2c-demux-pinctrl.c
> @@ -18,6 +18,7 @@
>  #include <linux/of.h>
>  #include <linux/pinctrl/consumer.h>
>  #include <linux/platform_device.h>
> +#include <linux/pm_runtime.h>
>  #include <linux/slab.h>
>  #include <linux/sysfs.h>
>  
> @@ -262,6 +263,8 @@ static int i2c_demux_pinctrl_probe(struct platform_device *pdev)
>  
>  	platform_set_drvdata(pdev, priv);
>  
> +	pm_runtime_no_callbacks(&pdev->dev);
> +
>  	/* switch to first parent as active master */
>  	i2c_demux_activate_master(priv, 0);
>  
> 
