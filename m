Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72ABE3F1666;
	Wed, 18 Mar 2026 19:42:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773862935; cv=none; b=nbVgdfhC5ohonJA+1zTtHvsDM3SPifmkmrXmsAArrlVHFDtCA8oIWgNQ+k3Kv3ka5s+V2bGew0mBtc+QzPgm42Nk6Z6OkiVrV8IpjXjjBQhMadhscidu03dlBorhn1vaJR7SEpQVuBChWhhrxMhfBQel/xhFSUj+IwwpJpWvun4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773862935; c=relaxed/simple;
	bh=8I2Z8zPNvEkd+HEAxrB5EUF178JNwza08AkwuUiamgo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XK45AGvfvhYNeSzNdnnqWyxlbgQ6elpeX1Jzkk1VliX828tHN2g7Qi8SsF144OKhsJrVl/kDppzGeB7ffvPZ7jSfWsIbuz650qPq3nzmLbFETnehRVNSzci2pjTpGsml0lrCoAGVn8t3GPGZhyg7LmJasaN6OaCwGHuttNECzsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=JFGVLKlu; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="JFGVLKlu"
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 91B67308;
	Wed, 18 Mar 2026 20:40:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1773862859;
	bh=8I2Z8zPNvEkd+HEAxrB5EUF178JNwza08AkwuUiamgo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JFGVLKluBtyG8MoSw6yji+kq3g5tLjP6BbRQmrhlf2G6iUnWFvxWlmuqEpX/0n0Ys
	 ySKlQvEyXXQJMv0nBqBcnFl0JW9mkCLSomxfS62Km3HzdVOjU3aGDSijp5wkBo4YGt
	 Qzsz0eTCyI2tGei1OSDB2bkGY4sWOQaV/pNIo2Kw=
Date: Wed, 18 Mar 2026 21:42:11 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>,
	linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Subject: Re: [PATCH] media: renesas: vsp1: Fix NULL pointer deref on module
 unload
Message-ID: <20260318194211.GA721582@killaraus.ideasonboard.com>
References: <20260115-rcar-vsp-crash-fix-v1-1-247bd51767fd@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260115-rcar-vsp-crash-fix-v1-1-247bd51767fd@ideasonboard.com>

On Thu, Jan 15, 2026 at 11:22:35AM +0200, Tomi Valkeinen wrote:
> From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> 
> When unloading the module on gen 4, we hit a NULL pointer dereference.
> This is caused by the cleanup code calling vsp1_drm_cleanup() where it
> should be calling vsp1_vspx_cleanup().
> 
> Fix this by checking the IP version and calling the drm or vspx function
> accordingly, the same way as the init code does.
> 
> Fixes: d06c1a9f348d ("media: vsp1: Add VSPX support")
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

One SoB is enough :-)

> ---
>  drivers/media/platform/renesas/vsp1/vsp1_drv.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/platform/renesas/vsp1/vsp1_drv.c b/drivers/media/platform/renesas/vsp1/vsp1_drv.c
> index 6c64657fc4f3..30df9b36642d 100644
> --- a/drivers/media/platform/renesas/vsp1/vsp1_drv.c
> +++ b/drivers/media/platform/renesas/vsp1/vsp1_drv.c
> @@ -240,8 +240,12 @@ static void vsp1_destroy_entities(struct vsp1_device *vsp1)
>  		media_device_unregister(&vsp1->media_dev);
>  	media_device_cleanup(&vsp1->media_dev);
>  
> -	if (!vsp1->info->uapi)
> -		vsp1_drm_cleanup(vsp1);
> +	if (!vsp1->info->uapi) {
> +		if (vsp1->info->version == VI6_IP_VERSION_MODEL_VSPX_GEN4)
> +			vsp1_vspx_cleanup(vsp1);
> +		else
> +			vsp1_drm_cleanup(vsp1);
> +	}
>  }
>  
>  static int vsp1_create_entities(struct vsp1_device *vsp1)
> 
> ---
> base-commit: 7d0a66e4bb9081d75c82ec4957c50034cb0ea449
> change-id: 20260115-rcar-vsp-crash-fix-8d4871f0f39e

-- 
Regards,

Laurent Pinchart
