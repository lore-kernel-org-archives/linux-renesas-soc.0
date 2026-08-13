Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com [209.85.222.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA5B2476697
	for <linux-renesas-soc@vger.kernel.org>; Thu, 13 Aug 2026 12:41:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786624876; cv=none; b=QS4EcVfVPwvz1pWx3LZO1VUNogWtVPCajdr2axHulIAlZWM4PgtVDX0Peg4zD3Xw5cVxxUUpeKC1PcybTLun2MStSKC3R/shhsEN+Jpc5wL+2SgU7+ec1Z3LPb/G3iy3Sc1sgXwMbgHA8u2tJLAECUwAzJnrOUs3Xf7EFgA5e3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786624876; c=relaxed/simple;
	bh=7tWUhsTf7yuYmukkfQ9m0Oxs9WCPgFyK+IQUvr2VHOc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kiiI/KkQDKONKYZ+94fgvz0H/nUAqZd5wTPO6P24q68AvAvEmhfOZzDkbQi7W690rVbO2pLVWi416WJh0FnVWs5RVSKFv1bw4jqIr9k68bM5cVDiwSMD8taqDuWHRQIr1tXW9mNMkbm4rmFRv7xsZYw/osux1t+OJoThv2yK44Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-9696319e14dso763529241.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 13 Aug 2026 05:41:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786624873; x=1787229673;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oqIqDSfBSxHW2hfkal8cX0hwZXtcD3FzDsHZ3Y3Mk9Q=;
        b=neZj/ew3nrEbYozHkrUoC7iLG4TxuAEgHc2Rzn7TxvyqYwoSAVX2UrkEyFVLA/jDpV
         dthoMi0UiOCIWfTmj4JQjx2UmViO7Ub25KqZG9lhCP2xbGEOXRXVhknZexeXLEXIdCzn
         FCtXpSo+biRVc7mZhJUpmGLgV67CfUzgGILftbC4KLsapAlei57G9p1zbcWmzF5+g64b
         ihKkAmmIsvPYiVXvdPODlk3dJhYln0iW1pWBa673TNTHIVZMrhVMfkQxBvPwlseJwua/
         DXsHh6nhmCm1pN/FNXpXoBU+aeion0gHZ+dEOT9EneUyKtvkmA4cWOTXof2LkVQC+uCD
         p/jw==
X-Forwarded-Encrypted: i=1; AHgh+RpH092LajFFDc67cH9g8LSsI6aVGwNKx2O0btH8fvgxauqaGAs5nUcLqNic/GGGArYQiNlDZ4Ttjl+Y0KwuxA69JA==@vger.kernel.org
X-Gm-Message-State: AOJu0YygtDlj310ZN7HV/I5zSYWs4ko549EChdtVhLeWpPNdVgQLF9M5
	aYQcqitBTXk6Nj1EPTAbQYIIHw/Lnt7ov76Y5zXdejBl07ZEGqZVXmvFWQLKV3c/
X-Gm-Gg: AR+sD10AjqSwBIFcgMZFnPJYw6An4jpwTc4bez/sG9iXRLZW1kSF9ZDxg1dBhqfPR06
	poBJ8oLJ7B0cs+b4eRJqpgmKp+YWerX1fr9SyVB1/zgVN+oqX37ae+k49X11mC1BBiSxWu2q4R4
	lMgr3YSvc2hX8QfIfOgXHcMQlVMV0bbtvfSyWtg28PHQz4fftVOpyx7FYWivUA9ZQmZYhPntWVh
	IU+ki3i693F/I9UG0ynsdiwFyghDdb/8H1aNBSbgobdEAmpZlZVIP9xCgFNrbMm2VcZhkgKjL6K
	wYyeMCWO985faMOZw2qiRsigVes+KmSiL+kgW2+Udx0MHU/LgBq054vNLtNde1qccDaQGA38kbr
	LGC5/yqePEYH7sCO7q7wc+AeBtPGUgUvy7GD9CPj4WCkB13mAlzncsEJaDtvZZ/LZICZwoipQkl
	LqDlAjZS/EsknY4Ku1D5rBL8Q/LnaOSVDLNS7tjYhxKqH64PS2OJJQFuWIYdzM5duLxCjBNjLhv
	VWM9ywI+wUr/Gy3v8r1Z/kFhgYI7DuwyJEj
X-Received: by 2002:a05:6102:8090:b0:738:1fcb:f276 with SMTP id ada2fe7eead31-76db527e124mr1274086137.1.1786624873533;
        Thu, 13 Aug 2026 05:41:13 -0700 (PDT)
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com. [209.85.222.42])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-97becae7d19sm837801241.4.2026.08.13.05.41.09
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Aug 2026 05:41:11 -0700 (PDT)
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-977fbb9dc5fso579636241.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 13 Aug 2026 05:41:09 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rr6XsNtjbYAFnu+ADadYvoW/50EkIWFGBemnN43jCGisWcDMPWuS/oa3WCw6RgPPoJeXn5hd5OYDhytf45QZsZoTg==@vger.kernel.org
X-Received: by 2002:a05:6102:2929:b0:739:478b:5bf2 with SMTP id
 ada2fe7eead31-76db856c8e1mr1303873137.13.1786624869514; Thu, 13 Aug 2026
 05:41:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260723154154.319674-1-biju.das.jz@bp.renesas.com> <20260723154154.319674-2-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260723154154.319674-2-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 13 Aug 2026 14:40:58 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXkj6E4pPCYbGGGGgL+Q57VuBf06B10Kyjkmd6yd4_jhg@mail.gmail.com>
X-Gm-Features: AUfX_mwfwYc46fKSTK2CZeQ2PKXNjkYeqMfpZWqO1-br0yPfVIChndaOIQ5XDSI
Message-ID: <CAMuHMdXkj6E4pPCYbGGGGgL+Q57VuBf06B10Kyjkmd6yd4_jhg@mail.gmail.com>
Subject: Re: [PATCH v19 1/4] pinctrl: renesas: rzg2l: Add SD channel POC
 support for RZ/G3L
To: Biju <biju.das.au@gmail.com>
Cc: Linus Walleij <linusw@kernel.org>, Biju Das <biju.das.jz@bp.renesas.com>, 
	linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 23 Jul 2026 at 17:41, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> Add power-on control (POC) support for SD channels 1 and 2 on the RZ/G3L
> SoC (r9a08g046).
>
> Introduce PIN_CFG_IO_VMC_SD2 capability flag (bit 22) and SD_CH2_POC
> register offset (0x3024). Extend rzg2l_caps_to_pwr_reg() to return
> SD_CH2_POC when PIN_CFG_IO_VMC_SD2 is set.
>
> Replace RZG3L_MPXED_PIN_FUNCS() with RZG2L_MPXED_COMMON_PIN_FUNCS() for
> port PG and PH pins, dropping PIN_CFG_SOFT_PS which is inappropriate for
> SD pins, and annotate them with PIN_CFG_IO_VMC_SD1 and PIN_CFG_IO_VMC_SD2
> respectively.
>
> Annotate all RZ/G3L SD0 dedicated pins (CLK, CMD, RST#, DS, DAT0=E2=80=93=
DAT7)
> with PIN_CFG_IO_VMC_SD0 so that power-source register lookups work
> correctly for those pins.
>
> Add sd_ch2 field to rzg2l_register_offsets and rzg2l_pinctrl_reg_cache to
> save and restore the SD_CH2_POC register across suspend/resume cycles.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v18->v19:
>  * No change.
> v17->v18:
>  * Moved sd_ch2 variable near to sd_ch[].

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-pinctrl for v7.4.

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
