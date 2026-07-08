Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94F212147F9;
	Wed,  8 Jul 2026 16:01:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783526493; cv=none; b=SDNBZbI5ePYn/75YbNy7o8W5vrhoDEN8A46DyFOwcMR2ePXhG7obvo62eMtzu9JIQDk8AFFooQE4P52IDVXGrjoZ71l6cn02TxFyKjiqtauR2h5X1jwd7FEhpWH09W5KrIWPe4iHF83CgL3YwhmJJRjlxvVkDDSTQtzN9CMWTiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783526493; c=relaxed/simple;
	bh=6mzUjpia4TAQCxJDO9kXTYk0qPYcldKr7encBPzwruE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OxegMz7XydXps6w6hBYMbsYdOIDQ9EUu5frwwsUY2vlCiJeAui2Vut0GBT4QAZMCxy6dbjvzHx1NqAJ00kvLD/vNOkQWe6LNyxRKpjOFqtu+CGGGEouJEmuKfng12uWvAPm7JYwWytvcjpXJlrBwJJTmMdGo4n9fPyotzbgy6M0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=ToGulIcT; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ToGulIcT"
Received: from ideasonboard.com (93-46-82-201.ip106.fastwebnet.it [93.46.82.201])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id DAD7BEAA;
	Wed,  8 Jul 2026 18:00:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1783526440;
	bh=6mzUjpia4TAQCxJDO9kXTYk0qPYcldKr7encBPzwruE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ToGulIcTyEciK+hcs1rfInAX4miw+MhSbLSQsJWeSat7jWZyiGPhN79OSV47uTKio
	 jbj9ZuObrqVmfW+MnnvGEhQfJWovG8JDBFK0gFHXbSnlfL6wSzDiIizKVT6q8QvEcK
	 rPALV0ZKd3wAH+N3xt3IDhf83DxUZVizA/6WMX6s=
Date: Wed, 8 Jul 2026 18:01:27 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Biren Pandya <birenpandya@gmail.com>
Cc: linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, niklas.soderlund@ragnatech.se, mchehab@kernel.org, 
	geert+renesas@glider.be, magnus.damm@gmail.com, laurent.pinchart@ideasonboard.com, 
	jacopo.mondi@ideasonboard.com
Subject: Re: [PATCH v3 3/4] media: renesas: rcar-core: Add missing
 media_entity_cleanup()
Message-ID: <ak5z6XBqAuJumxek@zed>
References: <20260704174638.66302-6-birenpandya@gmail.com>
 <20260704174638.66302-9-birenpandya@gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260704174638.66302-9-birenpandya@gmail.com>

Hi Biren

On Sat, Jul 04, 2026 at 11:16:42PM +0530, Biren Pandya wrote:
> The probe error path and the remove function fail to call
> media_entity_cleanup() upon teardown.
>
> While currently a no-op in most cases, calling media_entity_cleanup()
> is an API requirement for entities initialized with media_entity_pads_init()
> to prevent memory leaks.
>
> Add the missing media_entity_cleanup() calls. Furthermore, introduce a
> dedicated err_entity label in the probe error path to ensure the cleanup
> is only invoked if media_entity_pads_init() has successfully completed.

Same comments as per the other patches

Reviewed-by: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>

> Signed-off-by: Biren Pandya <birenpandya@gmail.com>
> ---
>  drivers/media/platform/renesas/rcar-vin/rcar-core.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-core.c b/drivers/media/platform/renesas/rcar-vin/rcar-core.c
> index c8d564aa1eba..5bae8eb0ee19 100644
> --- a/drivers/media/platform/renesas/rcar-vin/rcar-core.c
> +++ b/drivers/media/platform/renesas/rcar-vin/rcar-core.c
> @@ -1211,7 +1211,7 @@ static int rcar_vin_probe(struct platform_device *pdev)
>
>  	ret = rvin_create_controls(vin);
>  	if (ret < 0)
> -		goto err_id;
> +		goto err_entity;
>
>  	switch (vin->info->model) {
>  	case RCAR_GEN3:
> @@ -1246,6 +1246,8 @@ static int rcar_vin_probe(struct platform_device *pdev)
>
>  err_ctrl:
>  	rvin_free_controls(vin);
> +err_entity:
> +	media_entity_cleanup(&vin->vdev.entity);
>  err_id:
>  	rvin_id_put(vin);
>  err_dma:
> @@ -1270,6 +1272,7 @@ static void rcar_vin_remove(struct platform_device *pdev)
>  	rvin_group_put(vin);
>
>  	rvin_free_controls(vin);
> +	media_entity_cleanup(&vin->vdev.entity);
>
>  	rvin_id_put(vin);
>
> --
> 2.50.1 (Apple Git-155)
>
>
