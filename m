Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-ua0-f193.google.com ([209.85.217.193]:46386 "EHLO
        mail-ua0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752475AbeEOJLM (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 15 May 2018 05:11:12 -0400
MIME-Version: 1.0
In-Reply-To: <1526008947-26667-6-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1526008947-26667-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1526008947-26667-6-git-send-email-yoshihiro.shimoda.uh@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 15 May 2018 11:11:10 +0200
Message-ID: <CAMuHMdUiojCsGJjOkJz=qLFizwei_NuqhCMjhFsXWKQpaUng=Q@mail.gmail.com>
Subject: Re: [PATCH 5/6] pinctrl: sh-pfc: r8a77990: Add I2C{1,2,4,5,6,7} pins,
 groups and functions
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
        <devicetree@vger.kernel.org>,
        Takeshi Kihara <takeshi.kihara.df@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Fri, May 11, 2018 at 5:22 AM, Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> From: Takeshi Kihara <takeshi.kihara.df@renesas.com>
>
> This patch adds I2C{1,2,4,5,6,7} pins, groups and functions to
> the R8A77990 SoC.
>
> NOTE: I2C0 and I2C3 are not pin multiplexed.
>
> Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in sh-pfc-for-v4.18...

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
