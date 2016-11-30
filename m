Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wm0-f65.google.com ([74.125.82.65]:33412 "EHLO
        mail-wm0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1756277AbcK3NtR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 30 Nov 2016 08:49:17 -0500
MIME-Version: 1.0
In-Reply-To: <CAMuHMdUcxJ6fiahvG+Ydha_Tp5RkppSemb=1qkGRwpb4ACGoZw@mail.gmail.com>
References: <1480410716-25993-1-git-send-email-jacopo@jmondi.org>
 <4558124.JutbKSQ7ug@avalon> <CAMuHMdUcxJ6fiahvG+Ydha_Tp5RkppSemb=1qkGRwpb4ACGoZw@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 30 Nov 2016 14:49:14 +0100
Message-ID: <CAMuHMdUhhZ5V15RBpALFCm-gs4zZufHG-H56ud+zYMOQv5cmUA@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: sh-pfc: r8a7791: Add ADI pinconf support
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Jacopo Mondi <jacopo@jmondi.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, Nov 29, 2016 at 10:39 PM, Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
> On Tue, Nov 29, 2016 at 8:30 PM, Laurent Pinchart
> <laurent.pinchart@ideasonboard.com> wrote:
>> On Tuesday 29 Nov 2016 10:11:56 Jacopo Mondi wrote:
>>> Add pin configuration support for Gyro-ADC, named ADI on r8a7791 SoC.
>>>
>>> The Gyro-ADC supports three different configurations:
>>> a single ADC (adi and adi_b groups), 2 ADCs selectable through a single
>>> channel select signal (adi_chsel1 and adi_chsel1_b groups),
>>
>> I've only briefly looked up at the datasheet, but is that a supported mode ?
>> It seems that mode 1 uses 4 channels and mode 2 and 3 use 8 channels.
>
> I think you can always connect less ADCs than there are channels.
> If you connect e.g. only one, you don't need any CHS signals.
> If you connect e.g. two, you can use only one CHS signal.
>
> AFAICS, you still have to use an external demux to create individual chip
> selects from the single CS signal and (up to 3) CHS signals.

Upon closer look, the demux is intended to be at the analog side, but that
doesn't matter much.

When using an MB88101A, the (4ch) demux is part of the ADC chip, which
has 4 analog inputs and 2 channel select inputs.
The other supported ADCs (ADCS7476/ADC121, AD7476, MAX1162) are
really single-channel ADCs, and thus require an external demux.

But nobody says you have to use/populate all channels.
The Gyro-ADC will still scan all 4 or 8 channels, though.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
