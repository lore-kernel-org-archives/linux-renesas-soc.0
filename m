Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C37BB3E49CB
	for <linux-renesas-soc@vger.kernel.org>; Wed, 23 Sep 2026 21:17:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790198251; cv=none; b=F6rzEQ9BDMz/UItZzkrWgkRqtAHRp7Pj/8xWRayyDhaGMsLTPZr2w/2Ripz5jBYPpwUjCfaCuS2ifg4cv0gXnnTv1Ud8SdU8hi4L3DuhjZyEI8n6fwN3IaG9+xMwLHDUgoVuYaT9Njc5P/SVhlx71V0LYZrfOyk0XNVBalkQqAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790198251; c=relaxed/simple;
	bh=LcXuePjtl2W9YsHMLCydrUdYk69iIHGpmbCxJSwqc4s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NkaSsyNn8ryxrCExp4RiRn3IOI8MOky5s4GvKzTnh6+dBR1OMZaef8m6wWV6xl6uZ9BeuSr9e78lnnAhXrmwggRUoVRNjdsce3QWEcU2VkfmxLiqtqfDoviONZxcf4xRxTfrVFt/vZ1G9zqTGf8rxWvG3Rr63XjgWEgnupMUy/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Snx1vjV4; arc=none smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Snx1vjV4"
Received: by mail-pj2-f43.google.com with SMTP id 98e67ed59e1d1-396ccb1a98dso912632a91.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 23 Sep 2026 14:17:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790198244; x=1790803044; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=VOIjs3wmQAgHgZ83QmrBpj8tiZLeHbDXLko9JL+GaUk=;
        b=Snx1vjV4tsum7GCNnFx0467N4WgLp+Blyeo2jnkB0EgaNRrMzZOC3IP2zmfoWiV2CC
         QlwEZ1Nucwl9RQYCUuivB1nkIVBWw5eyBQwGRZpp6WBsZSnj2fQd0g+j0JBYz4d2HRTK
         /9CANf6mucV8flTdWHcwr0jUjuD4mQaydXn0TqmXNVl6nZY1boebVUIXqXKarEHTtW+H
         Q8yo7kJ6AIZyLo1HfhBFPP1aib1klBmL6BSwmAyFshc52iQwP50l9y9AtEVTg9P4Px2D
         /GO6eiWoRnJ+5flzmdTyHl7fGjiAlpMFo6ONbH9UAKpQJBWkhFnFmeUIct3YXeRTwRzh
         gX5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790198244; x=1790803044;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VOIjs3wmQAgHgZ83QmrBpj8tiZLeHbDXLko9JL+GaUk=;
        b=RhaMFsiNq8/7vcu6PPAU8dLQDdHO2Dv1zFwJ/VA5ekxLOh2jFQwejHvcvhGWzYZUOy
         a67PX3LJkZpjIjyo8g7yX6fXQ4jOngzC0v3DbonpKp9XmfJDflkviTpccmuSs8tKwRgH
         UQ2oypVfDvgKnDMCK7E31XrIA7ge5NssKd6796W9Rlb2Ux18W1s9qxyGTrHpdK+dq2bS
         qxJSQl9xrU+Copi9DR1kTQVV5RQFNCuSBWzOpj1nKJBlVl+gADPPDJUWbq3Jl8aKfWbh
         YHx0IE/VqxORANy/sBayRY+Ix8mBSgfVBq58DIu33r0YHyg36RqnAKgzEzMfLoXPmcns
         zbKA==
X-Forwarded-Encrypted: i=1; AKwUvBwgjD9tX8uiKPpjbeXz37iEwKUz0ZzsS9siJtKGeyk9QCDQ2EyRtQ5JqB0FIThrpHoqVz19tQ7TArKuM0MDmr7d7Q==@vger.kernel.org
X-Gm-Message-State: AFuF++lsNAimshknMtQyrK0Q2THCJrpeZ3fBmnzkr4jlf/P0s3TcdIWG
	+kX8c0hizOnXb7Icfz0S2kdDeC9bGCGFuA1TOq984pHscIK2L8Z+aV/8
X-Gm-Gg: AYBFou0q9J9X2UYlGA8DqjgBfgFewbaWxJ2XXXwNbFzVI+0GII3mPPMqs/YUPzGJsi1
	BKv9ZVKu4DCSAxWkMEfViYx3uql/llhPe6r+w1gwdGqONG6PT/fnykP0onK9gtz6YQ4cN5KbdJl
	JTjs25PdJxjCFT/QNUMuFMbk04yUJK7xXDi3LhLcuCEQMBa/mSAluIvnp4ZY+O09Yd6/B8H7K66
	XxEr4EWHZpZdg3de2jIOvVjPhf3Vl4G+WCtShx4Skc8Dw4/r1GbVo/rythLDyUTBrcEcg/njMTN
	ZnmXaMauo4gYyYaDC0NQy1B8bYULlxOYIi12L5fm0Aj//EGMsPv3fJiC/FgHQzL0sWVdwhUT06p
	cvzY6Jwz19zUlSAGbQiClBDq6g9Kax9pmLug+P0iIe91QEYAtqcVQUvjOm8ZqeyjE/GBxYnynun
	w0S4TJOT0GpMIyZc+WlYdCg0LmGL4zRVx33rEvm8LoB2wNkeFJRXM0/d/MaY95oTdfGls0fwdr7
	0qiVclBfBCr/vUMNpMfMXdJ
X-Received: by 2002:a17:90b:3852:b0:39e:6c6a:656c with SMTP id 98e67ed59e1d1-3a09896a59amr321272a91.47.1790198243551;
        Wed, 23 Sep 2026 14:17:23 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a097663e1dsm884946a91.7.2026.09.23.14.17.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 14:17:22 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 23 Sep 2026 14:17:21 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v6 4/8] watchdog: rzv2h: Propagate WDTDCR access errors
Message-ID: <fb5f25b4-33e4-4cb1-b790-3fd078c61e5d@roeck-us.net>
References: <20260923104054.3324830-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260923104054.3324830-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260923104054.3324830-5-prabhakar.mahadev-lad.rj@bp.renesas.com>

On Wed, Sep 23, 2026 at 11:40:50AM +0100, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> The WDTDCR helpers access the register directly using readl()/writel() and
> therefore cannot report failures to their callers. WDTDCR is located in a
> shared syscon region and will be accessed through regmap in a subsequent
> change, where register accesses can fail.
> 
> Make rzt2h_wdt_wdtdcr_count_start() and rzt2h_wdt_wdtdcr_count_stop()
> return an error so their callers can propagate failures.
> 
> Handle these errors in the watchdog start and stop paths and unwind the
> resources acquired before the WDTDCR access, restoring the reset state.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> v5->v6:
> - No change
> 
> v4->v5:
> - Dropped checking rzt2h_wdt_wdtdcr_count_start() return value in
>   restart path.
> 
> v2->v3:
> - New patch, split from v2 patch #1 to make thing easier to review.
> ---
>  drivers/watchdog/rzv2h_wdt.c | 35 ++++++++++++++++++++++++++---------
>  1 file changed, 26 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/watchdog/rzv2h_wdt.c b/drivers/watchdog/rzv2h_wdt.c
> index 9774fe8e441e..a65e5d6c48ad 100644
> --- a/drivers/watchdog/rzv2h_wdt.c
> +++ b/drivers/watchdog/rzv2h_wdt.c
> @@ -87,18 +87,22 @@ static int rzv2h_wdt_ping(struct watchdog_device *wdev)
>  	return 0;
>  }
>  
> -static void rzt2h_wdt_wdtdcr_count_stop(struct rzv2h_wdt_priv *priv)
> +static int rzt2h_wdt_wdtdcr_count_stop(struct rzv2h_wdt_priv *priv)
>  {
>  	u32 reg = readl(priv->wdtdcr + WDTDCR);
>  
>  	writel(reg | WDTDCR_WDTSTOPCTRL, priv->wdtdcr + WDTDCR);
> +
> +	return 0;
>  }
>  
> -static void rzt2h_wdt_wdtdcr_count_start(struct rzv2h_wdt_priv *priv)
> +static int rzt2h_wdt_wdtdcr_count_start(struct rzv2h_wdt_priv *priv)
>  {
>  	u32 reg = readl(priv->wdtdcr + WDTDCR);
>  
>  	writel(reg & ~WDTDCR_WDTSTOPCTRL, priv->wdtdcr + WDTDCR);
> +
> +	return 0;
>  }
>  
>  static void rzv2h_wdt_setup(struct watchdog_device *wdev, u16 wdtcr)
> @@ -148,8 +152,14 @@ static int rzv2h_wdt_start(struct watchdog_device *wdev)
>  	rzv2h_wdt_setup(wdev, of_data->cks_max | WDTCR_RPSS_100 |
>  			WDTCR_RPES_0 | of_data->tops);
>  
> -	if (priv->of_data->wdtdcr)
> -		rzt2h_wdt_wdtdcr_count_start(priv);
> +	if (priv->of_data->wdtdcr) {
> +		ret = rzt2h_wdt_wdtdcr_count_start(priv);
> +		if (ret) {
> +			reset_control_assert(priv->rstc);

It seems to me this does way more than handling the error:
it puts the module into reset and calls pm_runtime_put()
on the parent. This is a substantial functional change
that is not explained.

> +			pm_runtime_put(wdev->parent);
> +			return ret;
> +		}
> +	}
>  
>  	/*
>  	 * Down counting starts after writing the sequence 00h -> FFh to the
> @@ -169,8 +179,13 @@ static int rzv2h_wdt_stop(struct watchdog_device *wdev)
>  	if (ret)
>  		return ret;
>  
> -	if (priv->of_data->wdtdcr)
> -		rzt2h_wdt_wdtdcr_count_stop(priv);
> +	if (priv->of_data->wdtdcr) {
> +		ret = rzt2h_wdt_wdtdcr_count_stop(priv);
> +		if (ret) {
> +			reset_control_deassert(priv->rstc);

Same here, and the logic behind taking the module out of reset
in the stop function and putting it into reset in the start function
isn't obvious to me.

Frankly, I think it would be much better and risk fewer problems
to just ignore the theoretic errors from the regmap functions.

> +			return ret;
> +		}
> +	}
>  
>  	pm_runtime_put_sync(wdev->parent);
>  
> @@ -219,8 +234,10 @@ static int rzv2h_wdt_restart(struct watchdog_device *wdev,
>  	rzv2h_wdt_setup(wdev, priv->of_data->cks_min | WDTCR_RPSS_25 |
>  			WDTCR_RPES_75 | WDTCR_TOPS_1024);
>  
> -	if (priv->of_data->wdtdcr)
> +	if (priv->of_data->wdtdcr) {
> +		/* best effort, ignore ret */
>  		rzt2h_wdt_wdtdcr_count_start(priv);
> +	}
>  
>  	rzv2h_wdt_ping(wdev);
>  
> @@ -251,11 +268,11 @@ static int rzt2h_wdt_wdtdcr_init(struct platform_device *pdev,
>  	if (ret)
>  		return ret;
>  
> -	rzt2h_wdt_wdtdcr_count_stop(priv);
> +	ret = rzt2h_wdt_wdtdcr_count_stop(priv);
>  
>  	pm_runtime_put_sync(&pdev->dev);
>  
> -	return 0;
> +	return ret;
>  }
>  
>  static int rzv2h_wdt_probe(struct platform_device *pdev)
> -- 
> 2.55.0
> 
