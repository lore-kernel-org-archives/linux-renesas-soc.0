Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CB0F37E2E2
	for <linux-renesas-soc@vger.kernel.org>; Mon, 10 Aug 2026 09:45:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786355132; cv=none; b=rH9zYmzoNo8160tNuM8vChOBBMLPOQrAbHRctsTjZRF+K8nQA/OWR9FJbTCGhiDcybCdXv2YE3kM0hDRBMmFdhyeccqGxgIHpoTkpNOsPSvf/of47XmwxKtm+9qD/tMLXJINK2U2/2+5XuaT418+ahn9+uhDmqlidwUNhVvJx+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786355132; c=relaxed/simple;
	bh=gxcas0bqgHomtZULAw4OXEt+7h8gY3FlT9ou+7GepIA=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=DkICMDYLhqIaO6k+guana6eu0tDVIlSCGpfDdImHldy54xXXYTfV2auhUqhgNSvC8KYkXiC20XKFM7B2hvxZYFaG4P1tKVRtoI21TSlvatJ4aZ4+z+mZzrJl78CbAd3UIKxy82VPDLSUS+pEKg8maY/lodtU154wBTi0WaTifD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=k0mdxM8G; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="k0mdxM8G"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-4799b3f7c83so1046553f8f.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 10 Aug 2026 02:45:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1786355129; x=1786959929; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EyEgdVp7O6CUMToSIq4Pkng5Jk2xx180zJ29o453drU=;
        b=k0mdxM8GpN8v9aEsBACesPx9Gf+cxCH0avXSUFeBDLV5SX0QO3RF302wMhTs/WYpz9
         R5/o5ZogOHaIru5TnieFytH0qZGF7YMMeO56iMsTUTgmFYC4AiNhWMjYEC9suS7JMvJ4
         U6xXFFrptbOlmg82OMUrWo+uRX7+BYtJPJJeoQw2Di2Mad5Fz83ceQIVS6rSD6oJ0G9J
         m6wDbCqcxKmsFA2ouxbdj0+HUeVon626/5XdEIatRYUWBsZQ3bWdQiDTsu9WXh8BVtwv
         ZEEMwYNreK9GJKHFvvEhUSfz/iCEEd/49BwVmY/9/qGP2ARqitUVYLfsUb2UeVqSm8Hc
         W05Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786355129; x=1786959929;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=EyEgdVp7O6CUMToSIq4Pkng5Jk2xx180zJ29o453drU=;
        b=IVRKPKgXJ+9lQ0blcBYouF6t4ylXFXsXaACGOLOhR2GN9Pdy1kfXZ4uCpE3WTV4i1W
         8Gu7NXfnek5c+XDfYR+LAEaJ0xuwm4TdZNAfYHvOKgY4ADKyfC4EDB1KmNUAHzWcuxdq
         LM1gj0ypmSBkON4iO2ozXEG4w/LzSpv05T+CsqiH+EBrQVfwhny4Cj4OtkfOR7DuLQIY
         WRQJ43eWYjDYBfAbSCyJM84PMZ2UBLfpmIQLHdp//5md/ei+HIIf2m6ojWhBChe0aS6r
         3RD5IBLgm+tmKQ+UrjNdbaLj67+shvJE6jaZCgWCYJYLbDtrVwCwrV7In06YFWe9b10n
         Z1gQ==
X-Forwarded-Encrypted: i=1; AHgh+RrYjEgq2IK2xAXHnkWuDsnvZfhcsMZVQQkyHgHSTrZjxtpB27c7Ks3nkZvvxYiedQEitxGI/IN+Xb8X5lwnNzT68g==@vger.kernel.org
X-Gm-Message-State: AOJu0YySdKtHftJyEpnGMM90GIAuO29G1jifF87eXSPtWyZEUxphaQ4+
	/T4AcGMCv/92DZH683GaLPZWxFfRhmMjyxbiTkWPuSMZoFmR0Jz3RQ8js+D9+fxuZa8=
X-Gm-Gg: AR+sD10XVcKPzDxloesie5AqhWSWRwZNbgwcGaxV+U8cFB0F8CXE43BhoqD7M5ZXxWl
	7ENj6pHVzarzmEn8L5TBYmrVjv5hbMon7DJ+gscHt2Hi8nHXrzHAZPjosM0CNy4W5NkE5t9o/2p
	MvGjg6zShPPHNMmiuzSVrsApbAwmZYZx63bKfl5ZDblRSuOWKEjpyeGnXL0udPsEAyiLEUYG3qV
	pXvk9KX8S7w3C1Y4m294XOHlnm0hWrmIQfy/E90ka2MbmS2mCsiQkIPSJajsgee4FuXWbS8jtfa
	G+vY3X/mKDr0l5cH0zaboWVmYD9mzCRLXNZQZKB+efRvKDP/HX+eRUkyJ6SSc8Bo4RUumaZO+J5
	fQGgvTZaMTRNfvmhwX0JAlJUBOC1wvrZIvtTYemUEvjPIOCoSAu8JYe51xKd1UKDqgGsB9kpnpQ
	4dVlEpfO1RTwE2ZLKAqrKhccRpIw+obzA23QYTBz2GqAvR8JQqlxoUEirtoSqmpAClOEC4LUawY
	nPxodX9voJ7y7hpVhzbyvsVfy8+tGKgxq0VCXa2SOqIdH6MCtYF
X-Received: by 2002:a05:6000:4305:b0:47f:4fa9:ae42 with SMTP id ffacd0b85a97d-481455f8844mr733292f8f.11.1786355129252;
        Mon, 10 Aug 2026 02:45:29 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:eb7f:37e4:e8c9:f32? ([2a01:e0a:106d:1080:eb7f:37e4:e8c9:f32])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4800215078asm32050521f8f.12.2026.08.10.02.45.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Aug 2026 02:45:28 -0700 (PDT)
Message-ID: <d0c1f707-4d44-4d0c-a45b-5a78c94f286a@linaro.org>
Date: Mon, 10 Aug 2026 11:45:28 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 3/4] drm/panel: ilitek-ili9882t: Set prepare_prev_first
To: Marek Vasut <marek.vasut+renesas@mailbox.org>,
 linux-arm-kernel@lists.infradead.org
Cc: Conor Dooley <conor+dt@kernel.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 David Airlie <airlied@gmail.com>, Jessica Zhang <jesszhan0024@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Rob Herring <robh@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-renesas-soc@vger.kernel.org
References: <20260809200107.842945-1-marek.vasut+renesas@mailbox.org>
 <20260809200107.842945-3-marek.vasut+renesas@mailbox.org>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <20260809200107.842945-3-marek.vasut+renesas@mailbox.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/9/26 21:58, Marek Vasut wrote:
> Sending DSI commands from the prepare() callback requires DSI link to be
> up at that point. For DSI hosts is guaranteed only if the panel driver
> sets the .prepare_prev_first flag. Set it to let these panels work with
> the DSI hosts which don't power on the link in their .mode_set callback.
> 
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> ---
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Jessica Zhang <jesszhan0024@gmail.com>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Neil Armstrong <neil.armstrong@linaro.org>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Simona Vetter <simona@ffwll.ch>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: devicetree@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-renesas-soc@vger.kernel.org
> ---
>   drivers/gpu/drm/panel/panel-ilitek-ili9882t.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/panel/panel-ilitek-ili9882t.c b/drivers/gpu/drm/panel/panel-ilitek-ili9882t.c
> index 219d048cb883f..24e72ad0d29a1 100644
> --- a/drivers/gpu/drm/panel/panel-ilitek-ili9882t.c
> +++ b/drivers/gpu/drm/panel/panel-ilitek-ili9882t.c
> @@ -808,6 +808,7 @@ static int ili9882t_add(struct ili9882t *ili)
>   
>   	ili->base.funcs = &ili9882t_funcs;
>   	ili->base.dev = &ili->dsi->dev;
> +	ili->base.prepare_prev_first = true;
>   
>   	drm_panel_add(&ili->base);
>   

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil
