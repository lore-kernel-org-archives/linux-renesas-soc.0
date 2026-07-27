Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 478F43F410F;
	Mon, 27 Jul 2026 09:55:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785146127; cv=none; b=b3fPZNBnqwJ/Id/3jbP2X50MweLF4KaMHcT0zRgvtXX0Xljc3NG+S/U7g0PTcp0DI0fZ7hPcBAlppA9rx2fJaacSdnQG8CYQWoIJeLf0BdJn7BinC+bkWmJQWN04yI3JP4mg/xMzPEXoaSqzt1gn/5/MDkMevFQparGLo0eB75s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785146127; c=relaxed/simple;
	bh=tsRwJW6w/B108uEMUfCudRh+Icb9w89s/jzMYG1ftAI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o1fpd1IlcqLOLagDMKpdFlTiZ5oDeocD2iPcgud2W7mBR1wWfo/YVCMFtVAQcTdOFnAI1wGRsHYThUcGvAjb9mxKctLUktNERol7007Qy1/MYUKLGkm5/3hi9wYENr7M5XFHwIcinDe4URIOybMtqhPWonke7ydX8ucfvtcq5O4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=lmHuxc6U; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="lmHuxc6U"
Received: from ideasonboard.com (mob-5-90-50-102.net.vodafone.it [5.90.50.102])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0EC293A4;
	Mon, 27 Jul 2026 11:54:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1785146058;
	bh=tsRwJW6w/B108uEMUfCudRh+Icb9w89s/jzMYG1ftAI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lmHuxc6Up0KQbbqNqui6q0wjXLjwTgVbih+bg4yQ+zX3sTJk41HaKw5KggwcEtPSd
	 ae3Zvmk6FRZtRCIEOs3fTTZ6yrfJz12oHJUt5BU6LsbgKzUkSQfwz5CqbYTRqt1jlM
	 nDvw6b1ScKOT6KYWmUbU9h/nPpkun4ZlDxtJLrXI=
Date: Mon, 27 Jul 2026 11:55:17 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: tomm.merciai@gmail.com, linux-renesas-soc@vger.kernel.org, 
	biju.das.jz@bp.renesas.com, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/9] media: rzg2l-cru: Use bulk reset API in
 rzg2l_cru_start_streaming_vq()
Message-ID: <amcqq4dJxdpdbnzc@zed>
References: <20260616170542.447804-1-tommaso.merciai.xr@bp.renesas.com>
 <20260616170542.447804-4-tommaso.merciai.xr@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260616170542.447804-4-tommaso.merciai.xr@bp.renesas.com>

Hi Tommaso

On Tue, Jun 16, 2026 at 07:05:33PM +0200, Tommaso Merciai wrote:
> Replace individual reset_control_deassert() calls for aresetn and presetn
> with reset_control_bulk_deassert(), and consolidate the error path labels
> into a single err_assert_resets using reset_control_bulk_assert().
>
> No functional changes intended.
>
> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> ---
>  .../platform/renesas/rzg2l-cru/rzg2l-video.c  | 23 ++++++++-----------
>  1 file changed, 9 insertions(+), 14 deletions(-)
>
> diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> index 5185a547461d..bf61a74f8f74 100644
> --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> @@ -672,6 +672,10 @@ irqreturn_t rzg3e_cru_irq(int irq, void *data)
>  static int rzg2l_cru_start_streaming_vq(struct vb2_queue *vq, unsigned int count)
>  {
>  	struct rzg2l_cru_dev *cru = vb2_get_drv_priv(vq);
> +	struct reset_control_bulk_data resets[] = {
> +		{ .rstc = cru->aresetn },
> +		{ .rstc = cru->presetn },
> +	};
>  	int ret;
>
>  	ret = pm_runtime_resume_and_get(cru->dev);
> @@ -683,19 +687,12 @@ static int rzg2l_cru_start_streaming_vq(struct vb2_queue *vq, unsigned int count
>  		goto err_pm_put;
>
>  	/* Release reset state */
> -	ret = reset_control_deassert(cru->aresetn);
> +	ret = reset_control_bulk_deassert(ARRAY_SIZE(resets), resets);
>  	if (ret) {
> -		dev_err(cru->dev, "failed to deassert aresetn\n");
> +		dev_err(cru->dev, "failed to deassert resets\n");
>  		goto err_vclk_disable;
>  	}
>
> -	ret = reset_control_deassert(cru->presetn);
> -	if (ret) {
> -		reset_control_assert(cru->aresetn);
> -		dev_err(cru->dev, "failed to deassert presetn\n");
> -		goto assert_aresetn;
> -	}
> -

Is there any ordering requirement in the reset signal de-assertion ?

>  	/* Allocate scratch buffer */
>  	cru->scratch = dma_alloc_coherent(cru->dev, cru->format.sizeimage,
>  					  &cru->scratch_phys, GFP_KERNEL);
> @@ -703,7 +700,7 @@ static int rzg2l_cru_start_streaming_vq(struct vb2_queue *vq, unsigned int count
>  		rzg2l_cru_return_buffers(cru, VB2_BUF_STATE_QUEUED);
>  		dev_err(cru->dev, "Failed to allocate scratch buffer\n");
>  		ret = -ENOMEM;
> -		goto assert_presetn;
> +		goto err_assert_resets;
>  	}
>
>  	cru->active_slot = 0;
> @@ -722,11 +719,9 @@ static int rzg2l_cru_start_streaming_vq(struct vb2_queue *vq, unsigned int count
>  	if (ret)
>  		dma_free_coherent(cru->dev, cru->format.sizeimage, cru->scratch,
>  				  cru->scratch_phys);
> -assert_presetn:
> -	reset_control_assert(cru->presetn);
>
> -assert_aresetn:
> -	reset_control_assert(cru->aresetn);
> +err_assert_resets:
> +	reset_control_bulk_assert(ARRAY_SIZE(resets), resets);
>

Do you happen to know why rzg2l_cru_stop_streaming_vq() only assert
'presetn' and not 'aresetn' ?

>  err_vclk_disable:
>  	clk_disable_unprepare(cru->vclk);
> --
> 2.54.0
>
