Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f68.google.com ([209.85.215.68]:40322 "EHLO
        mail-lf0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751173AbdLMKQa (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 13 Dec 2017 05:16:30 -0500
Received: by mail-lf0-f68.google.com with SMTP id c140so1985322lfg.7
        for <linux-renesas-soc@vger.kernel.org>; Wed, 13 Dec 2017 02:16:29 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1513102155-47925-1-git-send-email-biju.das@bp.renesas.com>
References: <1513102155-47925-1-git-send-email-biju.das@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 13 Dec 2017 11:16:28 +0100
Message-ID: <CAMuHMdVi6k7MozVWuiwPpYJKgTD=5SsOxNUMxcLUaf1=a7OB2g@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: ASoC: rsnd: Add device tree support for r8a774[35]
To: Biju Das <biju.das@bp.renesas.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Chris Paterson <chris.paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        ALSA Development Mailing List <alsa-devel@alsa-project.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, Dec 12, 2017 at 7:09 PM, Biju Das <biju.das@bp.renesas.com> wrote:
> Document r8a774[35] specific compatible strings. The Renesas RZ/G1[ME]
> (r8a774[35]) sound modules are identical to the R-Car Gen2 family.
> No driver change is needed as the fallback compatible string
> "renesas,rcar_sound-gen2" activates the right code in the driver.
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
