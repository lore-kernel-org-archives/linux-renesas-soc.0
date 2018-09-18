Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-vs1-f67.google.com ([209.85.217.67]:33666 "EHLO
        mail-vs1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727161AbeIRO4q (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 18 Sep 2018 10:56:46 -0400
Received: by mail-vs1-f67.google.com with SMTP id y12-v6so394586vsm.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 18 Sep 2018 02:25:02 -0700 (PDT)
MIME-Version: 1.0
References: <20180918091433.13019-1-wsa+renesas@sang-engineering.com>
In-Reply-To: <20180918091433.13019-1-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 18 Sep 2018 11:24:49 +0200
Message-ID: <CAMuHMdWm=bFJKHoOaQqbczCWc0YLfvCROeOKXZCgL4iRmKR88A@mail.gmail.com>
Subject: Re: [RFC PATCH] arm64: dts: renesas: gen3: use 400kHz for I2C DVFS bus
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Simon Horman <horms@verge.net.au>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, Sep 18, 2018 at 11:14 AM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> The PMIC and EEPROM can operate at 400kHz, so use this speed.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

> ---
>
> RFC because I couldn't find docs for the PMIC. Tests showed that it does
> work at 400kHz (checksuming over 256 byte reads). Geert, do you happen
> to have docs? Other than that, for the EEPROM it also works and is also
> documented and BSP uses 400kHz as well. Tested on Salvator XS, not ULCB.

BD9571 docs say:
    (1) Fast mode: Max.400kHz
    (2) Fast mode plus: Max. 1MHz

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
