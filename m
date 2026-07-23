Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECB8747CC8C
	for <linux-renesas-soc@vger.kernel.org>; Thu, 23 Jul 2026 14:33:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784817231; cv=none; b=TdKEWpo/w127rjAd7WBqjEuM70eSmnEeUosup91GiIL+8fuIiQiK9ps8jZjkUUsKOklVO6XT2yj7bvxSk6YZSgWrKiG6sxa09P1t21VSICoZieOQUqbISg2GPqXoq6xF/PxsjhMyYYMUEtS4/Lb07PQ65qXiMw2n8mlTa/s70oI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784817231; c=relaxed/simple;
	bh=m9SnMkUX1tTQB6NO65dVN/roFkfDpAoBwsExIR6ZDZw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a2VLwXEN/In8vtgclFaVtDc0F25kLKinfyFowDUmZdDWprr1R4MwBnmg0xTKsarnKh0i/PjmAbvcRFp9ZqChfHXyPhUv2wTDyr4fAmDrg45QQEDZ/U0cRyRiLUK2VIFUurhWtGwBM7ftN7e9qejrDo44i9E/XMfUFkk44Qgm5m8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=QTKfXad+; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=UFIxQxKv; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="QTKfXad+";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="UFIxQxKv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1784817220;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2njy+/zspbCzy0izhWL1wi7/dDBKbdf0HpY/B2TDfoY=;
	b=QTKfXad+ncfLcR+Xpvo+ysfguNhj/X2g05l+MNDXrRJMXlDikMVUxYRJVqZ7n6VPiQtHtT
	xhr9tZGJtEyNPSCaXh9/5EJxOUTjT2u76QHI1RSOsU5YZwddgSTtjegT7jLPEzLFWuhPoX
	3wAZnFGIxdiN7iSqMS7HdHcPr4bY2aA=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-130-s_VzAzt0O2qPLsqP5KCBIw-1; Thu, 23 Jul 2026 10:33:38 -0400
X-MC-Unique: s_VzAzt0O2qPLsqP5KCBIw-1
X-Mimecast-MFC-AGG-ID: s_VzAzt0O2qPLsqP5KCBIw_1784817218
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8f1e4e0eac1so16312896d6.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 23 Jul 2026 07:33:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1784817218; x=1785422018; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=2njy+/zspbCzy0izhWL1wi7/dDBKbdf0HpY/B2TDfoY=;
        b=UFIxQxKvshLj6Ov7uMzFME4atQc5u7W64zO12Z8b2SRYQgMB54b9cZIa1cXP7Chf9K
         IvCaj+TkG7B9r11P0iBmuo1iln8tHE+WwQA7OR96c2crMwBYnzLjANbUtbzDm6QXUFS5
         duFfwKGT/0LhO1Jp+r3FFqqHfHoRFvrIPnuadW14Z9f1R3rfhGWVrlM84khYI8c3EfcF
         MapV7dKNfqR0qBN5ajsN2+6fhd9uxUVNbvczGZJpjJpk+P49VlByocb8B6FIHbXNnnmY
         zb4L16bMrHvqL58xQqpCBjGsyvsW1xWhN5GyS3IJwDcZY/c4GaEfZboMQVkNXmgGBJfS
         uieA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784817218; x=1785422018;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2njy+/zspbCzy0izhWL1wi7/dDBKbdf0HpY/B2TDfoY=;
        b=LYc2fVLHoB+Ycfs6ovVS8pMb4vXPIB1oolK98VrC4DkPFuyB0dMCQ/Gtoo1ilYgHe7
         DF6SsUh/v/Om/DThrtt4OpXdiG4LxzGBg6WDKHUKqvuITkaYYgiAmFUcHM98JOpIJFrZ
         5AoSdv1RSJBIMx4XqVBAtzQn/mtcL8eDFp1RHUSHeZmmf/IpALX7DcXfLShpUAInxgbr
         HVodLX3kzcfIc/cCc8qzTBTiMXyMiYiaO8DxL+kkhGc19ygFWLmE8mwDwzQ5NjFrVj6G
         x8WllHxcYQGZD+bklYTnRmom/XSLEcZiQF9Z7VcTUa9iUvbirJFxRN+nnQQM7rm6OGBW
         ds5A==
X-Forwarded-Encrypted: i=1; AHgh+RrTuHlbF2RgPJTeucOU7rXIiscX21Il3K9qPNztiKpEKxO/N0vsggR2W3l5C5+ytnL6jJWpkqNP4YT11xDExMjIqA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzrRJRDCzNlbClwP5H1SVmHv/29Kv6a87CzrE3Fe4EMowFRy9Hw
	v3FoNKYt7/SrfVAykfckw4UYqC0Xb0aiVdG43aq4Gru4R7HS51jqmqPZXMh1+7C9BBbz81jkoPw
	Izw/+fK1xvWKMI2AYpCEIhOiETddzj7k/LQD7aWC/dwyihCeVYt7ZdcRsKAPpOeuAlNRwt6ID
X-Gm-Gg: AR+sD11t2ooClZNwd1FJYsH81CuA/oUTLdmkjKbK299YyEQVJGbO93JbCknIii/B+0v
	RskD3W7y8C9YFA91klPD44nt5CFCEElH+D+jm8pO9oA52vhRqOup7wEInRfYHnrW4eLegPGjNZa
	fcIF8OhktiXBN4Z1ZgkUiHoi3suHhRsjQ689lYjk0vuCrQa0uF1Zmfd/CYeuh5oyCI4hcX9AIeV
	f4Ef9/9a08QOXTPhTBvvplCh5nbvZdEwfYwMrQzn6D+u3x13biITAzLvXDKhVLWjtAAyCYk7JDU
	g3MFoEfG30jg9A8gV5tWA+jEDYP5+hhcmQJnxOGh/7oR0E3E90+VayuB/1rP8N8za4BeKnnpe83
	A6HOanc1p4xhnQ/1de395dynJy3SS+AOwyqI=
X-Received: by 2002:a05:6214:2aa5:b0:907:aec2:6cdf with SMTP id 6a1803df08f44-907ca363063mr40225876d6.8.1784817218114;
        Thu, 23 Jul 2026 07:33:38 -0700 (PDT)
X-Received: by 2002:a05:6214:2aa5:b0:907:aec2:6cdf with SMTP id 6a1803df08f44-907ca363063mr40225316d6.8.1784817217491;
        Thu, 23 Jul 2026 07:33:37 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-907ba8b5f85sm46744846d6.2.2026.07.23.07.33.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 07:33:36 -0700 (PDT)
Date: Thu, 23 Jul 2026 10:33:35 -0400
From: Brian Masney <bmasney@redhat.com>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Heiko Stuebner <heiko@sntech.de>,
	Prashant Gaikwad <pgaikwad@nvidia.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Tero Kristo <kristo@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-rockchip@lists.infradead.org, linux-tegra@vger.kernel.org,
	linux-omap@vger.kernel.org
Subject: Re: [PATCH] clk: clean-up simple provider misuse of the consumer API
Message-ID: <amImP6sFlv-sNhMh@redhat.com>
References: <20260723-clk-provider-simple-clean-v1-1-0c9668240467@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260723-clk-provider-simple-clean-v1-1-0c9668240467@baylibre.com>
User-Agent: Mutt/2.4.0 (2026-06-19)

On Thu, Jul 23, 2026 at 03:20:59PM +0200, Jerome Brunet wrote:
> Clock provider should not be using the consumer interface.
> In other words, a provider should not be dealing with struct clk.
> 
> This change targets occurrences for which the provider uses the
> consumer interface and corresponding clk_hw interface exist:
> * __clk_get_name() -> clk_hw_get_name()
> * __clk_is_enabled() -> clk_hw_is_enabled()
> * clk_get_rate() -> clk_hw_get_rate()
> 
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
> The change being very simple, I did not think it was necessary
> to split it into multiple changes. If you prefer it to be split,
> just let me know how.
> ---
>  drivers/clk/mvebu/clk-cpu.c            |  2 +-
>  drivers/clk/qcom/clk-hfpll.c           |  4 ++--
>  drivers/clk/qcom/clk-krait.c           |  2 +-
>  drivers/clk/qcom/clk-rcg.c             |  4 ++--
>  drivers/clk/qcom/clk-rcg2.c            |  2 +-
>  drivers/clk/renesas/r9a06g032-clocks.c |  2 +-
>  drivers/clk/rockchip/clk-pll.c         | 24 ++++++++++++------------
>  drivers/clk/st/clkgen-pll.c            | 20 ++++++++++----------
>  drivers/clk/tegra/clk-tegra210.c       |  2 +-
>  drivers/clk/ti/clockdomain.c           |  2 +-
>  10 files changed, 32 insertions(+), 32 deletions(-)

This looks good to me however can you split this up by clk subsystem at
the very least so that the various submaintainers can pick up these up?

With that:

Reviewed-by: Brian Masney <bmasney@redhat.com>

