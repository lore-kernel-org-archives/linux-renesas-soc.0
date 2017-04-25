Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:56602 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1175183AbdDYHWl (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 25 Apr 2017 03:22:41 -0400
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Wei Yongjun <weiyj.lk@gmail.com>
Cc: David Airlie <airlied@linux.ie>,
        Wei Yongjun <weiyongjun1@huawei.com>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH -next] drm/shmob: fix return value check in shmob_drm_probe()
Date: Tue, 25 Apr 2017 10:23:42 +0300
Message-ID: <4032906.qIxZEVbvQP@avalon>
In-Reply-To: <20170425030808.7632-1-weiyj.lk@gmail.com>
References: <20170425030808.7632-1-weiyj.lk@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Wei,

Thank you for the patch.

On Tuesday 25 Apr 2017 03:08:08 Wei Yongjun wrote:
> From: Wei Yongjun <weiyongjun1@huawei.com>
> 
> In case of error, the function devm_ioremap_resource() returns ERR_PTR()
> and never returns NULL. The NULL test in the return value check should
> be replaced with IS_ERR().
> 
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

and applied to my tree. I'll send a pull request for v4.13.

> ---
>  drivers/gpu/drm/shmobile/shmob_drm_drv.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/shmobile/shmob_drm_drv.c
> b/drivers/gpu/drm/shmobile/shmob_drm_drv.c index 800d1d2..6bd777a 100644
> --- a/drivers/gpu/drm/shmobile/shmob_drm_drv.c
> +++ b/drivers/gpu/drm/shmobile/shmob_drm_drv.c
> @@ -235,8 +235,8 @@ static int shmob_drm_probe(struct platform_device *pdev)
> 
>  	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>  	sdev->mmio = devm_ioremap_resource(&pdev->dev, res);
> -	if (sdev->mmio == NULL)
> -		return -ENOMEM;
> +	if (IS_ERR(sdev->mmio))
> +		return PTR_ERR(sdev->mmio);
> 
>  	ret = shmob_drm_setup_clocks(sdev, pdata->clk_source);
>  	if (ret < 0)

-- 
Regards,

Laurent Pinchart
