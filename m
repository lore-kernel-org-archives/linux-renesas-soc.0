Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C3F744C518
	for <linux-renesas-soc@vger.kernel.org>; Tue, 25 Aug 2026 12:40:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787661615; cv=none; b=UajsHa/baFAO7CHZ/GQneoJewL3ezm+uVfi4MRrFJep9PRQ6Nac3hzyEITxX4XYzwDDII+H8EWdh64LUVZVK56rI45Kd2lgqg+4Dp1s+wXq3q/qE71qxQGDp4ca8mQYtg1hIj+iXtuo4JrbmfMwcf5omPpaB9htkJmHGQJWtLRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787661615; c=relaxed/simple;
	bh=QCWu+1nCsFU3Ed99yMQ8CrBj5gAQSQzojcYoisfIgnw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SMu/pasQHh1LBIuh7qFWPkCTHsZaFFS6k4SGWDDXRdEKUuD1T4OKmDAXVGg/FBBK1M9FQW2LlOBhI40UvB+t3dSfCK4n8SvQzhloJErdoPrGkmKgAwPeOzaKpMl7focWM/s+JLJ2YqROvUMSNDmNuN07PL8vuBfPCvM5WwUhVn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-5c5f23666d0so3666186e0c.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 25 Aug 2026 05:40:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787661603; x=1788266403;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=lItA1IXA9IE0IEBaaAVaQ9GLMnrPHs08yepsXMWLXUM=;
        b=AdtT8hiK6EYIIvfsh1/giV2/vDEDNfQjaRPhhSoQIcyq2wf3zEfTqUdjNd5xWukZR/
         cmH/sg8GFcdek9wUz9hQTBSs/D0v7zf7/hzPVQc9ZVb1+4YqAsyjKq+12sAl4WY5LTql
         Rz7gHqmbprOk42jZJt9D89p8wzMZt3DGVzb7e1pBk9u4EUYguA0euUE2C9K2Kb4jIGg3
         8/ytEcJAza19F4ARKPZHqFOftJA7ewo4oAFRjGAHdgdVa2EmmbZIQk0z8J70F9glWh9z
         gTrCX9Oqmbi4heLCQFHv8oMBvZVZjFpYIvx6OrbzO1hs5xGvLR5gZi6EgIN59X1G9x4O
         FiJg==
X-Forwarded-Encrypted: i=1; AHgh+Rpm+PY+m3fRX9fB3jPecHPTQulY6prLPIED12LC33PAm/O7g80t6RlJAvLxRdayRqndlCJLrKbmhndO7JYsFHnfug==@vger.kernel.org
X-Gm-Message-State: AFuF++ng2cQnGtGDLPqLoec0RRq4V4BBOzYKMM6TTju1aygQJtX1WnKy
	ZCpEenRzSWpJUJMlFuELCEHuS5zEMeNr4PxplxE1FmFr6EX6fvl2R6OnAjNSm4Drwcg=
X-Gm-Gg: AR+sD12R4RW0fUzA5VeIxm1E5QGGr6RB13nhJhp1Vj6loBCsbMSFjNrW1SEnE/KlrMu
	wkYbkkHuC+/CJ4GzjMRMFVuxLxS7xzioM62zW62H0O+kWiv01WiCuqlAVJZD32yXVEmxkrxCp0+
	TGXkFidOI1qTmPWfTm+wnzP2OsLG9LudkxsgkslssvP3tvDxfgR8cpBfzB36QXAr2CP/uMH/IZp
	qkAJ5zq4WDBrWcMznTzV3QdJFLCTMtUDx9NTRW7D7sBGB54zpKIgXC6D3LNy5IxmakSQTN9/T+T
	OcvYVeYq7NPO91j8HaCzQfdVDQbPQKIza0U5ZxOerlfAxSPG5xs6J5DeVObCMJcXSOmvBOvZA//
	xUwMD2BzD/bp9a9u6QIR/5J7y5lDkTJrxycgaHlOWEWd5Ebvv92JYJh2fV2LOQzFni2TpPnAcXY
	5ZXiZmbvbY1+MFZ57Yt3ubOSE6AAeoc4JqKkR2oYmF/dPctcYyzmm922pS8G+CJkZeRUg0jS/rL
	TxIzJkYzwJx+OKB59RkF+TIgxHe53XL7BnJtA==
X-Received: by 2002:a05:6122:4b12:b0:5c5:dacb:6ae0 with SMTP id 71dfb90a1353d-5c5ff6cde23mr15092352e0c.4.1787661602934;
        Tue, 25 Aug 2026 05:40:02 -0700 (PDT)
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com. [209.85.217.53])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c623d30a93sm5926877e0c.7.2026.08.25.05.40.00
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Aug 2026 05:40:01 -0700 (PDT)
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-73b909fbb6bso2888120137.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 25 Aug 2026 05:40:00 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Ro5ZZxuv6olgYeIk4K8P3Rzj5RxUQ4tvZzoLjOyvESeF1PGl4zPyYzgg2+TdOh3m9f5lV5LIg/CLmRrI5RpBlQsLQ==@vger.kernel.org
X-Received: by 2002:a05:6102:2907:b0:77d:e064:2dc1 with SMTP id
 ada2fe7eead31-77de064341fmr5703801137.0.1787661600596; Tue, 25 Aug 2026
 05:40:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260819143553.2478984-1-claudiu.beznea+renesas@tuxon.dev> <20260819143553.2478984-2-claudiu.beznea+renesas@tuxon.dev>
In-Reply-To: <20260819143553.2478984-2-claudiu.beznea+renesas@tuxon.dev>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 25 Aug 2026 14:39:49 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXqsO4Y9g+mLdeq4LZ2sosR7r7hXP0swKtRFap4qU3zfw@mail.gmail.com>
X-Gm-Features: AcwNN1W430KgO2INmLr-jl8Vwq7Neq8fxPjRN54TH1O2lbbWeDTKDcjU2n1-28M
Message-ID: <CAMuHMdXqsO4Y9g+mLdeq4LZ2sosR7r7hXP0swKtRFap4qU3zfw@mail.gmail.com>
Subject: Re: [PATCH v5 1/5] pinctrl: renesas: rzg2l: Generalize the power
 source code
To: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: linusw@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, magnus.damm@gmail.com, 
	prabhakar.mahadev-lad.rj@bp.renesas.com, linux-renesas-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Claudiu,

On Wed, 19 Aug 2026 at 16:36, Claudiu Beznea <claudiu.beznea@tuxon.dev> wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> The current functions used to get/set the pin power source check the
> OTHER_POC register, which is specific to the RZ/G3L SoC only. To allow the
> code to be extended for other power source functionalities (e.g. I3C on
> RZ/G3S), generalize the functions used to get/set the pin power source.
>
> For this, introduce the struct rzg2l_register_masks data structure whose
> purpose is to store SoC specific register bit masks. The members of this
> structure are then used in rzg2l_caps_to_pwr_reg() to retrieve the bitmask
> corresponding to a SoC specific power source capability.
>
> The conversion between HW specific power source values and SW specific
> power source values is now handled through rzg2l_pwr_reg_val_to_ps() and
> rzg2l_ps_to_pwr_reg_val().
>
> Finally, to keep the code generic, the register update in
> rzg2l_set_power_source() was changed to a read-modify-write approach to
> cover all cases.
>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> ---
>
> Changes in v5:
> - in function rzg2l_ps_to_pwr_reg_val() return power source register
>   value or negative error; due to this, in rzg2l_set_power_source()
>   dropped the val local variable and use ret instead; due to this,
>   to be able to use ret on register setup, moved the rzg2l_ps_to_pwr_reg_val()
>   call after rzg2l_caps_to_pwr_reg()
> - dropped the tags

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

This does not apply to renesas-pinctrl-for-v7.4, so please rebase.
Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
