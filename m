Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6018D198E91;
	Wed, 10 Jun 2026 20:22:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781122942; cv=none; b=WYMtD5rQWVvDtPjXZCnnMKcf6A4+j3sDPxFNuR2GBYmX4Qbpq0TbI8Vtu+1yE/sFg1Bmu9ue2yBTk66zvBMcQAMpkZ1Wz42wkp3SeCv8UkXOl/gPbWGVObL+26dHMtLNhlpuoA0RvtoM93tDqaWue2HZBnBsoaGyHXNh7Mn7PIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781122942; c=relaxed/simple;
	bh=BE2c+IrEeTOedP0ZD6cDfxkL/nAf77BgIwGN2zZwtDI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LPgTwoxyoSM4fRTjBp6enPVyfW9fOi66FzaME68yVSwtskQIdTyfEvIF/PPuQVHLWC7BHrlbEJr4I1bHOgn/hMz/rc7HffCxNPD9OinlJAPR5shz5eCVIbytLwTJ6Xk5vNtUwA6xiuyNHbRafPQOuNn08LUU2J0ynT96nh6EVNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=R14ZmYFQ; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="R14ZmYFQ"
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id A1612D0;
	Wed, 10 Jun 2026 22:21:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1781122910;
	bh=BE2c+IrEeTOedP0ZD6cDfxkL/nAf77BgIwGN2zZwtDI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=R14ZmYFQpdLTNXg0MNdWAkzsXqmq7ox48l6tasQ8eUN90leh7Cu8Z9Mcpa57HJn2v
	 qUX5E8baOZ2meCF9Rwa0Un0J6QNc6nSEe1OjoFs77Lu3uy4BzFNYHjdzRa31C62GAN
	 zjzi9JTsm0C0Ou/gNb6ORDyy66l+wk8pLrLozEk8=
Date: Wed, 10 Jun 2026 23:22:18 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Xiaolei Wang <xiaolei.wang@windriver.com>,
	Tarang Raval <tarang.raval@siliconsignals.io>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Daniel Scally <dan.scally@ideasonboard.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>,
	linux-renesas-soc@vger.kernel.org, stable@kernel.org
Subject: Re: [PATCH 3/3] media: mc-entity: Add missing kerneldoc
Message-ID: <20260610202218.GC1384932@killaraus.ideasonboard.com>
References: <20260610-media-ci-7-2-v1-0-3c61a482a44e@chromium.org>
 <20260610-media-ci-7-2-v1-3-3c61a482a44e@chromium.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260610-media-ci-7-2-v1-3-3c61a482a44e@chromium.org>

On Wed, Jun 10, 2026 at 04:20:08PM +0000, Ricardo Ribalda wrote:
> The argument args is not documented, and the latest kernel version
> complains about that.
> 
> This fixes the following warning:
> Warning: include/media/media-entity.h:1394 function parameter 'args'
> not described in 'media_entity_call'
> 
> Cc: stable@kernel.org
> Fixes: 48a7c4bac94d ("[media] docs-rst: improve the kAPI documentation for the mediactl")
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
>  include/media/media-entity.h | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/include/media/media-entity.h b/include/media/media-entity.h
> index d9b72cd87d52..fa393e840669 100644
> --- a/include/media/media-entity.h
> +++ b/include/media/media-entity.h
> @@ -1387,6 +1387,7 @@ void media_remove_intf_links(struct media_interface *intf);
>   * @entity: entity where the @operation will be called
>   * @operation: type of the operation. Should be the name of a member of
>   *	struct &media_entity_operations.
> + * @args: arguments for the operation.
>   *
>   * This helper function will check if @operation is not %NULL. On such case,
>   * it will issue a call to @operation\(@entity, @args\).
> 

-- 
Regards,

Laurent Pinchart
