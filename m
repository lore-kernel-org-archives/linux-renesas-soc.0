Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com [209.85.221.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78E7C43BDCF
	for <linux-renesas-soc@vger.kernel.org>; Fri,  4 Sep 2026 11:15:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788520558; cv=none; b=SJ1nFR6BJ7QL9bJECqGTbKtEHFVOzD5gJ3LzVLEfeTLHCuxliQ9O4vcl8ZDIj5wd5rAeeup0MfX2jY/IWTMzxhxn5DgoZEHYwnWWJ5A13fQVtfEwh7Vpx96DxRh5ICi/fLXltN7XqNjcMSb+IEawuyUAeEQ6fnlIg7pynjXKYOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788520558; c=relaxed/simple;
	bh=d6jCA5GVTc0ThXif/CzYvuE2cp2VD9so0DaT8N77OTk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cye+MYmqqffUWM6H7kuFaC3MvwZe+BUeHZ6zPgEX/mKS/5b0bh1gyQSK2a/6PoMGY+gyS/CAhKUqE6Lger5fZwSVxRggxdFa4PVxWk7IC+MPt5x34xgmggUKmJvFEzjTY6pasWKgqEKQRakMwO7la6Ln/Z2dMhQ5hx/UbSCJgU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-5c652293bcdso1084613e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 04 Sep 2026 04:15:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788520555; x=1789125355;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=kFRwu393qYqOsEzkDFwmTOKtASNW/fykD0KYaVUIBVo=;
        b=J1lElGITiiFiMoa1pCDZnt+umV88/kI67/28pDXe1GE6/nMWYMu/tOxIbN8ESbimsg
         Cc5G89Hlk/9zHP3Fkp+DrmaVzSO/Bp6Fo2FDgPPnO/oIApOM/+YlwvQsw+dtSoxmNhA9
         /yE+FNuf9zQJeuQBEmuKrh47ScamU6sGt3OM9AQkueziXLZp9e1q0lAMlRs4++IMeDs3
         OCpiTxdeTD4wdabmePurWGVRf/arCfeHe6md2IYm4eNLvYdsm5/8NRJZawC8ncL8jucP
         aU287RGtt43lyCBSMoLX0h5Ny5eHZEbC/z12gXM5IvSpQYOkTzBwqXJBXYJbJ7Vl8k+o
         pgow==
X-Forwarded-Encrypted: i=1; AKwUvBxvcngL/ryVgB7v044efsVYk98eD/I6+Fbtqv+BrRweTF4IWV6pR5KcXTeS9UDAqba1yiFiuGjQdfXWi7BsGkjfYg==@vger.kernel.org
X-Gm-Message-State: AFuF++kOeysp2v1wQOfdmE9vkMxY4jSx6FQQJmS2z1ktT5aXKlJLIn6l
	lp2tZVpYDO+qum98yatwcfguxVJNdKitKvszYAd77DlUByTphskXv8m4+I4sGpbJ3wQ=
X-Gm-Gg: AYBFou3deQMIU5HjoP7JN6pOlWP3T+4Uj/IS0DB1dVVdacw0i7lboZagb6jzPpCvm/k
	XxBST3ThLCVxn5SWb3wng/9z2ExbjCxpuUcfSO18ss9gz+c81eJck11lRBBIcVRQ4Nk7uRzgjj7
	36DbnPLcReoXyvGsi/D6OTzgZAfYqmfSJNmhz7LnsX007T0l0V/5qB9UcK4NzdHvUUj1+oMrebb
	A+WaOMofCIcE1Yi2YWHHK25L+eAfaESqn8BogS0aIIicKn5QY95zn1h0cWy+hA0vT0vsJCzL6sX
	yNJMkXOm3HMRdAUXtRYXG09NlbrxmyU+Fpu9U6VdIigM7jHl16EOTXHNp8ZQRnvV47v1xYl2NpD
	kL86rM2o45ipHHT8hz7rs9Jdu0vOvnFj4E4jvhgN05rxtc/Bz0A9LoW+LEjC/YXhqmERH/lcQ9a
	nxiU4AQQYZYc4A82V2HXDre6AFN8gKQ51tN7xidwX/5pwwN5I9vgNUXcXRLQovAB1n3Zy/FAi9c
	aWrcDRHJnMyh0wr8y4B0KGdlloh8w==
X-Received: by 2002:a05:6122:e267:b0:5c6:7f44:b001 with SMTP id 71dfb90a1353d-5c7ed33606amr2575638e0c.0.1788520555393;
        Fri, 04 Sep 2026 04:15:55 -0700 (PDT)
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com. [209.85.221.181])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c7ec219c12sm1790643e0c.8.2026.09.04.04.15.54
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Sep 2026 04:15:55 -0700 (PDT)
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-5c5f23666d0so833099e0c.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 04 Sep 2026 04:15:54 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByPcrbPcSVFGUo663Cs5A0tzZyJZroM3PUUtDXAtT1g5OGdzjdrEFNlfyezrroKpVpZUiOjJEG5oUoaa9L9GRis8g==@vger.kernel.org
X-Received: by 2002:a05:6102:3f51:b0:785:b85f:2aa with SMTP id
 ada2fe7eead31-78a4a648a46mr1803410137.2.1788520554747; Fri, 04 Sep 2026
 04:15:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260704151521.211335-1-marek.vasut+renesas@mailbox.org> <20260704151521.211335-2-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260704151521.211335-2-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 4 Sep 2026 13:15:43 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUapaP-8kkWT5cXtEO1h58aAzzm34XqO_mcrgbVSyXEwg@mail.gmail.com>
X-Gm-Features: AcwNN1WMlLVxDyFWD65pnl1NyThp-Tpg9HdlxV40HKkGt6SB_vBjbsP-zmpppFo
Message-ID: <CAMuHMdUapaP-8kkWT5cXtEO1h58aAzzm34XqO_mcrgbVSyXEwg@mail.gmail.com>
Subject: Re: [PATCH 2/2] gpio: rcar: Add R-Car X5H (R8A78000) support
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-gpio@vger.kernel.org, Bartosz Golaszewski <brgl@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Marek,

On Sat, 4 Jul 2026 at 17:15, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> R-Car X5H (R8A78000) is the first member of the R-Car Gen5 family.
> Add support for R-Car X5H, which has slightly different GPIO block
> register layout compared to previous generations. Introduce offset
> remap function which performs 1:1 remap for R-Car Gen1..4 and a bit
> more complex remap for R-Car Gen5.
>
> The GPIO block register offsets on R-Car Gen5 changed and the change
> can be divided into five groups, registers which remained at the
> same offset, INDT register shifted by +0x10, OUTDTSEL register
> shifted by -0x34, INEN register shifted by -0x38 and the rest of
> the registers used by the driver shifted by +0x70 .
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Thanks for your patch!

> --- a/drivers/gpio/gpio-rcar.c
> +++ b/drivers/gpio/gpio-rcar.c

> @@ -65,14 +66,59 @@ struct gpio_rcar_priv {
>
>  #define RCAR_MAX_GPIO_PER_BANK         32
>
> +static inline int gpio_rcar_remap_offset(struct gpio_rcar_priv *p, int *offs)

IMO passing a pointer to offs complicates the code.  Perhaps pass offs
by value, and return the adjusted offset or a negative error code?

> +{
> +       /* R-Car Gen4 and older do not need any offset remap. */
> +       if (!p->info.has_layout_gen5)
> +               return 0;
> +
> +       /*
> +        * R-Car Gen5 register layout is slightly different and the offsets
> +        * that have to be added to or subtracted from each register offset
> +        * can be divided into five groups, listed below.
> +        */
> +       switch (*offs) {
> +       case IOINTSEL...OUTDT:
> +               return 0;
> +       case INDT:
> +               *offs += 0x10;
> +               return 0;
> +       case INTDT...EDGLEVEL:
> +               fallthrough;
> +       case BOTHEDGE:
> +               *offs += 0x70;
> +               return 0;
> +       case OUTDTSEL:
> +               *offs -= 0x34;
> +               return 0;
> +       case INEN:
> +               *offs -= 0x38;
> +               return 0;
> +       default:
> +               /*
> +                * This here must never be reached, if this is reached, that
> +                * means there is a catastrophic failure in the driver. Skip
> +                * any IO read/write to prevent further damage.
> +                */
> +               WARN_ON(1);

A build-time failure would be better.  I tried BUILD_BUG() instead,
but unfortunately gcc is not smart enough to notice this case is
never reached.  __always_inline doesn't seem to help either.

> +               return -EINVAL;
> +       }
> +}

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
