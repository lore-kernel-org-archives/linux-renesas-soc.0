Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-vs1-f67.google.com ([209.85.217.67]:35867 "EHLO
        mail-vs1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726139AbeIXPVQ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 24 Sep 2018 11:21:16 -0400
MIME-Version: 1.0
References: <1537541154-54306-1-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1537541154-54306-1-git-send-email-biju.das@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 24 Sep 2018 11:19:57 +0200
Message-ID: <CAMuHMdXKm6Ha9Y2OgNp=cCEk8VPnVsTttrYpfbuhQbfKzUsGjg@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: serial: sh-sci: Document r8a7744 bindings
To: Biju Das <biju.das@bp.renesas.com>
Cc: Greg KH <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
        <devicetree@vger.kernel.org>, Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Fri, Sep 21, 2018 at 4:52 PM Biju Das <biju.das@bp.renesas.com> wrote:
> RZ/G1N (R8A7744) SoC also has the R-Car gen2 compatible SCIF, SCIFA,
> SCIFB, and HSCIF ports, so document the SoC specific bindings.
>
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> Reviewed-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
