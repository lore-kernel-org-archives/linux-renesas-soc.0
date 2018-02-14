Subject: Re: [PATCH] drm: rcar-du: Enable VSP compositor by default on Gen3
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 dri-devel@lists.freedesktop.org
Cc: linux-renesas-soc@vger.kernel.org
References: <20180112032035.11977-1-laurent.pinchart+renesas@ideasonboard.com>
Reply-To: kieran.bingham@ideasonboard.com
From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Message-ID: <1c5e3fb4-4355-f31e-266f-b3b59efa7c3c@ideasonboard.com>
Date: Wed, 14 Feb 2018 16:15:25 +0000
MIME-Version: 1.0
In-Reply-To: <20180112032035.11977-1-laurent.pinchart+renesas@ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Laurent,

Thankyou for the patch.

On 12/01/18 03:20, Laurent Pinchart wrote:
> On Gen3 hardware the VSP compositor is required for display. Enable it
> by default in the kernel configuration. The option is kept
> user-configurable for testing purpose on Gen2 platforms.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>


> ---
>  drivers/gpu/drm/rcar-du/Kconfig | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/rcar-du/Kconfig b/drivers/gpu/drm/rcar-du/Kconfig
> index 1d6f1b849287..2b104daf56eb 100644
> --- a/drivers/gpu/drm/rcar-du/Kconfig
> +++ b/drivers/gpu/drm/rcar-du/Kconfig
> @@ -27,7 +27,8 @@ config DRM_RCAR_LVDS
>  	  Enable support for the R-Car Display Unit embedded LVDS encoders.
>  
>  config DRM_RCAR_VSP
> -	bool "R-Car DU VSP Compositor Support"
> +	bool "R-Car DU VSP Compositor Support" if ARM
> +	default y if ARM64
>  	depends on DRM_RCAR_DU
>  	depends on VIDEO_RENESAS_VSP1=y || (VIDEO_RENESAS_VSP1 && DRM_RCAR_DU=m)
>  	help
> 
