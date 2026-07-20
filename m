Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50B77431A55
	for <linux-renesas-soc@vger.kernel.org>; Mon, 20 Jul 2026 14:56:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784559395; cv=none; b=BZ49XDIKNuu5SFGSB8u8ItIpvSJeExm5wGmiStp21wuGvTe8UH0A7Ad+Ce9+3BAClkk9sG2WtA/emefuhanEZzB+48os1Ze+Jn1uGmgxlJKav0FfJliw+qT54KOzY4t8b1iBzXSQfYVWNqvrbGdDZFBcD7P+U7ZcUtp4gAtcfc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784559395; c=relaxed/simple;
	bh=CzUkV1yWdw/cErC5nc9nd/oqrh/M2z9aTs8L/aar04M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lHlQQ7qlEnqe3CqEGqT08NlEA+AgmccQFX9s88zqV4Kzv7aUz5VnSGEdBbNfHg+tAEI4rj1pE3+db9o19VUwry6isRdK4/WSGoz+DQLUom6aKwNNIgZW+W+t8Ze0wwADngyib3TVp3pb7vdebcGilgqscHBDM8CqwIdDBT1DaEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iu9IRVFm; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iu9IRVFm"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-848882fdb18so7445627b3a.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 20 Jul 2026 07:56:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784559393; x=1785164193; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=R1PkSh+baSnNLGTsjAnxNBp1u03aHJ383HYMyDZwWTI=;
        b=iu9IRVFmDdaZl4J1mXlvqGTfm1PyCggVqottxL2ccZu2IHYt/XMh6Szp2VEGsQhsbc
         nSj8vfTe2aSX0Zso3YNeEZqyuWUkEmD7f7bJ3OHPPPm7HIBPnqZSPyozU/k04rPU/4QN
         2eYbcSUP+4WKjNynyJjjX3Hczi1jFmFDZ+wOJykVDC2W0G2GMblHDvvgT/SQ9c0IGJNV
         jcyGD6ye+yvYGh76PcOYjrqMaB4RVRwpC1TKY47FGQH+50/6ydFJH0EHkksALWCfFOmb
         5q1GMLxdr8NIzDHf62QwvdEVqXCyjxCMparPOJ6oX2D/KARHQBCZonuwdoCSFx0BZyDp
         lz8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784559393; x=1785164193;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=R1PkSh+baSnNLGTsjAnxNBp1u03aHJ383HYMyDZwWTI=;
        b=IAjO+u/8AnFSJG0dV3POMvi6s4IZUwnRABu85n7wbFmMyx5NRfrAom5m0jmYx6nqHM
         vWusVf2QqOl8OWjj1eBMyjk/VMIep/QRzhVl1yIih+lRaYcu3tgptdFRmZQ32NzBYN19
         Si8yeWlZYlFqWfeowo5l3qkx/aOqWepToU6gbhc5h00NPGek57aMC/2h9S0SQglTgFZW
         QnXlMHi95+NEQkd9ESZ81v2UKqA0vK7dKfHBSuxJk760D6PfEYqPnaat6Whaezac70dy
         myvzONUmHOIl7BzjM4NZHFZ+TfLila1Na922ZzHzI3K3qptXlS4Ym9NrNZ6TQv12/RsY
         TBBg==
X-Forwarded-Encrypted: i=1; AHgh+RpFhy0H6hqTdru+dzfmnS2WqQhsteeCfVjLs5Jsha7p0BK7Bwgks18e/Y/Ha907fYTdy2OKBf7U4OhmkP9wCh+Z5g==@vger.kernel.org
X-Gm-Message-State: AOJu0YxrTW4mS6AvkklOFh0yjwoeTHKlx2/x34JrUwIt2HItTVWaaMRP
	TR2CSsDmOk0nd5vIuBj/r4jo0QzRdvz8FHozriLP1XSLyMNfoVQFXLFW
X-Gm-Gg: AfdE7cm1ad3LGRzXvEkkt5st9eF97gfjiKkqWMXxprglBAWh+84D+YVXBmF8eP/MUHX
	jYz74iiJBl+vH7NqvOCdlrYCuUcWaX1Dy8e/QWEXMGOVywjFp4MQ5m28vndMvLpML0wQktAi7gj
	BB9gwKRtN8Ldjx6JVf2/wIKN8R3hql8J/sUxjo5/wnuhUIShV5lTt+Zp80X7oXFIwRs0o0xod+i
	V3zZw6zPEYaU3leetmI0+AbOCcbLjE2vZKn1J4LVp0f1k619KrML1ji1bH+Jp0X6OwyeS98749d
	tuxvzIRfuUMV7LxhrVtYTBZIz/1C1CWnuKPaHWmqeqslM01x/FV+EMDucrJRX/rJGOy+63Zbjhy
	cPZR4jJYkkNQQ6EIadljFODmSqmWXgMeM7wemJCQwqiVNjcdgPUdySbtj8Mm21QTBfBpfrxZ1ze
	mBThTu0jyfEAD/IZE=
X-Received: by 2002:a05:6a20:cc0b:b0:3c3:9a7f:7307 with SMTP id adf61e73a8af0-3c3ad7ec489mr16674248637.24.1784559392522;
        Mon, 20 Jul 2026 07:56:32 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3142a02b7f2sm36893149eec.13.2026.07.20.07.56.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 07:56:31 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 20 Jul 2026 07:56:29 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-watchdog@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v2 1/2] watchdog: rzv2h: Convert WDTDCR handling to regmap
Message-ID: <0eb41a71-a013-4686-bd9a-4f4df5acaa3a@roeck-us.net>
References: <20260715133922.2129340-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260715133922.2129340-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260715133922.2129340-2-prabhakar.mahadev-lad.rj@bp.renesas.com>

On Wed, Jul 15, 2026 at 02:39:21PM +0100, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Convert the WDTDCR register access from raw readl/writel variants over to
> the regmap framework using devm_regmap_init_mmio().
> 
> This conversion serves as a preparatory refactoring step. It allows the
> driver to subsequently support syscon-based system controllers natively
> by passing along alternative regmap handles without forcing messy
> architectural branching at runtime.
> 

This patch does a bit more than just converting the driver to use regmap.
It also modifies both reset control handling and runtime pm handling in
the start, stop, and restart function error handlers. Those changes need
to be implemented in separate patches and explained. When doing that,
please address Sashiko's feedback or explain why the issues it reported
are of no concern.

Thanks,
Guenter

> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> v1->v2:
> - Switched to use regmap_set/clear_bits()
> ---
>  drivers/watchdog/rzv2h_wdt.c | 75 ++++++++++++++++++++++++++----------
>  1 file changed, 54 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/watchdog/rzv2h_wdt.c b/drivers/watchdog/rzv2h_wdt.c
> index 3b6abb66a1da..0f951219caf8 100644
> --- a/drivers/watchdog/rzv2h_wdt.c
> +++ b/drivers/watchdog/rzv2h_wdt.c
> @@ -12,6 +12,7 @@
>  #include <linux/of.h>
>  #include <linux/platform_device.h>
>  #include <linux/pm_runtime.h>
> +#include <linux/regmap.h>
>  #include <linux/reset.h>
>  #include <linux/units.h>
>  #include <linux/watchdog.h>
> @@ -67,7 +68,7 @@ struct rzv2h_of_data {
>  
>  struct rzv2h_wdt_priv {
>  	void __iomem *base;
> -	void __iomem *wdtdcr;
> +	struct regmap *wdtdcr_regmap;
>  	struct clk *pclk;
>  	struct clk *oscclk;
>  	struct reset_control *rstc;
> @@ -89,18 +90,14 @@ static int rzv2h_wdt_ping(struct watchdog_device *wdev)
>  	return 0;
>  }
>  
> -static void rzt2h_wdt_wdtdcr_count_stop(struct rzv2h_wdt_priv *priv)
> +static int rzt2h_wdt_wdtdcr_count_stop(struct rzv2h_wdt_priv *priv)
>  {
> -	u32 reg = readl(priv->wdtdcr + WDTDCR);
> -
> -	writel(reg | WDTDCR_WDTSTOPCTRL, priv->wdtdcr + WDTDCR);
> +	return regmap_set_bits(priv->wdtdcr_regmap, WDTDCR, WDTDCR_WDTSTOPCTRL);
>  }
>  
> -static void rzt2h_wdt_wdtdcr_count_start(struct rzv2h_wdt_priv *priv)
> +static int rzt2h_wdt_wdtdcr_count_start(struct rzv2h_wdt_priv *priv)
>  {
> -	u32 reg = readl(priv->wdtdcr + WDTDCR);
> -
> -	writel(reg & ~WDTDCR_WDTSTOPCTRL, priv->wdtdcr + WDTDCR);
> +	return regmap_clear_bits(priv->wdtdcr_regmap, WDTDCR, WDTDCR_WDTSTOPCTRL);
>  }
>  
>  static void rzv2h_wdt_setup(struct watchdog_device *wdev, u16 wdtcr)
> @@ -150,8 +147,14 @@ static int rzv2h_wdt_start(struct watchdog_device *wdev)
>  	rzv2h_wdt_setup(wdev, of_data->cks_max | WDTCR_RPSS_100 |
>  			WDTCR_RPES_0 | of_data->tops);
>  
> -	if (priv->of_data->wdtdcr)
> -		rzt2h_wdt_wdtdcr_count_start(priv);
> +	if (priv->of_data->wdtdcr) {
> +		ret = rzt2h_wdt_wdtdcr_count_start(priv);
> +		if (ret) {
> +			reset_control_assert(priv->rstc);
> +			pm_runtime_put(wdev->parent);
> +			return ret;
> +		}
> +	}
>  
>  	/*
>  	 * Down counting starts after writing the sequence 00h -> FFh to the
> @@ -171,8 +174,13 @@ static int rzv2h_wdt_stop(struct watchdog_device *wdev)
>  	if (ret)
>  		return ret;
>  
> -	if (priv->of_data->wdtdcr)
> -		rzt2h_wdt_wdtdcr_count_stop(priv);
> +	if (priv->of_data->wdtdcr) {
> +		ret = rzt2h_wdt_wdtdcr_count_stop(priv);
> +		if (ret) {
> +			reset_control_deassert(priv->rstc);
> +			return ret;
> +		}
> +	}
>  
>  	pm_runtime_put(wdev->parent);
>  
> @@ -188,9 +196,10 @@ static int rzv2h_wdt_restart(struct watchdog_device *wdev,
>  			     unsigned long action, void *data)
>  {
>  	struct rzv2h_wdt_priv *priv = watchdog_get_drvdata(wdev);
> +	bool active = watchdog_active(wdev);
>  	int ret;
>  
> -	if (!watchdog_active(wdev)) {
> +	if (!active) {
>  		ret = clk_enable(priv->pclk);
>  		if (ret)
>  			return ret;
> @@ -234,8 +243,17 @@ static int rzv2h_wdt_restart(struct watchdog_device *wdev,
>  	rzv2h_wdt_setup(wdev, priv->of_data->cks_min | WDTCR_RPSS_25 |
>  			WDTCR_RPES_75 | WDTCR_TOPS_1024);
>  
> -	if (priv->of_data->wdtdcr)
> -		rzt2h_wdt_wdtdcr_count_start(priv);
> +	if (priv->of_data->wdtdcr) {
> +		ret = rzt2h_wdt_wdtdcr_count_start(priv);
> +		if (ret) {
> +			if (!active) {
> +				reset_control_assert(priv->rstc);
> +				clk_disable(priv->oscclk);
> +				clk_disable(priv->pclk);
> +			}
> +			return ret;
> +		}
> +	}
>  
>  	rzv2h_wdt_ping(wdev);
>  
> @@ -253,24 +271,39 @@ static const struct watchdog_ops rzv2h_wdt_ops = {
>  	.restart = rzv2h_wdt_restart,
>  };
>  
> +static const struct regmap_config rzv2h_wdtdcr_regmap_config = {
> +	.name = "wdtdcr",
> +	.reg_bits = 32,
> +	.val_bits = 32,
> +	.reg_stride = 4,
> +	.max_register = WDTDCR,
> +	.fast_io = true,
> +};
> +
>  static int rzt2h_wdt_wdtdcr_init(struct platform_device *pdev,
>  				 struct rzv2h_wdt_priv *priv)
>  {
> +	void __iomem *wdtdcr;
>  	int ret;
>  
> -	priv->wdtdcr = devm_platform_ioremap_resource(pdev, 1);
> -	if (IS_ERR(priv->wdtdcr))
> -		return PTR_ERR(priv->wdtdcr);
> +	wdtdcr = devm_platform_ioremap_resource(pdev, 1);
> +	if (IS_ERR(wdtdcr))
> +		return PTR_ERR(wdtdcr);
> +
> +	priv->wdtdcr_regmap = devm_regmap_init_mmio(&pdev->dev, wdtdcr,
> +						    &rzv2h_wdtdcr_regmap_config);
> +	if (IS_ERR(priv->wdtdcr_regmap))
> +		return PTR_ERR(priv->wdtdcr_regmap);
>  
>  	ret = pm_runtime_resume_and_get(&pdev->dev);
>  	if (ret)
>  		return ret;
>  
> -	rzt2h_wdt_wdtdcr_count_stop(priv);
> +	ret = rzt2h_wdt_wdtdcr_count_stop(priv);
>  
>  	pm_runtime_put(&pdev->dev);
>  
> -	return 0;
> +	return ret;
>  }
>  
>  static int rzv2h_wdt_probe(struct platform_device *pdev)
