Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-it0-f49.google.com ([209.85.214.49]:38442 "EHLO
        mail-it0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750755AbdFFHli (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 6 Jun 2017 03:41:38 -0400
MIME-Version: 1.0
In-Reply-To: <1496420523-23506-4-git-send-email-biju.das@bp.renesas.com>
References: <1496420523-23506-1-git-send-email-biju.das@bp.renesas.com> <1496420523-23506-4-git-send-email-biju.das@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 6 Jun 2017 09:41:37 +0200
Message-ID: <CAMuHMdV8Ugz_kvHLbV7sii-2v1WdHTSFm3meM8faVtx3jBpC+Q@mail.gmail.com>
Subject: Re: [PATCH 3/4] ARM: dts: iwg20m: Add iWave RZG1M Qseven SOM
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
> Add support for iWave RZG1M Qseven System On Module.
> http://www.iwavesystems.com/rz-g1m-qseven-module.html

Thanks for your patch!

> Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> Reviewed-by: Chris Paterson <chris.paterson2@renesas.com>

> --- /dev/null
> +++ b/arch/arm/boot/dts/r8a7743-iwg20m.dtsi
> @@ -0,0 +1,27 @@
> +/*
> + * Device Tree Source for the iWave-RZG1M-20M Qseven SOM
> + *
> + * Copyright (C) 2017 Renesas Electronics Corp.
> + *
> + * This file is licensed under the terms of the GNU General Public License
> + * version 2.  This program is licensed "as is" without any warranty of any
> + * kind, whether express or implied.
> + */
> +
> +#include "r8a7743.dtsi"
> +
> +/ {

Given this is a sub-board with many other components, I think it should have
its own (documented) compatible value, e.g.

    compatible = "iwave,g20m", "renesas,r8a7743";

> +       memory@40000000 {
> +               device_type = "memory";
> +               reg = <0 0x40000000 0 0x20000000>;
> +       };
> +
> +       memory@200000000 {
> +               device_type = "memory";
> +               reg = <2 0x00000000 0 0x20000000>;
> +       };
> +};

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
