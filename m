Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-pf0-f169.google.com ([209.85.192.169]:33298 "EHLO
        mail-pf0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752029AbdHPMBl (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 16 Aug 2017 08:01:41 -0400
MIME-Version: 1.0
In-Reply-To: <1501242081-3805-4-git-send-email-ykaneko0929@gmail.com>
References: <1501242081-3805-1-git-send-email-ykaneko0929@gmail.com> <1501242081-3805-4-git-send-email-ykaneko0929@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 16 Aug 2017 14:01:39 +0200
Message-ID: <CAMuHMdUEdNBBc3dg0djW+nKL3VY5tKnQSQ4UOnWOWr2+vsQoxQ@mail.gmail.com>
Subject: Re: [PATCH 3/9] pinctrl: sh-pfc: r8a7795: Fix SCIF_CLK_{A,B} pin's
 MOD_SEL assignment to MOD_SEL1 bit10
To: Yoshihiro Kaneko <ykaneko0929@gmail.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Fri, Jul 28, 2017 at 1:41 PM, Yoshihiro Kaneko <ykaneko0929@gmail.com> wrote:
> From: Takeshi Kihara <takeshi.kihara.df@renesas.com>
>
> This patch fixes SCIF_CLK_{A,B} pin's MOD_SEL assignment from MOD_SEL1
> bit11 to MOD_SEL1 bit10.
>
> This is a correction to the incorrect implementation of IPSR register
> pin assignment for R8A7795 ES2.0 SoC specification of R-Car Gen3 Hardware
> User's Manual Rev.0.53E or later.
>
> Fixes: 12f5d9a1dc7f ("pinctrl: sh-pfc: r8a7795: Replace for Renesas R8A7795 ES2.0 SoC")

Wrong reference.

> Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> Signed-off-by: Yoshihiro Kaneko <ykaneko0929@gmail.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

i.e. will queue in sh-pfc-for-v4.14 with reference corrected.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
