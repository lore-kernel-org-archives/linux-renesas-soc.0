Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.231.136
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794586456;
	b=XAIp+ZZeF77s9vv5kxH1PxjYkRdUxkqqJy495TAbktYI4mVMKQmfow2QYkyxO/4PTmtM
	 L9mFszfLbLaQKRR5cpAKb+tZAeG2/nOziGCwNgPsVs4C8ZC8pOLB8Z0DNtqNEgcqs5Kch
	 l5a9nKc8sR0RjXsPbtZHMj1El63aQyZK1HfAq8tjU9I75gfiOZKEaz+lycQ0T6t0psW1Z
	 jRna/oY83Gyo2c7L4WO5QaNN80xTO7Og63Lix43Tza8+GXHkfBUKw/E/ksxOk0Ju6pUr0
	 roDWIN6bfW0w43H8TGIIPgjtAWgozoabQ3zUO6w0rIxOj1Ug4XFETy0ARxR3Pxfl0wg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794586456;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=dNTZCO6CVD9uiA7Rqib0iVTPKHOWhKLny7CTKnD008c=;
	b=i7TKPHep/9lHGKgoDGjJ9KVfavoqIHDYUBkP/GBb9SOIVAqJLpw1VwLraG/bzgQ4w8cb
	 UP6sGppfV/aXEela13lq9tsP7Sf+dFq20gKZPfZ8ujt6fnL72JRqgp6WWv9E2KqDi3cFd
	 hdFQTo1Uw+pSzfKu6Zwnw5WoEVAthIh+oskKcSQhkRJw3dZjsVvSd5qI36KGlMkmSY3q3
	 adkDOZfUb29C8pP4H9F3Sm6zgEYVlE3aEuSPkHAFgSqm1tfGHVvTgyulJT7ySremRS58m
	 LlOR8O1Nr+GOxuDnzT/Lw9PmEATe2yz+7tdu2g7bUgvlf9mnF1fP1liS2HVV/m0oVzQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=w9aEphJh;
	arc=none smtp.remote-ip=74.125.231.136
Received: from mail-oo2-f8.google.com (mail-oo2-f8.google.com [74.125.231.136])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A480C606A89B
	for <linux-renesas-soc@vger.kernel.org>; Fri, 13 Nov 2026 16:14:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A480C606A89B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=w9aEphJh
Received: by mail-oo2-f8.google.com with SMTP id 46e09a7af769-860f8b7b943so448630a34.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 13 Nov 2026 08:14:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794586454; x=1795191254; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dNTZCO6CVD9uiA7Rqib0iVTPKHOWhKLny7CTKnD008c=;
        b=w9aEphJhxN7KRplF0AemXK6zfCEpZm7MqmDAaYAKTs1SrfzT5ugoss90iRafy9F9OD
         hR92TRyq5NjVfe4DDgIGkXrwOVztZGdvedhTy75XiVPMkt2+LVuahYxekXX1kzdRWCw9
         PWALAVHUS4ZEjxxsDiq3DFc9Yhhw3BxyWXjX+rPSdNklIfwQXmd9sFK9OxwrDOEDZQyn
         Nv7BkWcz7Gdc1Pph9fcj7zW33bbZdF6cYaZnELCjV5lLleY6fQxt4SmZ2RrExyoXq7/W
         z7w2hVUfxwkJwW2GjWkxA3asMKrhe3iGF39F0rgYowhRDYWcm9gyWGVn/bxZVMeh7ikb
         o3Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794586454; x=1795191254;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dNTZCO6CVD9uiA7Rqib0iVTPKHOWhKLny7CTKnD008c=;
        b=dJvCupwg3A1RlnHo3UO9pu/bNoMZ8rGe0fZAInIxMEcoxTx0ws84OyaHZLwAZJtjCP
         nR1buwfUIjRircOO0QZrCuGrWS0tVOcVapxl0uPZ8kocyzIeo8Nj/yGemVo8z0/XKBr/
         AUBdgkPSq5NyWE4YYGw0FIItSLOlxw/JRoWGQtNM3kKV2MG64Y7sSP0aIkhGG+Imo746
         qAmd6eRAe+1BDbTFwMuZmQS5eHYOZSYX2q2bhePNNGSrEgko+FBZCgUdP0qXTttBAVsE
         JRuk3A6JBdyUs0QyY3qwjz/ngKAEwgd3uw5yzwqvluE0L7MJG6p6r+xYrxXwBxRSoleR
         3lNg==
X-Forwarded-Encrypted: i=1; AL+hErHs2QXnOUgkX2YkfYkXXFSjPgxqT9jK8sIEZkJJLTeDrQ7ShsZkuvD5+/+MUI++djH6ySFtzIeYA24sFWtHfNQJnA==@vger.kernel.org
X-Gm-Message-State: APuU4Z91HHNePVZtUrzO6323wkhzOhU3lDrn3XH2KK9UC7tRFkJerfJS
	vPYWInaicfjTso0pK/voxJM/jqUpE1Ovp7yrT8LApe28vpfy9YbE7xSt
X-Gm-Gg: AYBFou1csvd4Q70SPWPCTyzQ+PGTzq+gfKK2HtCXaEhKhgCmnZBCLOC2VN3rryaweJu
	lvOWKtkvEX4EqK+mniggSOFjRjZvu+cLFn5Gz55Z1yh1HS5mMdQd3HEwWzXXEGsvYZJMLcQAPbe
	4n2uv//TtN9UlZjcycsAg0f+8EMi0VbqFvXqG2fookUpHzCltzwI9FWHKZeO77uomGmwDI1AUg/
	thXDZtq7yFthQKY13cFfJXqFc+hFQbHu+F2kCYwM8tsrAJGlbzNYAsnot3W6YBHZaY2LSIgxnW0
	bOXExgMWrq5cVhQtXfC3ltenwca5ItNTCrAL2Nw86FUyoTwOiwJjdRtumaVh4REJzow8foZC+il
	AbXYE0SsgztCZynGg23BgMy5fNP11U7aUoX76lBmajjbwnSDBTfeNg5iN9j8bm39muF9qDlbSoR
	1HNfFK7Gb/QdvXbsHk7RcoJUCDOJqRuNRbqG/hiGHYW0tlMvpK3trSrZqa6LBSiD6VSAwAShWRU
	87J29ZlUTwsdmGuLUNbVdKUQLP5spuEQv3C4ySbQLztXyW881NBiqXub7FV6Y+flUVXqzP8Eutj
	AMWQKa2ey47WoK/54F5/xjDuZPhgixPfYHg5D7kF7hVbFk0z+hQZDAIZ9URQHVXGly7SPsCjfI2
	ZwKO3SdG2mH9SfJ6GcyI=
X-Received: by 2002:a05:6830:3491:b0:85d:6045:52cf with SMTP id 46e09a7af769-862898c8b4dmr2468232a34.12.1794586454518;
        Fri, 13 Nov 2026 08:14:14 -0800 (PST)
Received: from [10.10.18.223] (wsip-64-207-253-118.tu.ok.cox.net. [64.207.253.118])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-8628813346esm2668473a34.17.2026.11.13.08.14.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2026 08:14:14 -0800 (PST)
Message-ID: <36b0b778-a5bb-4b85-b36d-d4408c3ca6fa@gmail.com>
Date: Fri, 13 Nov 2026 10:14:10 -0600
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Post: <mailto:linux-renesas-soc@vger.kernel.org>
List-Help: <mailto:linux-renesas-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-renesas-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] dt-bindings: display: panel: Make DSI panels port
 optional
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Joel Selvaraj <jo@jsfamily.in>,
 Jagan Teki <jagan@amarulasolutions.com>, Ondrej Jirman <megi@xff.cz>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Michael Trimarchi <michael@amarulasolutions.com>,
 Michael Tretter <m.tretter@pengutronix.de>,
 Cristian Cozzolino <cristian_ci@protonmail.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Nickolay Goppen <setotau@mainlining.org>,
 Robert Chiras <robert.chiras@nxp.com>, Alexander Koskovich
 <akoskovich@pm.me>, Marijn Suijten <marijn.suijten@somainline.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, Chris Morgan <macromorgan@hotmail.com>,
 Barnabas Czeman <barnabas.czeman@mainlining.org>,
 Heiko Stuebner <heiko@sntech.de>, Luca Weiss <luca.weiss@fairphone.com>,
 Arpit Saini <arpit.saini@oss.qualcomm.com>, Michael Walle
 <mwalle@kernel.org>, Ritesh Kumar <quic_riteshk@quicinc.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Konrad Dybcio <konradybcio@kernel.org>, Svyatoslav Ryhel
 <clamor95@gmail.com>, Danila Tikhonov <danila@mainlining.org>,
 Jens Reidel <adrian@travitia.xyz>, Michael Srba <Michael.Srba@seznam.cz>,
 Shawn Guo <shawn.guo@linaro.org>, Alexandre Mergnat <amergnat@baylibre.com>,
 Alexander Baransky <sanyapilot496@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org
Cc: Romain TISSERAND <romain.tisserand@gmail.com>
References: <20261113084236.53336-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
From: Ryan Brue <ryanbrue.dev@gmail.com>
In-Reply-To: <20261113084236.53336-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/13/26 2:42 AM, Krzysztof Kozlowski wrote:
> DSI panels can be placed under DSI bus directly and some of the Linux DRM
> drivers will work fine with it: mipi_dsi_host_register() adds device for
> such panel and DRM driver does not use OF graph to configure lanes.
> Examples are Samsung Exynos and Allwinner DRM drivers.
>
> The Linux panel drivers affected here do not use OF graph, either.
>
> Requiring graph port for such panels is tying the binding to one
> specific implementation of Linux DRM drivers, e.g. Qualcomm DRM which
> requires the port.  That's a mistake, because:
> 1. It prevents usage of such panel in DTS for other platforms,
> 2. Places the constraint (port requirement) in wrong domain - the DSI
>     host needs the port, not the panel.
>
> The port is not needed for the panel hardware to operate thus it should
> be optional.
>
> Suggested-by: Romain TISSERAND <romain.tisserand@gmail.com>
> Reviewed-by: Svyatoslav Ryhel <clamor95@gmail.com> # renesas r61307 and r69328
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Acked-by: Ryan Brue <ryanbrue.dev@gmail.com> # novatek,nt51021

Thanks,
Ryan Brue
