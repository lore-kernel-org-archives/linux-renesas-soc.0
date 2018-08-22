Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from perceval.ideasonboard.com ([213.167.242.64]:39248 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728208AbeHVPk4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 22 Aug 2018 11:40:56 -0400
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc: "open list:DRM DRIVERS FOR RENESAS" <dri-devel@lists.freedesktop.org>,
        "open list:DRM DRIVERS FOR RENESAS"
        <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH 2/3] drm: rcar-du: Write ESCR register per channel
Date: Wed, 22 Aug 2018 15:17:12 +0300
Message-ID: <1605837.B8ZfZIf33E@avalon>
In-Reply-To: <1534922509-15197-3-git-send-email-jacopo+renesas@jmondi.org>
References: <1534922509-15197-1-git-send-email-jacopo+renesas@jmondi.org> <1534922509-15197-3-git-send-email-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Jacopo,

Thank you for the patch.

On Wednesday, 22 August 2018 10:21:48 EEST Jacopo Mondi wrote:
> The ESCR registers offset definition is confusing, as each channel is
> equipped with an ESCR register instance, but the names suggest only ESCR and
> ESCR2 are taken into account.
> 
> Rename the offsets to a name that includes the channels they apply to, and
> write them to each channel with 'rcar_du_crtc_write()'.
> 
> Cosmetic patch, no functional changes intended.

I think patches 2/3 and 3/3 can be squashed together, there's no real reason 
to keep them separate. I propose updating the commit message to

"drm: rcar-du: Write ESCR and OTAR as CRTC registers 
  
The ESCR and OTAR registers exist in each DU channel, but at different 
offsets for odd and even channels. This led to usage of the group 
register access API to write them, with offsets macros named ESCR/OTAR 
and ESCR2/OTAR2 for the first and second ESCR/OTAR register in the group 
respectively.

The names are confusing as it suggests that the ESCR/OTAR registers for 
DU0 and DU2 are taken into account, especially with writes performed to
the group register access API.

Rename the offsets to ESCR/OTAR02 and ESCR/OTAR13, and use the CRTC 
register access API to clarify the code. The offsets values are updated 
accordingly.

Cosmetic patch, no functional changes intended."

Otherwise the patches look good to me, so

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

and applied the squashed version to my tree.

> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> ---
>  drivers/gpu/drm/rcar-du/rcar_du_crtc.c | 3 +--
>  drivers/gpu/drm/rcar-du/rcar_du_regs.h | 4 ++--
>  2 files changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
> b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c index 5454884..714c1fc 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
> @@ -294,8 +294,7 @@ static void rcar_du_crtc_set_display_timing(struct
> rcar_du_crtc *rcrtc) }
>  	}
> 
> -	rcar_du_group_write(rcrtc->group, rcrtc->index % 2 ? ESCR2 : ESCR,
> -			    escr);
> +	rcar_du_crtc_write(rcrtc, rcrtc->index % 2 ? ESCR13 : ESCR02, escr);
>  	rcar_du_group_write(rcrtc->group, rcrtc->index % 2 ? OTAR2 : OTAR, 0);
> 
>  	/* Signal polarities */
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_regs.h
> b/drivers/gpu/drm/rcar-du/rcar_du_regs.h index 9dfd220..ebc4aea 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_regs.h
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_regs.h
> @@ -492,8 +492,8 @@
>   * External Synchronization Control Registers
>   */
> 
> -#define ESCR			0x10000
> -#define ESCR2			0x31000
> +#define ESCR02			0x10000
> +#define ESCR13			0x01000
>  #define ESCR_DCLKOINV		(1 << 25)
>  #define ESCR_DCLKSEL_DCLKIN	(0 << 20)
>  #define ESCR_DCLKSEL_CLKS	(1 << 20)

-- 
Regards,

Laurent Pinchart
