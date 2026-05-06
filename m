Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C93B2E9757;
	Wed,  6 May 2026 20:08:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778098111; cv=none; b=KiKjlCEwS74Wum7Y9Fumxm2pbRmq6nYUTkpwA/ZV0dWe1usnBn4R//HPGBD+ekhckp88jnrjRl+gQIMkVJSMOYNULGSKyCJWKObFW0D9/9GKNCa+UEdTVgVQoBphiutwm95ERQktIRPfhNuA04gw+rlAQbRkfp1qm/LKW0QkVk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778098111; c=relaxed/simple;
	bh=tRKQs92pxOQZrOxm0RULdGhIjq+BMn75AXREg8GQbBs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b44FZX7HN/wO0axw7pVPWhPkVcCrxhHI5nTdALF1/EaYVagq8bnI6RDiXR570b3PQx48i8OgRFtb66QbRKHc9Z/fBNpRilcOaoNGF/aJOp04kyA/goefHkuzzO8/uHEfZIct5XErTUfoM3LDDmQRnGBF6e38+IevsPZzfI7hkno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=rbLUgKWn; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="rbLUgKWn"
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id DF7A063D;
	Wed,  6 May 2026 22:08:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1778098105;
	bh=tRKQs92pxOQZrOxm0RULdGhIjq+BMn75AXREg8GQbBs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rbLUgKWnqgb6d+kkmtRa0/EWv2PH7VPZh7cQsnl+Ye8YP43TUcZXMvRJ43U+NbJnp
	 3qFBwDPHCBZtXzdThjNxE353G3lv38ESWulKLx0BSHlosMqgffVjnEdTsk9ZJDwhUv
	 vQg2sG4LWo8ZWPTvFLumzwQwiJ23AJkUEJNuClOk=
Date: Wed, 6 May 2026 23:08:26 +0300
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
Subject: Re: [PATCH 2/4] drm: renesas: rz-du: Make DU reset control optional
 for RZ/T2H support
Message-ID: <20260506200826.GB1652535@killaraus.ideasonboard.com>
References: <20260429170012.366537-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260429170012.366537-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260429170012.366537-3-prabhakar.mahadev-lad.rj@bp.renesas.com>

On Wed, Apr 29, 2026 at 06:00:10PM +0100, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Update the DU CRTC initialisation to request the reset control using
> devm_reset_control_get_optional_shared(). On RZ/T2H SoCs the DU block does
> not expose a reset line, and treating the reset as mandatory prevents the
> driver from probing on those platforms.

This assume a device tree compliant with the bindings. In case of a
non-compliant device tree on platforms other than RZ/T2H, the driver may
silently fail to work as it won't complain about the lack of reset. I
think that's acceptable, as the reset should be specified in the SoC's
.dtsi. If if was the responsibility of board DT authors I would be a bit
more concerned.

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
>  drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.c
> index 18e2b981b691..2b772a11c7ee 100644
> --- a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.c
> +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.c
> @@ -380,7 +380,7 @@ int rzg2l_du_crtc_create(struct rzg2l_du_device *rcdu)
>  	struct drm_plane *primary;
>  	int ret;
>  
> -	rcrtc->rstc = devm_reset_control_get_shared(rcdu->dev, NULL);
> +	rcrtc->rstc = devm_reset_control_get_optional_shared(rcdu->dev, NULL);
>  	if (IS_ERR(rcrtc->rstc)) {
>  		dev_err(rcdu->dev, "can't get cpg reset\n");
>  		return PTR_ERR(rcrtc->rstc);

-- 
Regards,

Laurent Pinchart
