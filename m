Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.167.242.64
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794959631;
	b=zFbhPoABiW8XPgH5vhtHmb0gTtU73rj0/g3XpmbWPHf3iqwhsWL/a+viukMsGjFfvEp7
	 jxIIapvJNoRy1csL/Vd6grCgkPj4gMEazVSyQVUe7G1eH+r7cbBWBS0MXhQ66UIrH3+Xz
	 EDrLStaJT8xxrzCjQ1PHI4zsWKjHpsDR+onjy0upRCJUC4y1s4BiqlnAFcKnOj/gt51Gi
	 pXILuLzW21rMdr1r0bsBHHPEmkwrPJlrYmr/3U0cg4RwJcBLcfy86KyKCP6t2dpRQgz/a
	 wnklvfKo3/1Vnpy9oYbqnnqrbSCPmkX3R+Wd05b+26/OaKdOm4HL3UD7p/AjcdjpOfg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794959631;
	h=DMARC-Filter:Received:DKIM-Signature:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=E2lMWOASvHDwSygFRHgWFV0+JNG9Y+CLFv0E5F/ZJr8=;
	b=Kd7+7urU3ll7dDoeb7KsVEsfgr5OpF/7t+TxABbmSzkN1wnW/lvcShUa7yuH2nzpy0JI
	 /kheOs+bBuVDyDJAznhN3E43fseGBxPxRrvJ391QUO2nY4QFPmzBh0A9Hntc16RNQVNzf
	 0p8yOjxUMd2G9k0WCrl57Pcf+2z1n2cIVoCpdXOmk+54mNIZrwQZaS8tQ7tas2ftyNiIK
	 x4pkQDhU767kLO71Sj3rzEgBgOAZXMolXBT7meQfEGLN2bMJRdmsapi3OCADZV9BWn6UB
	 cvw7RGbcdHwyBhEjqrO9aIF/vpOZdnAHP8tCzKqPMnDG6mtLfmJ+C0gTV1Veqe1qZQA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ideasonboard.com;
	spf=pass smtp.mailfrom=ideasonboard.com;
	dkim=pass header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=pJTY8rIr;
	arc=none smtp.remote-ip=213.167.242.64
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F012606A31C
	for <linux-renesas-soc@vger.kernel.org>; Tue, 17 Nov 2026 23:53:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9F012606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=pJTY8rIr
Received: from killaraus.ideasonboard.com (2001-14ba-7086-3000--a06.rev.dnainternet.fi [IPv6:2001:14ba:7086:3000::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id E91F8270;
	Wed, 18 Nov 2026 00:51:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1794959480;
	bh=D9pHEAaEM16jOPMDP7nMOOaeLdVh58OFjjJ0wjOM0IE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pJTY8rIr6/Nu8dZisvD58CIxy2ErFfgwqp67fq996BSr909W0gCnCWFP6HLxOVXIl
	 yq5L/hZijX5ckrHclUyg4MFxfb3QrE8NgBcqmIB0NUJ33c+ux/ozXT2Df6FqYFXCHL
	 gL+iqfN6HP9s4jEbFl8DLpZKfb/aeF77v41aLdNk=
Date: Wed, 18 Nov 2026 01:53:46 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	dri-devel@lists.freedesktop.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 25/64] drm/rcar-du: Switch to
 drm_mode_config_create_initial_state
Message-ID: <20261117235346.GC1923307@killaraus.ideasonboard.com>
References: <20261116-drm-no-more-config-reset-v2-0-0bb471f4d1e0@kernel.org>
 <20261116-drm-no-more-config-reset-v2-25-0bb471f4d1e0@kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Post: <mailto:linux-renesas-soc@vger.kernel.org>
List-Help: <mailto:linux-renesas-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-renesas-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261116-drm-no-more-config-reset-v2-25-0bb471f4d1e0@kernel.org>

Hi Maxime,

Thank you for the patch.

On Mon, Nov 16, 2026 at 11:30:41AM +0100, Maxime Ripard wrote:
> drm_mode_config_reset() has a dual role: it creates the initial KMS
> state at probe time, and resets hardware and software state during
> suspend/resume cycles.
> 
> Since the two roles need different behaviors (notably for objects like
> drm_private_obj that must persist across suspend/resume),
> drm_mode_config_create_initial_state() was introduced to handle only
> the initial state creation at probe time.
> 
> Switch to drm_mode_config_create_initial_state().
> 
> Signed-off-by: Maxime Ripard <mripard@kernel.org>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Cc: Magnus Damm <magnus.damm@gmail.com>
> Cc: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> Cc: linux-renesas-soc@vger.kernel.org
> ---
>  drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c b/drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c
> index 9228a7ad0dfa..7fddde804dc6 100644
> --- a/drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c
> +++ b/drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c
> @@ -1000,11 +1000,13 @@ int rcar_du_modeset_init(struct rcar_du_device *rcdu)
>  	 * DPAD0.
>  	 */
>  	dpad0_sources = rcdu->info->routes[RCAR_DU_OUTPUT_DPAD0].possible_crtcs;
>  	rcdu->dpad0_source = ffs(dpad0_sources) - 1;
>  
> -	drm_mode_config_reset(dev);
> +	ret = drm_mode_config_create_initial_state(dev);
> +	if (ret)
> +		return ret;
>  
>  	drm_kms_helper_poll_init(dev);
>  
>  	return 0;
>  }

-- 
Regards,

Laurent Pinchart
