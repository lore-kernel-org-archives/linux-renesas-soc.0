Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34958301471;
	Wed, 10 Jun 2026 16:30:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781109057; cv=none; b=Ss5CA0bj+TxwOaUrC9fItDHvwtWZO56KB2RLWBZ6oR4A4x1i0ZF7maf+9Hw0YFfEPuvA8Wop3pSMv+s42+VYOpS/TTh62yLiryy5ldy80l/mkAh5Q2f8y8XIdz6QhpXEwHcfiFh/BS0dQp4Qbk5nf8V8dwkNgD69jpEN8qz1I5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781109057; c=relaxed/simple;
	bh=Ng0PlQ/8Hd+v6i06pAJnnDXB2ajl5khig70KfjHBrWM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gcbp1ARP3fiWlP2xOCr1uG04HhN925AsaB4tl3cyHaTcnTPK0OfL+q40o1dx0JuouciPTLsbU623keDC511yBAcKQsM8l1Qz2ilDMGJuWn1UMv2pcw+XB+7Cveb3FKDevDbOvrY9Q8nEbxzUT8ppr15G2lea4wIB2eiUiyo+FaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=c8gZt9ZH; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="c8gZt9ZH"
Received: from ideasonboard.com (93-46-82-201.ip106.fastwebnet.it [93.46.82.201])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 195BB517;
	Wed, 10 Jun 2026 18:30:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1781109025;
	bh=Ng0PlQ/8Hd+v6i06pAJnnDXB2ajl5khig70KfjHBrWM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=c8gZt9ZHYhQVz9QcfqZmOsAJZnoQUat9Atpgr/WC3do201RnH+uWRg8BwyqBsZ1e+
	 qBDbdaUMtUXP8pM2jqHWpBXJNyZjlpP8sHPzEOssLBO4ghYvbfbAHvI0FaQ5VYkUg5
	 HhCOG3fl/uefHn2j9xRYZSYFLX5opOzFoDb79p/M=
Date: Wed, 10 Jun 2026 18:30:51 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Xiaolei Wang <xiaolei.wang@windriver.com>, Tarang Raval <tarang.raval@siliconsignals.io>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Daniel Scally <dan.scally@ideasonboard.com>, Hans Verkuil <hverkuil+cisco@kernel.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 2/3] media: rzg2l-cru: Remove unused kerneldoc description
Message-ID: <aimQ3ln0y0jxMWT3@zed>
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

Hi Ricardo

On Wed, Jun 10, 2026 at 04:20:07PM +0000, Ricardo Ribalda wrote:
> The variable has been previously removed but not its kerneldoc.
>
> Also remove the leftover reference to state in the description of qlock.
>
> This patch fixes the following warning:
>
> Warning: drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h:164
> Excess struct member 'state' description in 'rzg2l_cru_dev'

upsie

indeed!

>
> Fixes: 85d8820d4869 ("media: rzg2l-cru: Remove the 'state' variable")

My only question is if this qualifies for stable or not...
Honestly, I would drop the Fixes tag here

> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>

Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

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
> --
> 2.54.0.1099.g489fc7bff1-goog
>
