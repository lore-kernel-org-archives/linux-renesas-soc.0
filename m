Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 289BA44BCB5;
	Wed, 10 Jun 2026 20:18:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781122720; cv=none; b=OH7RaMF5ufJskDF0LI+V3lqPa5UfMjgJ/hYsOsKEle82WKh+BzsKroCoiilDciTcyBZ44vx8VThs/Ra+MikBQx2oYxl7f/neZRq+BlWtvVjyegHiBVAhu07rN1bjHY2H4F8tShoIfvhhMPh0OytOcHGUz7pHfgHKsqWMyQcTb6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781122720; c=relaxed/simple;
	bh=dMbCiMPaiiNBx1P0Vt62U2D3Lam9y9FfXTPu/7YLMK8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ocjxIOHbzbv+tClvHl1RK8x7vtLnPWg/J+puGVH1LSb3DO7EL1kcHpjGH+d6tozfnF1lM0vG89Sufd5e1D8q3TnR7hCy4TN4J+iHfLYs6JRGk1IVDH5vt1ACp00OA5VI2XPQ61eyfHWICrUkWdDxzoQCq/kz3YTacn7l4NXEMec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=s8MUstah; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="s8MUstah"
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id E3964517;
	Wed, 10 Jun 2026 22:18:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1781122687;
	bh=dMbCiMPaiiNBx1P0Vt62U2D3Lam9y9FfXTPu/7YLMK8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=s8MUstahImRsXwk7jU/I3fPs/BMd0JgoDg++pgstWb/A5IlYZN8rUWuLiwtdfQAbg
	 x0HowM5bIJw6vhfhuOIU7TogmMIDOwGEvBtAxHBCm3Yh38uujtFgRAMkf1XDa1+b/E
	 XqMuhENhP98DYcD+cYYH5Nsv7v7Pcgjt5WuZQk7U=
Date: Wed, 10 Jun 2026 23:18:34 +0300
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
Subject: Re: [PATCH 1/3] media: ov9282: Remove unused kerneldoc description
Message-ID: <20260610201834.GA1384932@killaraus.ideasonboard.com>
References: <20260610-media-ci-7-2-v1-0-3c61a482a44e@chromium.org>
 <20260610-media-ci-7-2-v1-1-3c61a482a44e@chromium.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260610-media-ci-7-2-v1-1-3c61a482a44e@chromium.org>

On Wed, Jun 10, 2026 at 04:20:06PM +0000, Ricardo Ribalda wrote:
> The field has been removed, but the kerneldoc not. Let's take care of
> this.
> 
> This patch fixes the following warning:
> Warning: drivers/media/i2c/ov9282.c:223 Excess struct member 'mutex'
> description in 'ov9282'
> 
> Cc: stable@kernel.org
> Fixes: 0c69a963a300 ("media: i2c: ov9282: Switch to using the sub-device state lock")
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
>  drivers/media/i2c/ov9282.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/media/i2c/ov9282.c b/drivers/media/i2c/ov9282.c
> index 5b6f897a74fc..3ba630ec4f2a 100644
> --- a/drivers/media/i2c/ov9282.c
> +++ b/drivers/media/i2c/ov9282.c
> @@ -197,7 +197,6 @@ struct ov9282_mode {
>   * @noncontinuous_clock: Selection of CSI2 noncontinuous clock mode
>   * @cur_mode: Pointer to current selected sensor mode
>   * @code: Mbus code currently selected
> - * @mutex: Mutex for serializing sensor controls
>   */
>  struct ov9282 {
>  	struct device *dev;
> 

-- 
Regards,

Laurent Pinchart
