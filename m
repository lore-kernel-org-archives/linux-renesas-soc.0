Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wm1-f67.google.com ([209.85.128.67]:32984 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729588AbeKFA1c (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 5 Nov 2018 19:27:32 -0500
Received: by mail-wm1-f67.google.com with SMTP id f19-v6so6619324wmb.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 05 Nov 2018 07:07:23 -0800 (PST)
Subject: Re: [PATCH 5/5] thermal: zx2967_thermal: simplify getting
 .driver_data
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-kernel@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org, Jun Nie <jun.nie@linaro.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>,
        Eduardo Valentin <edubezval@gmail.com>,
        linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org
References: <20181021200053.2194-1-wsa+renesas@sang-engineering.com>
 <20181021200053.2194-6-wsa+renesas@sang-engineering.com>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
Message-ID: <1de46d0b-a241-8ee6-7bf3-eb8ae4c22251@linaro.org>
Date: Mon, 5 Nov 2018 16:07:19 +0100
MIME-Version: 1.0
In-Reply-To: <20181021200053.2194-6-wsa+renesas@sang-engineering.com>
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
>  drivers/thermal/zx2967_thermal.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/thermal/zx2967_thermal.c b/drivers/thermal/zx2967_thermal.c
> index 6acce0bce7c0..145ebf371598 100644
> --- a/drivers/thermal/zx2967_thermal.c
> +++ b/drivers/thermal/zx2967_thermal.c
> @@ -207,8 +207,7 @@ MODULE_DEVICE_TABLE(of, zx2967_thermal_id_table);
>  #ifdef CONFIG_PM_SLEEP
>  static int zx2967_thermal_suspend(struct device *dev)
>  {
> -	struct platform_device *pdev = to_platform_device(dev);
> -	struct zx2967_thermal_priv *priv = platform_get_drvdata(pdev);
> +	struct zx2967_thermal_priv *priv = dev_get_drvdata(dev);
>  
>  	if (priv && priv->clk_topcrm)
>  		clk_disable_unprepare(priv->clk_topcrm);
> @@ -221,8 +220,7 @@ static int zx2967_thermal_suspend(struct device *dev)
>  
>  static int zx2967_thermal_resume(struct device *dev)
>  {
> -	struct platform_device *pdev = to_platform_device(dev);
> -	struct zx2967_thermal_priv *priv = platform_get_drvdata(pdev);
> +	struct zx2967_thermal_priv *priv = dev_get_drvdata(dev);
>  	int error;
>  
>  	error = clk_prepare_enable(priv->clk_topcrm);
> 


-- 
 <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
