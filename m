Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBB9F47D94B
	for <linux-renesas-soc@vger.kernel.org>; Thu, 20 Aug 2026 17:10:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787245831; cv=none; b=apr0X8q/pBy0plqiuxdF3cuyIDUNNeg+nXsHENbSTks00gQtu1zknNR4nMKS7+Un+U6fAXr3TtnVsElWgagDoe93kdnymH/XQVecwsWbkuyFwfHKs4CgJVT8t8WZ9LhU4ZU/qiWETqhxGVY3PYgu0WVHeWvQMTwCmeW+lb29NW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787245831; c=relaxed/simple;
	bh=jnaTZjotwBm1xZ9HP6h3dDXEkOJupBhQaF95iCJctKs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YbNeDpSlzuVZrsTsgSW2vOkbdCChGHPAaZrYHWTNgR71+LHkTAHvh5dyjLEhjPrLP5Gct+DT2jr0fqjWDYat3y3ziDmDVZ4W3RK+Lz96zi2Yr8InVpNDx4ukaIF8Pgm3LHjw0L+x/zQ4vUl/c3nd+JclScj9FQ77XcXSLhwufyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=OPbrRkX/; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=YRwfUuaW; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="OPbrRkX/";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="YRwfUuaW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787245828;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8RFOFNhe8dD42ULPXJPC0m4cGSa+x0bKLYsWhLafPUQ=;
	b=OPbrRkX/W5YBByQZTjbwSpk8NXt+rRNjJei4Jrd2DKT51eZASCLPitOOBs47tbl/Em1OKs
	v+r2pDVTl+Jh1sn5IxSv7/hmH2N6LwjVhook6McpoNIeF0/GkO5Hx2Zyvg+OeaPYrftCYg
	2rySFr26ffIuryBbA8F9FwSO8IwjfmQ=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-537-yB5kAnDBOoKDJrvtpiiS7A-1; Thu, 20 Aug 2026 13:10:25 -0400
X-MC-Unique: yB5kAnDBOoKDJrvtpiiS7A-1
X-Mimecast-MFC-AGG-ID: yB5kAnDBOoKDJrvtpiiS7A_1787245825
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-482b88653d9so90620f8f.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 20 Aug 2026 10:10:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1787245824; x=1787850624; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8RFOFNhe8dD42ULPXJPC0m4cGSa+x0bKLYsWhLafPUQ=;
        b=YRwfUuaWUO/q0wEaPo/Xvgx/qN3eWzJhChFieUKhzmGnspZmZxgrQuFwd7RBDAz29H
         +s6F91I6XSdOjh34EcTFC49ZiJtO5L29sK01l9TWMvbyIpsS8pCmQDc1uSrOC6ety73j
         0Vo6lweAiCjHtgEly1yYZIV9RTXITE02bQl020Io15Wh00K1ScyJroZ+iNu+vmVCOaCH
         q2NRQnYadkFZZvoPLYpSUTDT2TA9F2mhLWIXFJckR9iLKqx5p+saUXVWMAyUGvC0AnGn
         KCOMyZKrthSpZPoaaIW615OuyzIcjjqpLmTUtw0xG/F2jJ0ENHmiq8s2tc65SJfIkD7U
         gXJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787245824; x=1787850624;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8RFOFNhe8dD42ULPXJPC0m4cGSa+x0bKLYsWhLafPUQ=;
        b=sFaEbbcDrgD6tCUA/sd1IKdO7MBNqgFtyunb0DV/0Tvi9EbkPvSevHExKtPY5FI4dQ
         FdJEx33Xi46qSjNp1nXZjBNV0sfK7pKGQP2cq9/gaGVzU0EXaGr1m8Ry2d3xuxK4EhCR
         C72zw6kqRVbWK03Tdyn8jT9TAn1XjG23eNe0SazIqmlXZU4IirjztWN5m5sNbG5EH+Uz
         Co5xiIchM1C0YDPK7VTZITU2hXXM8PGxl58INlU8Jc8QR0HmwQhgUolmUC9yZQTQWisL
         nDiXLppqNvVYMdGWR/sxSM73H8JSQnm4/addulsc13RbnusMYx5V9ggoGr0tGlifIMSU
         5JKQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr82J2F4NPmmw7aBuUETARUQgHf0VYctiMRWUsEK7ajca6cnB6FPc4QuzotNfZoQC5mXY5t3d+zBy4lkHv0vrnDKA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxeuRxJpKqPsIgNA9jD1uow/rSzQA5+QHgvENbQsQ0XUEDCDhsJ
	EU9vuUhsfitDbxzVUYPnFHzW8raOwNiJl2vkpj0tI3100cVNrkGrw3TJsHEICZdl+OGyEgPkDg0
	pmyDJne11S3lWCFuXzhBflfp+R1s2/WozIHgSZuzcb/T+GMpu3Wrwnucm8V/LckbNt+r9Ve1k
X-Gm-Gg: AR+sD12tAjmRhq9kk/F7fVsltJMH6qMGEsoJQD72NYTNb4swX/MD38i4j6Anj87ms5A
	f0ZtvIvMXxTePaf0Yoa04dtAmmzNnEqV3bWR+1f1wNpFaImisdGqxrLYVVPGzAAPiCtqQBV2VLt
	1iWrZ4u2W9KAiiOaEh7w0VfjQG7FL1wMbF8dz9TqIriZBGJ5MUbDXXSX1SQW3ZO0YoWKn1dytJr
	nPavyEsJ63fxT5scgDNZgHa1NbWZDwkm2GrFv+rScSZr/jGepn0zWDCcLGY9LNBIqVH1iUh4rg1
	ZmVAYDJd+fG1wrRD0PbFQ4r7vCf8Z806AAeZOEcCvw5GwM2m6rNIdfUxyYc4qndojKF8ucTbe64
	RPk7C4AWh03i2hbssUPCnmlhwuJjfXPAX826YdrHRa3hggw==
X-Received: by 2002:a05:600c:4744:b0:499:93b3:91ea with SMTP id 5b1f17b1804b1-499b831c0b1mr6516125e9.15.1787245824354;
        Thu, 20 Aug 2026 10:10:24 -0700 (PDT)
X-Received: by 2002:a05:600c:4744:b0:499:93b3:91ea with SMTP id 5b1f17b1804b1-499b831c0b1mr6515045e9.15.1787245823921;
        Thu, 20 Aug 2026 10:10:23 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:11aa:87f0:935:4f8e:b423:64eb? ([2a01:e0a:11aa:87f0:935:4f8e:b423:64eb])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499a9e805a4sm169531595e9.4.2026.08.20.10.10.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Aug 2026 10:10:23 -0700 (PDT)
Message-ID: <deba971f-7f8b-4c91-86c5-e3cf0e3c4bdd@redhat.com>
Date: Thu, 20 Aug 2026 19:10:19 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/12] drm/panic: Pass global module parameters to
 drm_panic_dispatch()
To: Thomas Zimmermann <tzimmermann@suse.de>, javierm@redhat.com,
 airlied@gmail.com, simona@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org
Cc: dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 linux-hyperv@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, nouveau@lists.freedesktop.org,
 linux-renesas-soc@vger.kernel.org, virtualization@lists.linux.dev,
 sashiko-reviews@lists.linux.dev
References: <20260818125012.468092-1-tzimmermann@suse.de>
 <20260818125012.468092-7-tzimmermann@suse.de>
Content-Language: en-US, fr
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20260818125012.468092-7-tzimmermann@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 18/08/2026 14:28, Thomas Zimmermann wrote:
> Set the panic type and QR version in draw_panic_plane() as a single
> point of truth. Pass the values into the individual drawing functions.
> 
> In the test case, always create a QR code with version 40 (i.e., the
> highest supported version).

Thanks, it looks good to me.

Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>

> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   drivers/gpu/drm/drm_panic.c            | 39 ++++++++++++++++----------
>   drivers/gpu/drm/tests/drm_panic_test.c |  2 +-
>   2 files changed, 25 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_panic.c b/drivers/gpu/drm/drm_panic.c
> index ede620b27515..12c39217cbcb 100644
> --- a/drivers/gpu/drm/drm_panic.c
> +++ b/drivers/gpu/drm/drm_panic.c
> @@ -657,7 +657,7 @@ static void drm_panic_qr_exit(void)
>   	stream.workspace = NULL;
>   }
>   
> -static int drm_panic_get_qr_code_url(u8 **qr_image)
> +static int drm_panic_get_qr_code_url(u8 **qr_image, unsigned int qr_version)
>   {
>   	struct kmsg_dump_iter iter;
>   	char url[256];
> @@ -672,7 +672,7 @@ static int drm_panic_get_qr_code_url(u8 **qr_image)
>   		return -EINVAL;
>   	url_len = ret;
>   
> -	max_qr_data_size = drm_panic_qr_max_data_size(panic_qr_version, url_len);
> +	max_qr_data_size = drm_panic_qr_max_data_size(qr_version, url_len);
>   	max_kmsg_size = min(MAX_ZLIB_RATIO * max_qr_data_size, sizeof(qrbuf1));
>   
>   	/* get kmsg to buffer 1 */
> @@ -718,11 +718,11 @@ static int drm_panic_get_qr_code_url(u8 **qr_image)
>   				     qrbuf1, sizeof(qrbuf1));
>   }
>   
> -static int drm_panic_get_qr_code_raw(u8 **qr_image)
> +static int drm_panic_get_qr_code_raw(u8 **qr_image, unsigned int qr_version)
>   {
>   	struct kmsg_dump_iter iter;
>   	size_t kmsg_len;
> -	size_t max_kmsg_size = min(drm_panic_qr_max_data_size(panic_qr_version, 0),
> +	size_t max_kmsg_size = min(drm_panic_qr_max_data_size(qr_version, 0),
>   				   sizeof(qrbuf1));
>   
>   	kmsg_dump_rewind(&iter);
> @@ -735,19 +735,20 @@ static int drm_panic_get_qr_code_raw(u8 **qr_image)
>   				     qrbuf2, sizeof(qrbuf2));
>   }
>   
> -static int drm_panic_get_qr_code(u8 **qr_image)
> +static int drm_panic_get_qr_code(u8 **qr_image, unsigned int qr_version)
>   {
>   	if (strlen(CONFIG_DRM_PANIC_SCREEN_QR_CODE_URL) > 0)
> -		return drm_panic_get_qr_code_url(qr_image);
> +		return drm_panic_get_qr_code_url(qr_image, qr_version);
>   	else
> -		return drm_panic_get_qr_code_raw(qr_image);
> +		return drm_panic_get_qr_code_raw(qr_image, qr_version);
>   }
>   
>   /*
>    * Draw the panic message at the center of the screen, with a QR Code
>    */
>   static int _draw_panic_screen_qr_code(struct drm_scanout_buffer *sb,
> -				      u32 fg_color, u32 bg_color)
> +				      u32 fg_color, u32 bg_color,
> +				      unsigned int qr_version)
>   {
>   	const struct font_desc *font = get_default_font(sb->width, sb->height, NULL, NULL);
>   	struct drm_rect r_screen, r_logo, r_msg, r_qr, r_qr_canvas;
> @@ -774,7 +775,7 @@ static int _draw_panic_screen_qr_code(struct drm_scanout_buffer *sb,
>   
>   	max_qr_size = min(3 * sb->width / 4, 3 * sb->height / 4);
>   
> -	qr_width = drm_panic_get_qr_code(&qr_image);
> +	qr_width = drm_panic_get_qr_code(&qr_image, qr_version);
>   	if (qr_width <= 0)
>   		return -ENOSPC;
>   
> @@ -816,9 +817,11 @@ static int _draw_panic_screen_qr_code(struct drm_scanout_buffer *sb,
>   	return 0;
>   }
>   
> -static int draw_panic_screen_qr_code(struct drm_scanout_buffer *sb, u32 fg_color, u32 bg_color)
> +static int draw_panic_screen_qr_code(struct drm_scanout_buffer *sb,
> +				     u32 fg_color, u32 bg_color,
> +				     unsigned int qr_version)
>   {
> -	if (_draw_panic_screen_qr_code(sb, fg_color, bg_color))
> +	if (_draw_panic_screen_qr_code(sb, fg_color, bg_color, qr_version))
>   		draw_panic_screen_user(sb, fg_color, bg_color);
>   	return 0;
>   }
> @@ -891,17 +894,18 @@ static bool drm_panic_is_format_supported(const struct drm_format_info *format)
>   	return drm_draw_can_convert_from_xrgb8888(format->format);
>   }
>   
> -static int draw_panic_dispatch(struct drm_scanout_buffer *sb, u32 fg_color, u32 bg_color)
> +static int draw_panic_dispatch(struct drm_scanout_buffer *sb, enum drm_panic_type panic_type,
> +			       u32 fg_color, u32 bg_color, unsigned int qr_version)
>   {
>   	int ret;
>   
> -	switch (drm_panic_type) {
> +	switch (panic_type) {
>   	case DRM_PANIC_TYPE_KMSG:
>   		ret = draw_panic_screen_kmsg(sb, fg_color, bg_color);
>   		break;
>   #if IS_ENABLED(CONFIG_DRM_PANIC_SCREEN_QR_CODE)
>   	case DRM_PANIC_TYPE_QR:
> -		ret = draw_panic_screen_qr_code(sb, fg_color, bg_color);
> +		ret = draw_panic_screen_qr_code(sb, fg_color, bg_color, qr_version);
>   		break;
>   #endif
>   	case DRM_PANIC_TYPE_USER:
> @@ -951,6 +955,11 @@ static void draw_panic_plane(struct drm_plane *plane, const char *description)
>   #else
>   	u32 bg_color = 0x00000000;
>   #endif
> +#if IS_ENABLED(CONFIG_DRM_PANIC_SCREEN_QR_CODE)
> +	unsigned int qr_version = panic_qr_version;
> +#else
> +	unsigned int qr_version = 0;
> +#endif
>   
>   	if (!drm_panic_trylock(plane->dev, flags))
>   		return;
> @@ -966,7 +975,7 @@ static void draw_panic_plane(struct drm_plane *plane, const char *description)
>   
>   	drm_panic_set_description(description);
>   
> -	ret = draw_panic_dispatch(&sb, fg_color, bg_color);
> +	ret = draw_panic_dispatch(&sb, drm_panic_type, fg_color, bg_color, qr_version);
>   	if (!ret) {
>   		/*
>   		 * Only flush if we have a panic screen to display. Otherwise
> diff --git a/drivers/gpu/drm/tests/drm_panic_test.c b/drivers/gpu/drm/tests/drm_panic_test.c
> index 969a096ec840..196496238d23 100644
> --- a/drivers/gpu/drm/tests/drm_panic_test.c
> +++ b/drivers/gpu/drm/tests/drm_panic_test.c
> @@ -58,7 +58,7 @@ static int draw_panic_screen_kmsg_default(struct drm_scanout_buffer *sb)
>   #if IS_ENABLED(CONFIG_DRM_PANIC_SCREEN_QR_CODE)
>   static int draw_panic_screen_qr_code_default(struct drm_scanout_buffer *sb)
>   {
> -	return draw_panic_screen_qr_code(sb, 0x00ffffff, 0x00000000);
> +	return draw_panic_screen_qr_code(sb, 0x00ffffff, 0x00000000, 40);
>   }
>   #endif
>   

