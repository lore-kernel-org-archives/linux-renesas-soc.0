Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-pg0-f65.google.com ([74.125.83.65]:35965 "EHLO
        mail-pg0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753692AbdIDOwv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 4 Sep 2017 10:52:51 -0400
MIME-Version: 1.0
In-Reply-To: <20170901221519.704978317@cogentembedded.com>
References: <20170901221519.704978317@cogentembedded.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 4 Sep 2017 16:52:50 +0200
Message-ID: <CAMuHMdXMko1GJcO=xwHG8w6ZLYYS9X=TSL2RfXPuDAA926uw0w@mail.gmail.com>
Subject: Re: [PATCH repost v2] serial: sh-sci: document R8A77970 bindings
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        "linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Sat, Sep 2, 2017 at 12:15 AM, Sergei Shtylyov
<sergei.shtylyov@cogentembedded.com> wrote:
> R-Car V3M (R8A77970) SoC also has the R-Car gen3 compatible SCIF and HSCIF
> ports, so document the SoC specific bindings.
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
