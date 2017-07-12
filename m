Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-it0-f65.google.com ([209.85.214.65]:36853 "EHLO
        mail-it0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1756235AbdGLLww (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 12 Jul 2017 07:52:52 -0400
MIME-Version: 1.0
In-Reply-To: <1499853805-5915-4-git-send-email-chris.paterson2@renesas.com>
References: <1499853805-5915-1-git-send-email-chris.paterson2@renesas.com> <1499853805-5915-4-git-send-email-chris.paterson2@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 12 Jul 2017 13:52:49 +0200
Message-ID: <CAMuHMdXMFkXopGiLOVf0jDDQTKig-wFrgMOKrf14341h85kPNw@mail.gmail.com>
Subject: Re: [PATCH 3/3] ARM: dts: iwg20m: Add MMCIF0 support
To: Chris Paterson <chris.paterson2@renesas.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Biju Das <biju.das@bp.renesas.com>,
        Linux MMC List <linux-mmc@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org"
        <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Chris,

On Wed, Jul 12, 2017 at 12:03 PM, Chris Paterson
<chris.paterson2@renesas.com> wrote:
> Define the iwg20m board dependent part of the MMCIF0 device node.
>
> Signed-off-by: Chris Paterson <chris.paterson2@renesas.com>
>
> diff --git a/arch/arm/boot/dts/r8a7743-iwg20m.dtsi b/arch/arm/boot/dts/r8a7743-iwg20m.dtsi
> index 001ca91..ffce1b6 100644
> --- a/arch/arm/boot/dts/r8a7743-iwg20m.dtsi
> +++ b/arch/arm/boot/dts/r8a7743-iwg20m.dtsi

> +&pfc {
> +       mmcif0_pins: mmc {
> +               groups = "mmc_data8", "mmc_ctrl";

"mmc_data8" is not correct, as D6/D7 of the eMMC are not connected to GP6_28
resp. GP6_29, but to GP6_6 resp. GP6_7.
So it should be "mmc_data8_b".

Unfortunately the latter pin group isn't supported by the PFC driver yet.
Cooking a patch...

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
