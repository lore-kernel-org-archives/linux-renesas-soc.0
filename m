Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-it0-f49.google.com ([209.85.214.49]:36643 "EHLO
        mail-it0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750805AbdFFHlS (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 6 Jun 2017 03:41:18 -0400
MIME-Version: 1.0
In-Reply-To: <1496420523-23506-3-git-send-email-biju.das@bp.renesas.com>
References: <1496420523-23506-1-git-send-email-biju.das@bp.renesas.com> <1496420523-23506-3-git-send-email-biju.das@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 6 Jun 2017 09:41:16 +0200
Message-ID: <CAMuHMdUHetaZMhfxBXF-1y0yv5UdUQrxH7NpkUfymty5hs_7EQ@mail.gmail.com>
Subject: Re: [PATCH 2/4] ARM: shmobile: document iW-RainboW-G20D-Qseven-RZG1M board
To: Biju Das <biju.das@bp.renesas.com>
Cc: Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Chris Paterson <chris.paterson2@renesas.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org"
        <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Biju,

On Fri, Jun 2, 2017 at 6:22 PM, Biju Das <biju.das@bp.renesas.com> wrote:
> Document the iW-RainboW-G20D-Qseven-RZG1M device tree bindings,
> listing it as a supported board.
>
> This allows to use checkpatch.pl to validate .dts files referring to the
> iW-RainboW-G20D-Qseven-RZG1M board.

Thanks for your patch!

> Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> Reviewed-by: Chris Paterson <chris.paterson2@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

> --- a/Documentation/devicetree/bindings/arm/shmobile.txt
> +++ b/Documentation/devicetree/bindings/arm/shmobile.txt
> @@ -69,6 +69,8 @@ Boards:
>      compatible = "renesas,kzm9d", "renesas,emev2"
>    - Kyoto Microcomputer Co. KZM-A9-GT
>      compatible = "renesas,kzm9g", "renesas,sh73a0"
> +  - iWave Systems RZ/G1M Qseven Development Platform (iW-RainboW-G20D-Qseven)
> +    compatible = "iwave,g20d", "renesas,r8a7743"

Please keep the list sorted alphabetically.

>    - Lager (RTP0RC7790SEB00010S)
>      compatible = "renesas,lager", "renesas,r8a7790"
>    - M3ULCB (R-Car Starter Kit Pro, RTP0RC7796SKB00010S)

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
