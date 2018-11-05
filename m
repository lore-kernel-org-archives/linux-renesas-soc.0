Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-vs1-f68.google.com ([209.85.217.68]:35929 "EHLO
        mail-vs1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727390AbeKEXG1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 5 Nov 2018 18:06:27 -0500
MIME-Version: 1.0
References: <20181015095827.25592-1-horms+renesas@verge.net.au> <20181015095827.25592-2-horms+renesas@verge.net.au>
In-Reply-To: <20181015095827.25592-2-horms+renesas@verge.net.au>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 5 Nov 2018 14:46:25 +0100
Message-ID: <CAMuHMdWfMd6e8QNY8pVeR55Dzo2JvprxgtUcZskF1QG1x0xr=w@mail.gmail.com>
Subject: Re: [PATCH 1/2] pinctrl: sh-pfc: r8a77990: Add Audio clock pins,
 groups and functions
To: Simon Horman <horms+renesas@verge.net.au>
Cc: Linus Walleij <linus.walleij@linaro.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Mon, Oct 15, 2018 at 11:58 AM Simon Horman
<horms+renesas@verge.net.au> wrote:
> From: Takeshi Kihara <takeshi.kihara.df@renesas.com>
>
> This patch adds AUDIO_CLK{A,B,C}, AUDIO_CLKOUT, AUDIO_CLKOUT{1,2,3}
> pins, groups and functions to the R8A77990 SoC.
>
> Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> [simon: rebase]
> Signed-off-by: Simon Horman <horms+renesas@verge.net.au>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in sh-pfc-for-v4.21.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
