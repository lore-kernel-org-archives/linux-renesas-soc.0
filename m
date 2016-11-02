Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-it0-f65.google.com ([209.85.214.65]:34706 "EHLO
        mail-it0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752103AbcKBJse (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 2 Nov 2016 05:48:34 -0400
MIME-Version: 1.0
In-Reply-To: <5689104.8HluMoeKiR@wasted.cogentembedded.com>
References: <4121805.SRTmqJtRfv@wasted.cogentembedded.com> <5689104.8HluMoeKiR@wasted.cogentembedded.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 2 Nov 2016 10:48:33 +0100
Message-ID: <CAMuHMdU0x=U3pQKVvAjza_5KGh0YmGDiGSHse2BC_Did82kxAA@mail.gmail.com>
Subject: Re: [PATCH 02/11] soc: renesas: rcar-sysc: add R8A7745 support
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Simon Horman <horms@verge.net.au>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Sat, Oct 29, 2016 at 12:09 AM, Sergei Shtylyov
<sergei.shtylyov@cogentembedded.com> wrote:
> Add support for RZ/G1E (R8A7745) SoC power areas to the R-Car SYSC driver.
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
