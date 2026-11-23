Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795421250;
	b=bJbtut+DHxhJ+2/08LA4hfgmjUoSrQaJGpKXWEmppeJIxbLvaxgQCI7z0fTkzRmNyK0y
	 ur3NDji+ZVjF/sL5wUMB3sVGtF0MAroTSJ1PBAxp64+aqE/h+FkP9/v7MCDZxG4f4YIIk
	 ZAFc+S+AL6Gx3FxatcSBH+2oxS18v3Qr5SOzcc9vQw1RTnidQiQkI2bzHlZlQInuP4fog
	 Crj/eSxosnUmx3UMOcM7jPjLGcxEM/Sckt0MTpWYfiby6atzuw01vEegUqGStlVyFFQbH
	 6bJ/qkFO3lCfD5sf1az51VjZllsiDKHsBr5W3zoTIKy4PA/AhhrHttg3MFNltMr0VYg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795421250;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=wpeI2D8k4eF4Gl52wSeLaD2a8enBNfeJeACQoMkSgLs=;
	b=i3DeoPHUpMdMNCydS75QNWxRKCUTrRC6zgiKzn3lumfTkVHjSmSM3w2GHrViiJZ+bU+T
	 7MR1uid2CDx1g1JJ7n/TTv3/0brIEWgvJSALwKJ+KsqwRKLfDvmQ/ZNPXLY13RW2ANogp
	 DrSqOTa37g/9K89LHtowvOjHW3Lxg3tPBeJmz88vsf4Z9giovunRUZopml5h5cB+5l6dg
	 2eS36JrfUvj/n5CObYhj4yl34WlZa9we96l85t5nmzA5wOUbhw9ZZQtbFcCAdP4l550J4
	 w/lpv1sg+zbn2oqxNEsuzUJDQmMQNPhfsJXaowa5C+w+d0bi/D2khXjS8RhxZ+t8LgA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=tuxon.dev;
	spf=pass smtp.mailfrom=tuxon.dev;
	dkim=pass header.d=tuxon.dev header.i=@tuxon.dev header.a=rsa-sha256 header.s=google header.b=Nd8tQEwv;
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F01F2607151A
	for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Nov 2026 08:07:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F01F2607151A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=tuxon.dev header.i=@tuxon.dev header.a=rsa-sha256 header.s=google header.b=Nd8tQEwv
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-498f5fa4f70so2394765f8f.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Nov 2026 00:07:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1795421248; x=1796026048; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wpeI2D8k4eF4Gl52wSeLaD2a8enBNfeJeACQoMkSgLs=;
        b=Nd8tQEwvw2YVHeQ8j1Cb46XOj1W6KTiKi55pRshAkmzgXk660CQlg7it9/dDUxWvZR
         HiHj7dU5yALL1R7gq97965gGFJsx+0mj3aapPkq7VvG78sdRxkhNmLB32vpYQDmHu7Q+
         GWZANiiisuMmVdhErOcvtxw5imyZorhl4pvPAG2lvvUMw42goZu36Hmg5uxvrgTQu5/d
         Awjdc6tzeYDjiDbVB4ickreDMX3baO07gu4+BGY7T0OzsmreaiSUf8Ezt7ujDb96+OOU
         oKLMaBOCWsTbgjvp/UQbBrb62jWNG/WoOI8hhnigAO+POKC0oiU3k/QSvKR/4BGMTk2o
         +m0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795421248; x=1796026048;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wpeI2D8k4eF4Gl52wSeLaD2a8enBNfeJeACQoMkSgLs=;
        b=QOFjF36pRBrnTwyOcTOSzXzQ2GeCcvIr2jUhw6bkDX9pgsYShPexjb0VEcs87/5PzY
         Fq3lO6gTzwayyklYbh+2nPRtErAET84KNShD6gHgkDhiv2s4qRIYMxC+uhKgN8Y8+S5Y
         ZWrkA4ETX4kkdWc3z7nUwC1E4MgiaQZCRfAeVGYyjX4Awz9pxkJrHXr68gomTWOt3EWU
         w/wu8o1AcEwfERu5f1/7VN/XffKR1sElWafGgCCpTpSzOyI4coeLUJTOworsvF7osflB
         +LvkzN7/Sg4jG5bI+jRSec+2fRj0vNy0jAwh0coN9qxv7NTpi2TtqIVaRp/Opr0R3uMN
         L41w==
X-Gm-Message-State: APuU4Z/+5zLpqzH7ADkYw4vIrKcAqT3qwo7vTXHblhVlxzmutM+rlqCp
	PnzQtbnBOO850FfQZ/H4YdiwMFYShdARQR5N1SF0GADWne2+21PrXG16GZfMkNFWj7E=
X-Gm-Gg: AZFdTZefW5I8QsrxsiyBhcEQ9TlyyFbR+uUE5ot7Ukn/zLkcdPisrSyaOxPqZ1oWczP
	+HsgydPXyVaUFZ18LK4fW4lu4/RPUc1kuOyOIy1DAxNi1Y06LyVWUhejWQeXTisjvJhg0Fx1vaa
	elY+fCerctAdGGSBXW43rejLEKRk24uZPfX7rkbUBoVdbIRxRm/tbtUC2RXXhAAPvP/WDGjExE+
	9xtQ3C45jsi8ZWbyWB3tKDnL4Oid4OCKWw2E1xudLCQMvj55GaQELdBlclMzUfelZJlWXOoqR1/
	Q+O+2Z94TXV2i6O8FWq51q0a6hf6NHBvk1cXZLafg/Ry2vXkIRbCOu2DY3PZLqWBXveoojKtOGR
	ctys6ByBqrVtKAMnuhMxre5zAkgCunSqJdWwCE6XlVq0UWf5BhFG0Yswj0IcoacFkeA1FdrK/k/
	CRAmOakvv64C6p9fZCTEINDr4W14CjS2eZAieFHBqSNmtZhUlgfPvz5I9zIE8f5CvUqwLvjAc2A
	WgZN753BO1LY+ckwwNufkD3l4YU4CkwaxyvQa2Zze+NW69jGIu+ujoW+h/VlPbBau98fzmp5UeC
	b75tA2O2zyywU6n3zA2vma9r6ie8GSIjROZZEIY=
X-Received: by 2002:a05:6000:2c05:b0:498:b92a:30b with SMTP id ffacd0b85a97d-4abb0c5d560mr20861869f8f.15.1795421247404;
        Mon, 23 Nov 2026 00:07:27 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.114])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b9add26sm20895154f8f.44.2026.11.23.00.07.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 00:07:26 -0800 (PST)
Message-ID: <c1b91afc-5b9f-4ed4-bfa2-b202e552769f@tuxon.dev>
Date: Mon, 23 Nov 2026 10:07:25 +0200
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Post: <mailto:linux-renesas-soc@vger.kernel.org>
List-Help: <mailto:linux-renesas-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-renesas-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: renesas: rzg2l-cpg: Skip re-initializing MSTOPs and
 critical resets for s2idle
To: Claudiu Beznea <claudiu.beznea@kernel.org>, geert+renesas@glider.be,
 sboyd@kernel.org, bmasney+clk@redhat.com, jbrunet+clk@baylibre.com
Cc: linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261019122501.2423969-1-claudiu.beznea@kernel.org>
Content-Language: en-US
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20261019122501.2423969-1-claudiu.beznea@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi, Geert,

Gentle ping.

Thank you,
Claudiu

On 10/19/26 15:25, Claudiu Beznea wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> 
> When the system suspends to s2idle, any of the IP blocks may be in the
> wakeup path. For a device in the wakeup path, the generic PM domain (genpd)
> does not disable/enable its clocks across suspend/resume. Re-initializing
> the MSTOP bits for such a device leads to synchronous aborts when its
> registers are accessed for the first time after resume.
> 
> In a suspend mode that is not controlled by firmware, power to the SoC is
> not lost, so the MSTOP and critical reset state is retained and does not
> need re-initialization in the first place. Skip it when
> pm_suspend_via_firmware() reports such a mode.
> 
> Fixes: 5cd33db56956 ("clk: renesas: rzg2l: Add support for MSTOP in clock enable/disable API")
> Cc: stable@vger.kernel.org
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> ---
>   drivers/clk/renesas/rzg2l-cpg.c | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/clk/renesas/rzg2l-cpg.c b/drivers/clk/renesas/rzg2l-cpg.c
> index f6293c968bcf..3d2281456036 100644
> --- a/drivers/clk/renesas/rzg2l-cpg.c
> +++ b/drivers/clk/renesas/rzg2l-cpg.c
> @@ -31,6 +31,7 @@
>   #include <linux/reset-controller.h>
>   #include <linux/slab.h>
>   #include <linux/string_choices.h>
> +#include <linux/suspend.h>
>   #include <linux/units.h>
>   
>   #include <dt-bindings/clock/renesas-cpg-mssr.h>
> @@ -2697,6 +2698,9 @@ static int rzg2l_cpg_resume(struct device *dev)
>   	struct rzg2l_cpg_priv *priv = dev_get_drvdata(dev);
>   	int ret;
>   
> +	if (!pm_suspend_via_firmware())
> +		return 0;
> +
>   	ret = rzg2l_cpg_deassert_crit_resets(&priv->rcdev, priv->info);
>   	if (ret)
>   		return ret;

