Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EB9446AA7A
	for <linux-renesas-soc@vger.kernel.org>; Wed,  9 Sep 2026 07:56:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788940587; cv=none; b=EzLx6zp98BG9vEFo74OXY9YVTQKS/LvjrT30SYA4i0Yc2IsxpHRM9Z869DymIk86K1L/N0aDGJ/i8zMR46lvoHFfCwMvPxfjjzcHqcus1G+0bEGd1VhrDl3NRhbji9nCd+ZC0WsGTsXXjc8EVDpigPB/oCZA1FiZdq28IDLkXsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788940587; c=relaxed/simple;
	bh=jIL/ineDSN9RSASWLEndVFHVKkHoHz+xKZ4KgMvLjJs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ECvuCryezdCX6gNoWuHhj4ldog4FtV/YU1y5s9ddbgER5FwtIqMBLnQv2/zWtYcY3+9emD9c6etpZZ/+tadjFKNTvTQZiHEf1ZhGf9Q8NF3Sj7agIsFw0JIZ/NMIEFMmpDAVSewfiZHlGlrbHSkI75t/mYnIOm8Cq+qksN0PIF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6a682579c72so7390728a12.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 09 Sep 2026 00:56:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788940583; x=1789545383;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=FFRHIlgUH34gNIFpS8cBfqFWe89JRGpFMu8JNscE7T8=;
        b=CD9MC8aU9n07g5lM7XFBQB20kYuSboL2y3IuS926hL2QSV/kf4tKr/FNu2mNKlNXsL
         V3WYhBWpry0SiFouPRHV4eAjORfF1w8N1HwVLG61RE5pj1DifFMXZsJJLXc4OGwFXTQu
         /hiR20UHxW9s08c47iLQahH9xsXFyNoErUbfgtI3bjde823TIfpIX+PXmalwHG6p9gNm
         x7aJFE7zY1oubldh/5uWyYAYlEou0z0Rfb7oxEHAnsCLquAGR3vfbkgPy77vsaA1zY1T
         aTIRuWCT8pHxaLf0LzE8Satij/PG38sf/YlhIowglw/1jjfvgluuKrFNjhyAu/7bwZHS
         IxqQ==
X-Forwarded-Encrypted: i=1; AKwUvBzvcjl2DopsW4dQn1cE1AtaUv/ttKh30P4lwY+euUkxAA/tnm0DyJQi98dqwZJmgx41OvEX0GkLE/mxZCt0BM9UTQ==@vger.kernel.org
X-Gm-Message-State: AFuF++lcBxbqFIz6lrBDDrqhdavm8aJPzjwmsK1VvU9MrKyi7/2Gs6x8
	WRlxNe9V45aEU4dfJzGwVWX6aPhYxN54hAZDW9UvUZe4AgH9HuaqLehj5eyH9kvnFJk=
X-Gm-Gg: AYBFou3MwfxbcLx9/Zke0JNz1+NjbjgYwzd7O90FlzNaqqIxmqCfZT5unJPcSS4fyHG
	pS4CbwRMN5jorv5IPOGehfifHKPIcIIH6sWT0IC6mqig36kDb8yigek54XYXeajT9wRK+XDRCGc
	ynl0gqDAgONE40u0yIoKAx8cvGF/t9DzgCy16cdNPrLCMm/qna2d/pkyMIPZZP41VZXge0I08ex
	toGk9365IvURTNp74EG37hP9gG3WH9wB9pK5GfY40+WcrVzVpjSLx2Io8klpM5t1Omw25k/l7yo
	crcMYvT0zkTKeUOmOq8OM8EkmX0CMZ3nK6RATaCrzhzxDSnaqOcty4nAgCFSwm/1RwrrSCAfS2E
	Qweo1ogSu+T8/ia9Fy8YHKH5A0ebRI3l/8sF1/waz2y1oYjs+pq/cfPTz+mFEXarpO+c496Nns+
	MccVKPISdB2nAOsxJM2nWP5k+qaxIRfs/J845OEV+cLIyCkxZ/nr5lIPZa0rfj7I7rZYMl/+uTn
	f5EirxJazUmMJo4kfHLRa9Tw9E4Mk5G5l6asITY7Ur7y80=
X-Received: by 2002:a05:6402:28cc:b0:6a6:32f9:e9ee with SMTP id 4fb4d7f45d1cf-6a7e8e9281cmr21998314a12.17.1788940583091;
        Wed, 09 Sep 2026 00:56:23 -0700 (PDT)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com. [209.85.208.47])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a7e68a6e0esm6603728a12.9.2026.09.09.00.56.19
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2026 00:56:20 -0700 (PDT)
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6a61910369bso6205791a12.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 09 Sep 2026 00:56:19 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBy8V+oHA0O2IiWxHXaYBA3bc0QZT/JjMZ2X7YZc+VcTasHAYQQjKFmZ7QX+k80/v8j/f+DdSSn4aO2TN3yCXivWKQ==@vger.kernel.org
X-Received: by 2002:a05:6402:44db:b0:6a6:7fa6:f0ac with SMTP id
 4fb4d7f45d1cf-6a7e8f9e843mr19491213a12.22.1788940578727; Wed, 09 Sep 2026
 00:56:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260808025724.131943-1-marek.vasut+renesas@mailbox.org>
 <CAMuHMdWvLX7OZSkfEBA34wKtnoZ4asB6rWFJiLa=2+=fezqsCA@mail.gmail.com> <f82ae578-fbe7-4834-bdde-d11e194a507f@mailbox.org>
In-Reply-To: <f82ae578-fbe7-4834-bdde-d11e194a507f@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 9 Sep 2026 09:56:06 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXQKL_srr80mUmsnznqJ_qxAoh0TdwyvJ41=CN=2pDjCQ@mail.gmail.com>
X-Gm-Features: AcwNN1VBlUkOuc1dFERdA1IT0JCfCvNrtGVHmcnj2K9AZQ9QnT8wN-u_7o86Wro
Message-ID: <CAMuHMdXQKL_srr80mUmsnznqJ_qxAoh0TdwyvJ41=CN=2pDjCQ@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: sparrow-hawk: Add overlay for
 WaveShare 2CH CANFD HAT
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>, linux-arm-kernel@lists.infradead.org, 
	Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Marek,

On Tue, 8 Sept 2026 at 19:02, Marek Vasut <marek.vasut@mailbox.org> wrote:
> On 9/8/26 2:02 PM, Geert Uytterhoeven wrote:
> >> +&pfc {
> >> +       msiof0_pins: spi-ws-2ch-canfd0 {        /* SPI_0 */
> >
> > Node name should be "msiof0".
>
> Do we also have to fix up
> arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk.dts this:
>
> "
>   755         msiof1_pins: sound {
>                            ^^^^^
> "
> ?

Might be a good idea, to increase consistency.

> But I wonder, shouldn't the DTOs contain unique pinmux node names, which
> cannot accidentally overlap with the base DT or other DTO node names ?

In general, the answer is yes.
In this case it is about pin control subnodes. If the base DTS already
uses msiof0, its original user needs to be disabled by the overlay
anyway.

> >> +               groups = "msiof0_clk", "msiof0_txd", "msiof0_rxd";
> >> +               function = "msiof0";
> >> +       };
> >> +};
> >> +
> >> +/*
> >> + * PWM1 uses PWM1_B pin configuration for pin GP2_13. This conflicts
> >> + * with SPI_1 CE_1 signal which is also on pin GP2_13. Disable PWM1
> >> + * in case this hat is in use.
> >> + */
> >> +&pwm1 {
> >> +       status = "disabled";
> >> +};
> >
> > Please move this node disabling pwm1 to the top, for compatibility
> > with dynamic DT overlays.
> Could you expand on that a bit ? What difference does the placement of
> this node make within the DTSO ? Please pardon my ignorance.

In case of a dynamic overlay, pwm1 must be disabled before SPI_1 is
probed.  Otherwise the latter will fail with -EBUSY due to the
conflicting pin being still in use.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
