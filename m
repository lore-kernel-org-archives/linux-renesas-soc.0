Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDC8440683F;
	Mon,  3 Aug 2026 13:43:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785764608; cv=none; b=UPcSU82Mtb+z/o64F8ibJBeIQLY7+M/kaxlWxzSaj/CcYA86GitTel5YiLLe++rpIqtEtZmtpDUcyE/hokEta44WnLOsnDEJk/ZjnIOya1qYha+pUryhCyLaiuzjMPaAbVJtfoocdqYIVnJFw+PGSqUxwzWBgqL1P/Vg6tYX1UM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785764608; c=relaxed/simple;
	bh=44VryXcwMut+EQEo1vI353ME29GH2UkgG5Pdas4t4w8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nZLNDWFZ3FLqRUEqvPriNbL+HNS9iyPazroV2jRh5RjqwMzbZ7hKnegCZcAZILE/7yRGkip2aymaiMTIpeqbNn9we5IBFjk08unrd2b25umcPC0BVo9cGzd3uOf6b2wV56x+pgPpKyc4omlGKSXN2FOQfe50HkH2wqeXVSb38P8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=cnKxEc3g; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="cnKxEc3g"
Received: from ideasonboard.com (mob-109-113-25-35.net.vodafone.it [109.113.25.35])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7CE3E512;
	Mon,  3 Aug 2026 15:42:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1785764535;
	bh=44VryXcwMut+EQEo1vI353ME29GH2UkgG5Pdas4t4w8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cnKxEc3gZA1irgLK+bcNUMvpATv0N562WOxGOHC/4eMk2SMDQW7SBZLmeE0Bfi4j1
	 337o1Frm9/NT+1byaohJQlipnXY0my50UxdYTrlRO1nfb/mk8MFiYw1mkTvshbtS4D
	 fFcDyc1Kwmi8x37MX59HTut2SbGBH4N153POUJJ0=
Date: Mon, 3 Aug 2026 15:43:21 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Linmao Li <lilinmao@kylinos.cn>
Cc: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] media: rcar-isp: Fix VSPX reference leaks
Message-ID: <anCZxVjPo_zfFcEq@zed>
References: <20260803090553.4082161-1-lilinmao@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260803090553.4082161-1-lilinmao@kylinos.cn>

Hello Linmao Li

On Mon, Aug 03, 2026 at 05:05:52PM +0800, Linmao Li wrote:
> of_parse_phandle() and of_find_device_by_node() both acquire references,
> but the ISPCORE probe never releases them. The device node reference is
> leaked immediately, and the VSPX device reference is leaked on probe
> failures and on driver removal.
>
> Drop the node reference once the platform device has been looked up and
> release the device reference with a devm action.
>
> Fixes: 2151350f60d1 ("media: rcar-isp: Add support for ISPCORE")
> Signed-off-by: Linmao Li <lilinmao@kylinos.cn>
> ---
>  drivers/media/platform/renesas/rcar-isp/core.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>
> diff --git a/drivers/media/platform/renesas/rcar-isp/core.c b/drivers/media/platform/renesas/rcar-isp/core.c
> index f3dc52c136120..8dafffdd8de68 100644
> --- a/drivers/media/platform/renesas/rcar-isp/core.c
> +++ b/drivers/media/platform/renesas/rcar-isp/core.c
> @@ -781,6 +781,13 @@ int risp_core_registered(struct rcar_isp_core *core, struct v4l2_subdev *sd)
>  	return 0;
>  }
>
> +static void risp_core_put_device(void *data)
> +{
> +	struct device *dev = data;
> +
> +	put_device(dev);
> +}
> +
>  static int risp_core_probe_resources(struct rcar_isp_core *core,
>  				     struct platform_device *pdev)
>  {
> @@ -820,9 +827,15 @@ static int risp_core_probe_resources(struct rcar_isp_core *core,
>  		return -ENODEV;
>
>  	vspx = of_find_device_by_node(of_vspx);
> +	of_node_put(of_vspx);

I was about to suggest to declared of_vspx as:

	struct device_node *of_vspx = __free(device_node) = NULL;

But maybe it is not necessary since there's a single call place for
of_node_put().


>  	if (!vspx)
>  		return -ENODEV;
>
> +	ret = devm_add_action_or_reset(&pdev->dev, risp_core_put_device,
> +				       &vspx->dev);
> +	if (ret)
> +		return ret;
> +

For my education: what are the drawbacks of using
devm_add_action_or_reset() instead of releasing core->vspx on probe
failures and _remove() ?

Thanks
  j

>  	/* Attach to VSP-X */
>  	core->vspx.dev = &vspx->dev;
>
>
> base-commit: 31152f5b0f8719f92063b8c6196cd5e34106c73d
> --
> 2.25.1
>
>
