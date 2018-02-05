Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-qk0-f177.google.com ([209.85.220.177]:46450 "EHLO
        mail-qk0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752260AbeBEMhF (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 5 Feb 2018 07:37:05 -0500
MIME-Version: 1.0
In-Reply-To: <76b4144e-423a-65fd-fe17-bfedbc0deb8e@cogentembedded.com>
References: <46fca582-220d-e5a7-62cd-2fc77a29846b@cogentembedded.com> <76b4144e-423a-65fd-fe17-bfedbc0deb8e@cogentembedded.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 5 Feb 2018 13:37:04 +0100
Message-ID: <CAMuHMdVcKEH4FMf8UazacV86DFtJq8sdxfT+c7UX+67k5vXugA@mail.gmail.com>
Subject: Re: [PATCH 02/11] soc: renesas: rcar-rst: add R8A77980 support
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Rob Herring <robh+dt@kernel.org>,
        Simon Horman <horms@verge.net.au>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
        <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Fri, Feb 2, 2018 at 7:27 PM, Sergei Shtylyov
<sergei.shtylyov@cogentembedded.com> wrote:
> Add support for R-Car V3H (R8A77980) to the R-Car RST driver -- this driver
> is  needed  for the clock driver to work.

Please drop the extra spaces in between words that are part of the same
sentence.

> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
