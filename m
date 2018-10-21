Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mga06.intel.com ([134.134.136.31]:54845 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727009AbeJVFfg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 22 Oct 2018 01:35:36 -0400
Date: Mon, 22 Oct 2018 00:19:51 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org
Subject: Re: [PATCH 1/5] pinctrl: intel: pinctrl-baytrail: simplify getting
 .driver_data
Message-ID: <20181021211951.GM10650@smile.fi.intel.com>
References: <20181021200032.1833-1-wsa+renesas@sang-engineering.com>
 <20181021200032.1833-2-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181021200032.1833-2-wsa+renesas@sang-engineering.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Sun, Oct 21, 2018 at 10:00:27PM +0200, Wolfram Sang wrote:
> We should get 'driver_data' from 'struct device' directly. Going via
> platform_device is an unneeded step back and forth.
> 

Thanks!

I see only 3 out of 5 patches.

Since we are about to establish a separate tree as well as an additional record
in MAINTAINERS data base for Intel pinctrl driver, I ask you to resend only
Intel related stuff in a separate series.

> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
> 
> Build tested only. buildbot is happy.
> 
>  drivers/pinctrl/intel/pinctrl-baytrail.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/pinctrl/intel/pinctrl-baytrail.c b/drivers/pinctrl/intel/pinctrl-baytrail.c
> index 6d1a43c0c251..a1c2548123a1 100644
> --- a/drivers/pinctrl/intel/pinctrl-baytrail.c
> +++ b/drivers/pinctrl/intel/pinctrl-baytrail.c
> @@ -1838,8 +1838,7 @@ static int byt_pinctrl_probe(struct platform_device *pdev)
>  #ifdef CONFIG_PM_SLEEP
>  static int byt_gpio_suspend(struct device *dev)
>  {
> -	struct platform_device *pdev = to_platform_device(dev);
> -	struct byt_gpio *vg = platform_get_drvdata(pdev);
> +	struct byt_gpio *vg = dev_get_drvdata(dev);
>  	int i;
>  
>  	for (i = 0; i < vg->soc_data->npins; i++) {
> @@ -1867,8 +1866,7 @@ static int byt_gpio_suspend(struct device *dev)
>  
>  static int byt_gpio_resume(struct device *dev)
>  {
> -	struct platform_device *pdev = to_platform_device(dev);
> -	struct byt_gpio *vg = platform_get_drvdata(pdev);
> +	struct byt_gpio *vg = dev_get_drvdata(dev);
>  	int i;
>  
>  	for (i = 0; i < vg->soc_data->npins; i++) {
> -- 
> 2.19.0
> 

-- 
With Best Regards,
Andy Shevchenko
