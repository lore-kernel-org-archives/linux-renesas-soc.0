Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.167.242.64
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792423595;
	b=KrjS6G3UdQ49HG6rv+VYw4kelYp/Q/nPwMrnpsAg3a6GfwgED8GAVsbbScY0THx7Skvq
	 jdIpPuK/L67U+dcbvNaeuxgqN4/J/c8w3VUxCZLvpPPMxdRM1F49VpXXvTWufea2tUsBT
	 hGJBFPDdRfgYLPTR7A6mjeP3M/SsKf5Ms/L+NRDokMew2Om57lv5PImvV1EhONEi3E7Nv
	 QzYaT3eu3tjkHGJBnCwy65rk5EyzXW20Lr6291FEw07EY3eDZ8ihK36VwXb1sTDcjmTgH
	 V5+lwvDKJpJf4i+D2j7nNyDj2CB+vJCZ3xFo9aYaADqp01ZvsglJLaonei2xcZ2jbrA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792423595;
	h=DMARC-Filter:Received:DKIM-Signature:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=JVkJer71fDIgsCTskA8DGsc6omuY8iOWv7lV2X8QpOY=;
	b=oDVIqUbRv3X+AcOedJEebj7NNBy1NAlMWc6dy78Y/SZ809icqudNeioX5FD0dXm/E/Ou
	 Db4zdXTcKFU8+N6eDJBybk9zaxJY1A1yEv6N1x9Csws5aGhUP+vhZKr/yHLuo5xRa1RkG
	 84cIOxxD4x1JRX7Voe/CO8u8UBq41HjtPJXflAGq3H2UTxWn3U533PfY2lRJZ8rbo9TPO
	 ur5l4ugMZp61AEg2A+xJkh22bhvCztRCKJOAEOJvOnlovlJD+g8qPVGNq97AZ2YLh3FQx
	 4A2Z0e8rn9XnWv1p74CfyLWZX7K4oR03TbJ6PtDCXrt5sHHFwObeaPQFFLklqaZlvwA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ideasonboard.com;
	spf=pass smtp.mailfrom=ideasonboard.com;
	dkim=pass header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=PuczZczY;
	arc=none smtp.remote-ip=213.167.242.64
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA41660B1F30
	for <linux-renesas-soc@vger.kernel.org>; Mon, 19 Oct 2026 15:26:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DA41660B1F30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=PuczZczY
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id D26A756D;
	Mon, 19 Oct 2026 17:24:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1792423466;
	bh=HOXUOqZNqxk+jJbTz2s4LyBRoCduEwrzq/BPXWMRxt8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PuczZczYz+T9/BbPDCCi4JOO84l3i/3NTo7RPeafAtxARl4Ny6KAyFV92+Pfl6qZT
	 1Y2pGQgTUKKR+r7O+hDazcRRvLp6wOKG0bmuWtAoHscOMs1ie8lkmNdedP0ep07lsr
	 ulueqfOE1r6fUNV4dfzru8Yy8Kx0bc7WPkH2dy5A=
Date: Mon, 19 Oct 2026 18:26:30 +0300
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
Subject: Re: [PATCH 71/75] drm/rcar-du: Convert to atomic_create_state
Message-ID: <20261019152630.GB5830@killaraus.ideasonboard.com>
References: <20261014-drm-no-more-connector-reset-v1-0-586c9c026823@kernel.org>
 <20261014-drm-no-more-connector-reset-v1-71-586c9c026823@kernel.org>
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
In-Reply-To: <20261014-drm-no-more-connector-reset-v1-71-586c9c026823@kernel.org>

Hi Maxime,

Thank you for the patch.

On Wed, Oct 14, 2026 at 07:27:34PM +0200, Maxime Ripard wrote:
> The rcar-du writeback connector reset implementation creates a custom
> state subclass, but only initializes a pristine state without resetting
> any hardware. This is equivalent to what atomic_create_state expects.
> Convert to it.
> 
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Cc: Magnus Damm <magnus.damm@gmail.com>
> Cc: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> Cc: linux-renesas-soc@vger.kernel.org
> ---
>  drivers/gpu/drm/renesas/rcar-du/rcar_du_writeback.c | 15 ++++++---------
>  1 file changed, 6 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_du_writeback.c b/drivers/gpu/drm/renesas/rcar-du/rcar_du_writeback.c
> index e5e6e6a156aa..9cb1af182fa0 100644
> --- a/drivers/gpu/drm/renesas/rcar-du/rcar_du_writeback.c
> +++ b/drivers/gpu/drm/renesas/rcar-du/rcar_du_writeback.c
> @@ -113,28 +113,25 @@ static void rcar_du_wb_conn_destroy_state(struct drm_connector *connector,
>  {
>  	__drm_atomic_helper_connector_destroy_state(state);
>  	kfree(to_rcar_wb_conn_state(state));
>  }
>  
> -static void rcar_du_wb_conn_reset(struct drm_connector *connector)
> +static struct drm_connector_state *rcar_du_wb_conn_create_state(struct drm_connector *connector)

static struct drm_connector_state *
rcar_du_wb_conn_create_state(struct drm_connector *connector)

With that,

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

No need to send a new version, you can address this when applying.

>  {
>  	struct rcar_du_wb_conn_state *state;
>  
> -	if (connector->state) {
> -		rcar_du_wb_conn_destroy_state(connector, connector->state);
> -		connector->state = NULL;
> -	}
> -
>  	state = kzalloc_obj(*state);
>  	if (state == NULL)
> -		return;
> +		return ERR_PTR(-ENOMEM);
>  
> -	__drm_atomic_helper_connector_reset(connector, &state->state);
> +	__drm_atomic_helper_connector_state_init(&state->state, connector);
> +
> +	return &state->state;
>  }
>  
>  static const struct drm_connector_funcs rcar_du_wb_conn_funcs = {
> -	.reset = rcar_du_wb_conn_reset,
> +	.atomic_create_state = rcar_du_wb_conn_create_state,
>  	.fill_modes = drm_helper_probe_single_connector_modes,
>  	.destroy = drm_connector_cleanup,
>  	.atomic_duplicate_state = rcar_du_wb_conn_duplicate_state,
>  	.atomic_destroy_state = rcar_du_wb_conn_destroy_state,
>  };

-- 
Regards,

Laurent Pinchart
