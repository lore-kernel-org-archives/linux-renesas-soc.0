Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-vs1-f66.google.com ([209.85.217.66]:43280 "EHLO
        mail-vs1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725884AbeKIFXW (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 9 Nov 2018 00:23:22 -0500
MIME-Version: 1.0
References: <20181028212457.1017-1-wsa+renesas@sang-engineering.com> <20181028212457.1017-3-wsa+renesas@sang-engineering.com>
In-Reply-To: <20181028212457.1017-3-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 8 Nov 2018 20:46:13 +0100
Message-ID: <CAMuHMdVxd0JKRW11E5D10FeNvgWJzk2SKkfOVVLwAhiyo1ycGg@mail.gmail.com>
Subject: Re: [PATCH 2/2] pinctrl: sh-pfc: r8a7794: initialize TDSEL register
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Sun, Oct 28, 2018 at 10:25 PM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> Documentation says that some bits in TDSEL must be set (ch 5.3.35 in
> R-Car E2 v0.5). However, the reset value of the register is 0, so
> software has to do it. Add this to the kernel driver to ensure this is
> really done independent of firmware versions. This is needed for some SD
> cards supporting SDR104 transfer mode.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
