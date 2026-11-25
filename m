Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795575805;
	b=AvU4VyLOK7chCpw+KY/sw+WY6dwiDJdXuzV4u3dBZWmIj5pCyoHWE18sODIlhFH4QThI
	 N4aTP2Le4iSEj2POmue47xmNFlOGnAiHMid6EHjI9PMMiYW8Dz+tuJBqj91LSOgFNgjcZ
	 TMk25yVs3pKqzhY/zVHlqdmilwAOfFMw6i1SbTjmYi4Me7mQUTfgJ8/vNbh6p/ik/YJ/G
	 h+JExF3Ej1rf0B9xclLI87SSnYrcVRu7M7XtOpT9SztumeqW0Kv5YmP1Ez9byf/6T7zpq
	 gtsaROBdsf0vv0OUy1dq7XBcZuNO8tXvS1WNE0ibJ6T0QqzICONRgEsQn7uhJ0PkhEA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795575805;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=YqK2M/Yynv5vzFLqMgSa7NJZjQIGQnS1ueWuqR6kXUY=;
	b=SGw1PuDNuaCkJQKYfyrIXra2EDG1ZqiwAhukRtA/YZC63KXvph82JdTvE0AX01P/yOg4
	 +TsWM8NoWbcfFn+Vp4k7XsNiNH/g28PXTwTbhf129m24dcV8F9gGbfs0QuX0SMxVvV/v1
	 ztxfOitt69w2GesnYXwUsHK1k8Qu/jO0wuGs6daMJQQ3bOLXXi/VJC8rots5UWKbLQP1x
	 YFKv3ScmvZbs7/8ab96qSVeQMC4+aHiUzmx4e60P2lAr0f8S4j2n8aQUjMmz5uhBodJWC
	 8xAMRdVqtf4anmU+7QAns3ylcnwquhvnfOG/t/K96DjKcSg/7CyAT1v+IPZb08k+6fw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ufNniQ5X;
	arc=none smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B2D7606A321
	for <linux-renesas-soc@vger.kernel.org>; Wed, 25 Nov 2026 03:03:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1B2D7606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ufNniQ5X
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-3869f03af6aso4471396eec.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 24 Nov 2026 19:03:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795575804; x=1796180604; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YqK2M/Yynv5vzFLqMgSa7NJZjQIGQnS1ueWuqR6kXUY=;
        b=ufNniQ5X9qByJ3a6jXn4U/XqEKMbII8PIg5Y2/CQlesuBwYx4husTAd+Vb3j9RQD2V
         K3VsfOPA8L93SwWTwRhD3IDJXCUdlK18qecUSlnOoNfGy80TpuWlDlYr+vADnXcAbO0n
         SlPBCTdoOUISCi/ZFW/KTmFLr039lWTEeTK7rPQkCDgQjlL8cdMvU6q/oJPnTKn48u2l
         T2Q94Dwdb8q+LPnjwzbAdH1wxJv+HDrKTRYUlYN77GpbgSZfAe3BhXwvX1nqRW+IbPT5
         nm31xPEUvr1lOm+K93PNB/2YXe5M3Nm54uctf+yiNZ0m97agP6DX302dJNxjXCoQ7XQP
         0POQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795575804; x=1796180604;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YqK2M/Yynv5vzFLqMgSa7NJZjQIGQnS1ueWuqR6kXUY=;
        b=WYmMTIT1lnq9kYv46sBusnFk/GBGGW0bjEznSYM+gBtc40zP0NhiaxCUUoufhvXb59
         1wmOW+3yvuy9V9U9G6TM4o3uwER+olDcgOXJYO8VRMpB6Z6tH7Cst36dYUNNfgvJ5R4B
         Eqoqe5xzCIw2EmCJ3oN+C1zMN/6eKn99yjQMf3nDTb50v1MtoxEHaFhY6qvAnp7+fZyy
         71h/m/OH2PI1FezAMjCW/JRg/hWA6lZEg2fFsi8is9WxN4kj0bWqe2SMUvcExAyDsNLg
         f5dBp0onyE0UHa8O5hlPF2kKH+5XO5inXtaESGlA5k67EdOz5Ra+6pBCw6AIQBRA29Xe
         dh8A==
X-Forwarded-Encrypted: i=1; AL+hErGut3bhmmcCLMd3XYRbepfhLQWYrHr5dbf5NEXYenORCjxp7fr5ouhKJzfZtwCIycQNXxBJw/7Yz5YLWQnu8QbSPw==@vger.kernel.org
X-Gm-Message-State: APuU4Z91VTRGKcxE3SlRx0btwpxTiw+hl7H8TvET87SCjO+91VejDQrz
	Zuut1RLaeq617y1wF9ucOlHKKqW7Us7iGvYJxiwAXmNQaW4QUKSbQtTo
X-Gm-Gg: AZFdTZf6TJRepVABFCPG2wjhpJs/w9eDYARcoTNJe0ZjW+NzKiMcaERSzJD8Rf/HoOM
	ovVsjnsxqLFttQnD5KjUErVBvdBpWvBw06SRl3HrL5pTKxLxLvVtMi8veLPWHC32bsVK7P2DQpv
	iQ2EqFI6GhSMNodoSg7+BxTpkZBEcTzouYqsd+fdnAaVZTmkloSSkySrUV9hMc7+DKiazgyUPJJ
	8XdlEVB3oBphzcTsuysy1/h07fe91BUZtmTK8i5LvTfwv9j5JdN29ZBX/1BMvk4kKO+7DlJY5jK
	XINRZkpbeiqyZSbFBAWKqDgxqFLpUKkiCQ9vTAEm7J3xPFwxJOWAwz90ZSOySVBF0rUXh0mp+I8
	fvoF3sEi3pq3eYjoKrSJy4ZD+nneyrD+Px3zB6LI7+u5y0XwYJdiiQ8Re2e9A5QW8K5/Moe4kI3
	aPExA3GEZUpMIHLE5KdIlhQD5470qbvLjhPhtcTDjS/zWfrzeEMzHLMpazZ5Vs5zwFVz8a3QrM8
	s3d2bUfM3B2EJFjimggoiE6dSQ4vhdch76EhZn5vGkfppcC8d+rI6Qxr0KDa1G0E4zHsbwMX90S
	cPn5ch6LjZHI0Jwct2/1QX2nnLZZRx3L6WSRGHr97aOtjUJcqgBZqBiOGlaaoe6EuqPUEAWFDVN
	UOdQh78Dynu7lGL2onC/WIDln
X-Received: by 2002:a05:7301:8616:b0:385:9424:5c08 with SMTP id 5a478bee46e88-38594245c66mr18684521eec.4.1795575803736;
        Tue, 24 Nov 2026 19:03:23 -0800 (PST)
Received: from [127.0.1.1] ([74.176.208.23])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567cafec4sm55751171eec.26.2026.11.24.19.03.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 19:03:23 -0800 (PST)
From: Yaohan Li <shunsheng1218@gmail.com>
To: Niklas =?utf-8?q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Cc: Rafael J. Wysocki <rafael@kernel.org>,
 Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 Lukasz Luba <lukasz.luba@arm.com>, Magnus Damm <magnus.damm@gmail.com>,
 linux-renesas-soc@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Eduardo Valentin <edubezval@gmail.com>
Subject: Re: [PATCH v3] thermal/drivers/rcar_thermal: disable the work before
 masking the interrupt
Date: Wed, 25 Nov 2026 11:03:17 +0800
Message-ID: <179557579759.953320.4240333903133893045@gmail.com>
In-Reply-To: <20261124132521.GJ3898744@ragnatech.se>
References: <20261118072321.1259639-1-shunsheng1218@gmail.com>
 <20261119022903.1493494-1-shunsheng1218@gmail.com>
 <20261124022219.1834499-1-shunsheng1218@gmail.com>
 <20261124132521.GJ3898744@ragnatech.se>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Post: <mailto:linux-renesas-soc@vger.kernel.org>
List-Help: <mailto:linux-renesas-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-renesas-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Hi Niklas,

Thanks for reviewing this.

The devm_free_irq() calls are intended to protect the lifetime of the
sensor objects, rather than only to wait for an in-flight handler.

The driver requests its shared IRQs before allocating the individual
sensor priv objects.  Because devres releases resources in reverse
order, those objects can be freed before the managed IRQ handlers are
released.

Even after the thermal interrupt sources are masked, another device
sharing the IRQ line can trigger rcar_thermal_irq().  The handler still
walks common->head and calls rcar_thermal_had_changed() for each sensor,
even when the masked status is zero.

Therefore, synchronize_irq() would wait for the current handler, but
would not prevent a later invocation from accessing the freed sensor
objects.

devm_free_irq() removes this driver's handler before the sensor objects
can be freed, while leaving other users of the shared IRQ intact.

I agree that the commit message should distinguish this lifetime issue
from the delayed-work race more clearly.

Thanks,
Yaohan
