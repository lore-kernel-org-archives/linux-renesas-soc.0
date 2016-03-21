Return-Path: <kieranbingham.mailinglists+caf_=kieranbingham=gmail.com@gmail.com>
Return-Path: <linux-kernel-owner@vger.kernel.org>
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Cc: Alexey Brodkin <Alexey.Brodkin@synopsys.com>,
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 4/4 v2] drm: rcar-du - use generic drm_connector_register_all() helper
Date: Mon, 21 Mar 2016 15:26:45 +0200
Message-ID: <1560693.4UujGVhTuc@avalon>
In-Reply-To: <1458563320-30541-5-git-send-email-abrodkin@synopsys.com>
References: <1458563320-30541-1-git-send-email-abrodkin@synopsys.com> <1458563320-30541-5-git-send-email-abrodkin@synopsys.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Alexey,

Thank you for the patch.

On Monday 21 Mar 2016 15:28:40 Alexey Brodkin wrote:
> Now when generic drm_connector_register_all() helper exists we may safely

s/Now when/Now that a/

> substiture with it driver-specific implementation of connectors plugging in

s/substiture with it/substitute it for the/

> sysfs.

And while at it, in the subject line,

s/rcar-du - use/rcar-du: Use/

> Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: linux-renesas-soc@vger.kernel.org

Apart for the commit message fixes,

Acked-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
> 
> No changes v1 -> v2.
> 
>  drivers/gpu/drm/rcar-du/rcar_du_drv.c | 9 +--------
>  1 file changed, 1 insertion(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> b/drivers/gpu/drm/rcar-du/rcar_du_drv.c index 644db36..0f251dc 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> @@ -361,14 +361,7 @@ static int rcar_du_probe(struct platform_device *pdev)
>  	if (ret)
>  		goto error;
> 
> -	mutex_lock(&ddev->mode_config.mutex);
> -	drm_for_each_connector(connector, ddev) {
> -		ret = drm_connector_register(connector);
> -		if (ret < 0)
> -			break;
> -	}
> -	mutex_unlock(&ddev->mode_config.mutex);
> -
> +	ret = drm_connector_register_all(ddev);
>  	if (ret < 0)
>  		goto error;

-- 
Regards,

Laurent Pinchart
