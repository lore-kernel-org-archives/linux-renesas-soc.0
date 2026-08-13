Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 326F839FCB1
	for <linux-renesas-soc@vger.kernel.org>; Thu, 13 Aug 2026 13:26:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786627604; cv=none; b=O39f05NCoe+v6KqQC4yKnriKLh0PQnY5AQ7gp/JJMgz082Q2EMokXOd30T5H+hsI1YE3XPJZ99hh2BpEuVAlrswENl8S80agU/gSufvCf27cBnqy8BsV3ZtnPLe8/0EOS4y6LIK9TGL71AnsqCLvaMDiIceeCEr+pWomgh9O2V0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786627604; c=relaxed/simple;
	bh=m0glXaJmdKQNkPodJBheA6Ja1+5WWr1uWzxve9NRR40=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JzQO9PUDKbwW/hcPSFJ8Vf21iUcGQuVH2rdLKNaWQDz7kO37KC8n9ZW3Y1tQCmcwPc8Vzxx8KIgt9cHAGQ+tnZpAFh1SfXAhl0fG8DrwJ+ftVlGQwzGlg6PTR+2PGJF4uhvlJ/4XsbKPoGdUR+qUgjEgy9Dw2qap//hbRpIaTKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FLJ88V0S; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FLJ88V0S"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E46A81F00A3A
	for <linux-renesas-soc@vger.kernel.org>; Thu, 13 Aug 2026 13:26:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786627602;
	bh=+nCeRbry9tgAPcOQkZXNT1tLEYJdbEYFIpt8gONT42Q=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=FLJ88V0SoNJtoPehkyqsNzCcON1vRHpIVd5wiFVRMeXgSXws5i8ocHbEy346etJi7
	 /meWPKrSTps+6XxPMMOg05VuT206pRzI3CPdcCsvylyAqhQzllCObc6TGtJjYhMqmb
	 2cKEl3lnA+fTTJHNG3FxtSL7lVKB/GhtlK3A5SbFWVrtg3bi5mwgkJmTwQMxDi344s
	 7ir07hfi5I3/yMlur4I/D42I5bGmdRIFP9CocoIOSuEu2bNsTQ6ji0Yh9hLgsDUKuO
	 YlQBWx82VTdB5IefgiuYg/PIzbOCQKxRjohZXOuI18pq7WT8kSujSvCN25NpO6vm7T
	 +VD7QqjOOJeeQ==
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-39c7ce122c7so16865661fa.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 13 Aug 2026 06:26:42 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RqADkyaUOmSqKN+aLsPAfQMtw7KuRNskvgoUQGbJmcaNy6nbjqvgxvd0vT0N9Ag8ePlKXhJhBQrmumKC9fROywFoQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyw2I3+fPgjOqlOa0fCAFq3n5N5w+572pB0YnbnJuSBcVaLiA3t
	xPKI+l1aDvUDaR/69eLHlM7UWKxL2a2RMRNYqCjXi6vfJQwGrrDGvM6G4s3hSZCBR40oTcKQUEt
	F2dwSqLhPAbRk4SImQaH4sl/TjCJBZ+S4+OCLJ/66CA==
X-Received: by 2002:a2e:be22:0:b0:3a1:1198:d196 with SMTP id
 38308e7fff4ca-3a129e730cfmr2462491fa.1.1786627601626; Thu, 13 Aug 2026
 06:26:41 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 13 Aug 2026 08:26:40 -0500
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 13 Aug 2026 08:26:40 -0500
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260812115010.108322-2-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260812115010.108322-1-biju.das.jz@bp.renesas.com> <20260812115010.108322-2-biju.das.jz@bp.renesas.com>
Date: Thu, 13 Aug 2026 08:26:40 -0500
X-Gmail-Original-Message-ID: <CAMRc=MeSC2KTdFSX7dNJN_1zUH9+N3A3ctHgHuweW=e7yAV-JA@mail.gmail.com>
X-Gm-Features: AUfX_mxovvcYsXQ8nLS_x90AAHjZoxfbJEGCiYCQuJmQ-QkUQUKysAcAMxHDgwY
Message-ID: <CAMRc=MeSC2KTdFSX7dNJN_1zUH9+N3A3ctHgHuweW=e7yAV-JA@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] soc: renesas: rz-sysc: Register auxiliary device
 for PWRRDY power sequencer
To: Biju <biju.das.au@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>, linux-renesas-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Bartosz Golaszewski <brgl@kernel.org>, Magnus Damm <magnus.damm@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 12 Aug 2026 13:50:03 +0200, Biju <biju.das.au@gmail.com> said:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> Some RZ SoCs (e.g. RZ/G3L) have a PWRRDY register that is controlled
> through a power sequencer rather than directly by the SYSC driver.
>
> Add a pwrrdy_pwrseq flag to struct rz_sysc_soc_id_init_data to mark
> SoCs with this property, and set it for RZ/G3L. When set,
> rz_sysc_probe() registers a "pwrseq-pwrrdy" auxiliary device so a
> dedicated driver can handle the PWRRDY sequencing.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v2->v3:
>  * Updated commit description by dropping devm_add_action_or_reset().
>  * Config now selects AUXILIARY_BUS to avoid compilation issues.
>  * Dropped the cast in devm_auxiliary_device_create().
> v1->v2:
>  * Switched to devm_auxiliary_device_create().
>  * Added regmap parameter to rz_sysc_pwrrdy_pwrseq_init(),so that regmap
>    can be passed as platform data.
> ---
>  drivers/soc/renesas/Kconfig          |  1 +
>  drivers/soc/renesas/r9a08g046-sysc.c |  1 +
>  drivers/soc/renesas/rz-sysc.c        | 21 +++++++++++++++++++++
>  drivers/soc/renesas/rz-sysc.h        |  2 ++
>  4 files changed, 25 insertions(+)
>
> diff --git a/drivers/soc/renesas/Kconfig b/drivers/soc/renesas/Kconfig
> index fdf18ed2dfc2..ab1c25fc2656 100644
> --- a/drivers/soc/renesas/Kconfig
> +++ b/drivers/soc/renesas/Kconfig
> @@ -485,6 +485,7 @@ config RZN1_IRQMUX
>  config SYSC_RZ
>  	bool "System controller for RZ SoCs" if COMPILE_TEST
>  	select MFD_SYSCON
> +	select AUXILIARY_BUS
>
>  config SYSC_R9A08G045
>  	bool "Renesas System controller support for R9A08G045 (RZ/G3S)" if COMPILE_TEST
> diff --git a/drivers/soc/renesas/r9a08g046-sysc.c b/drivers/soc/renesas/r9a08g046-sysc.c
> index 90db9d383539..cd129c727461 100644
> --- a/drivers/soc/renesas/r9a08g046-sysc.c
> +++ b/drivers/soc/renesas/r9a08g046-sysc.c
> @@ -76,6 +76,7 @@ static const struct rz_sysc_soc_id_init_data rzg3l_sysc_soc_id_init_data __initc
>  	.devid_offset = 0xa04,
>  	.revision_mask = GENMASK(31, 28),
>  	.specific_id_mask = GENMASK(27, 0),
> +	.pwrrdy_pwrseq = true,
>  };
>
>  const struct rz_sysc_init_data rzg3l_sysc_init_data __initconst = {
> diff --git a/drivers/soc/renesas/rz-sysc.c b/drivers/soc/renesas/rz-sysc.c
> index 161e8c38eea6..79c6af934721 100644
> --- a/drivers/soc/renesas/rz-sysc.c
> +++ b/drivers/soc/renesas/rz-sysc.c
> @@ -5,6 +5,7 @@
>   * Copyright (C) 2024 Renesas Electronics Corp.
>   */
>
> +#include <linux/auxiliary_bus.h>
>  #include <linux/bitfield.h>
>  #include <linux/cleanup.h>
>  #include <linux/io.h>
> @@ -84,6 +85,22 @@ static int rz_sysc_soc_init(struct rz_sysc *sysc, const struct of_device_id *mat
>  	return 0;
>  }
>
> +static int rz_sysc_pwrrdy_pwrseq_init(struct device *dev, struct regmap *regmap,
> +				      const struct rz_sysc_init_data *data)
> +{
> +	const struct rz_sysc_soc_id_init_data *soc_data = data->soc_id_init_data;
> +	struct auxiliary_device *adev;
> +
> +	if (!soc_data->pwrrdy_pwrseq)
> +		return 0;
> +
> +	adev = devm_auxiliary_device_create(dev, "pwrseq-pwrrdy", regmap);
> +	if (!adev)
> +		return -ENODEV;
> +
> +	return 0;
> +}
> +
>  static const struct of_device_id rz_sysc_match[] = {
>  #ifdef CONFIG_SYSC_R9A08G045
>  	{ .compatible = "renesas,r9a08g045-sysc", .data = &rzg3s_sysc_init_data },
> @@ -149,6 +166,10 @@ static int rz_sysc_probe(struct platform_device *pdev)
>  	if (IS_ERR(regmap))
>  		return PTR_ERR(regmap);
>
> +	ret = rz_sysc_pwrrdy_pwrseq_init(dev, regmap, match->data);
> +	if (ret)
> +		return ret;

Honestly I don't think this is worth a separate function, could have as well
been:

	if (match->data->soc_data->pwrrdy_pwrseq) {
		adev = ...
	}

But I won't die on that hill.

Bart

> +
>  	return of_syscon_register_regmap(dev->of_node, regmap);
>  }
>
> diff --git a/drivers/soc/renesas/rz-sysc.h b/drivers/soc/renesas/rz-sysc.h
> index 921ee0d26c47..e55f3258d703 100644
> --- a/drivers/soc/renesas/rz-sysc.h
> +++ b/drivers/soc/renesas/rz-sysc.h
> @@ -20,6 +20,7 @@
>   * @revision_mask: SYSC SoC ID revision mask
>   * @specific_id_mask: SYSC SoC ID specific ID mask
>   * @print_id: print SoC-specific extended device identification
> + * @pwrrdy_pwrseq: has pwrrdy register controlled through power sequencer
>   */
>  struct rz_sysc_soc_id_init_data {
>  	const char * const family;
> @@ -29,6 +30,7 @@ struct rz_sysc_soc_id_init_data {
>  	u32 specific_id_mask;
>  	void (*print_id)(struct device *dev, void __iomem *sysc_base,
>  			 struct soc_device_attribute *soc_dev_attr);
> +	bool pwrrdy_pwrseq;
>  };
>
>  /**
> --
> 2.43.0
>
>
