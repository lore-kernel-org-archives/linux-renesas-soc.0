Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from Mailgw01.mediatek.com ([1.203.163.78]:31579 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1753620AbeDTHqc (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 20 Apr 2018 03:46:32 -0400
Message-ID: <1524210384.25162.1.camel@mhfsdcap03>
Subject: Re: [PATCH 55/61] usb: mtu3: simplify getting .drvdata
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
CC: <linux-kernel@vger.kernel.org>,
        <linux-renesas-soc@vger.kernel.org>,
        <kernel-janitors@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        <linux-usb@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>
Date: Fri, 20 Apr 2018 15:46:24 +0800
In-Reply-To: <20180419140641.27926-56-wsa+renesas@sang-engineering.com>
References: <20180419140641.27926-1-wsa+renesas@sang-engineering.com>
         <20180419140641.27926-56-wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

hi,

On Thu, 2018-04-19 at 16:06 +0200, Wolfram Sang wrote:
> We should get drvdata from struct device directly. Going via
> platform_device is an unneeded step back and forth.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
> 
> Build tested only. buildbot is happy. Please apply individually.
> 
>  drivers/usb/mtu3/mtu3_plat.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/usb/mtu3/mtu3_plat.c b/drivers/usb/mtu3/mtu3_plat.c
> index 628d5ce356ca..46551f6d16fd 100644
> --- a/drivers/usb/mtu3/mtu3_plat.c
> +++ b/drivers/usb/mtu3/mtu3_plat.c
> @@ -447,8 +447,7 @@ static int mtu3_remove(struct platform_device *pdev)
>   */
>  static int __maybe_unused mtu3_suspend(struct device *dev)
>  {
> -	struct platform_device *pdev = to_platform_device(dev);
> -	struct ssusb_mtk *ssusb = platform_get_drvdata(pdev);
> +	struct ssusb_mtk *ssusb = dev_get_drvdata(dev);
>  
>  	dev_dbg(dev, "%s\n", __func__);
>  
> @@ -466,8 +465,7 @@ static int __maybe_unused mtu3_suspend(struct device *dev)
>  
>  static int __maybe_unused mtu3_resume(struct device *dev)
>  {
> -	struct platform_device *pdev = to_platform_device(dev);
> -	struct ssusb_mtk *ssusb = platform_get_drvdata(pdev);
> +	struct ssusb_mtk *ssusb = dev_get_drvdata(dev);
>  	int ret;
>  
>  	dev_dbg(dev, "%s\n", __func__);

Acked-by: Chunfeng Yun <chunfeng.yun@mediatek.com>

Thanks
