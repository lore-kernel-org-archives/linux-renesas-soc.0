Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39AB5478846
	for <linux-renesas-soc@vger.kernel.org>; Thu, 20 Aug 2026 17:12:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787245966; cv=none; b=QKosWHtDJJaC1gEBZuJezLP5FrSd9e2s0CA5mr2c+cNvtih/tsCaNj7+w4XHffE/EfyBskIAkVEhR8hLapa4v+QE6mNNIBb2W2LUrQdFkPXV9SsJa6Yt2B/pcYD05y138P25neavOYQ4WkvPTMJJp/HOw/0GxcTC+SlWW68phZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787245966; c=relaxed/simple;
	bh=9tk8Sl/tU+k06lyjB+gI117CsAuIPPkNt46ArevX/WA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YsQJ8Q2+XXDXc0QGIFRSTP0s+rZXzN1YPlpkkBKb7IGw6+ZFjRf+F7Amcgpbr64nsdo35Z3lLJOywaInTVzs7hQlLfaeqhgAMKc3OTLOlwtWVIZSfGVt0ZXoEFTRlTf0S/4f/Z4xczrpdQxGlz3rJmqveGB+bWutPa/H3xmhOas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=MB95tA0k; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=q2ZIEt0n; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="MB95tA0k";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="q2ZIEt0n"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787245964;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EM5PkmngzWPW5YVaOcE4doFSUi3DdsSPp8p0edYyrwQ=;
	b=MB95tA0kSm/DzqgLDbcjacsn/i2D4iPtbg3PFM2VLK9WSAP4Ajxo+Cy8MYgkAsfJwZEJ52
	MX5QK0J/SjdCgQShzWcaO6IbVSuxndH1P2ZV/eEEUVEqHqkTDMq+R8IoZvPsdavpjWpR3y
	kETTKZ4McQrkv+W35O6eGcdga+wZ2rg=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-58--3f_TMYGMJCF9i1H7ZuTsg-1; Thu, 20 Aug 2026 13:12:43 -0400
X-MC-Unique: -3f_TMYGMJCF9i1H7ZuTsg-1
X-Mimecast-MFC-AGG-ID: -3f_TMYGMJCF9i1H7ZuTsg_1787245962
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-495529a93f9so544475e9.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 20 Aug 2026 10:12:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1787245962; x=1787850762; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EM5PkmngzWPW5YVaOcE4doFSUi3DdsSPp8p0edYyrwQ=;
        b=q2ZIEt0nRbPcvu+1vCsU7hVwqj28ogQpcSJSqf4PmiQJeG+u5zo0THr5xRc2ynHF5c
         Ww1EEaD7Ityn0PsWh+ZpNzt83+k4W3vuMPo9MYK2gDMgE//rMff6wS55Y0rB1qsxxzu0
         RGY4cK0RswCIn1SiBOf48snf94jmAZxwOrixTHbZXI8T1yYot0iqmkFtoPhFDaysVSsB
         MnvM1c/Ft+IO/AmcxJiMsm6MiYXMlit2YFBel6/+0q93+O6hs+eBeCgXmySrS0ygZX84
         LJz1he6KsETFZcvfu9NJQ4MAl8BYp9W+NbraP6UhApI1F9GhVOTC00pOOoZ9d3MaRPw4
         I9Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787245962; x=1787850762;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EM5PkmngzWPW5YVaOcE4doFSUi3DdsSPp8p0edYyrwQ=;
        b=HCTXc8uRcQDO0YLzuaxC17AxOmWxPN3qPTxi+6aDrsnRa39XIAqZ3im2EyDUCSKwE2
         Fqt7dyC29sEblxMp/EsYKJOlxIuVrcp5U/zdT5ibyvMdz4yqJnIPcgO1h55w3oAEyex0
         HEv7a/GQqcP5nRBREq86shvhw4bQM9iwGIZt42gLcV3mlX+uIE2xJ6ZaiqGKLBST5ePL
         o0gOkXR1lTrtCgEDVlOvsWf8e5tJvlw8KOLb7iMTyfpSh239wg3Nw5WEMJKG0igIpoLX
         rW93R3BT9lBNTs9wz3D7gXBz9VIXjKQ46ZimGdbyw97f5lpOpqF8qiipNdR0+Qgza8rO
         aHzA==
X-Forwarded-Encrypted: i=1; AHgh+RoiSWoceYryikT4UP4Qs5dw01pRbo2PnCon+LcKROVi/PUYWtOhVjgug2Yd8PT/SiICBvnbFAgZkvKHViPdLYn0yQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw304fecJ8bzJaIOGspoupjKHju4d6PW6iNdsNsbyBvR33dJ/tl
	nWM1xgXuU6CN95oq5o+Z4N+izNkgN8QlVreNrfxxrXqJW0wdlBrQ+b93Skb7tfKAvz6/eBs6/4m
	WgXfUdC+YcSy1CGbIA3XGXbjBgaUbmSFgMktAV+6NzYmE9c12MVuuhGFlPuQp6QquXOpA130x
X-Gm-Gg: AR+sD12TBq5IJ6qgPVVBTAnGBWI+TjeyaJPP5oJ8c6L5kQysYUZEdaUwHDCJy0rUUak
	o6ZSlLFtcse6/MhNS8CBz5onzW6US3ltr28Y5C6sxmPk3dh/xWm0kerSYoM4QD1Ds4Kk+wQVS19
	/qUL4s3ZWy6AsBevxS3ERcVwm2iA8WraFZMrRnbnMV+zb6gc3sVJ0a+VkeBs2uGLO0H91GrVBvm
	MkqkW7jFH7mO81gPrEqgRPDFwiRP/fGAGqse6wfFxlOxpIadY4IJDKB/svpu+GfHevF7oL60S7y
	EH2FR3MxK3XJ3W2JIBU8gKw3cBvv4EKA+b7N4y2YuLdMW54vc7elOx3NKkgOp5OX7XVCegorw85
	TrbRi1NEnWw5w7Bnqv1pYJ+jTUk9mtVRj1/2+mWGsPXrjDg==
X-Received: by 2002:a05:600c:8819:b0:499:8aff:59b6 with SMTP id 5b1f17b1804b1-499b8301c54mr7853175e9.14.1787245961732;
        Thu, 20 Aug 2026 10:12:41 -0700 (PDT)
X-Received: by 2002:a05:600c:8819:b0:499:8aff:59b6 with SMTP id 5b1f17b1804b1-499b8301c54mr7852145e9.14.1787245961316;
        Thu, 20 Aug 2026 10:12:41 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:11aa:87f0:935:4f8e:b423:64eb? ([2a01:e0a:11aa:87f0:935:4f8e:b423:64eb])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499aa17fc80sm168153685e9.14.2026.08.20.10.12.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Aug 2026 10:12:40 -0700 (PDT)
Message-ID: <b332e4f1-30a8-40b1-bdd5-f0c3f816c229@redhat.com>
Date: Thu, 20 Aug 2026 19:12:37 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/12] drm/panic: Retry in dispatch function if panic
 output fails
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
 <20260818125012.468092-8-tzimmermann@suse.de>
Content-Language: en-US, fr
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20260818125012.468092-8-tzimmermann@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 18/08/2026 14:28, Thomas Zimmermann wrote:
> On failed output of QR codes and kmsg buffers, fall back to a user
> message. QR-code output already did this internally, but now formally
> support it in drm_panic_dispatch(). Streamlines the existing logic.
> 
> Also pass module parameter drm_panic_type as a parameter to
> drm_panic_dispatch(). This simpifies the implementation. It will later
> allow for moving the function into a helper library.

Thanks, it looks good to me.

Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   drivers/gpu/drm/drm_panic.c | 24 ++++++++++++------------
>   1 file changed, 12 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_panic.c b/drivers/gpu/drm/drm_panic.c
> index 12c39217cbcb..0960750bfce2 100644
> --- a/drivers/gpu/drm/drm_panic.c
> +++ b/drivers/gpu/drm/drm_panic.c
> @@ -746,9 +746,9 @@ static int drm_panic_get_qr_code(u8 **qr_image, unsigned int qr_version)
>   /*
>    * Draw the panic message at the center of the screen, with a QR Code
>    */
> -static int _draw_panic_screen_qr_code(struct drm_scanout_buffer *sb,
> -				      u32 fg_color, u32 bg_color,
> -				      unsigned int qr_version)
> +static int draw_panic_screen_qr_code(struct drm_scanout_buffer *sb,
> +				     u32 fg_color, u32 bg_color,
> +				     unsigned int qr_version)
>   {
>   	const struct font_desc *font = get_default_font(sb->width, sb->height, NULL, NULL);
>   	struct drm_rect r_screen, r_logo, r_msg, r_qr, r_qr_canvas;
> @@ -816,15 +816,6 @@ static int _draw_panic_screen_qr_code(struct drm_scanout_buffer *sb,
>   	drm_panic_blit(sb, &r_qr, qr_image, qr_pitch, scale, fg_color);
>   	return 0;
>   }
> -
> -static int draw_panic_screen_qr_code(struct drm_scanout_buffer *sb,
> -				     u32 fg_color, u32 bg_color,
> -				     unsigned int qr_version)
> -{
> -	if (_draw_panic_screen_qr_code(sb, fg_color, bg_color, qr_version))
> -		draw_panic_screen_user(sb, fg_color, bg_color);
> -	return 0;
> -}
>   #else
>   static void drm_panic_qr_init(void) {};
>   static void drm_panic_qr_exit(void) {};
> @@ -899,13 +890,22 @@ static int draw_panic_dispatch(struct drm_scanout_buffer *sb, enum drm_panic_typ
>   {
>   	int ret;
>   
> +retry:
>   	switch (panic_type) {
>   	case DRM_PANIC_TYPE_KMSG:
>   		ret = draw_panic_screen_kmsg(sb, fg_color, bg_color);
> +		if (ret) {
> +			panic_type = DRM_PANIC_TYPE_USER;
> +			goto retry;
> +		}
>   		break;
>   #if IS_ENABLED(CONFIG_DRM_PANIC_SCREEN_QR_CODE)
>   	case DRM_PANIC_TYPE_QR:
>   		ret = draw_panic_screen_qr_code(sb, fg_color, bg_color, qr_version);
> +		if (ret) {
> +			panic_type = DRM_PANIC_TYPE_USER;
> +			goto retry;
> +		}
>   		break;
>   #endif
>   	case DRM_PANIC_TYPE_USER:

