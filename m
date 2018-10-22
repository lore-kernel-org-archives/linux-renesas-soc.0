Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from perceval.ideasonboard.com ([213.167.242.64]:33556 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728374AbeJVTlb (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 22 Oct 2018 15:41:31 -0400
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Nguyen An Hoan <na-hoan@jinso.co.jp>
Cc: linux-renesas-soc@vger.kernel.org, geert+renesas@glider.be,
        kuninori.morimoto.gx@renesas.com, yoshihiro.shimoda.uh@renesas.com,
        h-inayoshi@jinso.co.jp, nv-dung@jinso.co.jp, cv-dong@jinso.co.jp
Subject: Re: [PATCH] drm: rcar-du: Re-update the DSYSR register value for start/stop
Date: Mon, 22 Oct 2018 14:23:23 +0300
Message-ID: <35008313.pubLakprOv@avalon>
In-Reply-To: <1540189854-14726-1-git-send-email-na-hoan@jinso.co.jp>
References: <1540189854-14726-1-git-send-email-na-hoan@jinso.co.jp>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello Hoan,

Thank you for the patch.

On Monday, 22 October 2018 09:30:54 EEST Nguyen An Hoan wrote:
> From: Hoan Nguyen An <na-hoan@jinso.co.jp>
> 
> From previous commit 0521ccb "drm: rcar-du: Cache DSYSR value to ensure
> known initial value"

What exact commit are you referring to ? The mainline commit that has this 
subject is 9144adc5e5a99577bce0d4ee2ca3615f53b9d296.

> We only need to update DSYSR0, DSYSR2 for start/stop.
> So using rgrp-> mmio_offset is enough, the change back from rcar_du_crtc ->
> rcar_du_group -> rcar_du_crtc leading to mmio addresses for DSYSR may be
> different.

Is this fixing an actual problem ? If you look at the code, the line

	struct rcar_du_crtc *rcrtc = &rgrp->dev->crtcs[rgrp->index * 2];

makes sure that we select DU0 or DU2 only, so the register write

	rcar_du_crtc_dsysr_clr_set(rcrtc, DSYSR_DRES | DSYSR_DEN,
				   start ? DSYSR_DEN : DSYSR_DRES);

should only access DSYSR0 and DSYSR2.

> Signed-off-by: Hoan Nguyen An <na-hoan@jinso.co.jp>
> ---
>  drivers/gpu/drm/rcar-du/rcar_du_group.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_group.c
> b/drivers/gpu/drm/rcar-du/rcar_du_group.c index d85f0a1..a5f7eed 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_group.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_group.c
> @@ -202,10 +202,9 @@ void rcar_du_group_put(struct rcar_du_group *rgrp)
> 
>  static void __rcar_du_group_start_stop(struct rcar_du_group *rgrp, bool
> start) {
> -	struct rcar_du_crtc *rcrtc = &rgrp->dev->crtcs[rgrp->index * 2];
> -
> -	rcar_du_crtc_dsysr_clr_set(rcrtc, DSYSR_DRES | DSYSR_DEN,
> -				   start ? DSYSR_DEN : DSYSR_DRES);
> +	rcar_du_group_write(rgrp, DSYSR,
> +			(rcar_du_group_read(rgrp, DSYSR) & ~(DSYSR_DRES | DSYSR_DEN)) |
> +			(start ? DSYSR_DEN : DSYSR_DRES));
>  }
> 
>  void rcar_du_group_start_stop(struct rcar_du_group *rgrp, bool start)

-- 
Regards,

Laurent Pinchart
