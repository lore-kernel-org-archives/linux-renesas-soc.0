Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-qk0-f196.google.com ([209.85.220.196]:33199 "EHLO
        mail-qk0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S964943AbdLSLZ4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 19 Dec 2017 06:25:56 -0500
MIME-Version: 1.0
In-Reply-To: <1513620411-17478-3-git-send-email-fabrizio.castro@bp.renesas.com>
References: <1513620411-17478-1-git-send-email-fabrizio.castro@bp.renesas.com> <1513620411-17478-3-git-send-email-fabrizio.castro@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 19 Dec 2017 12:25:54 +0100
Message-ID: <CAMuHMdUi953N1J+vfJWJo0GMKO4tBZV9HnX7haG0fvyNHfOvOA@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] ARM: dts: r8a7745: Add PWM SoC support
To: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc: Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Russell King <linux@armlinux.org.uk>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Mon, Dec 18, 2017 at 7:06 PM, Fabrizio Castro
<fabrizio.castro@bp.renesas.com> wrote:
> Add the definitions for pwm[0123456] to the SoC .dtsi.
>
> Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> Reviewed-by: Biju Das <biju.das@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

> --- a/arch/arm/boot/dts/r8a7745.dtsi
> +++ b/arch/arm/boot/dts/r8a7745.dtsi
> @@ -968,6 +968,83 @@
>                         status = "disabled";
>                 };
>
> +               pwm0: pwm@e6e30000 {
> +                       compatible = "renesas,pwm-r8a7745",
> +                                    "renesas,pwm-rcar";

I think this can fit on one line.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
