Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFD3E47DFAA
	for <linux-renesas-soc@vger.kernel.org>; Thu, 20 Aug 2026 17:05:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787245505; cv=none; b=lllXwITW+HJDMD435I6Sqw+QYtbUp38seQSJcV6FJbPX1UbgJ+djNM1Rf6W7ig2BrieOgVrdzUELQ4tYDM1s6D71JOR1C1KGG9jgMMvLrd0J97i7tEEYAr2fh0PMQJuHrc88EExTfmdxvJeJ7eVVdnvrX1wUaYZLQLBUId7CGjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787245505; c=relaxed/simple;
	bh=OOvAhEjtRhOw0a+UjXxcotOqI4sqWEFsEYl3cZ0ejEg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=m77pnON6SdPFfdcf2QegKyBeUr2a0OHg/nOakzBukcRFlVpgebxfqBfyY8ojJzxlL8ccZRii+mOW87eBInpTMbvfgitPwdysM+RkjcEX49lWgdOcn7LajW4v/BkJb7ZspRNlxl7tXNRxjo67INzKoRhjuKmQI5yPyOeCWa2uKGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=T++u5Nnb; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=GNngpUhG; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="T++u5Nnb";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="GNngpUhG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787245502;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TF+roY3oCVB3u96D2m+Kn+7JYFil1XkjxfPcXPVAxaA=;
	b=T++u5Nnbdyvrj1w9k3J4ZxjEgS4vXzvAWB26EodOEGTehMVvx8ZfPTGpqEmOz8on4bJZ+D
	RikZEdAm81vNijzZ+6eA/fPX1TVA6xL97OYZhARqiUkBAX+ZA2gFIkMQQQRqpeUiZChNhf
	XPlXFW7mwNi4c+97dJKFz1HsnjLfdbE=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-275-M029By8pPkSZXsrcExlQ9Q-1; Thu, 20 Aug 2026 13:05:00 -0400
X-MC-Unique: M029By8pPkSZXsrcExlQ9Q-1
X-Mimecast-MFC-AGG-ID: M029By8pPkSZXsrcExlQ9Q_1787245499
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-495474a5fbcso391555e9.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 20 Aug 2026 10:05:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1787245499; x=1787850299; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TF+roY3oCVB3u96D2m+Kn+7JYFil1XkjxfPcXPVAxaA=;
        b=GNngpUhGw6LvGOZy9Q9TqjDH/Jo4/N0UbO4oLdHnx1bz2LLQR7bdoORWUXOO0MWywX
         we1MQuBsglWX4t3Kp4SbHafc05j1YigY9Q1GioUFTdzJ+frrO4CdStl7pGAbg4Aj5Y1j
         yjQFYfS2ilL23rAbgMHBZcptID7e3L+KmfjH9cyq2dzPTqsaCCxlzk+hn2LoakpWmt+r
         Lg8V+YDNGI87UIrkPlvZVvrlmVMJj0Pu8bIv5DxE/DqyfOthKbdzQokjPKampK9hvdkt
         ORgdaKC8BHMf6sFgvoUhtBE5lEqF9uAFXSkwtrxrxy5GI3vcyVlcmHAmZ9tNsgMOmrTa
         RFrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787245499; x=1787850299;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TF+roY3oCVB3u96D2m+Kn+7JYFil1XkjxfPcXPVAxaA=;
        b=nJdbfQkoZ+7tS+cYkSj2waf4beWkuo8JzL1L+OTc3iA+2gHEhDhtgSTaBuV6/J83O9
         IvACgpj7+jwbiX6NAYzTlEvrRTLw1iIwWkTZF0S28QuJpGz+D0Mje861zLgtLC3uDYzJ
         YoY6kPPuRlAyP0gAy1f9o7LvSsbekv9n1mFw34SC/de3EvMHXkNpMb0YVahtLfoHwxv6
         K9cguM/OxJBK1zqRyq1MJonKTpvLswZvKQeOevyRn0jn9mDewZg7uBWksX7dwqWT5aUc
         oT38w7VyDJf6P1JAXW8h+SXaI1dD+VcqevTVHeazzM3hlm93wU7dSgtE4QIXRZuwQHcj
         6nhw==
X-Forwarded-Encrypted: i=1; AHgh+RqQ/Iz7iH8RFoiYK4hs7toppdTN6I/p/FEIeeU2UriKjT9VuKflUBc4mietdHifQqIkcmyBeKk2+uBrYLPc0vNUfw==@vger.kernel.org
X-Gm-Message-State: AOJu0YykqRvEk0OgoFXX6YofIOaFxCJYXE0pEe3n1dw3z/zO7Oi+lO+d
	F/Ra4ZtuIfUVIHTHi+VfzSqRaZ0b0nxsupHhrXimW/uWiOGeoQqpdARLWyJTY6a4x29ys+Bwbfn
	BNIafqYqu9PnhyYXQi/dI62p5f74noY2EbIHbr6KuvK5R9i/0Nrpk6J0IS3h7Cu3f+MzAWdGs
X-Gm-Gg: AR+sD12xc2NTF0cKAAQaJk+tbnuBAcFA2gbUf7Bm01BY2SEm5nxc2Eqr/Crylyn47qW
	JBOsYp3ddiLZC3FBwDDf+lww8fJddfp0RFYLIjh7MtbCVO5bwZFOrI724P+3P4O5vR4dk+atU0y
	EbMQCoWenzTUEw5MSJS6YWnjZdhJz/And5Z60256OEY78PM7gBvL4R4MDBI3BbRLMPp8KwPrO4N
	si7n9kmvldJQ1juTLSAwTTbugQ/Dk+/BJq9tFWM+urLTN17zjCBqLNryNBRe8Jp7MggxZqyF1c/
	/awl8QExxN6yKVldsi/olrhIeHQrHdUE8umelu5Y99ICsEH2RP971ubZeWT2E6Y/1m+n+9PO2dh
	oVLTN1R9eLfyEw+ltrxaJHLXtZet842Rapkruo9si0eFsCw==
X-Received: by 2002:a05:600c:6211:b0:495:4d88:e630 with SMTP id 5b1f17b1804b1-499b8465f7dmr5016905e9.10.1787245499080;
        Thu, 20 Aug 2026 10:04:59 -0700 (PDT)
X-Received: by 2002:a05:600c:6211:b0:495:4d88:e630 with SMTP id 5b1f17b1804b1-499b8465f7dmr5015695e9.10.1787245498659;
        Thu, 20 Aug 2026 10:04:58 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:11aa:87f0:935:4f8e:b423:64eb? ([2a01:e0a:11aa:87f0:935:4f8e:b423:64eb])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482b14c33b3sm13157002f8f.27.2026.08.20.10.04.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Aug 2026 10:04:58 -0700 (PDT)
Message-ID: <cb784cf6-f3d8-41aa-9f71-c197a5eba7f2@redhat.com>
Date: Thu, 20 Aug 2026 19:04:51 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/12] drm/panic: Return -EINVAL if font is not available
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
 <20260818125012.468092-4-tzimmermann@suse.de>
Content-Language: en-US, fr
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20260818125012.468092-4-tzimmermann@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 18/08/2026 14:28, Thomas Zimmermann wrote:
> Font lookup does not allocate memory. Hence reporting ENOMEM on
> failed lookups is misleading. Report EINVAL instead.

Thanks, it looks good to me.

Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   drivers/gpu/drm/drm_panic.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/drm_panic.c b/drivers/gpu/drm/drm_panic.c
> index 705b72bf0d83..96d238bfceee 100644
> --- a/drivers/gpu/drm/drm_panic.c
> +++ b/drivers/gpu/drm/drm_panic.c
> @@ -757,8 +757,10 @@ static int _draw_panic_screen_qr_code(struct drm_scanout_buffer *sb)
>   	int qr_width, qr_canvas_width, qr_pitch, v_margin;
>   	u8 *qr_image;
>   
> -	if (!font || !stream.workspace)
> +	if (!stream.workspace)
>   		return -ENOMEM;
> +	if (!font)
> +		return -EINVAL;
>   
>   	r_screen = DRM_RECT_INIT(0, 0, sb->width, sb->height);
>   

