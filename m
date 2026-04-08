Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE6C826C39E;
	Wed,  8 Apr 2026 21:33:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775684024; cv=none; b=WnxolClNjcUKBo+T1WSgijsBhuCjewLPglu8OqjhmlMVEM3Fi1y0uEpp7eTwwIeU4muHBDNIVd/iEB3NVWyZQ6vALQRbFE8U1EnWt80hzMDhUDdulevPzanHrDdnLWx46j0SXr/OOOXJLjkG8kjsIQxp2XsExtJVhh5dzrNu2J0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775684024; c=relaxed/simple;
	bh=1PsHHAVlfYudK7174uS0wwaNW8CiA1Xyq+dEBvmz6QQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sRRrB+A8D8CDCxDK4LVu0MebaVH1jH5X2wC2DcGN7PIa/1/y66Fhsxh77S6fUgxg0DZ0qjcf9XI2MoihjE9qj47wIH7xPSCP8hL+0a15bwQJWZsNaGQns6SHBEFzdU4UVBe84v8mAtRbToFH4xh6lKp672ZvJmQq5olVA81mijc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=VNtRtYrH; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="VNtRtYrH"
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 4723D241;
	Wed,  8 Apr 2026 23:32:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1775683932;
	bh=1PsHHAVlfYudK7174uS0wwaNW8CiA1Xyq+dEBvmz6QQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VNtRtYrHWCMuQAzSAUQPof8hyxmRXRrhoykppZA3vNFc2wRw5D2ChoARk0mO8vWJV
	 GbWjXydt62A8w5DvVM5XmIwLBjUGjov9FSJBfZzLdBttGZSExbe4Da3YmM/jb6D2WF
	 GkAIKxsORpkcdJEDo/S8Kx3SRnkwR4tqcd3O9k+U=
Date: Thu, 9 Apr 2026 00:33:39 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Louis Chauvet <louis.chauvet@bootlin.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Anitha Chrisanthus <anitha.chrisanthus@intel.com>,
	Linus Walleij <linusw@kernel.org>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Hui Pu <Hui.Pu@gehealthcare.com>,
	Ian Ray <ian.ray@gehealthcare.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/4] drm: renesas: rz-du: rzg2l_du_encoder: convert to
 of_drm_find_and_get_bridge()
Message-ID: <20260408213339.GM1965119@killaraus.ideasonboard.com>
References: <20260402-drm-bridge-alloc-getput-drm_of_find_bridge-4-v4-0-421781c8c061@bootlin.com>
 <20260402-drm-bridge-alloc-getput-drm_of_find_bridge-4-v4-1-421781c8c061@bootlin.com>
 <a3c30888-9818-4355-9d09-5398172cd698@bootlin.com>
 <DHNYGMWPQWLM.3OBWO5G9NPWK5@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <DHNYGMWPQWLM.3OBWO5G9NPWK5@bootlin.com>

On Wed, Apr 08, 2026 at 07:39:03PM +0200, Luca Ceresoli wrote:
> On Wed Apr 8, 2026 at 5:44 PM CEST, Louis Chauvet wrote:
> 
> >> @@ -83,10 +83,21 @@ int rzg2l_du_encoder_init(struct rzg2l_du_device  *rcdu,
> >>
> >>   		bridge = devm_drm_panel_bridge_add_typed(rcdu->dev, panel,
> >>   							 DRM_MODE_CONNECTOR_DPI);
> >> -		if (IS_ERR(bridge))
> >> -			return PTR_ERR(bridge);
> >> +		if (IS_ERR(bridge)) {
> >> +			// Inhibit the cleanup action on an ERR_PTR
> >> +			ret = PTR_ERR(bridge);
> >> +			bridge = NULL;
> >> +			return ret;
> >> +		}
> >
> > Can't you use
> > https://elixir.bootlin.com/linux/v6.19.11/source/include/linux/cleanup.h#L230?
> >
> > return PTR_ERR(no_free_ptr(bridge));
> 
> Ah, nice cleanup indeed! However, being this patch already reviewed ans
> tested, I'll postpone this cleanup to a later series.

I think this modification is minor enough to keep the tags.

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> > With or without this modification:
> >
> > Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>

-- 
Regards,

Laurent Pinchart
