Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61AEF4854E2
	for <linux-renesas-soc@vger.kernel.org>; Thu, 24 Sep 2026 13:15:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790255753; cv=none; b=WJvSl5m0i5UoExH/xWmRsU3flAbbsECaVLkbTzyBUHv8+rsRlPK/9L1ba45dAgRN6ROnk37l3HxFF7DVkekM0D87oPGqgM3eYS8vWWYMRyKIK+zU/BHggHwk7lAXD++grLJSEnsUCofG1zcSjqvJOM9l1iCEgxtd42PZwQItdaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790255753; c=relaxed/simple;
	bh=EIWW0uIRj5E/AVBdjvDh6E1nEQM9QogOHLuBjVHOsyA=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=S3x4axtHuGHUI4NRhXcgRFkCt3/jaSv22TXHareGBcZVNd8js+7rSyLsbRNWWw93UUsypkkesgXLqZvSl8o5ha2YZQSDvExcdO7BLdnzzsw7uOuk2SakpSLxeDAAXig14ZVF+6Z7dWeK8ob588I2GhSBwOhDz+Devs9sn1QZJjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EdkZGmiJ; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EdkZGmiJ"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-48586861639so406988f8f.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 24 Sep 2026 06:15:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790255749; x=1790860549; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CtFgILpoGN9oew1GWkpWJvU0DfUxofN2O/h63lGOutA=;
        b=EdkZGmiJfUPy5sRdwsx/ZW8K6y25TET4IXJRFQWrNhbB725QZ2NAKB0sRAWfb3TzfO
         PmHN31Ze0vbaS2jZt5S0SNpKw7EvHYiIUWJ/pjfiIRpy9B7E0sANWlfkN8trY1/YfOlE
         /jQRvAc/HEijwF/Zu0eGi5Z6tIR95Vkt1bqj+x0ajGKtEo41CHSRTpfQ54dYFx13j2p4
         nuJ/vP0kdNSKu6a/C1cpXKr2HT/4B0T2Cl/Bpv25jmG1nXKZ8RZO32nHh5J4IDtQFfsK
         GEeZ8NvseLhX7t48jzp1Llj7EmZNKFPT5kTcrD6RIfRMigrCsZmeP46koWt8NWRNpPw9
         gz0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790255749; x=1790860549;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=CtFgILpoGN9oew1GWkpWJvU0DfUxofN2O/h63lGOutA=;
        b=qg1yR5dpehrxPTiyGQ1W8xHAQYZvQ0WE06Yz4kh5M8ZzLu1RNaBde4VO4A6L5spGh2
         +Ep8/CN7ufB1Pdgl23RHA0qKNVIZ11I08sXwVY4bX9LSYPchFwj0uHZ155oVO4TuLddW
         eQpJF50HGzt/XmSdjai3kPE9PvkC0Y6Z0SqaR+wDLMxk3GGszd6tlDyfjuxukK8n5xYm
         A1KlY5ZwVMSOWL69qNdYfv+99eI9y/sgyNQnzE6pNxTwY5mqS4yriWn04tm8/pBI8W07
         w0mAlckfFJlC6H3ZFYumiNd12IA6PoWnAZrq6w+HFO3Bzvk2wpqoKfQx06B1Xeha0Y3D
         jL+A==
X-Forwarded-Encrypted: i=1; AKwUvBw8VGMj+o6KDGSCsUOBRiS6TCSUIbwT6mwQ93fOfR0J4w7mgKhRZzhBCcmF3eRmFTWFtQkrda8+r2BpHD/DZER6PQ==@vger.kernel.org
X-Gm-Message-State: AFuF++lM54Z1tZ7rkUqcdRBwZzF7Xpy9zGyXgE1ZPOz/1C+31By/kjfi
	FJL6rghsEZYRZh9c2XJu0Ppej4ZvkuBFf4ytyHtd03HCAGoy8qjO/Q1rxS/fWPKKDkoIEcNY4Py
	dcyJWT+M=
X-Gm-Gg: AYBFou3SlZwtglGsDgFM4x0zRmoR/hRYjmiXitSLDTgQo56urd1A5kejBuAc4LaSWnw
	GCZaq/b7Odwg94hqYNgILwl12v6q+3KrdQfdGpWLFtbH5klm8mikSBzBb3x8QTphuSIBO9D1dvK
	BKZ510FrsBKDU/qSIbgysUQiAaIYdZtLMM3mzq7Wsf244rnPLilW11xmgUaGyKV6EsRmEF3NjpS
	TU6FMMZ56nkBBb+Sgu9M54w8dW4PDH2WYGX2DWe4OeyHcKW87T6z2ua8rzmcENGTD3jDlPguTp7
	J/A2EbXRHrz4OqFolp/W17yN8PP+eI4D2rtS1LlHqmzAWFxGs3GDUeX0z6KgKhD5sDR/3b2IlFm
	wje7J15bnPXX9Prbu6DZXQYhf0SssqU450wv7SXpqoodjrvDCYXhWI6CTDjqs+1KCv1NgY0tu3u
	pNm83QQLg5epuRZkJCvhM1e87LbNjaTCEMt0tyUEExgGXn7jnVFsgCF6m6u70w99ll+zovVhVVE
	Lbvnt92GsHkaCt/dIpCoNDCC3ONwEbToJz/V+mJ4WfSY+pMrZMNlg==
X-Received: by 2002:a05:6000:25fb:b0:487:25:71c7 with SMTP id ffacd0b85a97d-488716b96cemr4930011f8f.12.1790255749477;
        Thu, 24 Sep 2026 06:15:49 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:336e:a1a0:8f96:9f7a? ([2a01:e0a:106d:1080:336e:a1a0:8f96:9f7a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48868886e45sm14944343f8f.31.2026.09.24.06.15.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Sep 2026 06:15:47 -0700 (PDT)
Message-ID: <bb71b2d6-2462-4351-b6e8-ae8785a24c11@linaro.org>
Date: Thu, 24 Sep 2026 15:15:46 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v3 2/4] drm/panel: ilitek-ili9882t: Make enable GPIO
 optional
To: Marek Vasut <marek.vasut+renesas@mailbox.org>,
 dri-devel@lists.freedesktop.org
Cc: Conor Dooley <conor+dt@kernel.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 David Airlie <airlied@gmail.com>, Jessica Zhang <jesszhan0024@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Rob Herring <robh@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <20260910181918.31551-1-marek.vasut+renesas@mailbox.org>
 <20260910181918.31551-2-marek.vasut+renesas@mailbox.org>
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
In-Reply-To: <20260910181918.31551-2-marek.vasut+renesas@mailbox.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/10/26 20:18, Marek Vasut wrote:
> The enable GPIO may not be accessible on the panel, make it optional.
> This is the case on 10" Raspberry Pi Touch Display 2.
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
> V2: No change
> V3: No change
> ---
>   drivers/gpu/drm/panel/panel-ilitek-ili9882t.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-ilitek-ili9882t.c b/drivers/gpu/drm/panel/panel-ilitek-ili9882t.c
> index d4b383138488a..69f6427bb4ffb 100644
> --- a/drivers/gpu/drm/panel/panel-ilitek-ili9882t.c
> +++ b/drivers/gpu/drm/panel/panel-ilitek-ili9882t.c
> @@ -787,7 +787,7 @@ static int ili9882t_add(struct ili9882t *ili)
>   	if (IS_ERR(ili->pp1800))
>   		return PTR_ERR(ili->pp1800);
>   
> -	ili->enable_gpio = devm_gpiod_get(dev, "enable", GPIOD_OUT_LOW);
> +	ili->enable_gpio = devm_gpiod_get_optional(dev, "enable", GPIOD_OUT_LOW);
>   	if (IS_ERR(ili->enable_gpio)) {
>   		dev_err(dev, "cannot get enable-gpios %ld\n",
>   			PTR_ERR(ili->enable_gpio));

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil
