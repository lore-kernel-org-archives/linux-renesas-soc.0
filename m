Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF7093EF0A0;
	Mon, 27 Jul 2026 09:55:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785146162; cv=none; b=HCWWCw2c+ItEupuqiA9559zUHgOdaC07S0FGRXWscNAPDc0Wc5lAYZLtbW8eL0PHsagG47oIhPQR/9+3rpCCvuGv9/0f4gn3gCTDiY3rXwPbvHEn4E2ZQSXyhtvpxbciI71re3N3K6tdImL0aRFi+YA2iTt/U0auf8mvSNyWugo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785146162; c=relaxed/simple;
	bh=u0J6g09I4FH5PgkE7fhtnKXgCJfKY5TdHkpeW8J3FlQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=arorEmf7UDTqC5mSIsbSSVlevhIiok1SWLR5rNjGyQSQZJ1gt4i4V+nGkjWsJmvh9Zls7ewKHBYAa4+ib+y1VKO6DKXYKAGQUW013oHL7fmLFiBokrQMVhyv4/bDsQf0+2trgwQwPOO7BFU2XZXBzN2aH6Ddy65vkuAV8rwL8XI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Lkq23iuP; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Lkq23iuP"
Received: from ideasonboard.com (mob-5-90-50-102.net.vodafone.it [5.90.50.102])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0EFC93A4;
	Mon, 27 Jul 2026 11:54:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1785146092;
	bh=u0J6g09I4FH5PgkE7fhtnKXgCJfKY5TdHkpeW8J3FlQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Lkq23iuPuElqC2b27qftw61XezBmFwJpy7FUih2JTMzWniPI7+4pDIaP+heErD3vi
	 8CMupOyZ54Z/NojcZdd4+WYGClHbDluZBBC+uIFBGxTDrAeZY0HMcUd6+zRS7zSzg/
	 oHUCR+RsUJh2s0KE3PKqmDrV2kkSnJbRzQRYJA2c=
Date: Mon, 27 Jul 2026 11:55:51 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: tomm.merciai@gmail.com, linux-renesas-soc@vger.kernel.org, 
	biju.das.jz@bp.renesas.com, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/9] media: rzg2l-cru: Drop stop streaming function
Message-ID: <amcrGixVK8Ucompc@zed>
References: <20260616170542.447804-1-tommaso.merciai.xr@bp.renesas.com>
 <20260616170542.447804-5-tommaso.merciai.xr@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260616170542.447804-5-tommaso.merciai.xr@bp.renesas.com>

Hi Tommaso

On Tue, Jun 16, 2026 at 07:05:34PM +0200, Tommaso Merciai wrote:
> Drop rzg2l_cru_stop_streaming() function and replace that with the
> direct call to rzg2l_cru_set_stream(cru, 0).
>
> This is a refactoring with no functional changes.
>
> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>

Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

Thanks
  j

> ---
>  drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c | 7 +------
>  1 file changed, 1 insertion(+), 6 deletions(-)
>
> diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> index bf61a74f8f74..e283d9b69342 100644
> --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> @@ -583,11 +583,6 @@ static int rzg2l_cru_set_stream(struct rzg2l_cru_dev *cru, int on)
>  	return ret;
>  }
>
> -static void rzg2l_cru_stop_streaming(struct rzg2l_cru_dev *cru)
> -{
> -	rzg2l_cru_set_stream(cru, 0);
> -}
> -
>  irqreturn_t rzg2l_cru_irq(int irq, void *data)
>  {
>  	struct rzg2l_cru_dev *cru = data;
> @@ -736,7 +731,7 @@ static void rzg2l_cru_stop_streaming_vq(struct vb2_queue *vq)
>  {
>  	struct rzg2l_cru_dev *cru = vb2_get_drv_priv(vq);
>
> -	rzg2l_cru_stop_streaming(cru);
> +	rzg2l_cru_set_stream(cru, 0);
>
>  	/* Free scratch buffer */
>  	dma_free_coherent(cru->dev, cru->format.sizeimage,
> --
> 2.54.0
>
