Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wm1-f66.google.com ([209.85.128.66]:52727 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729536AbeKFA0R (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 5 Nov 2018 19:26:17 -0500
Received: by mail-wm1-f66.google.com with SMTP id l66-v6so2568258wml.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 05 Nov 2018 07:06:08 -0800 (PST)
Subject: Re: [PATCH 3/5] thermal: spear_thermal: simplify getting .driver_data
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-kernel@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org, Zhang Rui <rui.zhang@intel.com>,
        Eduardo Valentin <edubezval@gmail.com>,
        linux-pm@vger.kernel.org
References: <20181021200053.2194-1-wsa+renesas@sang-engineering.com>
 <20181021200053.2194-4-wsa+renesas@sang-engineering.com>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
Message-ID: <8dbe48f1-6e9c-ed43-b902-6d9f7f757017@linaro.org>
Date: Mon, 5 Nov 2018 16:06:05 +0100
MIME-Version: 1.0
In-Reply-To: <20181021200053.2194-4-wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 21/10/2018 22:00, Wolfram Sang wrote:
> We should get 'driver_data' from 'struct device' directly. Going via
> platform_device is an unneeded step back and forth.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Daniel Lezcano <daniel.lezcano@linaro.org>

> ---
> 
> Build tested only. buildbot is happy.
> 
>  drivers/thermal/spear_thermal.c | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/thermal/spear_thermal.c b/drivers/thermal/spear_thermal.c
> index 81b35aace9de..8b9d567134d0 100644
> --- a/drivers/thermal/spear_thermal.c
> +++ b/drivers/thermal/spear_thermal.c
> @@ -56,8 +56,7 @@ static struct thermal_zone_device_ops ops = {
>  
>  static int __maybe_unused spear_thermal_suspend(struct device *dev)
>  {
> -	struct platform_device *pdev = to_platform_device(dev);
> -	struct thermal_zone_device *spear_thermal = platform_get_drvdata(pdev);
> +	struct thermal_zone_device *spear_thermal = dev_get_drvdata(dev);
>  	struct spear_thermal_dev *stdev = spear_thermal->devdata;
>  	unsigned int actual_mask = 0;
>  
> @@ -73,15 +72,14 @@ static int __maybe_unused spear_thermal_suspend(struct device *dev)
>  
>  static int __maybe_unused spear_thermal_resume(struct device *dev)
>  {
> -	struct platform_device *pdev = to_platform_device(dev);
> -	struct thermal_zone_device *spear_thermal = platform_get_drvdata(pdev);
> +	struct thermal_zone_device *spear_thermal = dev_get_drvdata(dev);
>  	struct spear_thermal_dev *stdev = spear_thermal->devdata;
>  	unsigned int actual_mask = 0;
>  	int ret = 0;
>  
>  	ret = clk_enable(stdev->clk);
>  	if (ret) {
> -		dev_err(&pdev->dev, "Can't enable clock\n");
> +		dev_err(dev, "Can't enable clock\n");
>  		return ret;
>  	}
>  
> 


-- 
 <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
