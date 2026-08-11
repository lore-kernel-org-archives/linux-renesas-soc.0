Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4443F2D97A6;
	Tue, 11 Aug 2026 06:52:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786431135; cv=none; b=YRlGnttX2w3kwgT9gRAcTD6NdIsnM4BjpY6iR895BY9gOc53eeP58aUebcEQzfSeH0adqfO+iA5qqPOSyPQcoQigMMfb+SMnI02xWLxj0kGSZxZUjg0wZr8qJFikGBG4ZIACRNHLgDyY7AL4lIcEV/+OkIEqpXjgnWdy1/U6ePY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786431135; c=relaxed/simple;
	bh=l/M9WNRO+6UqXt01q167qJTaKmCZvrlHEoLbila+tf4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=axkY/IhxLNZ2E7mjfH9GKv54Dwhx7pq9rr9qkeqlvmyF75uAKazzHuVxaZ0V7ep85Q6pgv85Gihel3PWCZI7Vz7055w3t29t9mcnvO5ifUgH54q0XqNgwgyVpAAU0ufxwsiFsN71unB+qUpnjZptfD/U5uPPMrYz3y0VQO+fgRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q8TCDHNl; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q8TCDHNl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9B351F00A3A;
	Tue, 11 Aug 2026 06:52:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786431133;
	bh=rnx4aKdLQV+Si2WpPSB6tZnUxEgGYBNSzmkTkfXY3Hg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Q8TCDHNlY8kP4fmxLpqu9OlX8aQGLW2qVQEXyaGbjwnAr6F0SkpfpqjEs4RM4UQSv
	 YGvJ/STCHSMMzo6EQ/wJ+PgL9/x51qU9kGfSwZUOokPvXi4q8+RlhDOky00s9+EDzb
	 Ed/rYNYxDJzlQbh6OuILFpF/YC1a6D9+ECGD2G6DWy6RqQz1Ln4xrk9AbDP9FUhOQR
	 JReAOe2WJZQ+hjCCBrwBR2BAd3VVFG0FSMf2AgSP+AIdPkmKdsRExuxSeOCntdJck+
	 Jvvf02xED+ELrMV4MVkxTHPZVGlC6BYs9NToUk4YKzxbG/e/K1wvhrs6dIlkyksJ7U
	 oSrvN1vS663Cg==
Date: Tue, 11 Aug 2026 08:52:09 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Biju <biju.das.au@gmail.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Mark Brown <broonie@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v6 04/10] reset: rzg2l-usbphy-ctrl: Add RZ/G3L support
Message-ID: <20260811-cuddly-hypnotic-skylark-17daea@quoll>
References: <20260806102236.149159-1-biju.das.jz@bp.renesas.com>
 <20260806102236.149159-5-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260806102236.149159-5-biju.das.jz@bp.renesas.com>

On Thu, Aug 06, 2026 at 11:22:23AM +0100, Biju wrote:
>  	struct reg_field field;
>  	struct regmap *regmap;
> @@ -183,7 +200,43 @@ static int rzg2l_usbphy_ctrl_pwrrdy_init(struct device *dev,
>  	if (ret)
>  		return ret;
>  
> -	return devm_add_action_or_reset(dev, rzg2l_usbphy_ctrl_pwrrdy_off, priv->pwrrdy);
> +	return devm_add_action_or_reset(dev, rzg2l_usbphy_ctrl_pwrrdy_off, priv);
> +}
> +
> +static int rzg2l_usbphy_ctrl_pwrrdy_powerseq_init(struct device *dev,
> +						  struct rzg2l_usbphy_ctrl_priv *priv)
> +{
> +	int ret;
> +
> +	priv->pwrseq = devm_pwrseq_get(dev, "usb-pwrrdy");

`git grep usb-pwrrdy` gave me zero results, so how is this supposed to
work if the name does not exist?

Best regards,
Krzysztof

