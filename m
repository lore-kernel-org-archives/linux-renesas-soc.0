Return-Path: <kieranbingham.mailinglists+caf_=kieranbingham=gmail.com@gmail.com>
Return-Path: <linux-kernel-owner@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <1480410716-25993-1-git-send-email-jacopo@jmondi.org>
References: <1480410716-25993-1-git-send-email-jacopo@jmondi.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 1 Dec 2016 09:47:22 +0100
Message-ID: <CAMuHMdWdcOLr+gQdeG1CHCQ8n4M2939eXA5rxQynjARpG6zmYA@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: sh-pfc: r8a7791: Add ADI pinconf support
To: Jacopo Mondi <jacopo@jmondi.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Jacopo,

On Tue, Nov 29, 2016 at 10:11 AM, Jacopo Mondi <jacopo@jmondi.org> wrote:
> Add pin configuration support for Gyro-ADC, named ADI on r8a7791 SoC.
>
> The Gyro-ADC supports three different configurations:
> a single ADC (adi and adi_b groups), 2 ADCs selectable through a single
> channel select signal (adi_chsel1 and adi_chsel1_b groups), up to 4 ADCs
> through 2 channel select signals (adi_chsel2 and adi_chsel2_b groups)
> and up to 8 ADCs through 3 channel select signals (adi_chsel3 and
> adi_chsel3_b groups)
>
> Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>

> +static const char * const adi_groups[] = {
> +       "adi",

As the group names below have a suffix ("_chselX"), I think it would be
good to have a suffix in this group name, too.
Usually we have splits like "data" and "ctrl", but in this case, the group
covers both data and control signals.
"adi_common"? "adi_base"? "adi_spi" (but it's only SPI in mode 2/3)?

I'm out of inspiration...

> +       "adi_chsel1",
> +       "adi_chsel2",
> +       "adi_chsel3",

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
