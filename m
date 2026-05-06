Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E616515A864;
	Wed,  6 May 2026 20:17:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778098642; cv=none; b=i6owXRENF15u3ATZs0HH6QbRghwsyJnrPM/WoLscy7/yK0347J0GeU3TGMuBCbYkb3dWtsZEWxRj091kH51HMUpklfR8teIx5IfawU4rKenc9CFZdTrJqGVQbX1Shx58gGiG7ZzrRGRDMDNayJkugqjRGEfE1+auJW9jtfrSIoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778098642; c=relaxed/simple;
	bh=JDEa8g0o3dfL9qeA9kCbepQ7yQDVWpvLy6D2Hjsl56o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N/tfLLXXVtbj5e4vxaqg2jLuzNNDajW1O6YgRVd/8a0sukKpaF3ffk6oGHoSp4+0BLzhh9z9ctICrR6kNUQypcwjnxQnY54jtdhYrCJqjnI+gmMwB0TPiV3/nfK/lMxINMPWQdR2EOg+Rzc4ry3D89knQ9Xr/+Sefpx/fHUCS+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=JPgcI2PS; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="JPgcI2PS"
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 988DD63D;
	Wed,  6 May 2026 22:17:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1778098635;
	bh=JDEa8g0o3dfL9qeA9kCbepQ7yQDVWpvLy6D2Hjsl56o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JPgcI2PSy8wtwg6ynLOthFx9CdYlCaZnvdhklwXbKDrxaexXJSwxK9DqntDDMek8I
	 iNjj2/RAe8mNw7v/QqK/Wp5SWwNjnabvrXZnzGDTnVqbleUpKdYWlJRkrP81MiqzP4
	 5QI9S2g5luxsuyGcQnJe+/yB3ZGy9hghL8WRCA14=
Date: Wed, 6 May 2026 23:17:17 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>, David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH 4/4] drm: renesas: rz-du: Add support for RZ/T2H SoC
Message-ID: <20260506201717.GD1652535@killaraus.ideasonboard.com>
References: <20260429170012.366537-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260429170012.366537-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260429170012.366537-5-prabhakar.mahadev-lad.rj@bp.renesas.com>

On Wed, Apr 29, 2026 at 06:00:12PM +0100, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> The RZ/T2H (R9A09G077) SoC includes a DU with a DPI interface,
> supporting resolutions up to WXGA with two RPFs for layer blending.
> Unlike earlier RZ/G2L SoCs, RZ/T2H requires explicit assertion of a
> DPI output-enable signal (DU_MCR0_DPI_EN) during CRTC startup.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
>  drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.c |  7 ++++++-
>  drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c  | 14 ++++++++++++++
>  drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.h  | 10 ++++++++++
>  3 files changed, 30 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.c
> index 2b772a11c7ee..017d5f26bc96 100644
> --- a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.c
> +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.c
> @@ -28,6 +28,7 @@
>  #include "rzg2l_du_vsp.h"
>  
>  #define DU_MCR0			0x00
> +#define DU_MCR0_DPI_EN		BIT(0)
>  #define DU_MCR0_DI_EN		BIT(8)
>  
>  #define DU_DITR0		0x10
> @@ -217,8 +218,12 @@ static void rzg2l_du_crtc_put(struct rzg2l_du_crtc *rcrtc)
>  static void rzg2l_du_start_stop(struct rzg2l_du_crtc *rcrtc, bool start)
>  {
>  	struct rzg2l_du_device *rcdu = rcrtc->dev;
> +	u32 val = DU_MCR0_DI_EN;
>  
> -	writel(start ? DU_MCR0_DI_EN : 0, rcdu->mmio + DU_MCR0);
> +	if (start && rzg2l_du_has(rcdu, RZG2L_DU_FEATURE_DPIO_OE))
> +		val |= DU_MCR0_DPI_EN;
> +
> +	writel(start ? val : 0, rcdu->mmio + DU_MCR0);
>  }
>  
>  static void rzg2l_du_crtc_start(struct rzg2l_du_crtc *rcrtc)
> diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c
> index 3b7162c6e1f4..fc55dfffebaf 100644
> --- a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c
> +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c
> @@ -63,10 +63,24 @@ static const struct rzg2l_du_device_info rzg2l_du_r9a09g057_info = {
>  	},
>  };
>  
> +static const struct rzg2l_du_device_info rzg2l_du_r9a09g077_info = {
> +	.channels_mask = BIT(0),
> +	.routes = {
> +		[RZG2L_DU_OUTPUT_DPAD0] = {
> +			.possible_outputs = BIT(0),
> +			.port = 0,
> +		},
> +	},
> +	.features = RZG2L_DU_FEATURE_DPIO_OE,
> +	.mode_clock_min = 5000,
> +	.mode_clock_max = 100000,
> +};
> +
>  static const struct of_device_id rzg2l_du_of_table[] = {
>  	{ .compatible = "renesas,r9a07g043u-du", .data = &rzg2l_du_r9a07g043u_info },
>  	{ .compatible = "renesas,r9a07g044-du", .data = &rzg2l_du_r9a07g044_info },
>  	{ .compatible = "renesas,r9a09g057-du", .data = &rzg2l_du_r9a09g057_info },
> +	{ .compatible = "renesas,r9a09g077-du", .data = &rzg2l_du_r9a09g077_info },
>  	{ /* sentinel */ }
>  };
>  
> diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.h b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.h
> index 885558eb9547..baf076d69cda 100644
> --- a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.h
> +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.h
> @@ -20,6 +20,8 @@
>  struct device;
>  struct drm_property;
>  
> +#define RZG2L_DU_FEATURE_DPIO_OE	BIT(0)	/* Has DPIO output enable control */
> +
>  enum rzg2l_du_output {
>  	RZG2L_DU_OUTPUT_DSI0,
>  	RZG2L_DU_OUTPUT_DPAD0,
> @@ -46,12 +48,14 @@ struct rzg2l_du_output_routing {
>   * @routes: array of CRTC to output routes, indexed by output (RZG2L_DU_OUTPUT_*)
>   * @mode_clock_min: minimum pixel clock in kHz
>   * @mode_clock_max: maximum pixel clock in kHz
> + * @features: device features (RZG2L_DU_FEATURE_*)
>   */
>  struct rzg2l_du_device_info {
>  	unsigned int channels_mask;
>  	struct rzg2l_du_output_routing routes[RZG2L_DU_OUTPUT_MAX];
>  	u32 mode_clock_min;
>  	u32 mode_clock_max;
> +	unsigned int features;
>  };
>  
>  #define RZG2L_DU_MAX_CRTCS		1
> @@ -77,6 +81,12 @@ static inline struct rzg2l_du_device *to_rzg2l_du_device(struct drm_device *dev)
>  	return container_of(dev, struct rzg2l_du_device, ddev);
>  }
>  
> +static inline bool rzg2l_du_has(struct rzg2l_du_device *rcdu,
> +				unsigned int feature)
> +{
> +	return rcdu->info->features & feature;
> +}
> +
>  const char *rzg2l_du_output_name(enum rzg2l_du_output output);
>  
>  #endif /* __RZG2L_DU_DRV_H__ */

-- 
Regards,

Laurent Pinchart
