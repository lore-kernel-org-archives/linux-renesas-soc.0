Return-Path: <kieranbingham.mailinglists+caf_=kieranbingham=gmail.com@gmail.com>
Return-Path: <linux-kernel-owner@vger.kernel.org>
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	koji.matsuoka.xm@renesas.com, yoshihiro.shimoda.uh@renesas.com,
	naoya.shiiba.nx@renesas.com, ryo.kodama.vz@renesas.com,
	hiroyuki.yokoyama.vx@renesas.com, yoshifumi.hosoya.wj@renesas.com,
	takeshi.kihara.df@renesas.com, toshiaki.komatsu.ud@renesas.com,
	harunobu.kurokawa.dn@renesas.com, ryusuke.sakato.bx@renesas.com,
	tomoharu.fukawa.eb@renesas.com, kouei.abe.cp@renesas.com,
	khiem.nguyen.xt@rvc.renesas.com, hien.dang.eb@rvc.renesas.com
Subject: Re: [PATCH] drm: rcar-du: EPROBE_DEFER case doesn't need error message
Date: Tue, 24 May 2016 16:32:13 +0300
Message-ID: <3209827.hXSB4Y22Yy@avalon>
In-Reply-To: <87posc9gg6.wl%kuninori.morimoto.gx@renesas.com>
References: <redmine.issue-77851.20151006064038@dm.renesas.com> <redmine.journal-710718.20160523104049.392ea8e63d81580c@dm.renesas.com> <87posc9gg6.wl%kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Morimoto-san,

Thank you for the patch.

On Tuesday 24 May 2016 14:24:09 Kuninori Morimoto wrote:
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> 
> EPROBE_DEFER is not error, thus, error message on kernel log on this
> case is confusable for user. Prints it only error cases.
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
>  drivers/gpu/drm/rcar-du/rcar_du_drv.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> b/drivers/gpu/drm/rcar-du/rcar_du_drv.c index 26fd3ba..1db080c 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> @@ -354,14 +354,16 @@ static int rcar_du_probe(struct platform_device *pdev)
> */
>  	ret = drm_vblank_init(ddev, (1 << rcdu->info->num_crtcs) - 1);
>  	if (ret < 0) {
> -		dev_err(&pdev->dev, "failed to initialize vblank\n");
> +		if (ret != -EPROBE_DEFER)

I don't think this can ever happen. Actually, the only reason 
drm_vblank_init() could return an error at the moment is a kcalloc() failure, 
so we could remove this message completely.

> +			dev_err(&pdev->dev, "failed to initialize vblank\n");
>  		goto error;
>  	}
> 
>  	/* DRM/KMS objects */
>  	ret = rcar_du_modeset_init(rcdu);
>  	if (ret < 0) {
> -		dev_err(&pdev->dev, "failed to initialize DRM/KMS (%d)\n", ret);
> +		if (ret != -EPROBE_DEFER)
> +			dev_err(&pdev->dev, "failed to initialize DRM/KMS (%d)\n", ret);
>  		goto error;
>  	}

-- 
Regards,

Laurent Pinchart
