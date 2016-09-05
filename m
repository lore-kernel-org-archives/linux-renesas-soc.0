Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-it0-f66.google.com ([209.85.214.66]:36173 "EHLO
        mail-it0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753498AbcIEJKg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 5 Sep 2016 05:10:36 -0400
MIME-Version: 1.0
In-Reply-To: <3191777.fJ30rYXr4J@wasted.cogentembedded.com>
References: <1648590.FPpmBRoQyh@wasted.cogentembedded.com> <3191777.fJ30rYXr4J@wasted.cogentembedded.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 5 Sep 2016 11:10:35 +0200
Message-ID: <CAMuHMdW+82ePveuVbOrPU0uRj4Uu5f8+NvzHpjWQr8Wa_BoU+A@mail.gmail.com>
Subject: Re: [PATCH 3/3] ARM: dts: wheat: add QSPI support
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

On Sat, Sep 3, 2016 at 12:09 AM, Sergei Shtylyov
<sergei.shtylyov@cogentembedded.com> wrote:
> Define the Wheat board dependent part of the QSPI device node.
> Add device nodes for Spansion S25FL512S SPI flash and MTD partitions on it.
>
> Based  on the original (and large) patch by Vladimir Barinov
> <vladimir.barinov@cogentembedded.com>.
>
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Disclaimer: I have no board schematics nor manuals describing FLASH layout.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
