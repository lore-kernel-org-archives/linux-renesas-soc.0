Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:37128 "EHLO
	galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751322AbcDYREd (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Mon, 25 Apr 2016 13:04:33 -0400
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: David Airlie <airlied@linux.ie>,
	Daniel Vetter <daniel.vetter@ffwll.ch>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Koji Matsuoka <koji.matsuoka.xm@renesas.com>,
	Alexey Brodkin <Alexey.Brodkin@synopsys.com>,
	dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm: rcar: remove unused variable
Date: Mon, 25 Apr 2016 20:04:54 +0300
Message-ID: <4434458.QD7L4MnxGs@avalon>
In-Reply-To: <1461589881-1394495-1-git-send-email-arnd@arndb.de>
References: <1461589881-1394495-1-git-send-email-arnd@arndb.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Arnd,

Thank you for the patch.

On Monday 25 Apr 2016 15:11:08 Arnd Bergmann wrote:
> A cleanup for the rcar-du driver left an unused variable behind:
> 
> drm/rcar-du/rcar_du_drv.c: In function 'rcar_du_probe':
> drm/rcar-du/rcar_du_drv.c:300:24: error: unused variable 'connector'
> [-Werror=unused-variable]
> 
> This removes the variable.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> Fixes: d63c25e4245a ("drm: rcar-du: Use generic drm_connector_register_all()
> helper")

I've already submitted an identical patch and Daniel Vetter has queued it up.

> ---
>  drivers/gpu/drm/rcar-du/rcar_du_drv.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> b/drivers/gpu/drm/rcar-du/rcar_du_drv.c index 0f251dc11082..fb9242d27883
> 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> @@ -297,7 +297,6 @@ static int rcar_du_probe(struct platform_device *pdev)
>  {
>  	struct device_node *np = pdev->dev.of_node;
>  	struct rcar_du_device *rcdu;
> -	struct drm_connector *connector;
>  	struct drm_device *ddev;
>  	struct resource *mem;
>  	int ret;

-- 
Regards,

Laurent Pinchart
