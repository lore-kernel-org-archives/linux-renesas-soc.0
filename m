Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CFEC3F1AB4;
	Mon, 27 Jul 2026 09:45:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785145557; cv=none; b=r6uKbA3gvUihIQLpm3MpkXXlfozEFO1VIimE+N+7lK5nrPKDPucU+kx3CKnLOaHm3okYVFZAs1jlEqxArBbyZ7dGFtBbuUD6WfAEvlAMfOWLXjQDOLPFmY5ORX7rbWlUTPOzHJIhXPmzMnKx4Gy+1XUuSm/k4xILc4m67CQanIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785145557; c=relaxed/simple;
	bh=zlhe45T7zphfxSRQPQ0/CzQbOuJIjqmc0+Vw3dH3sbE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C4OPSGpEDu7jSu6oiwbtFYpUzRnAsBnTFAMIxaETEAZt0mGNDWBLgd8OUIZq0qDpsB0Sus9UOP2vm7XminQmVfM6NLKi+MBMh7BKpYeCKLdqRo/s+W6+USSjioM82sArs0bG1DeYv0xJ/u6J7Tp18eforQ3eKaasaNSPxO6JpGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=u/blltmP; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="u/blltmP"
Received: from ideasonboard.com (mob-5-90-50-102.net.vodafone.it [5.90.50.102])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id C17D63A4;
	Mon, 27 Jul 2026 11:44:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1785145489;
	bh=zlhe45T7zphfxSRQPQ0/CzQbOuJIjqmc0+Vw3dH3sbE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=u/blltmP6fv5AzrInfteuEptCCeYJ+Oc3FACpqrUTjsz4JtjjWZuXP84qWoELeomf
	 enklJc5MpYaovr32ugUYv20N+egsQHEyMox5I61WP+3qFFBbEOgKIWWLlpy5EdmCx4
	 vrZpofSd7aD6jHd0ya7ktCsKqMdaSfOFXJN6iOH8=
Date: Mon, 27 Jul 2026 11:45:50 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: tomm.merciai@gmail.com, linux-renesas-soc@vger.kernel.org, 
	biju.das.jz@bp.renesas.com, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/9] media: rzg2l-cru: Add device_link from CRU to CSI-2
Message-ID: <amcn1m-RFmVdeCsE@zed>
References: <20260616170542.447804-1-tommaso.merciai.xr@bp.renesas.com>
 <20260616170542.447804-2-tommaso.merciai.xr@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260616170542.447804-2-tommaso.merciai.xr@bp.renesas.com>

Hi Tommaso

On Tue, Jun 16, 2026 at 07:05:31PM +0200, Tommaso Merciai wrote:
> The CRU device depends on CSI-2 to operate. Without an explicit
> device_link the PM core has no knowledge of this dependency and may
> suspend CSI-2 while CRU is still active, or resume CRU before CSI-2
> is ready.
>
> Add a DL_FLAG_STATELESS device_link from the CRU to CSI-2 when the
> CSI-2 subdev binds. This instructs the PM core to suspend CRU before
> CSI-2 and to resume CSI-2 before CRU. The link is deleted on unbind.
>
> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> ---
>  drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
> index 3c5fbd857371..1b12d91eaec9 100644
> --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
> +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
> @@ -101,6 +101,7 @@ static void rzg2l_cru_group_notify_unbind(struct v4l2_async_notifier *notifier,
>  	mutex_lock(&cru->mdev_lock);
>
>  	if (cru->csi.asd == asd) {
> +		device_link_remove(cru->dev, subdev->dev);
>  		cru->csi.subdev = NULL;
>  		dev_dbg(cru->dev, "Unbind CSI-2 %s\n", subdev->name);
>  	}
> @@ -118,6 +119,12 @@ static int rzg2l_cru_group_notify_bound(struct v4l2_async_notifier *notifier,
>
>  	if (cru->csi.asd == asd) {
>  		cru->csi.subdev = subdev;
> +		if (!device_link_add(cru->dev, subdev->dev, DL_FLAG_STATELESS)) {

So, cru-core and cru-csi2 are two different drivers, guarded by two
different config symbols, both live in drivers/media/platforms/renesas/rzg2l-cru/

I guess it doesn't make much sense to have one without the other, but
the build system allows that. That might be the reason why you used
STATELESS here, but since this call happens at _bound() time, doesn't
it mean we're sure the supplier driver is there and has probed
correctly already ?

I guess you don't want DL_FLAG_PM_RUNTIME as this series is for system
suspend/resume, right ?

> +			dev_err(cru->dev, "Failed to create device link to CSI-2 %s\n",
> +				subdev->name);
> +			mutex_unlock(&cru->mdev_lock);
> +			return -EINVAL;
> +		}
>  		dev_dbg(cru->dev, "Bound CSI-2 %s\n", subdev->name);
>  	}
>
> --
> 2.54.0
>
