Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com [209.85.221.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7568C360EF9
	for <linux-renesas-soc@vger.kernel.org>; Tue,  8 Sep 2026 09:56:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788861386; cv=none; b=F9LRNoKVYyaKdJaKfkb+MPobeaET41b6QXuYVldYHKjsSK0y4sKD2jvBXE6oOEbBJIMDChMGbOaUeUk82Za7WFbC7VBfI12aVcP20Wutb/h6XuR1ePx5wYel0yskQpVvJrNXGqCMqDvtEgJi4p9JrBfl7qKgmFTvJZDdHLDouVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788861386; c=relaxed/simple;
	bh=NXZNmgvu0XequOW0h/JSVE4Z5uMg/YTzszCCImTyPlw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ko7QcKUetIGBFq4l99D7p0k/O2U0TFLlG+E41pqXDhGT7HVWEt4dWRyCqqzeWKzmFnUASe/fxLuBGh5i5i++giP+VwgTpAkVVD/P5wxYB+hBE1mTA8Ncz4uOxD7YZsCzcWeYjys3Gv/xhHeSc9puvYjIRwbWklR+zE6D3ZcrVxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-5c7d1512dbfso3569063e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 08 Sep 2026 02:56:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788861384; x=1789466184;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Frf4CDKY0g6g3QawhbxdAbsjmWIQZS7SHxphY7Ve0uc=;
        b=Pxii9uhBczLQkSFQAAm2yeWqrov0O866QwxttSxouVTcLlpbOCAp2ipMHwaPoJtT2U
         Z1i3tPkroao56l+rE0UEJU7wnQpJXDPztrbNLEnFBcPV38MAgbDGcegC9w7asynH4XqO
         OMLHFPsGQJ08hZc3l6I/GcUZ6m2/6HwggHeZsVMaNgJzcp2NQBryDErLeoshfX5lSnKh
         34knZi1qnxew4UtblvNYEZHE47qagg9n1pHQYBomy8mt8hPFhplxKwBN8HVvKmExCxCg
         LzKFeDajTvvEbKeIC5sq44VsZeqnYs/m2aYzzpAa2HGNxTH8WCr2TCoip3yj8Zl9jY3l
         Z2sQ==
X-Forwarded-Encrypted: i=1; AKwUvBw4owadTOjaBSGimvP5XI9ucSkvQgkMxO8Jf5eKDYZWL/yxVxZUoX4N3loS+kZWxHJITTtsdOLar2RXYSx423GwOA==@vger.kernel.org
X-Gm-Message-State: AFuF++kxabpRAdpkAmbwKfvM3MQskVxhoII54LBUwDYH2lDUIigVLwE3
	QoO6dvs9Nlqi3reit8ucMtazX6lF9Nv2mc59z+65SaSOX+s8AW2DRqMBxZMt2HzD
X-Gm-Gg: AYBFou2HNdlK3HjHm7IAihK1fej2wHI6gI9r0/TJ5nbaNbqeS9Xm3tMhohTd/CbfsL/
	1YpS/mGS2a6VzieiT8LtbotbRi6G3XL3EaET9dTfyktCjOQ/ahHE9kGwSpl0KOHR8T8f3dXGm4z
	zcgAM2bjscsK5BK0xF3HgAnilnlShQKu7zoIityKn+4aU0hbmowO10UFRB7yQl3sGoay3GM0Kgx
	ZQWHDHN37MO5u2g+PGbeayp8tskdYNgmbcwI4Ny6OaAyetctFP9TS2IZRhtXWX6ORuvi5zCH7wX
	pQK8ah7EvN4/SFBTK+kDwT2XNofnvNpgWztUF4VcBg2eUOTHVO7ArjYtQIdPOvRLtg5zbsq/sgs
	i6XvTekBajbzBBsJs+YgQnpOHKYfTpNc9pd9HGln+fHyaIbLUEMKe6fNiG1w5WLJDpi3KnSUIih
	RA8IUaDGjo1y8aFxFxxO/C69QkuXHiLHJXcvaneKkx+wU0QQhlGawGwCyEL75P/t+sOFJGJuozU
	DbeFi0X4WnN1wM/cDhlZwoOCg==
X-Received: by 2002:a05:6122:1d08:b0:5c7:98a9:cf95 with SMTP id 71dfb90a1353d-5c7ed603f9dmr14633269e0c.4.1788861384086;
        Tue, 08 Sep 2026 02:56:24 -0700 (PDT)
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com. [209.85.217.45])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c7ecac1033sm9560009e0c.18.2026.09.08.02.56.23
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Sep 2026 02:56:23 -0700 (PDT)
Received: by mail-vs1-f45.google.com with SMTP id ada2fe7eead31-782df51b4c1so3266251137.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 08 Sep 2026 02:56:23 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzon5UjU+e1R7uTDYN6ojN39/Cg5as7wBmijvBPN4WJdYSORkpIq1P4UzqcB+h1SbsJDgHZmsJp0RWruBf2kya7fQ==@vger.kernel.org
X-Received: by 2002:a05:6102:6b03:b0:77b:ae7:1bba with SMTP id
 ada2fe7eead31-78a4a72eac3mr12923163137.3.1788861383206; Tue, 08 Sep 2026
 02:56:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260817185700.322370-1-cosmin-gabriel.tanislav.xa@renesas.com> <20260817185700.322370-5-cosmin-gabriel.tanislav.xa@renesas.com>
In-Reply-To: <20260817185700.322370-5-cosmin-gabriel.tanislav.xa@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 8 Sep 2026 11:56:11 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUHAXzRiODL9hphVTjqKOHNVUe8cOygXESWF6_r7Ou2yw@mail.gmail.com>
X-Gm-Features: AcwNN1V3nOK0dJ3UvwLd7mgfKmiEg244M-OC0mkyJDzXDnUsNESnG0OLJvnPvSU
Message-ID: <CAMuHMdUHAXzRiODL9hphVTjqKOHNVUe8cOygXESWF6_r7Ou2yw@mail.gmail.com>
Subject: Re: [PATCH 4/7] pinctrl: renesas: rzt2h: fix reading pin value in IRQ function
To: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
Cc: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Cosmin,

On Mon, 17 Aug 2026 at 20:58, Cosmin Tanislav
<cosmin-gabriel.tanislav.xa@renesas.com> wrote:
> rzt2h_gpio_get() only reports a level for pins in input or output mode
> and returns -EINVAL otherwise. When a pin is requested as an interrupt
> it is switched to IRQ function and its I/O mode is set to Hi-Z, so its
> value can no longer be read.
>
> gpiolib calls gpiod_get_value_cansleep() to determine the edge's
> direction when a line is watched with GPIO_V2_LINE_FLAG_EDGE_BOTH.
> Non-zero values are translated to a rising edge, zero to a falling edge.
>
> Since gpiod_get_value_cansleep() ends up calling rzt2h_gpio_get() which
> returns -EINVAL when the pin is in IRQ function, every edge is reported
> as rising.
>
> When using the IRQ function, the input buffers are enabled and the PINm
> registers reflect the live state of the input.
>
> Report the input level even when the pin is used as an IRQ.
>
> Cc: stable@kernel.org
> Fixes: 829dde3369a9 ("pinctrl: renesas: rzt2h: Add GPIO IRQ chip to handle interrupts")
> Signed-off-by: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>

Thanks for your patch!

> --- a/drivers/pinctrl/renesas/pinctrl-rzt2h.c
> +++ b/drivers/pinctrl/renesas/pinctrl-rzt2h.c
> @@ -171,6 +171,23 @@ static int rzt2h_validate_pin(struct rzt2h_pinctrl *pctrl, unsigned int offset)
>         return (pincfg & BIT(pin)) ? 0 : -EINVAL;
>  }
>
> +static bool rzt2h_pin_mode_is_peripheral(struct rzt2h_pinctrl *pctrl, u8 port, u8 bit)
> +{
> +       return rzt2h_pinctrl_readb(pctrl, port, PMC(port)) & BIT(bit);
> +}
> +
> +static u8 rzt2h_pin_read_pfc(struct rzt2h_pinctrl *pctrl, u8 port, u8 pin)
> +{
> +       u64 reg64 = rzt2h_pinctrl_readq(pctrl, port, PFC(port));
> +
> +       return field_get(PFC_PIN_MASK(pin), reg64);
> +}
> +
> +static bool rzt2h_pin_read_input(struct rzt2h_pinctrl *pctrl, u8 port, u8 bit)
> +{
> +       return rzt2h_pinctrl_readb(pctrl, port, PIN(port)) & BIT(bit);
> +}
> +
>  static u8 rzt2h_pin_read_pm(struct rzt2h_pinctrl *pctrl, u8 port, u8 pin)
>  {
>         u16 reg = rzt2h_pinctrl_readw(pctrl, port, PM(port));
> @@ -847,6 +864,13 @@ static int rzt2h_gpio_get(struct gpio_chip *chip, unsigned int offset)
>         u8 bit = RZT2H_PIN_ID_TO_PIN(offset);
>         u16 reg;
>
> +       if (rzt2h_pin_mode_is_peripheral(pctrl, port, bit)) {
> +               if (rzt2h_pin_read_pfc(pctrl, port, bit) == PFC_FUNC_INTERRUPT)

Section 17.4.5 ("PINm : Port m Input Register (m = 00 to 35)") states:

   "The PINm register is valid not only for general I/O mode (PMCn = 0b)
    but also when peripheral function is selected (PMCn = 1b) and it works
    as input."

this is not limited to PFC_FUNC_INTERRUPT, so I think you can drop
this check?

> +                       return rzt2h_pin_read_input(pctrl, port, bit);
> +
> +               return -EINVAL;
> +       }
> +
>         reg = rzt2h_pinctrl_readw(pctrl, port, PM(port));
>         reg = (reg >> (bit * 2)) & PM_MASK;
>         if (reg & PM_INPUT)

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
