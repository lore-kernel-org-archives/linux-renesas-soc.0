Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C02463F4848
	for <linux-renesas-soc@vger.kernel.org>; Thu, 18 Jun 2026 12:30:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781785824; cv=none; b=Siy9qrQXaD7L04RKDJUAldx7g7Mz71Rhn0CdOc3eAiWUum4M9MpPBp5MkuJRr9+Sg9NO9Zi749L1Le4ksU1qM9yU1IzytilVNC/aAtEkwU+2d5hw+JBpVdW7q3+Hz5JzbPNetVNeKcoXsI8KqSyvGZkM8l79gRRqhyAqIYUIwNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781785824; c=relaxed/simple;
	bh=0cAra00Ak049b9s2bmtE/U+MjaLArd8s5x8l6HglVMo=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=mh0Xo8eoLDcxBGX3OJ4UmDo/3TDzqc0wbe1OXzTQqZuPouDpQHm6t86WdYi/jFr3C8SQPa3WgM5ZsjKVRRkTWaK3XN6k5WWJKmR19oECZWwpSQB24cIMCLwS8pYyHh2Bk8vm4WF7UCZzuytFTL13lIZelBOY7wolw//QO6VR1yI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ow1v3+59; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ow1v3+59"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-4633193af19so689590f8f.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 18 Jun 2026 05:30:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781785821; x=1782390621; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T87pQD65CNc83N4OFeqqd6eZRLgKX3mUIa9gwzpc18Q=;
        b=ow1v3+59uo2QsBnKmW/LupZ/GvGq+WhKFMJ6RXZbAaOh95RAOK6Wnp4Ns89PXT51mi
         piGjkOHn3M9jh6A03rzWHcAqKa+V64aHUuy2PLPVkCJggaAuRp2eP68scEXsqbqHPrlg
         vfgO2+w1y+AHtbMliiRFNCcE6s9ZlOm2UHRoAToGwnZB+8LbAhAMBPn63cYqxFL6l/pW
         gWKByRCHKItSQVtTPosmnZxqdAGPHabWVQvHdulanFM4Sqs8jnrYJLxEx2+L4G/Xxo3s
         0K0ayt5RXc6eqc7b+ng/hfVzur5Rz9eDif8Xycjg53G11GaOtXrM3t4BIB5J7GuqFRxH
         5zIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781785821; x=1782390621;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T87pQD65CNc83N4OFeqqd6eZRLgKX3mUIa9gwzpc18Q=;
        b=sXESAN8/clUAD+TnUUtz0rzDCZaaR7yBzHjRj/UyUAkKZe18g1HQuTNMFeAn9Ns7zA
         cp/Isk2BziG6EZkquxt+Um5jBtmTw18uQQpMNmMWKBhIm8i1HYf1VEw+SD5dLj5MI+Q0
         +R+hPisInxTL+AxT7fQDsmZP+8GreYhRDJWQMSkyj1Yw7o1eC/mU7ncGa7/ys3/DTrhQ
         T2pacgoIpOeWbYppiEXy4wbRcZiG6qLCRYnMUH8/ge9s+FPsfKTpBImiCgenqyxhgQce
         8Q2JIdY+yDDqcB1Le8ZLs0sHjlC/I4KMMpcIxvkun4eJVIX9XfbXQwutP0dF5OQzhDkb
         FNeg==
X-Forwarded-Encrypted: i=1; AFNElJ9kL+A5eor49vdP8qoNTY5wPjutYPc9N3OBfRu7cqvlMYcTiTfwl/TbXz4XIhuBdgyGHkGZQPtNMrNt4+DdqHhMEQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxil81wVfFi2kxCTPd89bIh5CFmFhZt41CYcTXgUORInnU9rrFD
	mMSQZVlKEGilxNdjNSluRBcSLqFUX61GVTk3rocpnkxxk/LL8xbEt1oJT2UOe9blNzbp71hoXsB
	zVXP2m5w=
X-Gm-Gg: AfdE7cnpfEgqfiLncFRe311EUGutiqCawNot0AAHG0aRMv0B3KJHdwaaKfRYvdpXsK7
	9hdWnHdTL9ljCfnq8iKrfpFkrKh1NNLhNW52A/OeznxsOEOX+QUfugJVnGK0eFP3RlZBvgGLFqz
	uylZ5lR/FzKCk8rhEkt+9sWzAObGijZrBIoVEuYfZ7zNmk8lRQ8NtvYnSNzTl3jzYV5CaKx+fr2
	IAGg8ktEjyJCaNP3BixPOY5R90YBTMi3I7oBkYBuOTFzxxTjQGk1Xs4/4ozIQVA5OMvSz1HgazT
	beIV2hC5lFdKyC0+UlGCFyBwa+cgvjfACWTOoL5YGX3yMjELoBMj83tdD/8qUnw/i8QLkc82R2O
	Qa4LwXK/79oZbm/um3h4AMtjxTyYXRhlHIS+RMrmtYJPrwrYz0fCQRfUNukw9u4kUEwo/Rmgr1Y
	eE8L20O9qnEGYDMx7KQzg8z9eWOCjA8AjTgBwOiQErK3awyP4HSF19maVlp8NXlxBeVQosxh+jQ
	4eQ
X-Received: by 2002:a05:6000:2405:b0:43f:dd91:b022 with SMTP id ffacd0b85a97d-4641d5554c1mr3156524f8f.35.1781785820908;
        Thu, 18 Jun 2026 05:30:20 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:6e1b:5a5:b2b5:b2c0? ([2a01:e0a:106d:1080:6e1b:5a5:b2b5:b2c0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46289c3b3a3sm14692642f8f.30.2026.06.18.05.30.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Jun 2026 05:30:20 -0700 (PDT)
Message-ID: <a8e62db4-716b-4d9f-abfa-4027bbe0f37b@linaro.org>
Date: Thu, 18 Jun 2026 14:30:19 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v7 2/2] drm: panel: add support for the Renesas R63419
 based dual-DSI video mode Display Panels
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Douglas Anderson <dianders@chromium.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 KancyJoe <kancy2333@outlook.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>
References: <20260605-topic-sm8650-ayaneo-pocket-s2-r63419-v7-0-b84b6da84293@linaro.org>
 <20260605-topic-sm8650-ayaneo-pocket-s2-r63419-v7-2-b84b6da84293@linaro.org>
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
In-Reply-To: <20260605-topic-sm8650-ayaneo-pocket-s2-r63419-v7-2-b84b6da84293@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Dmitry, Douglas, Jessica,

On 6/5/26 16:50, Neil Armstrong wrote:
> From: KancyJoe <kancy2333@outlook.com>
> 
> Implement support for the Renesas 63419 based dual-DSI video mode
> Display Panels found in the Ayaneo gaming handled devices.
> 
> Signed-off-by: KancyJoe <kancy2333@outlook.com>
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>   drivers/gpu/drm/panel/Kconfig                |  12 +
>   drivers/gpu/drm/panel/Makefile               |   1 +
>   drivers/gpu/drm/panel/panel-renesas-r63419.c | 366 +++++++++++++++++++++++++++
>   3 files changed, 379 insertions(+)
> 
<snip>

Could one of you get a look on this patch so I can reduce my backlog ?

Jessica, do you still be marked as DRM Panel reviewer ?

Thanks,
Neil
