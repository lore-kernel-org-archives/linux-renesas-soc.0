Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C246A53A882
	for <linux-renesas-soc@vger.kernel.org>; Tue,  8 Sep 2026 12:20:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788870023; cv=none; b=u6Vmm9xaVlCmk73AN1uWTKrKUQuAHQAxelx7FooV+Kn2Iw/e81xW9JZ8dApQ62SH/wfPG11+dDX8JF8yO1XwvMsB1X51sHfX9WEK/8V7Q00y+P4g9a9/U+DWBm/hrpzOWMXhOKjluNs5HxOtJPbHuaR7wOmeWbFrVEiNyMyHcF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788870023; c=relaxed/simple;
	bh=0TMTisvxJ+92sKupOfinZVmI2wJF91ccrQT+YBZKyKI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WMqbwkiJV+lvadyKZMmH+4vWu3/dtrLFFUWPFq+lKRrJuBTuEStlmpZUy0U7LBZoo+0m57rDXZR7v7Uy0AabMMHFde8idz4cdON90lGiG02btCUlCq5KaaQboGouj83FNaHUluJ3QnscoXxvam8gx5ChLPD5UzNnG5Fg8v58INI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-5309dc5cdfcso2981471cf.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 08 Sep 2026 05:20:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788870017; x=1789474817;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ofUUPAlzK0RlPGiJuLSG6vss9ksk5CLPkzJ8jLWh4TE=;
        b=e/5xne0AWHtertS2WpM35OQfrvTxWQ9mQSTw1XTmYJLapvtCJGidBfLsZIOIK9+Pyh
         JL8w+aAhiqXpbOwhmlUmI5KPVlgFfcMohmbfWNieQmF8Gf4ObwCOe+4IPEJPsjXZ+ffZ
         AYcPMg02dlHBr/KvmgiJLZ/WkEJcAB+GQWmhAtWDNGkj3AA9pHxdQJvUP1o3qX0r+neS
         E9a6Cs9XOe2HUTeCniYyO3EaflIl3YTq7C0sw4iisteiDR7hECoGj2KJuljs3L0lt7JT
         GF5icamxZegGABHFZe6BnQYoKCmtlmGQUa/rxG8lDtePHU4EuD1zlxs0gnu0Of+LiGO0
         YRVg==
X-Forwarded-Encrypted: i=1; AKwUvBx7p+FBZs9HVfxY2sq3KUaTJwBr6PMKN5EF9doyD1sHJZZ2bmAHPlAdTCVwEU1YqmWDO3CrIGiGXBjru5OtynDFQw==@vger.kernel.org
X-Gm-Message-State: AFuF++lxxPJZ370wHsmmLgmRsA0Q1GGAh/x8u9CD3ud3m4NowuOrqrIZ
	USPEycmACnQWnYWo2M6WLc06RNTvZqFh1Y3G7z7Vb22I9KxnAzWegm/RgRXkG4fO
X-Gm-Gg: AYBFou2M71sR/0IX+7fa/Q1jvIWgcTFqqpd+89cvapHbGZ5m7qohsW2ZhFRqP5Mnrwt
	byVT8SlInAcOEib76JK8wteBYReMAPN6qrUNJn8i87AlPS1PwSC6x9G5Uo9etO/SocZBVDgsw8+
	SKuqCf2ZbPTgCfrOZa9Hp3Xmipp+WE1ObMCpiwTm/D+0KozLDnjBrl6fAk6ek08fNFuzkVTTOaR
	3Lwv71m9wPtZK3y4W5+vzzCVhqVolcT5SD1EKDRBVmOAxkQ5AKigbvQjODGc62a/RO7IH5+nJMA
	jyhVloxv+lmuT9oncYXb+nRVpY0RAW1Kzm5qZQ7b+Y+hvJ7ISQY/SvT6FrWrkPocyh2kQGsyfVO
	y+k7Jq1l/JBc4skcchEY8UvzL/rr/CRU7bfyxesnnPgrKIH9Dtbfs6btLjygI9ACsm+Penmopyg
	jykckHb3DWtr7bQk1Th4YrJTy2hT2dYeLcx8szKwBxzoB8K4kS/792vscYEE3To22TAMKDBw+ei
	L3ziIpviYELLqhDApYF/G9qD68BLQ==
X-Received: by 2002:a05:622a:17c8:b0:530:42e4:1b5d with SMTP id d75a77b69052e-53054a341f1mr411198651cf.42.1788870016637;
        Tue, 08 Sep 2026 05:20:16 -0700 (PDT)
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com. [209.85.160.179])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-53087363c46sm44940091cf.18.2026.09.08.05.20.16
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Sep 2026 05:20:16 -0700 (PDT)
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-52cd38ddcdfso51293981cf.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 08 Sep 2026 05:20:16 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwHQ3VWeYbLXKhhcjMrDC4y7CMD0GlWrIWaeiUDR0qI3rUU7+YgDJH++j1BQDHbL6Dy94+RQW/TaxjcBt/Dg0VOiw==@vger.kernel.org
X-Received: by 2002:a05:6102:8098:b0:783:79ac:9dc3 with SMTP id
 ada2fe7eead31-78a4a880ccdmr9426846137.10.1788869517073; Tue, 08 Sep 2026
 05:11:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260907-rcar-du-dsc-v6-0-f8ef711a7494@ideasonboard.com> <20260907-rcar-du-dsc-v6-4-f8ef711a7494@ideasonboard.com>
In-Reply-To: <20260907-rcar-du-dsc-v6-4-f8ef711a7494@ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 8 Sep 2026 14:11:45 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXA6koxaUjv7hobWhL4eJHHDnBtn6Z44uAbf=3thn8oew@mail.gmail.com>
X-Gm-Features: AcwNN1WQMv0pxPEjkRceB80LKKGbxYp0qnUsTTCp1Uv8lpJfhrW-zDPu8BR9rQQ
Message-ID: <CAMuHMdXA6koxaUjv7hobWhL4eJHHDnBtn6Z44uAbf=3thn8oew@mail.gmail.com>
Subject: Re: [PATCH v6 4/6] arm64: dts: renesas: r8a779g0: Add DSC
To: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Marek Vasut <marek.vasut+renesas@mailbox.org>, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 7 Sept 2026 at 11:30, Tomi Valkeinen
<tomi.valkeinen+renesas@ideasonboard.com> wrote:
> From: Marek Vasut <marek.vasut+renesas@mailbox.org>
>
> The Renesas DSC Display Stream Compression is a bridge embedded in the
> Renesas R-Car V4H SoC. The bridge is placed between DU and DSI1 units.
>
> The current dtsi file does not represent the DSC at all, and thus the
> pipeline for DSI1 has not been functional.
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> [tomi.valkeinen: separated the sparrowhawk changes]
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.4, pending acceptance of the
DT bindings.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
