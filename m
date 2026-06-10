Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3600B43C063;
	Wed, 10 Jun 2026 15:49:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781106602; cv=none; b=IbO9T2Li3RycG1AvFeDV7KI+/UTTDAtbEORkurec7hpGQq8hTL+MqDnSDawTrDxMHwVOuwdiAehCbYIC6Q9ddwZOQbntvMcq7wozgk0qRgkEDLwCxoHZCe23HOkmY2SisHznTRIoObYbQav1m84Q2WfmTqamlR1RtzqQDtDrlRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781106602; c=relaxed/simple;
	bh=1HLHVotbcuXMCV9qhlxe/fp4cX8c46z4aJrEatBj7JM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D+0er24nIJCa1kWMPgFQdV0ZfgxAMOTDDmnlB0p8GoMWXEigRkfjr1nL+CqBXXP/REx5VlVNG96U3AhgNSFVftMbfG/qVqYNKlQIFGyZBGtQdte5WrIlBkEKqwHdlawI3mFfO95KI6lXFPJ3ZSyaXTMo9oIHXXQ/JRBukVZcDOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=MenOPSRW; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="MenOPSRW"
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3DB3B6DF;
	Wed, 10 Jun 2026 17:49:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1781106567;
	bh=1HLHVotbcuXMCV9qhlxe/fp4cX8c46z4aJrEatBj7JM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MenOPSRWFuX3Je9PwZ1VrE10Dt5Hw6SyfZgi70H7epYacaBQ20LgOOo3UaHpjB+x7
	 WG+ZiCK1Twbfn+Dzekt21xjOXo9dsyLkKxON01o9ChhYWv1Vdl/FybtVL8BIgVGUSM
	 5afqTePVl4BJ7weA/XYA0dNzMxJ1g3V7csbjRsUo=
Date: Wed, 10 Jun 2026 18:49:54 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH 3/3] media: renesas: vsp1: Make reset control optional to
 support platforms without a reset line
Message-ID: <20260610154954.GC1335994@killaraus.ideasonboard.com>
References: <20260430100929.1088281-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260430100929.1088281-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260430100929.1088281-4-prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi Prabhakar,

Thank you for the patch.

On Thu, Apr 30, 2026 at 11:09:29AM +0100, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Switch the VSP1 driver to use devm_reset_control_get_optional_shared()
> when requesting its reset control. Some newer Renesas SoCs integrating
> VSP1 such as RZ/T2H do not provide a reset line for the VSP IP block.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
>  drivers/media/platform/renesas/vsp1/vsp1_drv.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/renesas/vsp1/vsp1_drv.c b/drivers/media/platform/renesas/vsp1/vsp1_drv.c
> index 627b5046fa80..605fac57bd93 100644
> --- a/drivers/media/platform/renesas/vsp1/vsp1_drv.c
> +++ b/drivers/media/platform/renesas/vsp1/vsp1_drv.c
> @@ -947,7 +947,7 @@ static int vsp1_probe(struct platform_device *pdev)
>  	if (irq < 0)
>  		return irq;
>  
> -	vsp1->rstc = devm_reset_control_get_shared(&pdev->dev, NULL);
> +	vsp1->rstc = devm_reset_control_get_optional_shared(&pdev->dev, NULL);
>  	if (IS_ERR(vsp1->rstc))
>  		return dev_err_probe(&pdev->dev, PTR_ERR(vsp1->rstc),
>  				     "failed to get reset control\n");

-- 
Regards,

Laurent Pinchart
