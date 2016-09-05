Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-it0-f66.google.com ([209.85.214.66]:35678 "EHLO
        mail-it0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753498AbcIEJAw (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 5 Sep 2016 05:00:52 -0400
MIME-Version: 1.0
In-Reply-To: <4521660.ueRdz9Zt8E@wasted.cogentembedded.com>
References: <1501145.5ro9yfox2Z@wasted.cogentembedded.com> <4521660.ueRdz9Zt8E@wasted.cogentembedded.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 5 Sep 2016 11:00:31 +0200
Message-ID: <CAMuHMdUxAOm-xyELTzpoMuaxcn+ZWEJ=Eu=0wttTQ=Xq=Orb+Q@mail.gmail.com>
Subject: Re: [PATCH resend] pinctrl: sh-pfc: r8a7792: add QSPI pin groups
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Fri, Sep 2, 2016 at 11:50 PM, Sergei Shtylyov
<sergei.shtylyov@cogentembedded.com> wrote:
> Add QSPI pin groups to the R8A7792 PFC driver.
>
> Based  on the original (and large) patch by Vladimir Barinov
> <vladimir.barinov@cogentembedded.com>.
>
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
