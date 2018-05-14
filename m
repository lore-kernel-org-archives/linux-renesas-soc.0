Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-ua0-f177.google.com ([209.85.217.177]:43624 "EHLO
        mail-ua0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752015AbeENU2g (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 14 May 2018 16:28:36 -0400
MIME-Version: 1.0
In-Reply-To: <24039c74-d6d3-cac3-6c68-5dcd88ef8ecc@cogentembedded.com>
References: <3923fc5f-103c-94c9-57ba-cb29e8c55d05@cogentembedded.com> <24039c74-d6d3-cac3-6c68-5dcd88ef8ecc@cogentembedded.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 14 May 2018 22:28:34 +0200
Message-ID: <CAMuHMdV6HtW7L4HVbi=RSC-nmb4SDuNaY3-iVH0YYERBg3tToA@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: arm: document Renesas V3HSK board bindings
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Simon Horman <horms@verge.net.au>,
        Rob Herring <robh+dt@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
        <devicetree@vger.kernel.org>, Magnus Damm <magnus.damm@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, May 10, 2018 at 8:09 PM, Sergei Shtylyov
<sergei.shtylyov@cogentembedded.com> wrote:
> Document the V3H Starter Kit device tree bindings, listing it as
> a supported board.
>
> This allows to use checkpatch.pl to validate .dts files referring to
> the V3HSK board.
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
