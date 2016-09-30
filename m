Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-it0-f66.google.com ([209.85.214.66]:36269 "EHLO
        mail-it0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752570AbcI3I3t (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 30 Sep 2016 04:29:49 -0400
MIME-Version: 1.0
In-Reply-To: <19681841.MzyqfDfWny@wasted.cogentembedded.com>
References: <19681841.MzyqfDfWny@wasted.cogentembedded.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 30 Sep 2016 10:29:48 +0200
Message-ID: <CAMuHMdUMzddV-BZ3SSkraTHJ6Kqi3YFTb3t1c+jkZ6pk60PTnw@mail.gmail.com>
Subject: Re: [PATCH] DT: irqchip: renesas-irqc: document R8A7743/5 support
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <marc.zyngier@arm.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, Sep 29, 2016 at 11:25 PM, Sergei Shtylyov
<sergei.shtylyov@cogentembedded.com> wrote:
> Renesas  RZ/G SoC have the R-Car gen2 compatible IRQC interrupt controllers.
> Document RZ/G1[ME] (also known as R8A774[35]) SoC bindings.
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
