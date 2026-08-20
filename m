Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5909147D472
	for <linux-renesas-soc@vger.kernel.org>; Thu, 20 Aug 2026 17:06:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787245573; cv=none; b=thQjaF/gRYa2ztx0UneEbTCt6Dp+yJSnfRHT+HF+2TQ0A9o4XjLF1F1Y08BTCDYd76kbYo+4c11G2qUjmDnklRVQSEfqGiZJq8FBAYdVaqVvhF9aPlfJMr6lMfOpkzs+IIwn7ZIHj+Ojjg1F8Vg1CXgIDwIAT3j7adakb6lii3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787245573; c=relaxed/simple;
	bh=s2lcFnu/Uj7kZhM6peVZ6x6b+Y7c35+ltIcEtK5cUCQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JQdvGfMz94nFFvkFT29Q+3yLSnHFP/JVqmKGq8hG8JX2LoWvxFMtS0beo/8oX8h2Y53A6RVeHGRbuwnD6AGASpFfntaxWPvbqFhD29K5kQquy3hlfDqZAfM1zXqBpUVAUIaGKXYmQkxG49F1z2Jv9pQdC1k9soDieLetbhgqhws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ZVblalLC; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=N1xxlcb3; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZVblalLC";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="N1xxlcb3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787245570;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Z4jxRAgmGu6qOONmDUji01BEYH0iTGQlpmgV/kwEyHw=;
	b=ZVblalLCIuB6Okcf7b4K3D7d0iYUV2VFrI6+kx80zmOooEAjQxVQZsIc4N7aETn4mTWuQy
	QEjMj7GE+4H5u1udeK2YLarQ9loKWR1QCf2XNfKYRfnaJ/hOLTv91jmgCY7mq9eRZO/O/S
	VkUJWHEIvjnS30CaDE1X944LVtVnA/Q=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-610-pH4pnFvcPwiczIZlhO4Y-g-1; Thu, 20 Aug 2026 13:06:03 -0400
X-MC-Unique: pH4pnFvcPwiczIZlhO4Y-g-1
X-Mimecast-MFC-AGG-ID: pH4pnFvcPwiczIZlhO4Y-g_1787245562
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-47f7039fa59so102766f8f.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 20 Aug 2026 10:06:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1787245562; x=1787850362; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z4jxRAgmGu6qOONmDUji01BEYH0iTGQlpmgV/kwEyHw=;
        b=N1xxlcb3iQWekdVQPoW3Wlsgjye7E2yM3fkxE3mAcyYvX/Lm+AuONV7aaQjTqK3WRK
         DzFQ7pkbDV8jqPKP66HWcF0Z40fIOwKoTNV37wJDQrklUbW9HVWpmHuPCe7NdnHKn7RT
         81VBLWU8jTSclSCnGlXWlB/41LlyWFWGkVoEu/5/gramD8obBN0XvENvSfTaGVhTNIbY
         Y1w8fPpXVDV2wR65ckTEEeDuh6iM9ChHNR78dd66DVxphslvL5Jr+Mvk73WGDLYfZFMV
         I42RlHYqwb4ObMmRCbwqzg3WJ2+LPn89Snfw2FT23w92iD9sHEKQlVaRynEgFPHBVGZU
         5HkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787245562; x=1787850362;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z4jxRAgmGu6qOONmDUji01BEYH0iTGQlpmgV/kwEyHw=;
        b=SGZwuDAwmuOUtfFz4CdYebxiyHT3i4RbQa2DmjmtavTCTUXm8yUWZt1dKbuinr6EYf
         rYplkwl1g1xCDSkSMzxSIdvrZDSLdOhk2UU5ErZqljOtnEyJ0iBak3V0n6fYVYfeXQLd
         LTvxbsvhaRwaLpPz8ZtJsVRl9vM5vKY/xzT+XgEd0Dpw8JxB+LptA8uPkQWd37QRAT4K
         r4F1pW4A7D7GMhACi5KYe/A8zAty70/+rBlWiJu4hu16J5/Rm1duRrlA7gEl87ke+Igl
         V1iBMj4Xo0jtbhrLzbEYBAxVJ//Hgc/qZmR0mIMaqe2fkbLYc8t4C7Ja1CavM36yUlIz
         Gvig==
X-Forwarded-Encrypted: i=1; AHgh+RoBGl2rbUKJv8pg3VBFIBNB3N+aULRtp6yPvepLVXzY6lJCN9Yyku5QpRBfnwKUN20sK07qSmA/nJn6NetrI8E/xg==@vger.kernel.org
X-Gm-Message-State: AFuF++kJsR0O59IQgpuMrcveJefNsrQXGgybGmbh3m0xOdknlWfXCrKS
	OfNbnhgkWrhSSUtuRJ88SdFyVQ7BInUWtsPTyOFa85pPgQAPidDk1FzAntlgSwV8E11y83OiUqS
	xBtqGyWj7/3CgxqS2sonvDlaA7JXlS4/cz2qFC52ch2vD7BIQwPiOLzIXadvLsUOpBpWP8qBA
X-Gm-Gg: AR+sD103NSJugrJvtacld02GZNxwXQGJIjRSGLypyiAGKWZPwK+ZiLD8rkYfRlteDMN
	9Xu9+vePxAKWfXQUC9uamCH1JDZmRXI+pHevdN0KASWRjbjElxxNp648ldfD/ZyaLD7RDTPqW1Z
	1eqlsrqhWdJ/hmqW6IvRM3yB64bd0tYF1awQWm1qpotKC7N5NPy+92Yoi0JwoAdbhcFDvF75Si/
	mUhUtxjJUH0t79dp+orzT5QBxH6b0oPVdgzdLABojTy0zOBSlfhMCOhNNXtGnfM58BSxm5X47fw
	AIa9g+7JBFVsW4qdPXl4XWdbi+T1h4V5dtT6hjZJdxGMCfaDHCYtHr+ybdf9bR3O/lOyIVGJugf
	pBIRJaidtMqyJKkOMBxorX7utR0kXlih5AVeib+UIc9Y5Hw==
X-Received: by 2002:a05:6000:25fe:b0:47f:86af:8fe7 with SMTP id ffacd0b85a97d-482c0ba220fmr134352f8f.22.1787245562160;
        Thu, 20 Aug 2026 10:06:02 -0700 (PDT)
X-Received: by 2002:a05:6000:25fe:b0:47f:86af:8fe7 with SMTP id ffacd0b85a97d-482c0ba220fmr134240f8f.22.1787245561785;
        Thu, 20 Aug 2026 10:06:01 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:11aa:87f0:935:4f8e:b423:64eb? ([2a01:e0a:11aa:87f0:935:4f8e:b423:64eb])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482b14cf0a3sm13674489f8f.32.2026.08.20.10.06.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Aug 2026 10:06:01 -0700 (PDT)
Message-ID: <5e7e0d9c-2fe2-4c0f-a854-1b1a495b1a7f@redhat.com>
Date: Thu, 20 Aug 2026 19:05:57 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/12] drm/panic: Return errno codes if panic output fails
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
 <20260818125012.468092-5-tzimmermann@suse.de>
Content-Language: en-US, fr
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20260818125012.468092-5-tzimmermann@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 18/08/2026 14:28, Thomas Zimmermann wrote:
> Return errno codes from the panic output helpers to detect invalid
> panic handling. Avoid flushing the display if an error ocured. The
> unflushed display output might be helpful in debugging.
> 
> For now, test the result values in the panic test cases. A later patch
> will add support for retrying failed panic output.

Thanks, it looks good to me.

Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   drivers/gpu/drm/drm_panic.c            | 41 +++++++++++++++++---------
>   drivers/gpu/drm/tests/drm_panic_test.c | 16 ++++++----
>   2 files changed, 37 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_panic.c b/drivers/gpu/drm/drm_panic.c
> index 96d238bfceee..594235661710 100644
> --- a/drivers/gpu/drm/drm_panic.c
> +++ b/drivers/gpu/drm/drm_panic.c
> @@ -478,7 +478,7 @@ static void drm_panic_logo_draw(struct drm_scanout_buffer *sb, struct drm_rect *
>   				   fg_color);
>   }
>   
> -static void draw_panic_screen_user(struct drm_scanout_buffer *sb)
> +static int draw_panic_screen_user(struct drm_scanout_buffer *sb)
>   {
>   	u32 fg_color = drm_draw_color_from_xrgb8888(CONFIG_DRM_PANIC_FOREGROUND_COLOR,
>   						    sb->format->format);
> @@ -489,7 +489,7 @@ static void draw_panic_screen_user(struct drm_scanout_buffer *sb)
>   	unsigned int msg_width, msg_height;
>   
>   	if (!font)
> -		return;
> +		return -EINVAL;
>   
>   	r_screen = DRM_RECT_INIT(0, 0, sb->width, sb->height);
>   	drm_panic_logo_rect(&r_logo, font);
> @@ -508,6 +508,8 @@ static void draw_panic_screen_user(struct drm_scanout_buffer *sb)
>   		drm_panic_logo_draw(sb, &r_logo, font, fg_color);
>   
>   	draw_txt_rectangle(sb, font, panic_msg, panic_msg_lines, true, &r_msg, fg_color);
> +
> +	return 0;
>   }
>   
>   /*
> @@ -547,7 +549,7 @@ static int draw_line_with_wrap(struct drm_scanout_buffer *sb, const struct font_
>    * Draw the kmsg buffer to the screen, starting from the youngest message at the bottom,
>    * and going up until reaching the top of the screen.
>    */
> -static void draw_panic_screen_kmsg(struct drm_scanout_buffer *sb)
> +static int draw_panic_screen_kmsg(struct drm_scanout_buffer *sb)
>   {
>   	u32 fg_color = drm_draw_color_from_xrgb8888(CONFIG_DRM_PANIC_FOREGROUND_COLOR,
>   						    sb->format->format);
> @@ -562,7 +564,7 @@ static void draw_panic_screen_kmsg(struct drm_scanout_buffer *sb)
>   	int yoffset;
>   
>   	if (!font || font->width > sb->width)
> -		return;
> +		return -EINVAL;
>   
>   	yoffset = sb->height - font->height - (sb->height % font->height) / 2;
>   
> @@ -589,6 +591,8 @@ static void draw_panic_screen_kmsg(struct drm_scanout_buffer *sb)
>   			start--;
>   		}
>   	}
> +
> +	return 0;
>   }
>   
>   #if defined(CONFIG_DRM_PANIC_SCREEN_QR_CODE)
> @@ -814,10 +818,11 @@ static int _draw_panic_screen_qr_code(struct drm_scanout_buffer *sb)
>   	return 0;
>   }
>   
> -static void draw_panic_screen_qr_code(struct drm_scanout_buffer *sb)
> +static int draw_panic_screen_qr_code(struct drm_scanout_buffer *sb)
>   {
>   	if (_draw_panic_screen_qr_code(sb))
>   		draw_panic_screen_user(sb);
> +	return 0;
>   }
>   #else
>   static void drm_panic_qr_init(void) {};
> @@ -888,23 +893,25 @@ static bool drm_panic_is_format_supported(const struct drm_format_info *format)
>   	return drm_draw_can_convert_from_xrgb8888(format->format);
>   }
>   
> -static void draw_panic_dispatch(struct drm_scanout_buffer *sb)
> +static int draw_panic_dispatch(struct drm_scanout_buffer *sb)
>   {
> +	int ret;
> +
>   	switch (drm_panic_type) {
>   	case DRM_PANIC_TYPE_KMSG:
> -		draw_panic_screen_kmsg(sb);
> +		ret = draw_panic_screen_kmsg(sb);
>   		break;
> -
>   #if IS_ENABLED(CONFIG_DRM_PANIC_SCREEN_QR_CODE)
>   	case DRM_PANIC_TYPE_QR:
> -		draw_panic_screen_qr_code(sb);
> +		ret = draw_panic_screen_qr_code(sb);
>   		break;
>   #endif
> -
>   	case DRM_PANIC_TYPE_USER:
>   	default:
> -		draw_panic_screen_user(sb);
> +		ret = draw_panic_screen_user(sb);
>   	}
> +
> +	return ret;
>   }
>   
>   static void drm_panic_set_description(const char *description)
> @@ -951,9 +958,15 @@ static void draw_panic_plane(struct drm_plane *plane, const char *description)
>   
>   	drm_panic_set_description(description);
>   
> -	draw_panic_dispatch(&sb);
> -	if (plane->helper_private->panic_flush)
> -		plane->helper_private->panic_flush(plane);
> +	ret = draw_panic_dispatch(&sb);
> +	if (!ret) {
> +		/*
> +		 * Only flush if we have a panic screen to display. Otherwise
> +		 * it's probably better to leave the display output as-is.
> +		 */
> +		if (plane->helper_private->panic_flush)
> +			plane->helper_private->panic_flush(plane);
> +	}
>   
>   	drm_panic_clear_description();
>   
> diff --git a/drivers/gpu/drm/tests/drm_panic_test.c b/drivers/gpu/drm/tests/drm_panic_test.c
> index ad2f3a2f93b6..fdd77b0cc54c 100644
> --- a/drivers/gpu/drm/tests/drm_panic_test.c
> +++ b/drivers/gpu/drm/tests/drm_panic_test.c
> @@ -30,7 +30,7 @@ struct drm_test_mode {
>   	const int width;
>   	const int height;
>   	const u32 format;
> -	void (*draw_screen)(struct drm_scanout_buffer *sb);
> +	int (*draw_screen)(struct drm_scanout_buffer *sb);
>   	const char *fname;
>   };
>   
> @@ -87,7 +87,7 @@ static void drm_test_panic_screen_user_map(struct kunit *test)
>   	const struct drm_test_mode *params = test->param_value;
>   	char *fb;
>   	int fb_size;
> -	int i;
> +	int i, ret;
>   
>   	sb->format = drm_format_info(params->format);
>   	fb_size = params->width * params->height * sb->format->cpp[0];
> @@ -102,7 +102,8 @@ static void drm_test_panic_screen_user_map(struct kunit *test)
>   	sb->height = params->height;
>   	sb->pitch[0] = params->width * sb->format->cpp[0];
>   
> -	params->draw_screen(sb);
> +	ret = params->draw_screen(sb);
> +	KUNIT_ASSERT_EQ(test, ret, 0);
>   
>   	for (i = 0; i < fb_size; i++)
>   		drm_panic_check_color_byte(test, fb[i]);
> @@ -119,7 +120,7 @@ static void drm_test_panic_screen_user_page(struct kunit *test)
>   {
>   	struct drm_scanout_buffer *sb = test->priv;
>   	const struct drm_test_mode *params = test->param_value;
> -	int fb_size, p, i, npages;
> +	int fb_size, p, i, npages, ret;
>   	struct page **pages;
>   	u8 *vaddr;
>   
> @@ -146,7 +147,8 @@ static void drm_test_panic_screen_user_page(struct kunit *test)
>   	sb->height = params->height;
>   	sb->pitch[0] = params->width * sb->format->cpp[0];
>   
> -	params->draw_screen(sb);
> +	ret = params->draw_screen(sb);
> +	KUNIT_ASSERT_EQ(test, ret, 0);
>   
>   	for (p = 0; p < npages; p++) {
>   		int bytes_in_page = (p == npages - 1) ? fb_size - p * PAGE_SIZE : PAGE_SIZE;
> @@ -182,6 +184,7 @@ static void drm_test_panic_screen_user_set_pixel(struct kunit *test)
>   {
>   	struct drm_scanout_buffer *sb = test->priv;
>   	const struct drm_test_mode *params = test->param_value;
> +	int ret;
>   
>   	sb->format = drm_format_info(params->format);
>   	sb->set_pixel = drm_test_panic_set_pixel;
> @@ -189,7 +192,8 @@ static void drm_test_panic_screen_user_set_pixel(struct kunit *test)
>   	sb->height = params->height;
>   	sb->private = test;
>   
> -	params->draw_screen(sb);
> +	ret = params->draw_screen(sb);
> +	KUNIT_ASSERT_EQ(test, ret, 0);
>   }
>   
>   static void drm_test_panic_desc(const struct drm_test_mode *t, char *desc)

