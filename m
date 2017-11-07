Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-qk0-f196.google.com ([209.85.220.196]:51419 "EHLO
        mail-qk0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752975AbdKGP0l (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 7 Nov 2017 10:26:41 -0500
MIME-Version: 1.0
In-Reply-To: <1510067449-17017-2-git-send-email-fabrizio.castro@bp.renesas.com>
References: <1510067449-17017-1-git-send-email-fabrizio.castro@bp.renesas.com> <1510067449-17017-2-git-send-email-fabrizio.castro@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 7 Nov 2017 16:26:39 +0100
Message-ID: <CAMuHMdVTVAP+dSAvJtoAuSrHo6ngKg=iz_DdxeHk1pp7s4i4Fg@mail.gmail.com>
Subject: Re: [PATCH 1/8] dt-bindings: can: rcar_can: document r8a774[35] can support
To: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc: Wolfgang Grandegger <wg@grandegger.com>,
        Marc Kleine-Budde <mkl@pengutronix.de>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-can@vger.kernel.org,
        "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, Nov 7, 2017 at 4:10 PM, Fabrizio Castro
<fabrizio.castro@bp.renesas.com> wrote:
> Document "renesas,can-r8a7743" and "renesas,can-r8a7745" compatible
> strings. Since the fallback compatible string ("renesas,rcar-gen2-can")
> activates the right code in the driver, no driver change is needed.
>
> Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> Reviewed-by: Biju Das <biju.das@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
