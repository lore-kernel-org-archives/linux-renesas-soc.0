Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 866E3374170
	for <linux-renesas-soc@vger.kernel.org>; Sat, 15 Aug 2026 19:12:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786821132; cv=none; b=UTcHuxBOaxgqsOA0GUpcPplSaCICsfpWzO1yLYODQpCmvS+gGfoCkpA2pE/nMBEPahWFC5dSJlE198sgi/di6stvdiCYM3Snb8bknoEypv0VLJ4fiTOtopw0k2AGa7C5IGO92t8d2Dd/rDCqIOzDJ1XlewtqHO9Z628DbD/Cg2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786821132; c=relaxed/simple;
	bh=5RkMUJ1444X2cAUbWcMBKjhTBMhgCS7gOIBcS9lYMPs=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=GmYH1Yv1kv+b/QzbPf8jEQF6kEhvgwL8KoVCCmoTNouAnhNHBljpuniolOw5coCGxoqDbgcnpLWo9wbKQ3opxBJlyAZEOZVWKw6DnjVLsUZtQI1rDKAU4AGiZ5shGSul+7lUeg6aJrgsoiC4woISJJsLVKlp0G2V7EstTOe+YJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OGvpzoKv; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OGvpzoKv"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c214321dc32so207612666b.0
        for <linux-renesas-soc@vger.kernel.org>; Sat, 15 Aug 2026 12:12:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786821128; x=1787425928; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=88izO+QaB/O00yTBhu9wQoygITPFWyCSorKc++U3zBY=;
        b=OGvpzoKvC/8HTbmaFB/nErXD6qnlhk/zmsXYD1OoN7t5w35IW4M0y+EYsAKrhWKfyR
         ufdqcKHJCBbLpLj1obAkoaZkYYY1zrjg8byCGapnQDz/fViPHjZ8ihPMv2Rl3rk1Urou
         MWX5hktfymmp3wuZlZXPITJfxQA1nVgtyU2O5Bom3kdZh9kDedUJuFfrdwceIOJSqeTu
         hzpQE9FPQktvXr2EhyD53G57Kbe3eG6BkXbu5Sm/MjTJo2emI50CU60khHg4ZyHZ4w29
         NlWfVs+GMpGmmVsoKZO45DrVYz+IuNGsk0HjiL6lrnjbwuF7ZWpdYvvOQZRMWm13Oic4
         g0sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786821128; x=1787425928;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=88izO+QaB/O00yTBhu9wQoygITPFWyCSorKc++U3zBY=;
        b=KAQxQEq0AqQAg7nD/iqXH6NwO6xnshPMEG2StKBeXIeLj5+N5iY0wL/kZ93aJ0x4JG
         IuMqRqs6jZOmd1HWTPb67UW2OKbioXPBhmoS8osODhKFOSee/Ly1AVPfTgFHRAJlbozt
         biadV/ZHnLxU4uGHKgLJVjAH+lNe+7u6cc6zzP7/1Wut8XgSetMeLlDouU4jWjM9HEhx
         VJ1bAkfGijEuJXz94N8YXLE6uFcK16q9mxtjElNyhuXb3+bKGsQ8BAcWgHqiXBqWczf9
         e32mgIIbBxbgOUM3KGY1VcPsPlmBKLMr9R7+kOfOKCezU+cvB96E5z35jam8vnCwlp0T
         TglA==
X-Forwarded-Encrypted: i=1; AHgh+RpX2nNS/PEFoJ1jJBSKDyy/IjlTUtrC+OhREli55e1OzJ1pnsKVHBj7JHv8xaVYm8josGdipJnrrMsQxGM+qYu30Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YxJpfrbxtkmLDK7KDrcNDOIAblfmSSeALWQdkkt5YzM6MKvSndm
	PGKDXteCDY8p6Tyol/m1pEvqdeszCqMWvQDOYh7qu/9BuL8gfw6i/zJs
X-Gm-Gg: AR+sD13wO2AUmQgsB/9YfZ2Vk7Xz/kGkwAdCh7mYzMC0FdECGQFTV8+pHYagXRrZIbr
	B+uNcExsNNSEfwTvn6h/vuj9SvD0wQD3ndCYUrfH3CYt5xekOPM4QQSE2KQwsTNyOxbpx68OOwJ
	yzjcVkCt4Ah79+Xyj0TgQkBPO5N3TyLjAynH2QLVcRZbeAfb2w0cm3qPja/NmyCZL+fVY24E+AZ
	fdoYd9ELjtG91mISMPkczc7ILeUd9gMGURKLpB3kGEB6WYFIP3eMU/aPijZ16vsQOqOAOwkM0mo
	9kcdH7kyQ4y1wTBjqJ+LaP+4iKLN2kCfqu+xLvgXsD643p2dFlTVdD1uE1kSCtNfBQb6/nS369g
	MpN83S4FsxPYPXeTw4ffPgnn2TE1DSaR+WGoURiWdWn2jGLBIg1YPEjP7H5Q5PpajtuUT4bKnhp
	wdXD2Hpuc//+hTCWPXH75xO89D4JRoeEGhPbZB/pVBabvVGgDllYzlyXa4RagzHg+oy81SiBQ34
	eprOeE0Enqqy5N2Jq8L5qC67gdDuWh0l0ojQMda1w==
X-Received: by 2002:a17:906:eeca:b0:c1a:5d49:f99d with SMTP id a640c23a62f3a-c2129ab6c24mr672768166b.7.1786821127686;
        Sat, 15 Aug 2026 12:12:07 -0700 (PDT)
Received: from ?IPV6:2a00:1fa0:28f:426f:2aa1:8f7:f8a6:4f89? ([2a00:1fa0:28f:426f:2aa1:8f7:f8a6:4f89])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c212339f744sm252129866b.10.2026.08.15.12.12.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 15 Aug 2026 12:12:06 -0700 (PDT)
Message-ID: <f140a168-0f92-4507-bf07-f5297ad92159@gmail.com>
Date: Sat, 15 Aug 2026 22:12:03 +0300
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v2 10/10] net: ethernet: ravb: Add gPTP support
 for Gen4
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?=
 <niklas.soderlund+renesas@ragnatech.se>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>,
 Richard Cochran <richardcochran@gmail.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "DavidS. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Vadim Fedorenko
 <vadim.fedorenko@linux.dev>, linux-renesas-soc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org
References: <20260811160200.2049987-1-niklas.soderlund+renesas@ragnatech.se>
 <20260811160200.2049987-11-niklas.soderlund+renesas@ragnatech.se>
Content-Language: en-US
From: Sergey Shtylyov <sergei.shtylyov@gmail.com>
In-Reply-To: <20260811160200.2049987-11-niklas.soderlund+renesas@ragnatech.se>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 8/11/26 7:02 PM, Niklas Söderlund wrote:

> While driver advertises gPTP support on Gen4 platforms it is in fact
> completely broken. On R-Car Gen4 devices the RAVB module have no
> internal gPTP clock as generations before it. Instead it utilizes a
> system-wide gPTP clock.
> 
> This change utilizes the refactoring of the RAVB gPTP code to add
> support for a system-wide clock and stops the Gen4 devices trying to use
> the non-existing internal gPTP clock.
> 
> To remain backward compatible the ptp-timer property is optional.If not
> present, or not enabled, the RAVB driver will no longer advertise gPTP
> support to user-space.
> 
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> Reviewed-by: Sergey Shtylyov <sergei.shtylyov@gmail.com>
[...]

> diff --git a/drivers/net/ethernet/renesas/ravb.h b/drivers/net/ethernet/renesas/ravb.h
> index b4df5cab0e5c..4c8dc02022e2 100644
> --- a/drivers/net/ethernet/renesas/ravb.h
> +++ b/drivers/net/ethernet/renesas/ravb.h
> @@ -249,6 +249,8 @@ enum APSR_BIT {
>  	APSR_RDM	= 0x00002000,
>  	APSR_TDM	= 0x00004000,
>  	APSR_MIISELECT	= 0x01000000,	/* R-Car V4M only */
> +	APSR_GPTPTIMER_SOURCE = BIT(25), /* Gen4 */
> +	APSR_GPTPCLOCK	= BIT(29),	/* Gen4 */

   Again, I don't quite like that you switched to using BIT() all of a sudden...

[...]> diff --git a/drivers/net/ethernet/renesas/ravb_main.c b/drivers/net/ethernet/renesas/ravb_main.c
> index 12877a8488ed..30170e92d3d7 100644
> --- a/drivers/net/ethernet/renesas/ravb_main.c
> +++ b/drivers/net/ethernet/renesas/ravb_main.c
> @@ -2752,6 +2752,59 @@ static const struct ravb_hw_info ravb_gen3_hw_info = {
>  	.magic_pkt = 1,
>  };
>  
> +static int ravb_gen4_ptp_probe(struct net_device *ndev)
> +{
> +	struct ravb_private *priv = netdev_priv(ndev);
> +
> +	priv->of_gptp =
> +		of_parse_phandle(priv->pdev->dev.of_node, "ptp-timer", 0);

   You now have full 100 columns, no need to break that line... :-)

> +	if (!priv->of_gptp)
> +		return 0;
> +
> +	if (!of_device_is_available(priv->of_gptp)) {
> +		of_node_put(priv->of_gptp);
> +		priv->of_gptp = NULL;
> +		return 0;

   This *return* seems superfluous...

> +	}
> +
> +	return 0;
> +}[...]

MBR, Sergey

