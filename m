Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-qt0-f177.google.com ([209.85.216.177]:46177 "EHLO
        mail-qt0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933975AbdLSIny (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 19 Dec 2017 03:43:54 -0500
Received: by mail-qt0-f177.google.com with SMTP id r39so23206089qtr.13
        for <linux-renesas-soc@vger.kernel.org>; Tue, 19 Dec 2017 00:43:54 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20171218214043.10796-3-horms+renesas@verge.net.au>
References: <20171218214043.10796-1-horms+renesas@verge.net.au> <20171218214043.10796-3-horms+renesas@verge.net.au>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 19 Dec 2017 09:43:53 +0100
Message-ID: <CAMuHMdXtfMnSQ90GsDQtK0ApM0ijtV44rQFBC86mj2Aj0S_ArQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] ARM: dts: r8a7743: move timer node out of bus
To: Simon Horman <horms+renesas@verge.net.au>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Mon, Dec 18, 2017 at 10:40 PM, Simon Horman
<horms+renesas@verge.net.au> wrote:
> The timer node does not have any register properties and thus shouldn't be
> placed on the bus.
>
> This problem is flagged by the compiler as follows:
> $ make
>   DTC     arch/arm/boot/dts/r8a7743-iwg20d-q7-dbcm-ca.dtb
> arch/arm/boot/dts/r8a7743-iwg20d-q7.dtb: Warning (simple_bus_reg): Node /soc/timer missing or empty reg/ranges property
> arch/arm/boot/dts/r8a7743-iwg20d-q7-dbcm-ca.dtb: Warning (simple_bus_reg): Node /soc/timer missing or empty reg/ranges property
>   DTC     arch/arm/boot/dts/r8a7743-sk-rzg1m.dtb
> arch/arm/boot/dts/r8a7743-sk-rzg1m.dtb: Warning (simple_bus_reg): Node /soc/timer missing or empty reg/ranges property
>
> Signed-off-by: Simon Horman <horms+renesas@verge.net.au>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
