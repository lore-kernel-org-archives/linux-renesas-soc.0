Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1011C363086;
	Mon, 27 Jul 2026 10:20:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785147637; cv=none; b=mYEdqTSkaBg08xk+JonOoMWzQPy9y00zo6USk/tPOS0+soAc3h66XNiYMw61KZAMHuymHf4VrUbOeyIpevgDVj9xaDPHShXGMXY8WNP4u+/XKtMtarQzINfIrK7IGW8W/OmMWLtmDm3QHTHALQsW1cccBW/smZ1sTWnHqgmrjLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785147637; c=relaxed/simple;
	bh=hPLHXeoAYbvigVN00b8mMV9FkhjPjrvtvQnWFccOfmY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a6HmiTPeyeuxOHbeH2ALLk23Sl7NfZM5PCmNpkQUMW3NZDvvSged8JIqLq+iOK0/ZekrxMLhdYqfAV02g8iGq+enVkyfbMNcof0zKMmC0St+gEaLeViN03IJ0sMD/hw+1ta+LCmxH1H7fbt+zFzLwlMU/xON0wSh3yXsidq9MQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=S3QiUDsK; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="S3QiUDsK"
Received: from ideasonboard.com (mob-5-90-50-102.net.vodafone.it [5.90.50.102])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 730073A4;
	Mon, 27 Jul 2026 12:19:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1785147570;
	bh=hPLHXeoAYbvigVN00b8mMV9FkhjPjrvtvQnWFccOfmY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=S3QiUDsKd3AV64BOkwXntfTfflvyrgbz5wMXQs+NWI22SvB+2k1UlbXZPaBVeC71x
	 DIcgen8Jy34350gCLzXzSRVB80HNUghZzMfxjUHnoL+JuOcLU3ka/+bBJpuAoIVpg8
	 0gh8+cNlyvJSe+Ov2M+LPseuhIvKZpVCxNldn4eA=
Date: Mon, 27 Jul 2026 12:20:31 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: tomm.merciai@gmail.com, linux-renesas-soc@vger.kernel.org, 
	biju.das.jz@bp.renesas.com, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 6/9] media: rzg2l-cru: Add suspend/resume support
Message-ID: <amcvTPggBxgkRjQA@zed>
References: <20260616170542.447804-1-tommaso.merciai.xr@bp.renesas.com>
 <20260616170542.447804-7-tommaso.merciai.xr@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260616170542.447804-7-tommaso.merciai.xr@bp.renesas.com>

Hi Tommaso

On Tue, Jun 16, 2026 at 07:05:36PM +0200, Tommaso Merciai wrote:
> The CRU has no system sleep hooks, leaving the device in an undefined
> state across suspend/resume.
>
> On suspend, stop the pipeline, requeue any buffers held by the hardware
> back to the software queue, and assert the resets. On resume, deassert
> the resets and restart streaming.
>
> Add a bool running field to track pipeline state. stop_streaming uses it
> to skip rzg2l_cru_set_stream() when the pipeline was already stopped by
> a failed resume, avoiding a double-stop. Export rzg2l_cru_set_stream()
> and add rzg2l_cru_requeue_active_buffers() for use by the PM callbacks.
>
> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> ---
>  .../platform/renesas/rzg2l-cru/rzg2l-core.c   | 67 +++++++++++++++++++
>  .../platform/renesas/rzg2l-cru/rzg2l-cru.h    |  5 ++
>  .../platform/renesas/rzg2l-cru/rzg2l-video.c  | 25 ++++++-
>  3 files changed, 95 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
> index 1b12d91eaec9..2840f40e4c01 100644
> --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
> +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
> @@ -246,6 +246,72 @@ static int rzg2l_cru_media_init(struct rzg2l_cru_dev *cru)
>  	return 0;
>  }
>
> +static int rzg2l_cru_pm_suspend(struct device *dev)
> +{
> +	struct rzg2l_cru_dev *cru = dev_get_drvdata(dev);
> +	struct reset_control_bulk_data resets[] = {
> +		{ .rstc = cru->aresetn },
> +		{ .rstc = cru->presetn },
> +	};

You're re-creating this struct in a few places. Isn't it worth to move
struct reset_control_bulk_data resets[] to struct rzg2l_cru_dev and
populate it at probe time ?

> +	int ret;
> +
> +	if (!cru->running)
> +		return 0;
> +
> +	ret = rzg2l_cru_set_stream(cru, 0);
> +	if (ret)
> +		return ret;
> +
> +	rzg2l_cru_requeue_active_buffers(cru);
> +
> +	ret = reset_control_bulk_assert(ARRAY_SIZE(resets), resets);
> +	if (ret) {
> +		if (rzg2l_cru_set_stream(cru, 1))
> +			vb2_queue_error(&cru->queue);
> +
> +		return ret;
> +	}

Do you need to prepare_enble/disable_unprepare clocks as well or only
resets ?

If you need clocks as well, then this section will become very similar
to what follows pm_runtime_resume_and_get()/precedes
pm_runtime_suspend in rzg2l_cru_start_streaming_vq() and
rzg2l_cru_stop_streaming_vq() respectively.

At this point you could break out the clock/reset handling to
dedicated functions and also install runtime_pm handlers, and re-use
the same routines here and in the below resume ?

> +
> +	return 0;
> +}
> +
> +static int rzg2l_cru_pm_resume(struct device *dev)
> +{
> +	struct rzg2l_cru_dev *cru = dev_get_drvdata(dev);
> +	struct reset_control_bulk_data resets[] = {
> +		{ .rstc = cru->aresetn },
> +		{ .rstc = cru->presetn },
> +	};
> +	int ret;
> +
> +	if (!cru->running)
> +		return 0;
> +
> +	ret = reset_control_bulk_deassert(ARRAY_SIZE(resets), resets);
> +	if (ret)
> +		goto err_running;
> +
> +	ret = rzg2l_cru_set_stream(cru, 1);
> +	if (ret) {
> +		dev_err(cru->dev, "Failed to restart streaming: %d\n", ret);
> +		goto err_reset_assert;
> +	}
> +
> +	return 0;
> +
> +err_reset_assert:
> +	reset_control_bulk_assert(ARRAY_SIZE(resets), resets);
> +err_running:
> +	cru->running = false;
> +	vb2_queue_error(&cru->queue);
> +
> +	return ret;
> +}
> +
> +static DEFINE_SIMPLE_DEV_PM_OPS(rzg2l_cru_pm_ops,
> +				rzg2l_cru_pm_suspend,
> +				rzg2l_cru_pm_resume);
> +
>  static int rzg2l_cru_probe(struct platform_device *pdev)
>  {
>  	struct device *dev = &pdev->dev;
> @@ -437,6 +503,7 @@ static struct platform_driver rzg2l_cru_driver = {
>  	.driver = {
>  		.name = "rzg2l-cru",
>  		.of_match_table = rzg2l_cru_of_id_table,
> +		.pm = pm_sleep_ptr(&rzg2l_cru_pm_ops),
>  	},
>  	.probe = rzg2l_cru_probe,
>  	.remove = rzg2l_cru_remove,
> diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
> index 5bf334e173d2..c079cad41266 100644
> --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
> +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
> @@ -161,12 +161,17 @@ struct rzg2l_cru_dev {
>  	struct list_head buf_list;
>  	unsigned int sequence;
>
> +	bool running;
> +
>  	struct v4l2_pix_format format;
>  };
>
>  int rzg2l_cru_start_image_processing(struct rzg2l_cru_dev *cru);
>  void rzg2l_cru_stop_image_processing(struct rzg2l_cru_dev *cru);
>
> +int rzg2l_cru_set_stream(struct rzg2l_cru_dev *cru, int on);
> +void rzg2l_cru_requeue_active_buffers(struct rzg2l_cru_dev *cru);
> +
>  int rzg2l_cru_dma_register(struct rzg2l_cru_dev *cru);
>  void rzg2l_cru_dma_unregister(struct rzg2l_cru_dev *cru);
>
> diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> index 71d9c671f739..46a0823e1300 100644
> --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> @@ -155,6 +155,23 @@ static void rzg2l_cru_return_buffers(struct rzg2l_cru_dev *cru,
>  	}
>  }
>
> +void rzg2l_cru_requeue_active_buffers(struct rzg2l_cru_dev *cru)
> +{
> +	unsigned int i;
> +
> +	scoped_guard(spinlock_irqsave, &cru->hw_lock) {

As the functions is fully covered by the lock this could be

        guard(spinlock_irqsave)(&cru->hw_lock);

Can this be called from irq context ? Do you need irqsave ?

> +		for (i = 0; i < cru->num_buf; i++) {

You can declare i inside the for loop

> +			if (!cru->queue_buf[i])
> +				continue;
> +			scoped_guard(spinlock_irqsave, &cru->qlock) {
> +				list_add_tail(to_buf_list(cru->queue_buf[i]),
> +					      &cru->buf_list);
> +			}
> +			cru->queue_buf[i] = NULL;
> +		}
> +	}
> +}
> +
>  static int rzg2l_cru_queue_setup(struct vb2_queue *vq, unsigned int *nbuffers,
>  				 unsigned int *nplanes, unsigned int sizes[],
>  				 struct device *alloc_devs[])
> @@ -528,7 +545,7 @@ int rzg2l_cru_start_image_processing(struct rzg2l_cru_dev *cru)
>  	return 0;
>  }
>
> -static int rzg2l_cru_set_stream(struct rzg2l_cru_dev *cru, int on)
> +int rzg2l_cru_set_stream(struct rzg2l_cru_dev *cru, int on)
>  {
>  	struct media_pipeline *pipe;
>  	struct v4l2_subdev *sd;
> @@ -707,6 +724,7 @@ static int rzg2l_cru_start_streaming_vq(struct vb2_queue *vq, unsigned int count
>  		goto out;
>  	}
>
> +	cru->running = true;

Is it necessary to protect access to cru->running for concurrent
suspend/start|stop_streaming sequences ?

Thanks
   j

>  	dev_dbg(cru->dev, "Starting to capture\n");
>  	return 0;
>
> @@ -731,7 +749,10 @@ static void rzg2l_cru_stop_streaming_vq(struct vb2_queue *vq)
>  {
>  	struct rzg2l_cru_dev *cru = vb2_get_drv_priv(vq);
>
> -	rzg2l_cru_set_stream(cru, 0);
> +	if (cru->running) {
> +		rzg2l_cru_set_stream(cru, 0);
> +		cru->running = false;
> +	}
>
>  	/* Free scratch buffer */
>  	dma_free_coherent(cru->dev, cru->format.sizeimage,
> --
> 2.54.0
>
