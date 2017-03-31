Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-it0-f67.google.com ([209.85.214.67]:35695 "EHLO
        mail-it0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932764AbdCaKx0 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 31 Mar 2017 06:53:26 -0400
MIME-Version: 1.0
In-Reply-To: <20170330202059.050530179@cogentembedded.com>
References: <20170330202059.050530179@cogentembedded.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 31 Mar 2017 12:53:23 +0200
Message-ID: <CAMuHMdUodJ8Eruu9F=vn922DvM+ZYJa3Ttx63Y9MnxujmdgtxA@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: sh-pfc: r8a7791: fix SCIF2 pinmux data
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Linus Walleij <linus.walleij@linaro.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, Mar 30, 2017 at 10:20 PM, Sergei Shtylyov
<sergei.shtylyov@cogentembedded.com> wrote:
> PINMUX_IPSR_MSEL() macro invocation for the TX2 signal has apparently wrong
> 1st argument -- most probably a result of cut&paste programming...
>
> Fixes: 508845196238 ("pinctrl: sh-pfc: r8a7791 PFC support")
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
