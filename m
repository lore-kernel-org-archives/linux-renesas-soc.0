Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35B6E47F77E
	for <linux-renesas-soc@vger.kernel.org>; Thu, 20 Aug 2026 17:15:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787246146; cv=none; b=CUvSyOC4DY4zafh5QVCx0Gjz2TQULmCHoUkv4/Q6iVRnfXDE/WRPleyqIbtlUVBI+g+pdOSWK6Z2eJYOnSHZ8G4LMZlu4eI3BycOktmrss8t/GDkW0tC5bIeTsblV53rslA7fO8ejpIE58tIqC7H7BpkT27tFwTeFbtFxzUo6Gc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787246146; c=relaxed/simple;
	bh=9tk8Sl/tU+k06lyjB+gI117CsAuIPPkNt46ArevX/WA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aJ0ONZNIvUH3HlgZUykGpvIUPU6SKjpzbP1H2m2Uod99kxZEyNa7DTpDJ0XzMkpBY2Lk/1ybTH4W+nVLMDv3rOZqwgs+YdT5+cGmfaKY0P0hYJgsh/pDSIhOACSdKCegWxtDn79SaVmHxDAAUSSXGEqAQm4mACjRLSO7ewbxEWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=D1gwD+sR; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=WYRy9Gkb; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="D1gwD+sR";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="WYRy9Gkb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787246144;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EM5PkmngzWPW5YVaOcE4doFSUi3DdsSPp8p0edYyrwQ=;
	b=D1gwD+sRZaYTghvGsT4EXwVi3RNJ2qL7tXeQnOYKK/pItTPGVnl0vVQAUCAxEZGwDJpipi
	PPJqV1ovKWLvppF4boKj1aHQ0CH8Nqxw4/OaYj4m+uhHv6PNlZuKwdo0CBkUbcPlKkG82X
	T9qcSm7ZBCknLKzsbkm5+0I15oGuGeE=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-149-x9Kn1kbSNJyyuRj_WKjvzw-1; Thu, 20 Aug 2026 13:15:31 -0400
X-MC-Unique: x9Kn1kbSNJyyuRj_WKjvzw-1
X-Mimecast-MFC-AGG-ID: x9Kn1kbSNJyyuRj_WKjvzw_1787246130
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-49554715277so437215e9.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 20 Aug 2026 10:15:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1787246130; x=1787850930; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EM5PkmngzWPW5YVaOcE4doFSUi3DdsSPp8p0edYyrwQ=;
        b=WYRy9Gkb1rjGQdmeEiCJfgTY1e93MBXxbD8jBmNBGWmP9btJUyY9cr9P11CMu8zJ2d
         9cAcL4SbipaIgiFRWbX6Zpkmr/waNWWVYviq3jcv+4P2ixnL85ea1JG3+K4OgUe15BD8
         6YATsaMHrRXyuIIYSOyx5GX7twQGXlz/te0WwX339foKU8MR9A+6q1vEltQW4UPVdcN+
         x8I6uraitVE19u7fss1phx9n+q59ABq0qN1pHPdCst/2CKbX0JbhF9HWrfPZRzSPoOwp
         vPAlNpqL10o6c//qFjogQ7YWQyqArMm9hl9fHDK34rEl4ird0a0bFpW0nG4bIiF+RR9N
         Jy4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787246130; x=1787850930;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EM5PkmngzWPW5YVaOcE4doFSUi3DdsSPp8p0edYyrwQ=;
        b=kD8KfiIBk6M+J9x13yf/HB+s6OULoDSHTLXVcMjtcpTDyp55vHcHGCwpcgBjIRubLs
         lwnm8h8JbBtmO7HntlWKGD/VY/DorwPTVoRvrmWJXVNHUVp8vEjN4O/CoV69PS/vRwTW
         TWN5xwuHhJBqgDSfe2jbk6APNTBhaj+k5PwqR4e0UoIyPZhT/W7EpjhXJsjwKYNnQN0l
         VLIpzq0c3KDsDdPoJRKfHeiuTbHhFG+Kxt7plfw6RYut0Zna7As8H1RNGky2KGRktz+u
         JRubG3/MqvCi/Gh7i57cxeCrPAacRUDTuXLdis57+MTNeXSyH8cqW4mzPoFB1fx50dd6
         px6w==
X-Forwarded-Encrypted: i=1; AHgh+RofVqG4ozar6URfGDf8nTUN83ar2f9nnesrbJAzbQdHQ3lzZKGSEunj/xi8tNZUbh7PpaWmGKDBHf4idHOnRUvxNg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwdhS2jqeUYbzrMePlc7hmkZAwc0Pp4pAlxZEA/kDkiqhPgZIDx
	V961N/664umAykR8Xg77d0GWUj6rByfzplk/QC9epxnVf0TVkZPmpJvmXS7SCuABhYt3u1PSn5D
	k7FO3LBSW/NIN6iqNQOmLJc3tx6EpBqIAHmY6V+hV7YGYhGZyElwJKx2bjYREjjndn9VMxpI2
X-Gm-Gg: AR+sD11GPcJ3b7L3ii/kiboONU/NmMc2FyR4sJzLxbC/gcvi/xLQKhFD6UXRXNwYYZi
	2NiL1k+Z3bRgGCMg1CYQNjwQzrhrtGnTVYrtKDQbb4lcswMjB36AQ85auvE3tcfaMNJ/JdQFtU5
	vR8kq/ub4EAkmtPmjXLHrb3dxFmBydQ+7RkErJV67FFM9mp/D0P5JiS/w/18Z5oAAdOGZSCAYnm
	mXUUnXNa2zfPdLzTwPt22q57Tza7SXgAMeWARw08vo3SCxvBR+PLA6NE1NHID7Ub4XrH8A87qd1
	KiCOvCbT1wLFpGN9eZzR1Yx1Afqb11exkmZpjd+RAJP4b4/iq85NzADVXwMeTSsBGGxiBNO3vxC
	VeVreN/RT6MjPQEM+MGQQdYSmamdiTMiGbjzH2WeAA1V2qQ==
X-Received: by 2002:a05:600c:c493:b0:499:7aa7:eaa7 with SMTP id 5b1f17b1804b1-499b845c184mr6845885e9.15.1787246130471;
        Thu, 20 Aug 2026 10:15:30 -0700 (PDT)
X-Received: by 2002:a05:600c:c493:b0:499:7aa7:eaa7 with SMTP id 5b1f17b1804b1-499b845c184mr6843265e9.15.1787246129216;
        Thu, 20 Aug 2026 10:15:29 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:11aa:87f0:935:4f8e:b423:64eb? ([2a01:e0a:11aa:87f0:935:4f8e:b423:64eb])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482b14514d5sm14505430f8f.10.2026.08.20.10.15.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Aug 2026 10:15:28 -0700 (PDT)
Message-ID: <dd1da602-675f-4b63-ace3-a23e55ce549b@redhat.com>
Date: Thu, 20 Aug 2026 19:15:24 +0200
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

