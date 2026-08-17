Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F8A33BB678
	for <linux-renesas-soc@vger.kernel.org>; Mon, 17 Aug 2026 09:46:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786959998; cv=none; b=iwTf7pva0SM4d4oxZB6CNfJRgUs2Ptim8Gs4gbZgxQOWDQ6AZL7/XQHNJQ4h4t/H3RmA8S/9zRYIZ6lCRRW11Gvd7KDsizRoreJm+fRccJsrKc56u65rN9O0WIo4uw75jL13Mp1wuGTt5uSu8Xg07Eisj5ZnlIoAzN/oSi+fubA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786959998; c=relaxed/simple;
	bh=LCHeg9vuB3FBvkWntuAEI5uvGJN34D18AlJx8xCDtak=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NU7XDKtGODtukK72DO1QbVNVsM+V0j/DFdX7jxQzfL5x2nJ01Z0AFtIgMu3mmDtrK0PoGtmOTISI+XbhNWU+dybWWo+dpW6dcd5j4gHogdMdPd7uWKO/Z9Adcpt+rHMdY3w4vEn0DRmmeKhxe9HbtuYP07NkhMbE8elpVXAEk/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-5c56dbc3a51so774045e0c.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 17 Aug 2026 02:46:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786959996; x=1787564796;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=3UFyHhdBqPN0GbhgGILHuViQXldTAJKU85xm0W0LQ/w=;
        b=fgmnwgQkv9bqHS1lXHJB0bd7xQQp8ipIZKIktmvq262nLxlQRo8h3IxxMs1Wco7ECj
         cDibvMp/8xbv3wn7n33+QHK+mir5rWCewNB5tHFmZt5tIJM5Ahcyq6fl2B6GsUOUNbXL
         19Rha6I++Fs98QWID8dBDs2NqaGZATh5erDe5BPyebF5Sna5EQNh3NnQXab0Mwzi3Tcp
         vNZyHDfXMSYzlraTG5DKH2/i8j2wi8m3+tNhpTD2t+zjnwAjF7y0CBPdgMHuSUlNVdEh
         2Dd55MkbeFaFr+2M4GNJvIyGR2T9AIq2+IPsfIJ1lNdpMaAhtR6XDN4FuuvApBdIy+tx
         D4YQ==
X-Forwarded-Encrypted: i=1; AHgh+RqoKgKmSmDpWVGEMHov2QGBLLedYngybssmGYz14rD8HGvaR+XufSYU+ASsNSJl9YBCUN8RRup8qClFJifQxPPOmw==@vger.kernel.org
X-Gm-Message-State: AOJu0YySkqViprEOUCWVNpQfSo7quhOfHz2uNY3de9ZKL/UfvHySrVbI
	pRgyg013iDwQwR3dmuFOXepF7JtlMc9VLkyGRgWYjKuefZmDQ4ZrZ31fYieXbk6U
X-Gm-Gg: AR+sD106skRG+MvTCHGI9Kg9Zo8IEmAiQzabDBTFuUBvAX2n/k3JpwrBJIcKRGj9PHR
	YQmh1Tmh/Hd3oigsIuvx2iZrDgHYFBsaSm1wxWpPhsJn+sCVjr0lCcF70ey0nAQBxUDhlIrAejS
	PAjFWFF3UAQNPwBAYqwfA+AUwsqIJfXYT5UJ/ewSeyb3vQemEnzp6H2M6mA4jzj4W6Gvy+4O+uo
	0APD53CyR2XCroVceTAfpHVnBaQ1H75E8UCE3195At+NHhPZeYwNKaohkp/RxF9PDdBJ8YMEU4a
	EFtDFngm6h4+BwBJQue/LPg2UF/cWcmy4MfBpDltLWRYvRzorhb3d+ZzqOxRR+ao3j2aiVqNtHS
	Y5/OdKC169qeCyQJBRc4DQEzMNHtzooivWLhfPSyTQyhW9PSh738GsUkocgJD6Wgikv3MWNZwaI
	vgYh4wsUVVrMjayd+SdNTJpb7ExipoXKAgUt5RtDZXVGdnKcMPra1TdoPfsYN/syd1ScIXY2A0L
	LGMbRwZdWvW89GeledqmKKrCRUpckk=
X-Received: by 2002:a05:6122:6e0f:b0:56d:b639:5c0d with SMTP id 71dfb90a1353d-5c591f7ef58mr3975565e0c.13.1786959996237;
        Mon, 17 Aug 2026 02:46:36 -0700 (PDT)
Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com. [209.85.221.173])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c5c761bccfsm515767e0c.3.2026.08.17.02.46.34
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Aug 2026 02:46:35 -0700 (PDT)
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-5c2c96286f0so1190101e0c.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 17 Aug 2026 02:46:34 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RrEhAFqobMMOXwjy36ECP0JI9Y9QRmTvfOgwfWADupB43cHG8rM180GDGlM0D6Qo4uqDcJIqgqNjU5WOlyqNrHP9A==@vger.kernel.org
X-Received: by 2002:a05:6122:caa:b0:5bd:cb34:1b70 with SMTP id
 71dfb90a1353d-5c591c98081mr3829490e0c.1.1786959994433; Mon, 17 Aug 2026
 02:46:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260814191415.2110732-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20260814191415.2110732-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20260814191415.2110732-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 17 Aug 2026 11:46:23 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVKy1QOh6vBGf8xFGTw0c_htgF8JYA-VnDH=muL1G03EA@mail.gmail.com>
X-Gm-Features: AcwNN1XeWYM04fSzyWxMFlNboGEYsCueoJUOD-EEgYm_hkndon5OVe93-Hsyb5Y
Message-ID: <CAMuHMdVKy1QOh6vBGf8xFGTw0c_htgF8JYA-VnDH=muL1G03EA@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] watchdog: rzv2h_wdt: Propagate WDTDCR access errors
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Guenter Roeck <linux@roeck-us.net>, Wim Van Sebroeck <wim@linux-watchdog.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, linux-watchdog@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Prabhakar <prabhakar.csengg+renesas@gmail.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Prabhakar,

On Fri, 14 Aug 2026 at 21:15, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> The WDTDCR helpers currently access the register directly using
> `readl()`/`writel()` and therefore cannot report failures to their callers.
> WDTDCR is located in a shared syscon region and will be accessed through
> regmap in a subsequent change, where register accesses can fail.
>
> Make `rzt2h_wdt_wdtdcr_count_start()` and `rzt2h_wdt_wdtdcr_count_stop()`
> return an error so their callers can propagate failures.
>
> Handle these errors in the watchdog start, stop and restart paths and
> unwind resources acquired before the WDTDCR access. In particular, restore
> the reset and clock state and release the runtime PM reference as
> appropriate when an access fails.
>
> The helpers still return zero with the current `readl()`/`writel()`
> implementation, so this change does not alter the driver's behaviour by
> itself. It prepares the error handling required for the subsequent regmap
> conversion of WDTDCR access.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> v2->v3:
> - New patch, split from v2 patch #1 to make thing easier to review.

Thanks for the update!

> --- a/drivers/watchdog/rzv2h_wdt.c
> +++ b/drivers/watchdog/rzv2h_wdt.c

> @@ -234,8 +250,19 @@ static int rzv2h_wdt_restart(struct watchdog_device *wdev,
>         rzv2h_wdt_setup(wdev, priv->of_data->cks_min | WDTCR_RPSS_25 |
>                         WDTCR_RPES_75 | WDTCR_TOPS_1024);
>
> -       if (priv->of_data->wdtdcr)
> -               rzt2h_wdt_wdtdcr_count_start(priv);
> +       if (priv->of_data->wdtdcr) {
> +               ret = rzt2h_wdt_wdtdcr_count_start(priv);
> +               if (ret) {
> +                       if (!active) {
> +                               reset_control_assert(priv->rstc);
> +                               clk_disable(priv->oscclk);
> +                               clk_disable(priv->pclk);
> +                       } else {
> +                               reset_control_reset(priv->rstc);
> +                       }

FTR, this else-branch is also new in v3.

> +                       return ret;
> +               }
> +       }
>
>         rzv2h_wdt_ping(wdev);
>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
