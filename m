Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E23943D47D2
	for <linux-renesas-soc@vger.kernel.org>; Wed,  8 Apr 2026 15:44:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775663043; cv=none; b=fFYpWirhtBf+h7mpFneDdKlCslx5z7FKZ48PHkDShVHl4z7GwFbNvxYKvZ4T6hODdKGjN4QUd2XFTAltxiYhDyomQjIzG3SzsPIGh0VeQTQEzbecoocc4L2D2hge0fy/oOvn/zk8dMuomBGdXSFsZkr+AUYBbcoXh1e3L7hyyNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775663043; c=relaxed/simple;
	bh=J0svxGKkD1Xkb7rWTSxQkJD3cs37JEnlABijhMSBRCY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ew7GPy8FTNC+kkiOzrBArxxFfGUbrc6hcUy9cfP9wfI5D7IS8OhkJOVcdhDyDrx+mxAGgxE6m/ShjVd/Kp02CinbGgVoWhEULIqjCdnyMPsyBDwWBD/tloGAF0mkoilkfl+GcCwhf7ImbO3RLxsfmuRHnvdYquUtgSyVeFXhqwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=CbqlRATR; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="CbqlRATR"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 5B2051A320D;
	Wed,  8 Apr 2026 15:44:00 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 24CD9603CB;
	Wed,  8 Apr 2026 15:44:00 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id BC7FA1045012A;
	Wed,  8 Apr 2026 17:43:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1775663039; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=8Rrz89gPzPp297ULZaYId6KNoBOvWz14fm4uY98Dttk=;
	b=CbqlRATRSuaGDiwycm+nperBpEQoMjeerVUCl3vIKiewReKWRln3Ngk/rake7EyeLkKI9f
	htntddeXNoKjyPvH2gUznC/6SEMwQecut0zU88eKVslBAVJFbRTkF7bLqSZHwU8T5ENYbn
	Cb4ytN7lQt8X49NttrYDXgsWsr+dvhX+T3LhbpWLW9gLFTwW8ibHoKZQ5lebwCp1S7Y/s8
	DJC0JNR7jGzyOn5Yuvb/jdHUhha28BrouL8zL91e/SoXh6XV/F1ZVmQzhm8mJkh9d2ECM5
	sqIoEuwYJCERlhVXFmpgEPORj1EsppBZKYayPnEGuGnE5rT+a8VXSGKOsStVkg==
Message-ID: <a3c30888-9818-4355-9d09-5398172cd698@bootlin.com>
Date: Wed, 8 Apr 2026 17:44:34 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/4] drm: renesas: rz-du: rzg2l_du_encoder: convert to
 of_drm_find_and_get_bridge()
To: Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Biju Das <biju.das.jz@bp.renesas.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Anitha Chrisanthus <anitha.chrisanthus@intel.com>,
 Linus Walleij <linusw@kernel.org>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Hui Pu <Hui.Pu@gehealthcare.com>, Ian Ray <ian.ray@gehealthcare.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260402-drm-bridge-alloc-getput-drm_of_find_bridge-4-v4-0-421781c8c061@bootlin.com>
 <20260402-drm-bridge-alloc-getput-drm_of_find_bridge-4-v4-1-421781c8c061@bootlin.com>
From: Louis Chauvet <louis.chauvet@bootlin.com>
Content-Language: en-US
In-Reply-To: <20260402-drm-bridge-alloc-getput-drm_of_find_bridge-4-v4-1-421781c8c061@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3



On 4/2/26 18:27, Luca Ceresoli wrote:
> of_drm_find_bridge() is deprecated. Move to its replacement
> of_drm_find_and_get_bridge() which gets a bridge reference, and ensure it
> is put when done.
> 
> This is made somewhat simpler by the fact that 'bridge' is a local
> variable.
> 
> However we need to handle both branches of the main if().
> 
> In the 'else' case, just switch to of_drm_find_and_get_bridge() to ensure
> the bridge is not freed while in use in the function tail
> (drm_bridge_attach() mainly).
> 
> In the 'then' case, devm_drm_panel_bridge_add_typed() already increments
> the refcount using devres which ties the bridge allocation lifetime to the
> device lifetime, so we would not need to do anything. However to have the
> same behaviour in both branches take an additional reference here, so that
> the bridge needs to be put whichever branch is taken without more
> complicated logic. Ensure to clear the bridge pointer however, to avoid
> calling drm_bridge_put() on an ERR_PTR.
> 
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> Tested-by: Biju Das <biju.das.jz@bp.renesas.com>
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> 
> ---
> 
> Changes in v4:
> - Added comment to clarify the additional drm_bridge_get() in the
>    panel_bridge case (keeping the R-by and T-by tags as it's just a comment)
> ---
>   drivers/gpu/drm/renesas/rz-du/rzg2l_du_encoder.c | 19 +++++++++++++++----
>   1 file changed, 15 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_encoder.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_encoder.c
> index 5e6dd16705e6..9edb90059830 100644
> --- a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_encoder.c
> +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_encoder.c
> @@ -67,7 +67,7 @@ int rzg2l_du_encoder_init(struct rzg2l_du_device  *rcdu,
>   {
>   	struct rzg2l_du_encoder *renc;
>   	struct drm_connector *connector;
> -	struct drm_bridge *bridge;
> +	struct drm_bridge *bridge __free(drm_bridge_put) = NULL;
>   	int ret;
>   
>   	/*
> @@ -83,10 +83,21 @@ int rzg2l_du_encoder_init(struct rzg2l_du_device  *rcdu,
>   
>   		bridge = devm_drm_panel_bridge_add_typed(rcdu->dev, panel,
>   							 DRM_MODE_CONNECTOR_DPI);
> -		if (IS_ERR(bridge))
> -			return PTR_ERR(bridge);
> +		if (IS_ERR(bridge)) {
> +			// Inhibit the cleanup action on an ERR_PTR
> +			ret = PTR_ERR(bridge);
> +			bridge = NULL;
> +			return ret;
> +		}

Can't you use 
https://elixir.bootlin.com/linux/v6.19.11/source/include/linux/cleanup.h#L230?

return PTR_ERR(no_free_ptr(bridge));

With or without this modification:

Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>

> +
> +		/*
> +		 * The reference taken by devm_drm_panel_bridge_add_typed() is
> +		 * released automatically. Take a second one for the __free()
> +		 * when this function will return.
> +		 */
> +		drm_bridge_get(bridge);
>   	} else {
> -		bridge = of_drm_find_bridge(enc_node);
> +		bridge = of_drm_find_and_get_bridge(enc_node);
>   		if (!bridge)
>   			return -EPROBE_DEFER;
>   	}
> 

