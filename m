Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D899376481;
	Wed, 10 Jun 2026 20:21:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781122889; cv=none; b=us1/JqmFGGzYFsXljtQKXfmkoqwR3B538GoKT0YshfgmLwHUGv3u89WZ+UWac3dJ8aAlFwOeX6GN9PaysdP4ef+tfONgBedFcAJNNisKuhsO/zPUkomru3AM5+HP2pJmlmcgyZBua5JNiJh+M/XV9aA0Huk0ouSV+H71Sa8K4pg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781122889; c=relaxed/simple;
	bh=C0hgwPpvRDLcB4otJ+c/gq+EAXdaLhyN2qcfmP8/X1s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iAhHlo2z33HIsN/3yklhh1gHfM+sYl+mVn33+yPOuGcZeq3cwIH9oLoaerEJUgl4M8kcOdNXtpunhOEpb99CClRW2Fk4mg9Zuum+ZGjm2oX5rDDGDsh3R4IdOIoe09TZL9EVuxotSxLjmaAL5zI3nDTuFrPuWm8zd5ObZOrgmYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=DPU4A6A8; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="DPU4A6A8"
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8EF74D0;
	Wed, 10 Jun 2026 22:20:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1781122856;
	bh=C0hgwPpvRDLcB4otJ+c/gq+EAXdaLhyN2qcfmP8/X1s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DPU4A6A8MhqxgpICYEnSO9Posr6LRrhrGs7bOspqe1IVCyqIr4bphjSJ/4SrOI/kZ
	 SW7nf1Sl4yfZ3jleOYqJvPl2PA22nMVED6RqZTuEpCZ3Prvy/AoOtHsu3i54W2qYuB
	 cCa7Lz1DfW942CsDqCXqkVJkMH+JInar3sAI25/I=
Date: Wed, 10 Jun 2026 23:21:24 +0300
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
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 2/3] media: rzg2l-cru: Remove unused kerneldoc description
Message-ID: <20260610202124.GB1384932@killaraus.ideasonboard.com>
References: <20260610-media-ci-7-2-v1-0-3c61a482a44e@chromium.org>
 <20260610-media-ci-7-2-v1-2-3c61a482a44e@chromium.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260610-media-ci-7-2-v1-2-3c61a482a44e@chromium.org>

On Wed, Jun 10, 2026 at 04:20:07PM +0000, Ricardo Ribalda wrote:
> The variable has been previously removed but not its kerneldoc.
> 
> Also remove the leftover reference to state in the description of qlock.
> 
> This patch fixes the following warning:
> 
> Warning: drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h:164
> Excess struct member 'state' description in 'rzg2l_cru_dev'
> 
> Fixes: 85d8820d4869 ("media: rzg2l-cru: Remove the 'state' variable")

Does it mean that this patch was merged without going through CI ? Is
there something we need to improve in the process ?

> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
>  drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
> index 5bf334e173d2..b426bc7898bf 100644
> --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
> +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
> @@ -116,11 +116,9 @@ struct rzg2l_cru_info {
>   * @scratch_phys:	physical address of the scratch buffer
>   *
>   * @qlock:		protects @queue_buf, @buf_list, @sequence
> - *			@state
>   * @queue_buf:		Keeps track of buffers given to HW slot
>   * @buf_list:		list of queued buffers
>   * @sequence:		V4L2 buffers sequence number
> - * @state:		keeps track of operation state
>   *
>   * @format:		active V4L2 pixel format
>   */
> 

-- 
Regards,

Laurent Pinchart
