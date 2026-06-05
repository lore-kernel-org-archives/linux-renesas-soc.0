Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83B4B36D503
	for <linux-renesas-soc@vger.kernel.org>; Fri,  5 Jun 2026 14:35:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780670141; cv=none; b=jKLBG4SF0ACm/IPCPXUtHWS5rBplNUcf/cRwNyr94Vs9Ob9b0DOik0JP7zW9kcij8EIGmfGxJcR80Mg+evaJQGAuFydLsBvQLTUicGcduGGJe7ivHjluDpj7FyIlY58N781m5Tw/8nUv8wdHj69/3PTrK4HgxLA1ONQRHlqJ0wc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780670141; c=relaxed/simple;
	bh=4Be3tAP2Lsg/1BJlGAqo+63noml+3afh0zhiAHwhG1o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FkzZC+oxQteKlsxM+IyOi9RRRKnsYsRU3BpO4pJ+Ng3KDkJwSOcAXzd8FxgLrLS7ABFn9DoO8sfP0pXH41iDIC5ZRlSyKmlJbeI3LQvoL4FDB41D0gRgw2E+0QfFRqr8GF2hLWZLXlWtQ1x22Vdv8g9T42AKzWrlElGGpFcAlpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Joei6JJ/; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Joei6JJ/"
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id E35B11B9A;
	Fri,  5 Jun 2026 16:35:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1780670110;
	bh=4Be3tAP2Lsg/1BJlGAqo+63noml+3afh0zhiAHwhG1o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Joei6JJ/k30lB+i4rxoWV00uUqq/O3QwYTsTAl9b1WEB80bPF1aqzqJMfXkdPn+EJ
	 XUmYP62qd0NTgijNH5WsZg+Dy7pgyBG8GJolo9m7DDIGFRbaZZkCB7P/6Le+QRATyn
	 Hs7hS/z/eIM3hpzt8y3laWxZEFXhnsBGI2dKCr54=
Date: Fri, 5 Jun 2026 17:35:34 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Dmitry Baryshkov <lumag@kernel.org>,
	dri-devel@lists.freedesktop.org,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 59/76] drm/renesas: rcar-du: lvds: Switch to
 atomic_create_state
Message-ID: <20260605143534.GH84912@killaraus.ideasonboard.com>
References: <20260530-drm-no-more-bridge-reset-v1-0-875d828d31bc@kernel.org>
 <20260530-drm-no-more-bridge-reset-v1-59-875d828d31bc@kernel.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260530-drm-no-more-bridge-reset-v1-59-875d828d31bc@kernel.org>

On Sat, May 30, 2026 at 04:00:04PM +0200, Maxime Ripard wrote:
> The drm_bridge_funcs.atomic_reset callback and its
> drm_atomic_helper_bridge_reset() helper are deprecated.
> 
> Switch to the atomic_create_state callback and its
> drm_atomic_helper_bridge_create_state() counterpart.
> 
> Signed-off-by: Maxime Ripard <mripard@kernel.org>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
> To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> To: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> To: Geert Uytterhoeven <geert+renesas@glider.be>
> To: Magnus Damm <magnus.damm@gmail.com>
> Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-renesas-soc@vger.kernel.org
> ---
>  drivers/gpu/drm/renesas/rcar-du/rcar_lvds.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_lvds.c b/drivers/gpu/drm/renesas/rcar-du/rcar_lvds.c
> index 154410745a74..e433ce61d431 100644
> --- a/drivers/gpu/drm/renesas/rcar-du/rcar_lvds.c
> +++ b/drivers/gpu/drm/renesas/rcar-du/rcar_lvds.c
> @@ -656,11 +656,11 @@ static int rcar_lvds_attach(struct drm_bridge *bridge,
>  static const struct drm_bridge_funcs rcar_lvds_bridge_ops = {
>  	.attach = rcar_lvds_attach,
>  	.destroy = rcar_lvds_destroy,
>  	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
>  	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
> -	.atomic_reset = drm_atomic_helper_bridge_reset,
> +	.atomic_create_state = drm_atomic_helper_bridge_create_state,
>  	.atomic_enable = rcar_lvds_atomic_enable,
>  	.atomic_disable = rcar_lvds_atomic_disable,
>  	.mode_fixup = rcar_lvds_mode_fixup,
>  };
>  

-- 
Regards,

Laurent Pinchart
