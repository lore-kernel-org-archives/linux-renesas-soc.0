Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A42BB672;
	Mon,  3 Aug 2026 14:17:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785766640; cv=none; b=tKKem1Ed9X392GI61ARTDaTq4+K7FZRT8ds+EaB7foJWCyAReMgogx5xW9MFqARhTOmWKGr+YOkYW/4TULhw7erma9MjQ4P4R3K6OIzhudZ4k7PAfMPn8WXkiB8sx8ow1s8hNtkSJpwS6nELZjfDPxWikJiItBTqPT5qwcLlXkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785766640; c=relaxed/simple;
	bh=0S4Gl8Ud6+KHhpm/4qD/MH7pGevAXVn0E/MpV7+4WZQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UBkwgLdVKa+o0GxzM3grIAUroROBDn+BsjkfykRbjiIQvDlO8+vJ9yxxEBpkTOwkZZqLsoaTohKuCyFouqOA1e8DFMASBfbSUSd+mryYAwlpMNZQatBHabtzccrBFEBinHeTGhvYcJwN9Utxv1vkaHM71D+Crz3DbspeARphZg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Vse6pVA2; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Vse6pVA2"
Received: from ideasonboard.com (mob-109-113-25-35.net.vodafone.it [109.113.25.35])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 63C705B3;
	Mon,  3 Aug 2026 16:16:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1785766567;
	bh=0S4Gl8Ud6+KHhpm/4qD/MH7pGevAXVn0E/MpV7+4WZQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Vse6pVA2rSebrYUBpQqCeSgiPHf4exEx+eI31v1YeQypSv2ovkA0sOUThHuk0oDjl
	 wteDJ6iWJFPzDHI86OqBQKlDzJGMNqKGXYsLcUqeLeVUItFLIcfcOP4O3QrO+O6k/Y
	 GWi4tlw7fpItsxsHIJOnAaw1kK/1N5QVwmhxrafQ=
Date: Mon, 3 Aug 2026 16:17:12 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Linmao Li <lilinmao@kylinos.cn>
Cc: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] media: rcar-isp: Release ISPCORE resources
Message-ID: <anChUtV090GkJ6VI@zed>
References: <20260803090553.4082161-1-lilinmao@kylinos.cn>
 <20260803090553.4082161-2-lilinmao@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260803090553.4082161-2-lilinmao@kylinos.cn>

Hi Linmao Li

On Mon, Aug 03, 2026 at 05:05:53PM +0800, Linmao Li wrote:
> v4l2_device_register() takes a reference to the parent device, but the
> ISPCORE remove path never calls v4l2_device_unregister(). The reference
> is therefore leaked whenever an ISPCORE is removed.
>
> Probe failures after rppx1_create() also return without destroying the
> RPPX1 object.
>
> Unregister the V4L2 device and destroy the RPPX1 object on the
> corresponding error paths, and unregister the V4L2 device during removal.
> v4l2_device_unregister() also unregisters all attached subdevices, so it
> replaces the narrower subdevice-only cleanup.
>
> Fixes: 2151350f60d1 ("media: rcar-isp: Add support for ISPCORE")

The driver has not landed in any Linux release, but it has just been
collected for the next merge window.

If your patches get collected as part of the same cycle, I don't think
there's any need for a Fixes tag ?

> Signed-off-by: Linmao Li <lilinmao@kylinos.cn>
> ---
>  drivers/media/platform/renesas/rcar-isp/core.c | 12 +++++++++---
>  1 file changed, 9 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/media/platform/renesas/rcar-isp/core.c b/drivers/media/platform/renesas/rcar-isp/core.c
> index 8dafffdd8de68..923970fd7841f 100644
> --- a/drivers/media/platform/renesas/rcar-isp/core.c
> +++ b/drivers/media/platform/renesas/rcar-isp/core.c
> @@ -883,17 +883,23 @@ int risp_core_probe(struct rcar_isp_core *core, struct platform_device *pdev,
>
>  	ret = v4l2_device_register(core->dev, &core->v4l2_dev);
>  	if (ret)
> -		return ret;
> +		goto err_destroy_rpp;
>
>  	ret = risp_core_create_subdev(core);
>  	if (ret)
> -		return ret;
> +		goto err_unregister_v4l2;
>
>  	mutex_init(&core->io_lock);
>  	spin_lock_init(&core->lock);
>  	INIT_LIST_HEAD(&core->risp_jobs);
>
>  	return 0;
> +
> +err_unregister_v4l2:
> +	v4l2_device_unregister(&core->v4l2_dev);
> +err_destroy_rpp:
> +	rppx1_destroy(core->rpp);
> +	return ret;
>  }
>
>  void risp_core_remove(struct rcar_isp_core *core)
> @@ -907,7 +913,7 @@ void risp_core_remove(struct rcar_isp_core *core)
>  	for (unsigned int i = 0; i < RISP_CORE_NUM_PADS; i++)
>  		risp_core_io_destroy(&core->io[i]);
>
> -	v4l2_device_unregister_subdev(&core->subdev);
> +	v4l2_device_unregister(&core->v4l2_dev);

As v4l2_device_unregister() unregister all subdevs of core->v4l2_dev,
this seems correct to me.

R-Car ISP is a little complicated, in the sense that the core->subdev
gets registered by risp_cs_registered() which is the handler of the
channel selector subdev .registered() callback, and to properly
balance we should unregister it in the (not implemented)
.unregistered() handler.

However, as this is called as part of the driver's remove handler, and
that's what we have at the moment, I guess this is ok

Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

>
>  	mutex_destroy(&core->io_lock);
>  	rppx1_destroy(core->rpp);
> --
> 2.25.1
>
>
