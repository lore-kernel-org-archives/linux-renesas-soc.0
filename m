Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDB913D3486;
	Mon, 27 Jul 2026 09:49:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785145747; cv=none; b=TKj0NNZfBMH9tdsy20okbsRr9+eh3dqEHtJ+2V2ym8hFdOmd3NA423/EF/4lZ/1Q1IiSShsxZxuoycA8bGbHX4YRpSDV3xxIlfxS8g3gWT7bEKfq2EtHr/uclPSc6T4zyz6AG+agQVfmrEQ+1AEuBHV+Ki1V+6uXzxGPP4jq58U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785145747; c=relaxed/simple;
	bh=7akpkg+Eu3pWC7+Pg4WxjHm+2cLOxFv38oPKFHSlEsA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=suWFlyYDYOJydZ5mxGTgD3aqmBzSJNq4rsgjDEtF8K8FRmXdjSgPyXq+/RyWeNjrZ5/sYnnXHHd/4A7EcV2sq1HANZwoSOOjiazwynIHb1jZbP1vGdRgUis2uyVm0lojd/owu6tJKihq3cGJ3ld/VS+NlG0MDjD5umNiCoRywI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=k9C8mwYC; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="k9C8mwYC"
Received: from ideasonboard.com (mob-5-90-50-102.net.vodafone.it [5.90.50.102])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2A9283A4;
	Mon, 27 Jul 2026 11:47:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1785145678;
	bh=7akpkg+Eu3pWC7+Pg4WxjHm+2cLOxFv38oPKFHSlEsA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=k9C8mwYCzdIzxSNj3yqmOI/rvqdcOyj2NIJTG4TJDBoZQdLvixQiNryGTO1fC3lPS
	 Uej/9BVTEHu1DjQSrEF5aY2Az9MMVgwk8R7Hcl1Vx8j5lhHetErk13ZhTQBihHgvpx
	 cx9nPVt1M4+TWLStWQRyC5YZpmtmCzvpeP4xJnRk=
Date: Mon, 27 Jul 2026 11:48:59 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: tomm.merciai@gmail.com, linux-renesas-soc@vger.kernel.org, 
	biju.das.jz@bp.renesas.com, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/9] media: rzg2l-cru: csi2: Add device_link from CSI-2
 to sensor
Message-ID: <amcpMBZTD20M9cMZ@zed>
References: <20260616170542.447804-1-tommaso.merciai.xr@bp.renesas.com>
 <20260616170542.447804-3-tommaso.merciai.xr@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260616170542.447804-3-tommaso.merciai.xr@bp.renesas.com>

Hi Tommaso

On Tue, Jun 16, 2026 at 07:05:32PM +0200, Tommaso Merciai wrote:
> The CSI-2 receiver depends on its remote sensor being powered and
> configured before it can receive data. Without an explicit device_link
> the PM core has no knowledge of this dependency and may suspend the
> sensor while CSI-2 is still active, or resume CSI-2 before the sensor
> is ready.
>
> Add a DL_FLAG_STATELESS device_link from the CSI-2 device to the sensor
> device when the sensor subdev binds. This instructs the PM core to
> suspend CSI-2 before the sensor and to resume the sensor before CSI-2.
> The link is deleted on unbind.
>
> Move csi2->remote_source assignment to the end of the function.
>
> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> ---
>  .../platform/renesas/rzg2l-cru/rzg2l-csi2.c   | 24 +++++++++++++++----
>  1 file changed, 19 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
> index 6dc4b53607b4..3a4bc4ef72fc 100644
> --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
> +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
> @@ -773,15 +773,28 @@ static int rzg2l_csi2_notify_bound(struct v4l2_async_notifier *notifier,
>  				   struct v4l2_async_connection *asd)
>  {
>  	struct rzg2l_csi2 *csi2 = notifier_to_csi2(notifier);
> +	int ret;
>
> -	csi2->remote_source = subdev;
> +	if (!device_link_add(csi2->dev, subdev->dev, DL_FLAG_STATELESS)) {

As cru-csi2 supports runtime suspend/resume, should you also add
DL_FLAG_PM_RUNTIME ?

> +		dev_err(csi2->dev, "Failed to create device link to sensor %s\n",
> +			subdev->name);
> +		return -EINVAL;
> +	}
>
>  	dev_dbg(csi2->dev, "Bound subdev: %s pad\n", subdev->name);
>
> -	return media_create_pad_link(&subdev->entity, RZG2L_CSI2_SINK,
> -				     &csi2->subdev.entity, 0,
> -				     MEDIA_LNK_FL_ENABLED |
> -				     MEDIA_LNK_FL_IMMUTABLE);
> +	ret = media_create_pad_link(&subdev->entity, RZG2L_CSI2_SINK,
> +				    &csi2->subdev.entity, 0,
> +				    MEDIA_LNK_FL_ENABLED |
> +				    MEDIA_LNK_FL_IMMUTABLE);
> +	if (ret) {
> +		device_link_remove(csi2->dev, subdev->dev);
> +		return ret;
> +	}
> +
> +	csi2->remote_source = subdev;
> +
> +	return 0;
>  }
>
>  static void rzg2l_csi2_notify_unbind(struct v4l2_async_notifier *notifier,
> @@ -790,6 +803,7 @@ static void rzg2l_csi2_notify_unbind(struct v4l2_async_notifier *notifier,
>  {
>  	struct rzg2l_csi2 *csi2 = notifier_to_csi2(notifier);
>
> +	device_link_remove(csi2->dev, subdev->dev);
>  	csi2->remote_source = NULL;
>
>  	dev_dbg(csi2->dev, "Unbind subdev %s\n", subdev->name);
> --
> 2.54.0
>
