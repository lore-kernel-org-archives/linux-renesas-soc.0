Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-pg0-f66.google.com ([74.125.83.66]:33525 "EHLO
        mail-pg0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750931AbdIMHwY (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 13 Sep 2017 03:52:24 -0400
MIME-Version: 1.0
In-Reply-To: <20170912210510.955132498@cogentembedded.com>
References: <20170912210510.955132498@cogentembedded.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 13 Sep 2017 09:52:23 +0200
Message-ID: <CAMuHMdXF96znGDaSb6d96WCDu7unkPiNUPAzV9zgKciUd-bqbA@mail.gmail.com>
Subject: Re: [PATCH 02/11] soc: renesas: rcar-rst: add R8A77970 support
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Simon Horman <horms@verge.net.au>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        "linux-arm-kernel@lists.infradead.org"
        <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, Sep 12, 2017 at 10:37 PM, Sergei Shtylyov
<sergei.shtylyov@cogentembedded.com> wrote:
> Add support for R-Car V3M (R8A77970) to the R-Car RST driver -- this driver
> is  needed  for the clock driver to work.
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
