Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf1-f68.google.com ([209.85.167.68]:46280 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727493AbeJVQjL (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 22 Oct 2018 12:39:11 -0400
Received: by mail-lf1-f68.google.com with SMTP id o2-v6so747391lfl.13
        for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Oct 2018 01:21:40 -0700 (PDT)
Subject: Re: [PATCH] drm: rcar-du: Re-update the DSYSR register value for
 start/stop
To: Nguyen An Hoan <na-hoan@jinso.co.jp>,
        linux-renesas-soc@vger.kernel.org, geert+renesas@glider.be
References: <1540189854-14726-1-git-send-email-na-hoan@jinso.co.jp>
Cc: laurent.pinchart@ideasonboard.com,
        kuninori.morimoto.gx@renesas.com, yoshihiro.shimoda.uh@renesas.com,
        h-inayoshi@jinso.co.jp, nv-dung@jinso.co.jp, cv-dong@jinso.co.jp
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <41a8932e-74a3-3225-5243-11df5c3923c8@cogentembedded.com>
Date: Mon, 22 Oct 2018 11:21:19 +0300
MIME-Version: 1.0
In-Reply-To: <1540189854-14726-1-git-send-email-na-hoan@jinso.co.jp>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello!

On 22.10.2018 9:30, Nguyen An Hoan wrote:

> From: Hoan Nguyen An <na-hoan@jinso.co.jp>
>
> From previous commit 0521ccb "drm: rcar-du: Cache DSYSR value to ensure known initial value"

    When you cite an commit, at least 12 digits of SHA1 are needed, and the 
summary needs to enclosed in (""), no just "".

> We only need to update DSYSR0, DSYSR2 for start/stop. So using rgrp-> mmio_offset is enough,
> the change back from rcar_du_crtc -> rcar_du_group -> rcar_du_crtc leading to
> mmio addresses for DSYSR may be different.
>
> Signed-off-by: Hoan Nguyen An <na-hoan@jinso.co.jp>
> ---
>  drivers/gpu/drm/rcar-du/rcar_du_group.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_group.c b/drivers/gpu/drm/rcar-du/rcar_du_group.c
> index d85f0a1..a5f7eed 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_group.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_group.c
> @@ -202,10 +202,9 @@ void rcar_du_group_put(struct rcar_du_group *rgrp)
>
>  static void __rcar_du_group_start_stop(struct rcar_du_group *rgrp, bool start)
>  {
> -	struct rcar_du_crtc *rcrtc = &rgrp->dev->crtcs[rgrp->index * 2];
> -
> -	rcar_du_crtc_dsysr_clr_set(rcrtc, DSYSR_DRES | DSYSR_DEN,
> -				   start ? DSYSR_DEN : DSYSR_DRES);

    The continuation line indentation style used above is different from yours 
below.
would be preferable to keep the existing style...

> +	rcar_du_group_write(rgrp, DSYSR,
> +			(rcar_du_group_read(rgrp, DSYSR) & ~(DSYSR_DRES | DSYSR_DEN)) |
> +			(start ? DSYSR_DEN : DSYSR_DRES));
>  }
>
>  void rcar_du_group_start_stop(struct rcar_du_group *rgrp, bool start)

MBR, Sergei
