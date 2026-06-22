Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E99722DA76C;
	Mon, 22 Jun 2026 11:57:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782129442; cv=none; b=SxWlqF48FPwUmPHMLhok/wp2B36UQskqlspambFXLh9eoWqrb3UzVBxAQQea8pbl6cuTmvRV+PO+ODYHLIpNByULyR/ec9qC/INRIb+XDoZzZhVCwdv4QrXO0nv0m1ghfUPk12wPQR3ZSCZ++Calz3oX8XRnWN5MxNWlWGLgt68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782129442; c=relaxed/simple;
	bh=motJcgx6Rp/JcX3QEyA5X2+wVGq3FES59TwBK2EswIQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZqNmDUOz7MTL5m68oBhvMvYh01x9uKq91Fh75KQco0+IbQRW64v45YMZL+FkEQyJrcZa4+SNQ6wtevokkMtS+JKYRWKjsbJHI0sf3HkfTDHs2XeC8OfVsb93yqGydMDodrnAcLyTgu5tYGFPxixhNQU0fXIaCx2vXaiFpM7ATzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=pl+lMrxj; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="pl+lMrxj"
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6F9B59CE;
	Mon, 22 Jun 2026 13:56:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1782129401;
	bh=motJcgx6Rp/JcX3QEyA5X2+wVGq3FES59TwBK2EswIQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pl+lMrxjzBpFEP/jWWQRSYs5tjwoHB/A4wPOxXRpryjZHYnQDXVF3tQSWJCIgOlaX
	 PBYxop4LABI/khAuLHRq/q/LbzdlxKFdQpAypA2w9XrBBko56dV115/yaoRiH+LpvF
	 6nnQ2scCCk56Hh6BE/aYiv1/ivpb3HGuZ8Rvcbjs=
Date: Mon, 22 Jun 2026 14:57:18 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Biren Pandya <birenpandya@gmail.com>, linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, sakari.ailus@linux.intel.com,
	mchehab@kernel.org
Subject: Re: [PATCH v2 1/4] media: renesas: rcar-csi2: Add missing
 media_entity_cleanup()
Message-ID: <20260622115718.GH3872967@killaraus.ideasonboard.com>
References: <20260619102241.22887-6-birenpandya@gmail.com>
 <20260619121729.24899-5-birenpandya@gmail.com>
 <ajjsrRVdvV-tkr-i@zed>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ajjsrRVdvV-tkr-i@zed>

On Mon, Jun 22, 2026 at 10:06:54AM +0200, Jacopo Mondi wrote:
> Hi Biren
> 
> On Fri, Jun 19, 2026 at 05:47:30PM +0530, Biren Pandya wrote:
> > The probe error paths and remove function are missing calls to
> > media_entity_cleanup(). Add them and introduce an err_entity label
> > to ensure teardown logic properly inverses initialization.
> >
> > Signed-off-by: Biren Pandya <birenpandya@gmail.com>
> 
> Have you at least compiled this patch ?
> 
> ../drivers/media/platform/renesas/rcar-csi2.c: In function ‘rcsi2_probe’:
> ../drivers/media/platform/renesas/rcar-csi2.c:2634:1: error: label ‘error_entity’ defined but not used [-Werror=unused-label]
>  2634 | error_entity:
>       | ^~~~~~~~~~~~
> 
> Also, don't send v(n+1) in reply to v(n). Each version of a series
> goes in its own thread, with a proper cover letter and changelog.
> 
> I suggest to use b4.

Also, while it's OK to not send all patches of a series to everybody,
the cover letter must be send to all recipients.

> > ---
> >  drivers/media/platform/renesas/rcar-csi2.c | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/drivers/media/platform/renesas/rcar-csi2.c b/drivers/media/platform/renesas/rcar-csi2.c
> > index 7305cc4a04cb..61d7dfe14688 100644
> > --- a/drivers/media/platform/renesas/rcar-csi2.c
> > +++ b/drivers/media/platform/renesas/rcar-csi2.c
> > @@ -2631,6 +2631,8 @@ static int rcsi2_probe(struct platform_device *pdev)
> >  	v4l2_subdev_cleanup(&priv->subdev);
> >  error_pm_runtime:
> >  	pm_runtime_disable(&pdev->dev);
> > +error_entity:
> > +	media_entity_cleanup(&priv->subdev.entity);
> >  error_async:
> >  	v4l2_async_nf_unregister(&priv->notifier);
> >  	v4l2_async_nf_cleanup(&priv->notifier);
> > @@ -2646,6 +2648,7 @@ static void rcsi2_remove(struct platform_device *pdev)
> >  	v4l2_async_nf_cleanup(&priv->notifier);
> >  	v4l2_async_unregister_subdev(&priv->subdev);
> >  	v4l2_subdev_cleanup(&priv->subdev);
> > +	media_entity_cleanup(&priv->subdev.entity);
> >
> >  	pm_runtime_disable(&pdev->dev);
> >  }

-- 
Regards,

Laurent Pinchart
