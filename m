Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 091863D3D18;
	Thu,  9 Jul 2026 07:12:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783581158; cv=none; b=sgK69m5MiUEldPcWIwHOW5+dIi+I6TbkZG++RO8wIyW8adL7i99yCjLMeyWxPSymg6iFhP6A4NZB9qnSnY/tZg85c70fvgFaCZDRoZ5hDFv4pWkWiOe8K14Nzwgo8nbtq53eG3fMKbSogqxYI+ZdHP3nB7RqKTGF9z56na6UN3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783581158; c=relaxed/simple;
	bh=M1pFjA5KJic4AEdltKopPMI6uc5gHRM33VPZKOAQ1MU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UaPpma2SqiCJPADsaKKmk68Woo95g04RKU/gzah983TSW2jimIMaPkykhtvxBCE8SD8SOLvxNYnCdoTCeUl0irMRzU+rVMs3nM6sZuHlGlRygVvoOsvDlOGHnuDl0nBsVeJzWx4WU/NbLQQrUNL03+JyOXnfoO1Y17ENwQxdvdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Taaa+6Oo; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Taaa+6Oo"
Received: from ideasonboard.com (net-93-65-100-155.cust.vodafonedsl.it [93.65.100.155])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id EB3736BFA;
	Thu,  9 Jul 2026 09:04:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1783580699;
	bh=M1pFjA5KJic4AEdltKopPMI6uc5gHRM33VPZKOAQ1MU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Taaa+6Oo3TeP/6dLZFfvqYJ+pRbF47dkPyQG5NgQhCaxhWu11zXNoVQdc8UOLsKMK
	 ufv7h8d7VsMDkoC/4qLB41vMSeIyUCTk0kudBKIWfDp7d3yC8Sii2l3T6JUYijWVNf
	 gDwUisNF/a3PjXaUY15qWYXRKXrzt4sHyL+QOt7A=
Date: Thu, 9 Jul 2026 09:05:46 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Biren Pandya <birenpandya@gmail.com>
Cc: niklas.soderlund@ragnatech.se, mchehab@kernel.org, 
	geert+renesas@glider.be, magnus.damm@gmail.com, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>, 
	linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 4/4] media: renesas: rzg2l-core: Add missing
 media_entity_cleanup()
Message-ID: <ak9G5g8sw5W_c8nf@zed>
References: <20260708170843.55076-6-birenpandya@gmail.com>
 <20260708170843.55076-10-birenpandya@gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260708170843.55076-10-birenpandya@gmail.com>

Hi Biren

On Wed, Jul 08, 2026 at 10:38:48PM +0530, Biren Pandya wrote:
> The probe error paths and the remove function fail to call
> media_entity_cleanup() upon teardown.
>
> While currently a no-op, calling media_entity_cleanup()
> is an API requirement for entities initialized with
> media_entity_pads_init()
> to prevent memory leaks.

Here and in the other patches, why break the line ?

>
> Add the missing media_entity_cleanup() calls.
>
> Additionally, patch the error path in rzg2l_cru_media_init() to ensure
> that media_device_cleanup(), media_entity_cleanup(), and mutex_destroy()
> are invoked and the error code is correctly returned if
> rzg2l_cru_mc_parse_of_graph() fails, rather than silently returning 0
> and leaving the initialized structures lingering.
>
> Signed-off-by: Biren Pandya <birenpandya@gmail.com>
> ---
>  drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
> index 3c5fbd857371c..77b17bcf7aeb7 100644
> --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
> +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
> @@ -234,6 +234,10 @@ static int rzg2l_cru_media_init(struct rzg2l_cru_dev *cru)
>  		mutex_lock(&cru->mdev_lock);
>  		cru->v4l2_dev.mdev = NULL;
>  		mutex_unlock(&cru->mdev_lock);
> +		media_device_cleanup(mdev);
> +		media_entity_cleanup(&cru->vdev.entity);
> +		mutex_destroy(&cru->mdev_lock);
> +		return ret;

Mmmm, this is growing enough  to qualify for a label I guess...

Unrelated, but I wonder what

        mutex_lock(&cru->mdev_lock);
        cru->v4l2_dev.mdev = NULL;
	mutex_unlock(&cru->mdev_lock);

Protects against...

What do you think of reworking the error path to make it like

	ret = rzg2l_cru_mc_parse_of_graph(cru);
	if (ret)
                goto err_mc_parse;

        return 0;

error_mc_parse:
        media_device_cleanup(mdev);
        cru->v4l2_dev.mdev = NULL;
        media_entity_cleanup(&cru->vdev.entity);
        mutex_destroy(&cru->mdev_lock);
        return ret;

?

In this case, please reword the commit message accordingly, as the
patch won't just be about adding media_entity_cleanup() but rather
about reworking the rzg2l_cru_media_init() error path.

Thanks
  j

>  	}
>
>  	return 0;
> @@ -312,6 +316,7 @@ static void rzg2l_cru_remove(struct platform_device *pdev)
>  	v4l2_async_nf_cleanup(&cru->notifier);
>
>  	rzg2l_cru_video_unregister(cru);
> +	media_entity_cleanup(&cru->vdev.entity);
>  	media_device_cleanup(&cru->mdev);
>  	mutex_destroy(&cru->mdev_lock);
>
> --
> 2.50.1 (Apple Git-155)
>
