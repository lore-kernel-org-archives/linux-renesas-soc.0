Subject: Re: [PATCH 2/2] drm: rcar-du: Add HDMI outputs to R8A7796 device
 description
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 dri-devel@lists.freedesktop.org
Cc: linux-renesas-soc@vger.kernel.org
References: <20170621090407.4093-1-laurent.pinchart+renesas@ideasonboard.com>
 <20170621090407.4093-2-laurent.pinchart+renesas@ideasonboard.com>
Reply-To: kieran.bingham@ideasonboard.com
From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Message-ID: <eebddb5b-f642-e9d3-451f-a2f2d7c68d38@ideasonboard.com>
Date: Wed, 12 Jul 2017 14:51:13 +0100
MIME-Version: 1.0
In-Reply-To: <20170621090407.4093-2-laurent.pinchart+renesas@ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Laurent,

This looks good to me.

Table 35.1 (in the DU datasheet) certainly shows that there is only an HDMI-IF0
on the M3, but it's amusing that (and I was confused by the fact that) my
r8a7796 board (Salvator-X) still has the HDMI1 populated. Of course I presume
this is populated to keep the boards the same but is not connected in the chip.

Anyway, that's irrelevant to this patch so ...

On 21/06/17 10:04, Laurent Pinchart wrote:
> Update the device description with the HDMI output.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

> ---
>  drivers/gpu/drm/rcar-du/rcar_du_drv.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_drv.c b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> index d6a0255181cc..fc0ae0947b8f 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> @@ -180,19 +180,25 @@ static const struct rcar_du_device_info rcar_du_r8a7796_info = {
>  		  | RCAR_DU_FEATURE_VSP1_SOURCE,
>  	.num_crtcs = 3,
>  	.routes = {
> -		/* R8A7796 has one RGB output, one LVDS output and one
> -		 * (currently unsupported) HDMI output.
> +		/*
> +		 * R8A7796 has one RGB output, one LVDS output and one HDMI
> +		 * output.
>  		 */
>  		[RCAR_DU_OUTPUT_DPAD0] = {
>  			.possible_crtcs = BIT(2),
>  			.port = 0,
>  		},
> +		[RCAR_DU_OUTPUT_HDMI0] = {
> +			.possible_crtcs = BIT(1),
> +			.port = 1,
> +		},
>  		[RCAR_DU_OUTPUT_LVDS0] = {
>  			.possible_crtcs = BIT(0),
>  			.port = 2,
>  		},
>  	},
>  	.num_lvds = 1,
> +	.dpll_ch =  BIT(1),
>  };
>  
>  static const struct of_device_id rcar_du_of_table[] = {
> 
