Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-qk0-f195.google.com ([209.85.220.195]:38652 "EHLO
        mail-qk0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753319AbeBAUAz (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 1 Feb 2018 15:00:55 -0500
MIME-Version: 1.0
In-Reply-To: <2182bb59-d16f-54f0-d992-65b49815ce1d@cogentembedded.com>
References: <2182bb59-d16f-54f0-d992-65b49815ce1d@cogentembedded.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 1 Feb 2018 21:00:53 +0100
Message-ID: <CAMuHMdX=yE+_t4AjcHXswrr4ee=8=aAmRM4Utc+_ioy-RDSY6A@mail.gmail.com>
Subject: Re: [PATCH] DT: serial: renesas,sci-serial: document R8A77980 bindings
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>, linux-serial@vger.kernel.org,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
        <devicetree@vger.kernel.org>, Mark Rutland <mark.rutland@arm.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, Feb 1, 2018 at 8:36 PM, Sergei Shtylyov
<sergei.shtylyov@cogentembedded.com> wrote:
> R-Car V3H (R8A77980) SoC has the R-Car gen3 compatible SCIF and HSCIF ports,
> so document the SoC specific bindings.
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
