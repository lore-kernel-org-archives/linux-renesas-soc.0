Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-it0-f65.google.com ([209.85.214.65]:34603 "EHLO
        mail-it0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751468AbcI0H2m (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 27 Sep 2016 03:28:42 -0400
MIME-Version: 1.0
In-Reply-To: <20160920154620.18653-4-chris.brandt@renesas.com>
References: <20160920154620.18653-1-chris.brandt@renesas.com> <20160920154620.18653-4-chris.brandt@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 27 Sep 2016 09:28:41 +0200
Message-ID: <CAMuHMdXQrO_brqrzZtp4iV8CnxER-yfTYT03YdDxud3Fp0bHAw@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] ARM: dts: rskrza1: add mmc DT support
To: Chris Brandt <chris.brandt@renesas.com>
Cc: Simon Horman <horms+renesas@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Chris,

On Tue, Sep 20, 2016 at 5:46 PM, Chris Brandt <chris.brandt@renesas.com> wrote:
> Since the MMC and SDHI1 on the RSK share the same socket connector (CN1),
> you cannot enable MMC and SDHI1 at the same time. Therefore the status
> has been set to disabled because SDHI is more popular with this board.
> However, keeping this code in here serves as a good way to document how
> the MMC on the RZ/A1 has been known to work for someone that does want
> to use MMC instead of SDHI1.
>
> A fixed 3.3 regulator is included because it is required by the mmc
> driver.

I have mixed feelings about adding these "disabled" nodes, purely for
documentation.

What do other people think?

> --- a/arch/arm/boot/dts/r7s72100-rskrza1.dts
> +++ b/arch/arm/boot/dts/r7s72100-rskrza1.dts
> @@ -33,6 +33,15 @@
>                 #address-cells = <1>;
>                 #size-cells = <1>;
>         };
> +
> +       d3_3v: regulator-d3-3v {
> +               compatible = "regulator-fixed";
> +               regulator-name = "D3.3V";
> +               regulator-min-microvolt = <3300000>;
> +               regulator-max-microvolt = <3300000>;
> +               regulator-boot-on;
> +               regulator-always-on;

'status = "disabled";', too?

> +       };

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
