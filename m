Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from perceval.ideasonboard.com ([213.167.242.64]:38382 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725948AbeHTNYV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 20 Aug 2018 09:24:21 -0400
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Ulrich Hecht <uli+renesas@fpond.eu>
Cc: linux-renesas-soc@vger.kernel.org, dri-devel@lists.freedesktop.org,
        jacopo+renesas@jmondi.org, kieran.bingham+renesas@ideasonboard.com,
        Koji Matsuoka <koji.matsuoka.xm@renesas.com>
Subject: Re: [PROTO][PATCH 01/10] drm: rcar-du: Add clk_set_rate for external clock device
Date: Mon, 20 Aug 2018 13:10:15 +0300
Message-ID: <1985747.4xD5rL3F0m@avalon>
In-Reply-To: <1534254604-24204-2-git-send-email-uli+renesas@fpond.eu>
References: <1534254604-24204-1-git-send-email-uli+renesas@fpond.eu> <1534254604-24204-2-git-send-email-uli+renesas@fpond.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Ulrich,

Thank you for the patch.

On Tuesday, 14 August 2018 16:49:55 EEST Ulrich Hecht wrote:
> From: Koji Matsuoka <koji.matsuoka.xm@renesas.com>
> 
> Signed-off-by: Koji Matsuoka <koji.matsuoka.xm@renesas.com>
> ---
>  drivers/gpu/drm/rcar-du/rcar_du_crtc.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
> b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c index b52b3e8..cd6803a 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
> @@ -229,6 +229,7 @@ static void rcar_du_crtc_set_display_timing(struct
> rcar_du_crtc *rcrtc) unsigned long rate;
>  		u32 extdiv;
> 
> +		clk_set_rate(rcrtc->extclock, mode_clock);

This is a hack, Jacopo has posted "[PATCH 3/3] drm: rcar-du: Improve non-DPLL 
clock selection" which I think is a better solution (or will be in v2 :-)).

>  		extclk = clk_get_rate(rcrtc->extclock);
>  		if (rcdu->info->dpll_ch & (1 << rcrtc->index)) {
>  			unsigned long target = mode_clock;

-- 
Regards,

Laurent Pinchart
