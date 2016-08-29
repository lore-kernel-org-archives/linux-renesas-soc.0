Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-it0-f66.google.com ([209.85.214.66]:35985 "EHLO
        mail-it0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750828AbcH2H5M (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 29 Aug 2016 03:57:12 -0400
MIME-Version: 1.0
In-Reply-To: <81794087.EqU2I9TLcp@wasted.cogentembedded.com>
References: <3665116.9BjHTnhfR3@wasted.cogentembedded.com> <81794087.EqU2I9TLcp@wasted.cogentembedded.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 29 Aug 2016 09:57:11 +0200
Message-ID: <CAMuHMdUiF9R7eiuQ=aFRPXA01JRG1aY3YUZsMMiKwt0ghypS+Q@mail.gmail.com>
Subject: Re: [PATCH 1/3] DT: arm: shmobile: document Wheat board
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Simon Horman <horms@verge.net.au>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Fri, Aug 26, 2016 at 10:20 PM, Sergei Shtylyov
<sergei.shtylyov@cogentembedded.com> wrote:
> Document the Wheat device tree bindings, listing it as a supported board.
>
> This allows to use checkpatch.pl to validate .dts files referring to the
> Wheat board.
>
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

Acked-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
