Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B738B3B8D7B
	for <linux-renesas-soc@vger.kernel.org>; Fri,  5 Jun 2026 14:35:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780670162; cv=none; b=MLrOTX0ePREt+zadS0AiJnwDILk4wduHxmp82a6CjBiE2gO95sp1LXC/ecBIR7GSrsB0MZeZwlf982JVQ45GM32oYY/abrqYe0sKBZKVftUNFaAgA9AXAEDA8+w4W7HG7gPWsHCpQnYco3VtXNsjGTW1VPXnmr5cauNAvdmeIcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780670162; c=relaxed/simple;
	bh=lBRsT0NsAtKixhkhExzGWNyjWCaCq6WnddgfrQokn74=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B/YW0IboTXTGYKhbREzHL6+NfpI+mlHugCMe4EvNlRBlJMvO2eWz6BbsXYn6YpMiaYKlyDf7lgVehvDLXlR6nQD6yXnEs/FOw7h4kdud+bZJF684AmvtDSSfT3IfrLZ5maEMLMaE+h7ZbIUQbTDs27BBkXBTQH7KkOuL96mD804=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=lzhBprMd; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="lzhBprMd"
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 34F191B9A;
	Fri,  5 Jun 2026 16:35:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1780670127;
	bh=lBRsT0NsAtKixhkhExzGWNyjWCaCq6WnddgfrQokn74=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lzhBprMdgzVsrkngOAT5RYjvTlgnKE2CPBE+2ccLb72kKtOVS/A6qcGj47fuKcJNE
	 e4ThPH0wgUZ5kRAGbDJRLPe+qLYl5fg8zC6itZPT6p5LSJFgk1QM+qepBilJeU6QnL
	 Mxv9wJWlApuEF2MHp6XckJmHFGmVEP0or0tSY9xI=
Date: Fri, 5 Jun 2026 17:35:51 +0300
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
Subject: Re: [PATCH 60/76] drm/renesas: rcar-du: mipi_dsi: Switch to
 atomic_create_state
Message-ID: <20260605143551.GI84912@killaraus.ideasonboard.com>
References: <20260530-drm-no-more-bridge-reset-v1-0-875d828d31bc@kernel.org>
 <20260530-drm-no-more-bridge-reset-v1-60-875d828d31bc@kernel.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260530-drm-no-more-bridge-reset-v1-60-875d828d31bc@kernel.org>

On Sat, May 30, 2026 at 04:00:05PM +0200, Maxime Ripard wrote:
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
>  drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c b/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c
> index aaafee1c060b..6e46d6d99f3c 100644
> --- a/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c
> +++ b/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c
> @@ -922,11 +922,11 @@ rcar_mipi_dsi_bridge_mode_valid(struct drm_bridge *bridge,
>  
>  static const struct drm_bridge_funcs rcar_mipi_dsi_bridge_ops = {
>  	.attach = rcar_mipi_dsi_attach,
>  	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
>  	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
> -	.atomic_reset = drm_atomic_helper_bridge_reset,
> +	.atomic_create_state = drm_atomic_helper_bridge_create_state,
>  	.atomic_enable = rcar_mipi_dsi_atomic_enable,
>  	.atomic_disable = rcar_mipi_dsi_atomic_disable,
>  	.mode_valid = rcar_mipi_dsi_bridge_mode_valid,
>  };
>  

-- 
Regards,

Laurent Pinchart
