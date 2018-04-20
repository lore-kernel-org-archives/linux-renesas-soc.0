Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mout01.posteo.de ([185.67.36.141]:50048 "EHLO mout01.posteo.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1754243AbeDTIxL (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 20 Apr 2018 04:53:11 -0400
Received: from submission (posteo.de [89.146.220.130])
        by mout01.posteo.de (Postfix) with ESMTPS id 642CA210B1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 20 Apr 2018 10:45:54 +0200 (CEST)
From: Marc Dietrich <marvin24@gmx.de>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        kernel-janitors@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        ac100@lists.launchpad.net, linux-tegra@vger.kernel.org,
        devel@driverdev.osuosl.org
Subject: Re: [PATCH 49/61] staging: nvec: simplify getting .drvdata
Date: Fri, 20 Apr 2018 10:45:42 +0200
Message-ID: <1534139.KRlJX3jJQi@ax5200p>
In-Reply-To: <20180419140641.27926-50-wsa+renesas@sang-engineering.com>
References: <20180419140641.27926-1-wsa+renesas@sang-engineering.com> <20180419140641.27926-50-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Am Donnerstag, 19. April 2018, 16:06:19 CEST schrieb Wolfram Sang:
> We should get drvdata from struct device directly. Going via
> platform_device is an unneeded step back and forth.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Acked-by: Marc Dietrich <marvin24@gmx.de>

> ---
> 
> Build tested only. buildbot is happy. Please apply individually.
> 
>  drivers/staging/nvec/nvec.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/staging/nvec/nvec.c b/drivers/staging/nvec/nvec.c
> index 52054a528723..2a5e0dcf4162 100644
> --- a/drivers/staging/nvec/nvec.c
> +++ b/drivers/staging/nvec/nvec.c
> @@ -925,8 +925,7 @@ static int tegra_nvec_remove(struct platform_device
> *pdev) static int nvec_suspend(struct device *dev)
>  {
>  	int err;
> -	struct platform_device *pdev = to_platform_device(dev);
> -	struct nvec_chip *nvec = platform_get_drvdata(pdev);
> +	struct nvec_chip *nvec = dev_get_drvdata(dev);
>  	struct nvec_msg *msg;
>  	char ap_suspend[] = { NVEC_SLEEP, AP_SUSPEND };
> 
> @@ -946,8 +945,7 @@ static int nvec_suspend(struct device *dev)
> 
>  static int nvec_resume(struct device *dev)
>  {
> -	struct platform_device *pdev = to_platform_device(dev);
> -	struct nvec_chip *nvec = platform_get_drvdata(pdev);
> +	struct nvec_chip *nvec = dev_get_drvdata(dev);
> 
>  	dev_dbg(nvec->dev, "resuming\n");
>  	tegra_init_i2c_slave(nvec);
