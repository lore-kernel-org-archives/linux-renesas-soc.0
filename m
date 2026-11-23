Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795400515;
	b=ZcXai2dX8RdYCp/TO7uz9pBbpLHQMSrT4IRNzDqAtli/LwryZFQoBVGTwf3d/Ge9RkBp
	 jq6dlfuJhgSDZni47mBflJTstvqaVQGd4aSuf4Lsox3TW0saWgVP3H6M270wN2m3PGIZl
	 RF+zPoaoHugi7RhzCpUQsGPa2fXdGgFPsYGw2paZ5AUpjNJij42AiWHTuXl9nsYeuBi9q
	 VnkEOiu1lfjJjCVeVlCAokqrKEr2XgnsmbLXC76AgvA9Ctr437rOCS9saYa22ag+0ee1y
	 j+PwM5Pc3Ic/XJ0qqtwg5B9XTLhbkdGXG5GDE6saBARjpFCD16a7MQB4Ux/RfpRoOeA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795400515;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=qIzih0fB8OsJOrwE3j+2DEEIY6AuLHwswwUsz0vhlXY=;
	b=QfoReAXPK8xbujQg5Qa6zm1V08+6eUO65RVjcwDM9nrDjSsN7Jx6r2H6Jg2LZaRN1kqW
	 sFHezQu4/sePj1tJN1ylIB2Kj2z4Hb96H/RMUD72xRxdZexRLEQ0OkAIzlQDHxwL1ZVOA
	 EcZ3mWKymONHvH1fGZkSXZ5uVwmk//UjTffAv4yz6R+I5t7/N6+PKcYU4khj/zsu5Z8rF
	 mOrfOTyaEe04nRsjg3e/gve5TfCGUsuKh8iltGbh7jUZUtyWnouCcTzZDR2X01xeaiBVL
	 yyKsWZeG0SOb65W49R3X/KliBk798A92sh3xfHW8UIrnTbzHTkPmuH6sfpbUQY0wRWQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yJX1ACZT;
	arc=none smtp.remote-ip=209.85.210.177
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56ED5606A31A
	for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Nov 2026 02:21:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 56ED5606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yJX1ACZT
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-8a06e79e152so1223461b3a.0
        for <linux-renesas-soc@vger.kernel.org>; Sun, 22 Nov 2026 18:21:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795400515; x=1796005315; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qIzih0fB8OsJOrwE3j+2DEEIY6AuLHwswwUsz0vhlXY=;
        b=yJX1ACZTcjUxpbbTP++wMkoJseMfzO51Y+2EPD5i307atFEoeY/ALtI5UbP0KOCvb5
         all9+T7MQYo++0GGm/j9jYIuoNUMZsZu7J+Cbi1HRruaCWSH1uWeAxgwE2kXCX42DjTm
         sJQMtG3zMYp8fJbvjKhAUcYJHP3g7p4anaE3jcfrfhIcIiUMqlkjsm13w/6cJqBc5rdB
         Z4iu1gl7pxdlH9ybYhwDLjErhpuKjpwsHCX0BKSyirhHcKA0+DDe0DeXXW9AMEDiKP2Z
         SKaHqIb0ysTbPlChu4o0ia4wsBAYk4cblIAw2RDRwdnqKjz554z4+H1JqcAOBhhOLwOG
         4n+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795400515; x=1796005315;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qIzih0fB8OsJOrwE3j+2DEEIY6AuLHwswwUsz0vhlXY=;
        b=RjKCEWiMJ5IV88LYOGqPtl61QjzxUo2TpGpWzQpgBmsL4nIBVoVvJCtQEtHzGBdy9u
         xl2+Jf67LF2Tc2yxdeNsPzY+lsk29qs2TwURW+6lnRmSfg9B/CMFPGv1pRz4IOv3ZuQP
         M3vGVpGVIamr+uqSfi8KF8DZ5SPj1Kj/DIMTcvEv+K43f5yUorkAXYHAoTCkC/+AMlnE
         wRzUPkxTfTMfxkXMygCAy2POk7sEJWYYGytuIsi+jFKRDpHp/Tq7q3dZSS5TPLqOYWKO
         TPsnXx4+5nwc0JpJs+8xPWdv+2YdYxm3jGUEg5wb+AGnp1XOADJkjsklZvHW+Ti8X6BO
         OVtQ==
X-Forwarded-Encrypted: i=1; AL+hErH8udz3BYcNlZvaZtYrMvDJpqqp6sVUr5Mv27kyq99VguNIYH0ogoUt7RddxHoo2YRADme/AxfpC/w4rcCyFqxyIQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z/k85TtXAGD5iXxwFkI1MJMJv40BKCdA9P4glSCG4stSRF7OisN
	xNXpjDM59h7Bh39R4NwJO3ANEWTBjUhzetvnC80Z8RUwmpbLoAQ5Tnig
X-Gm-Gg: AZFdTZfwXnRuxEOu3AIFTXLNCTLSgbaa9wMFmQ70yWVoS7EslRcnWZO/Q64ZBBuXVmd
	CKrz9wURkP/5vJmw+Ge8RcpOmIFppXzBcBqBlWiWBwRw4apsmh20OBp/0bXCnZS021PEHmb61Vd
	mN1G6JOjs6/HPRwOH298YZzy9u8ji/jqR1mjxndQIYlWDZKTTKANQR4zhobh3r35lxPgm0eK9aD
	nX9t40wZiVi7VOrnuJaw4MLi2m50Dlziu6uyAbznhOsa5qgKw20/1moarEHN24MRBI6Fm9KjxuZ
	4SW+wL+yXBhogeFgkF82eVH+C0dQkjyyMIQuVt+VPSxDBuUMj8Zy/gtZyl1MYEcB6pfeTo9bKyP
	rnhU0SfOKjI1bYHgjbukaQgbUDnJnX+YcZUleNV8kS7F/fvNygIfxfs693WVZ9/GCHjKKV33UMY
	9a8u3mPfr2pDKxzjvMtEpzt0WI8vE+obBZIb63tUl4j6z4OJ7nYh7IAr2r6GIsejlSl8+DDBkvX
	elFvuz320YSAAyyNZJurrYjreOO8S3QSQqKYFBm50z+hD9T5JFlEk7XltWMO1GU0Ga7M2IEfHve
	SmvOfgceeQIMrS1aDHuhu9f1//wxYKOBosl+a+4qBp6cjA6/LVJBJ7HrTe1JyxN7xA0iBivg/e1
	IkrKeEDtbVwa5yZ6x8dCXYEmjtja7Ajo90sGoE/V9fxYsog==
X-Received: by 2002:a05:6a00:2888:b0:89f:db59:193c with SMTP id d2e1a72fcca58-8c87bac50abmr8010706b3a.9.1795400514607;
        Sun, 22 Nov 2026 18:21:54 -0800 (PST)
Received: from [127.0.1.1] ([74.176.208.23])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c872e45eccsm4674426b3a.31.2026.11.22.18.21.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 18:21:54 -0800 (PST)
From: Yaohan Li <shunsheng1218@gmail.com>
To: Niklas =?utf-8?q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Cc: Rafael J. Wysocki <rafael@kernel.org>,
 Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 Lukasz Luba <lukasz.luba@arm.com>, Magnus Damm <magnus.damm@gmail.com>,
 linux-renesas-soc@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] thermal: rcar_gen3: release the IRQ handlers before
 the zones are freed
Date: Mon, 23 Nov 2026 10:21:46 +0800
Message-ID: <179540050658.417371.217605576878858750@gmail.com>
In-Reply-To: <20261122144813.GB3898744@ragnatech.se>
References: <20261117145348.1092528-1-shunsheng1218@gmail.com>
 <20261119022926.1493582-1-shunsheng1218@gmail.com>
 <20261122144813.GB3898744@ragnatech.se>
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

The explicit devm_free_irq() calls are needed because of the current devres
registration order. rcar_gen3_thermal_request_irqs() runs before the loop
that calls devm_thermal_of_zone_register(). On teardown, devres therefore
unregisters the zones before freeing the IRQ handlers. During that interval,
rcar_gen3_thermal_irq() can still call thermal_zone_device_update() through
tsc->zone, which is not cleared when the zone is unregistered.

Masking the source and freeing the IRQs in ->remove() closes that window;
free_irq() also waits for a threaded handler that is already running.

Requesting the IRQs after the zones would make the automatic release order
correct. But probe currently uses the return value of
rcar_gen3_thermal_request_irqs() to select priv->ops.set_trips before zone
registration, and rcar_gen3_thermal_init() enables the source depending on
that callback. Reordering would therefore need changes to probe setup and
failure handling, rather than just moving one call. I kept this revision
focused on teardown.

I have shortened the two comments as suggested. I will hold off on v3 until
we have agreed on the approach.

Thanks,
Yaohan
