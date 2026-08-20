Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82095469843;
	Thu, 20 Aug 2026 17:39:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787247555; cv=none; b=MZAlSoMN3s+thZ1Y6mCq1+o58tef7yILfPi76i+1Cddt15BRvVKoxXs3D76EJAojE8M2DuKV8/W8lCTiZZC3cotdRNbpnijGFIhnU/lkf4rw/gXPZ+Y2tAmjYsBQvMjURwGaBFh1Qfnni5q5qNpVuE1JaeDws5kwAu1C6IK3i8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787247555; c=relaxed/simple;
	bh=DK+MU8di5N0rHbIgIqQ2+Kh8/+vbJBirSdkFWhdqtf0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=J5NaT+cdo9Dgw9ZvsB+ycMDayofez38qvbsbjnaqJ7f2xw/gFuTbL1aF1rGWgaEfINCZLVD9wNg6S7XXRMtOVJ6mmnPMS/TYwAHQWjEeRrW9KS5PYVbeJj/5ZXOcCZUyBhsGh7KGveJJ0WTx2fSKQrnbNtNwBca6b7PrtR4Gixo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=NuOzpepW; arc=none smtp.client-ip=80.241.56.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="NuOzpepW"
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4hQrK94XXzz8v1Y;
	Thu, 20 Aug 2026 19:39:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1787247549;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MN8dZCWstpgGLykuTbU1uGEtW2iVdaKsEn0Gd59Itxw=;
	b=NuOzpepWM2gXLDkS2wqvOz/3Mv9cWc+5wiMOJk90QDmOgEh4Lw2vV97t9ehGXtmlGGhtx5
	cFhsx0pEZn3IcSQBp7QWUA2v2MPVAtU8jc3cjjPnauDcZOVnCZKSQ2axMjX1TcRcPcTix1
	0PDH2Fz7H64+DwlbmHVGixQB1UJj5cV6YMo8O8X5Xs9Lire0FgyDao7xpOdgoL/Yuee3J8
	sikB+//2k2LSZZVwH9i/cbIqg/JkyRxsgBhB5X+3Bt0Pq0sFuh0rpLAsPm0FLNouHEcHWK
	AhY/cj2i2H/WcgZW3cs9/ZNOy5nYrGaGHSjYvGAXSu7RVxZ23sY1gxa2yc+bxA==
Message-ID: <f9f77c44-a36c-4b5e-afcb-78a5b5eb84ce@mailbox.org>
Date: Thu, 20 Aug 2026 19:39:04 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH] drm/rcar-du: dsi: Implement DSI command TX using AXI
 memory access
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: dri-devel@lists.freedesktop.org, David Airlie <airlied@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Magnus Damm <magnus.damm@gmail.com>, Maxime Ripard <mripard@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <20260809195831.842907-1-marek.vasut+renesas@mailbox.org>
 <20260810100451.GA2940644@killaraus.ideasonboard.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <20260810100451.GA2940644@killaraus.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: 1bd4199c2f0fca30007
X-MBO-RS-META: kujyzycna17ogju4pgdce9fpxu56de6f

On 8/10/26 12:04 PM, Laurent Pinchart wrote:

Hello Laurent,

[...]

>> @@ -1276,6 +1295,13 @@ static int rcar_mipi_dsi_probe(struct platform_device *pdev)
>>   	dsi->dev = &pdev->dev;
>>   	dsi->info = of_device_get_match_data(&pdev->dev);
>>   
>> +	dsi->cmd_axi_cpu = dma_alloc_coherent(&pdev->dev, SZ_4K, &dsi->cmd_axi_dma,
>> +					      GFP_KERNEL | GFP_DMA32);
> 
> I think setting the DMA mask for the device is preferred over using
> GFP_DMA32.

I will do so.

>> +	if (!dsi->cmd_axi_cpu) {
>> +		return dev_err_probe(&pdev->dev, -ENOMEM,
>> +				     "Failed to allocate DSI AXI Access command buffer\n");
>> +	}
> 
> No need for curly braces.

Are branckets { } not required for multi-line code ?
If this was a oneliner, I would drop them.

>> +
>>   	ret = rcar_mipi_dsi_parse_dt(dsi);
> 
> The allocated memory is leaking in error paths.

Fixed in V2, thanks !

[...]

-- 
Best regards,
Marek Vasut
