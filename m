Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DA6134AB00
	for <linux-renesas-soc@vger.kernel.org>; Wed,  8 Apr 2026 16:14:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775664854; cv=none; b=sTEpBM74Zcw37T5xUQjmLMuW5c+k7M9o5PuzJlvnVM/hfNjFC5225HorEw3oh20LU1/phwTsaaTKhBX5ae7TgScaBFeT9qQeovXBgr3vomkU/9ZQya5GUrzk0LQWqlA3yF61WN5l2PcNYPX4DGBWO2evj2sRktwEwpBiaG9mEcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775664854; c=relaxed/simple;
	bh=lAuLkmAICBWtpgqM7R+C41LzoLZ59/NfD/AVVZsDgGY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UfSDIW9nBSvQFP3Z1/5qluDHYNWHclf//RItUo97G3GX/+D/9WxIMYv8m/v7vGo6tJxzTM94elQbSVSjuxZN4c5zIKQKK496KzMDTEzMBpIt2tXYgl5U/NTyZ35wzTbmJSX3lcV0iPVZPFLXzxqmnu3CGj+cQ4hW/INSuhoCUdo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=2IzeL48E; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="2IzeL48E"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id C4F5EC5B1BA;
	Wed,  8 Apr 2026 16:14:44 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 76466603CE;
	Wed,  8 Apr 2026 16:14:10 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0920810450154;
	Wed,  8 Apr 2026 18:14:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1775664849; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=zrPj+mHoGkeTlqb4UQKbc3eMKH+sjFduXWLJpuFI2j8=;
	b=2IzeL48EroU211CTOIhkQWk08tjwRBChPgieOgIeHas6vucSSi3xw67BVwQNnrW92RuVYm
	h41EC7UpMo2Rug11BouyZXGDuQtUEh8qXkZ0pVXIKGeJQrS1GFZPS2LjAWpclnzBGr56HT
	RA28meyoV/dhU2lNuTeg+I6JLFX+N9021I93K5jG9JY/op9Pnw2vRDYGAEPnBOTzWbnNek
	EBUIeUgq+ZA9RUXzDZopwod/ZYDRwoRGLk/pWcTt8j8OIQAPqIPySu3NKUIYpCJViCvb04
	SFwpuoeOvLwYEPPDF7/h6Uxvy0pxulsNR30p5LuvBBGM7FPkwow6pvz6b15hgA==
Message-ID: <abf6a5ef-c05d-4d9d-8b36-6a422966ec89@bootlin.com>
Date: Wed, 8 Apr 2026 18:14:46 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/4] drm/omap: dss: convert to
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
 <20260402-drm-bridge-alloc-getput-drm_of_find_bridge-4-v4-4-421781c8c061@bootlin.com>
From: Louis Chauvet <louis.chauvet@bootlin.com>
Content-Language: en-US
In-Reply-To: <20260402-drm-bridge-alloc-getput-drm_of_find_bridge-4-v4-4-421781c8c061@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3



On 4/2/26 18:27, Luca Ceresoli wrote:
> of_drm_find_bridge() is deprecated. Move to its replacement
> of_drm_find_and_get_bridge() which gets a bridge reference, and ensure it
> is put when done.
> 
> omapdss_device_init_output() can take one bridge pointer in out->bridge or
> two pointers in out->bridge and out->next_bridge. Ensure each has a
> corresponding drm_bridge_get() and add drm_bridge_put() calls in the
> cleanup code.
> 
> Also slightly change the initial code assigning out->panel and out->bridge
> to ensure and clarify that either out->panel or out->bridge is set in the
> function prologue, not both. If both were set, the 'if (out->panel){...}'
> code that follows would overwrite out->bridge without having put the
> reference.
> 
> Finally, take a reference in case a panel_bridge is added using
> drm_panel_bridge_add(). This ensures we always need to put a reference,
> which came either from of_drm_find_and_get_bridge() or by the
> drm_panel_bridge_add+drm_bridge_get() branch.
> 
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>

> ---
>   drivers/gpu/drm/omapdrm/dss/output.c | 11 ++++++++---
>   1 file changed, 8 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/omapdrm/dss/output.c b/drivers/gpu/drm/omapdrm/dss/output.c
> index 7378e855c278..ca891aba3820 100644
> --- a/drivers/gpu/drm/omapdrm/dss/output.c
> +++ b/drivers/gpu/drm/omapdrm/dss/output.c
> @@ -30,11 +30,13 @@ int omapdss_device_init_output(struct omap_dss_device *out,
>   		return 0;
>   	}
>   
> -	out->bridge = of_drm_find_bridge(remote_node);
>   	out->panel = of_drm_find_panel(remote_node);
>   	if (IS_ERR(out->panel))
>   		out->panel = NULL;
>   
> +	if (!out->panel)
> +		out->bridge = of_drm_find_and_get_bridge(remote_node);
> +
>   	of_node_put(remote_node);
>   
>   	if (out->panel) {
> @@ -49,7 +51,7 @@ int omapdss_device_init_output(struct omap_dss_device *out,
>   			goto error;
>   		}
>   
> -		out->bridge = bridge;
> +		out->bridge = drm_bridge_get(bridge);
>   	}
>   
>   	if (local_bridge) {
> @@ -59,7 +61,7 @@ int omapdss_device_init_output(struct omap_dss_device *out,
>   		}
>   
>   		out->next_bridge = out->bridge;
> -		out->bridge = local_bridge;
> +		out->bridge = drm_bridge_get(local_bridge);
>   	}
>   
>   	if (!out->bridge) {
> @@ -79,6 +81,9 @@ void omapdss_device_cleanup_output(struct omap_dss_device *out)
>   	if (out->bridge && out->panel)
>   		drm_panel_bridge_remove(out->next_bridge ?
>   					out->next_bridge : out->bridge);
> +
> +	drm_bridge_put(out->next_bridge);
> +	drm_bridge_put(out->bridge);
>   }
>   
>   void dss_mgr_set_timings(struct omap_dss_device *dssdev,
> 

