Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-it0-f66.google.com ([209.85.214.66]:33634 "EHLO
        mail-it0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932863AbcJSOMh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 19 Oct 2016 10:12:37 -0400
MIME-Version: 1.0
In-Reply-To: <2883940.Oo8sg10L7m@wasted.cogentembedded.com>
References: <2056698.ncAHq8vRQ3@wasted.cogentembedded.com> <2883940.Oo8sg10L7m@wasted.cogentembedded.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 19 Oct 2016 10:16:05 +0200
Message-ID: <CAMuHMdUjqagddSnhGOTGRYUwtF=-g+j3Kydu+iJKtV23RrPKWQ@mail.gmail.com>
Subject: Re: [PATCH v3 04/11] ARM: dts: r8a7743: initial SoC device tree
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Simon Horman <horms@verge.net.au>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Russell King <linux@arm.linux.org.uk>,
        "linux-arm-kernel@lists.infradead.org"
        <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, Oct 5, 2016 at 11:38 PM, Sergei Shtylyov
<sergei.shtylyov@cogentembedded.com> wrote:
> The  initial R8A7743 SoC device tree including CPU cores, GIC, timer, SYSC,
> CPG, and the required clock descriptions.
>
> Based on the original (and large) patch by Dmitry Shifrin
> <dmitry.shifrin@cogentembedded.com>.
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
