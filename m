Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:41393 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933063AbcLTBHi (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 19 Dec 2016 20:07:38 -0500
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Wolfram Sang <wsa@the-dreams.de>
Cc: linux-renesas-soc@vger.kernel.org, David Airlie <airlied@linux.ie>,
        dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] gpu: drm: rcar-du: rcar_du_drv: don't open code of_device_get_match_data()
Date: Tue, 20 Dec 2016 03:08:05 +0200
Message-ID: <2560269.bN5qXdpXVS@avalon>
In-Reply-To: <1456850269-8290-1-git-send-email-wsa@the-dreams.de>
References: <1456850269-8290-1-git-send-email-wsa@the-dreams.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Wolfram,

Thank you for the patch. It looks like I've missed it, sorry about that.

On Tuesday 01 March 2016 17:37:34 Wolfram Sang wrote:
> From: Wolfram Sang <wsa+renesas@sang-engineering.com>
> 
> This change will also make Coverity happy by avoiding a theoretical NULL
> pointer dereference; yet another reason is to use the above helper function
> to tighten the code and make it more readable.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Acked-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Tested-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

and taken in my tree.

> ---
> 
> Compile tested only. I am on the road and can't test the multimedia drivers
> because of no cables :( If someone could test it, that would be much
> appreciated. Or I'll do it next week. The pattern worked for other drivers
> I could actually test, though.
> 
>  drivers/gpu/drm/rcar-du/rcar_du_drv.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> b/drivers/gpu/drm/rcar-du/rcar_du_drv.c index
> ed6006bf6bd893..ac95509e80bb7c 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> @@ -318,7 +318,7 @@ static int rcar_du_probe(struct platform_device *pdev)
>  	init_waitqueue_head(&rcdu->commit.wait);
> 
>  	rcdu->dev = &pdev->dev;
> -	rcdu->info = of_match_device(rcar_du_of_table, rcdu->dev)->data;
> +	rcdu->info = of_device_get_match_data(rcdu->dev);
> 
>  	ddev = drm_dev_alloc(&rcar_du_driver, &pdev->dev);
>  	if (!ddev)

-- 
Regards,

Laurent Pinchart
