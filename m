Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C98633DFC82;
	Thu,  6 Aug 2026 09:33:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786008837; cv=none; b=mLEV30gZnydGAEMXcoFiB+tP1ROhdGI/GLPC6xMgcxYq2rx+J3O8kiMlXSsz3QOXY/2jD65vlIMeKhSjL+1CiGs/Mlm9EPbcVq+0+GLfEB2gEF8vR/mBbRfTaMmHrex+SpqPdwMJDk6k9tnWW7dfXprE0YkIqd9/6kJCPib7y6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786008837; c=relaxed/simple;
	bh=fJMCrg817kjSAHjrwbAsfEhl9jPo3HJLs6nABG1sI9c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z8QEBJAXpayOlN8vPyTsSCDZS3kPhMmI9zxBNv3RTmkOfPPyZG1Q+D/swJL6M2acINR2iGR+C6cLwmjalRYqgvXXxUUgkawI3HQVsq4QzrkldK63vRRpeYLJpvnjkXQIyvLm96aqke4+A9Mgey76j2J1Iws2CL5RKItU5npkIkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=JkcUA5//; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="JkcUA5//"
Received: from ideasonboard.com (unknown [IPv6:2001:b07:6462:5de2:520d:d7a3:63ca:99e8])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 454B91A57;
	Thu,  6 Aug 2026 11:32:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1786008762;
	bh=fJMCrg817kjSAHjrwbAsfEhl9jPo3HJLs6nABG1sI9c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JkcUA5//X0ckgRvL53infs9lKIzzAdpbE94VFG7cCALzQWADbfIVvseoZwR28ZYlJ
	 EfjsmgY0XUR7Hgiwu3rmrqVMVcpyDJZDgKbx5kQuKHao/qD02hRwT1d8jhSm8YfAxl
	 IidZ0jKFjzb+2V5sW+DIbAK8Q2GMsDWRGXfL45oc=
Date: Thu, 6 Aug 2026 11:33:50 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Linmao Li <lilinmao@kylinos.cn>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] media: rcar-isp: Fix VSPX reference leaks
Message-ID: <anRUpYHq3uEl462H@zed>
References: <20260804102431.273385-1-lilinmao@kylinos.cn>
 <20260804102431.273385-3-lilinmao@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260804102431.273385-3-lilinmao@kylinos.cn>

Hello Linmao Li

On Tue, Aug 04, 2026 at 06:24:31PM +0800, Linmao Li wrote:
> of_parse_phandle() and of_find_device_by_node() both acquire references,
> but the ISPCORE probe never releases them. The device node reference is
> leaked immediately, and the VSPX device reference is leaked on probe
> failures and on driver removal.
>
> Drop the node reference once the platform device has been looked up, and
> release the device reference on the probe error paths and in the remove
> path.
>
> Signed-off-by: Linmao Li <lilinmao@kylinos.cn>

Thanks, looks good to me!

Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

Sakari, Hans, should we collect these two patches as fixes for 7.3 ?


> ---
>  drivers/media/platform/renesas/rcar-isp/core.c | 17 +++++++++++++----
>  1 file changed, 13 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/media/platform/renesas/rcar-isp/core.c b/drivers/media/platform/renesas/rcar-isp/core.c
> index 181446ae53779..b5861d0cd0e8b 100644
> --- a/drivers/media/platform/renesas/rcar-isp/core.c
> +++ b/drivers/media/platform/renesas/rcar-isp/core.c
> @@ -820,6 +820,7 @@ static int risp_core_probe_resources(struct rcar_isp_core *core,
>  		return -ENODEV;
>
>  	vspx = of_find_device_by_node(of_vspx);
> +	of_node_put(of_vspx);
>  	if (!vspx)
>  		return -ENODEV;
>
> @@ -828,7 +829,7 @@ static int risp_core_probe_resources(struct rcar_isp_core *core,
>
>  	ret = vsp1_isp_init(&vspx->dev);
>  	if (ret < 0)
> -		return ret;
> +		goto err_put_vspx;
>
>  	/* Attach to the RPP library
>  	 *
> @@ -839,7 +840,7 @@ static int risp_core_probe_resources(struct rcar_isp_core *core,
>  	 */
>  	ret = clk_prepare_enable(core->clk);
>  	if (ret)
> -		return ret;
> +		goto err_put_vspx;
>
>  	usleep_range(2000, 4000);
>
> @@ -847,10 +848,16 @@ static int risp_core_probe_resources(struct rcar_isp_core *core,
>
>  	clk_disable_unprepare(core->clk);
>
> -	if (!core->rpp)
> -		return -ENODEV;
> +	if (!core->rpp) {
> +		ret = -ENODEV;
> +		goto err_put_vspx;
> +	}
>
>  	return 0;
> +
> +err_put_vspx:
> +	put_device(&vspx->dev);
> +	return ret;
>  }
>
>  int risp_core_probe(struct rcar_isp_core *core, struct platform_device *pdev,
> @@ -886,6 +893,7 @@ int risp_core_probe(struct rcar_isp_core *core, struct platform_device *pdev,
>  	v4l2_device_unregister(&core->v4l2_dev);
>  err_destroy_rpp:
>  	rppx1_destroy(core->rpp);
> +	put_device(core->vspx.dev);
>  	return ret;
>  }
>
> @@ -904,4 +912,5 @@ void risp_core_remove(struct rcar_isp_core *core)
>
>  	mutex_destroy(&core->io_lock);
>  	rppx1_destroy(core->rpp);
> +	put_device(core->vspx.dev);
>  }
> --
> 2.25.1
>
>
