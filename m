Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from smtp1.de.adit-jv.com ([62.225.105.245]:57889 "EHLO
        smtp1.de.adit-jv.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752169AbeC1Oug (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 28 Mar 2018 10:50:36 -0400
Date: Wed, 28 Mar 2018 16:40:51 +0200
From: Eugeniu Rosca <erosca@de.adit-jv.com>
To: Wolfram Sang <wsa@the-dreams.de>
CC: <linux-i2c@vger.kernel.org>, <linux-renesas-soc@vger.kernel.org>,
        Eugeniu Rosca <erosca@de.adit-jv.com>,
        Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>
Subject: Re: [PATCH] i2c: rcar: initialize earlier using subsys_initcall()
Message-ID: <20180328144051.GA28586@vmlxhi-102.adit-jv.com>
References: <1521197932-2073-1-git-send-email-vladimir_zapolskiy@mentor.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <1521197932-2073-1-git-send-email-vladimir_zapolskiy@mentor.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello Wolfram and i2c/Renesas contributors,

To give you some background behind this change, it is done in the
context of rcar3 boot optimization, while trying to put our past
experience in practice for reaching the "rvc-in-less-than-2s"
requirement for our customers.

The current commit description should already speak by itself. While
switching drivers to async probing is hardly suitable with mainline
(am I wrong?), I believe this small change should be harmless. If
there are any concerns, we will do our best to properly handle them.

Special thanks to Vladimir, for reviewing and submitting the patch.

Best regards,
Eugeniu.

On Fri, Mar 16, 2018 at 12:58:52PM +0200, Vladimir Zapolskiy wrote:
> From: Eugeniu Rosca <erosca@de.adit-jv.com>
> 
> The purpose of this patch looks pretty similar to:
> 104522806a7d ("i2c: designware: dw_i2c_init_driver as subsys initcall")
> 74f56c4ad4e4 ("i2c-bfin-twi: move setup to the earlier subsys initcall")
> b8680784875b ("i2c-gpio: Move initialization code to subsys_initcall()")
> 5d3f33318a6c ("[PATCH] i2c-imx: make bus available early")
> ccb3bc16b489 ("i2c-sh_mobile: change module_init() to subsys_initcall()")
> 18dc83a6ea48 ("i2c: i2c-s3c2410: Initialise Samsung I2C controller early")
> 2514cca06be9 ("[ARM] 5394/1: Add static bus numbering support to i2c-versatile")
> 47a9b1379a5e ("i2c-pxa: Initialize early")
> 
> However, the story behind it might be a bit different.
> Experimenting with async probing in various rcar-specific drivers (e.g.
> rcar-du, vsp1, rcar-fcp, rcar-vin), it was noticed that in most of
> the cases enabling async probing in one driver introduced some degree of
> inconsistency in the initialization of other builtin drivers.
> 
> To give an example, with pure sequential driver initialization, based
> on 5 dmesg logs, the builtin kernel initialization deviation is
> around +/- 5ms, whereas after enabling async probing in e.g. vsp1
> driver, the variance is increased to sometimes +/- 80ms or more.
> 
> This patch fixes it and keeps the startup time consistent after
> switching certain i2c-dependent drivers to asynchronous probing on
> H3-es20-Salvator-X target.
> 
> Another effect seems to be improving the init time of rcar_i2c_driver
> itself from ~7ms to ~1ms (assuming CONFIG_I2C_RCAR=y).
> 
> Signed-off-by: Eugeniu Rosca <erosca@de.adit-jv.com>
> Signed-off-by: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>
> ---
>  drivers/i2c/busses/i2c-rcar.c | 13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/i2c/busses/i2c-rcar.c b/drivers/i2c/busses/i2c-rcar.c
> index 4159ebcec2bb..502f62052b49 100644
> --- a/drivers/i2c/busses/i2c-rcar.c
> +++ b/drivers/i2c/busses/i2c-rcar.c
> @@ -972,7 +972,18 @@ static struct platform_driver rcar_i2c_driver = {
>  	.remove		= rcar_i2c_remove,
>  };
>  
> -module_platform_driver(rcar_i2c_driver);
> +static int __init rcar_i2c_driver_init(void)
> +{
> +	return platform_driver_register(&rcar_i2c_driver);
> +}
> +
> +static void __exit rcar_i2c_driver_exit(void)
> +{
> +	return platform_driver_unregister(&rcar_i2c_driver);
> +}
> +
> +subsys_initcall(rcar_i2c_driver_init);
> +module_exit(rcar_i2c_driver_exit);
>  
>  MODULE_LICENSE("GPL v2");
>  MODULE_DESCRIPTION("Renesas R-Car I2C bus driver");
> -- 
> 2.8.1
> 

Best regards,
Eugeniu.
