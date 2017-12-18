Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:38045 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932240AbdLRIOL (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 18 Dec 2017 03:14:11 -0500
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
        David Airlie <airlied@linux.ie>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux-Kernel <linux-kernel@vger.kernel.org>,
        dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v4 1/2] drm: rcar-du: use 1000 to avoid misunderstanding in rcar_du_dpll_divider()
Date: Mon, 18 Dec 2017 10:14:17 +0200
Message-ID: <29110897.lreW3hDc8y@avalon>
In-Reply-To: <87po7criel.wl%kuninori.morimoto.gx@renesas.com>
References: <87r2rsrifu.wl%kuninori.morimoto.gx@renesas.com> <87po7criel.wl%kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello Morimoto-san,

Thankk you for the patch.

On Monday, 18 December 2017 02:35:18 EET Kuninori Morimoto wrote:
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> 
> It is difficult to understand its scale if number has many 0s.
> This patch uses "* 1000" to avoid it in rcar_du_dpll_divider().
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
> v3 -> v4
> 
>  - no change
> 
>  drivers/gpu/drm/rcar-du/rcar_du_crtc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
> b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c index 5685d5a..6820461f 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
> @@ -132,7 +132,7 @@ static void rcar_du_dpll_divider(struct rcar_du_crtc
> *rcrtc,
> 
>  				output = input * (n + 1) / (m + 1)
>  				       / (fdpll + 1);
> -				if (output >= 400000000)
> +				if (output >= 400 * 1000 * 1000)
>  					continue;
> 
>  				diff = abs((long)output - (long)target);

-- 
Regards,

Laurent Pinchart
