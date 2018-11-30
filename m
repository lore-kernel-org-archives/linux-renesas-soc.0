Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-vs1-f66.google.com ([209.85.217.66]:40804 "EHLO
        mail-vs1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726572AbeK3T5f (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 30 Nov 2018 14:57:35 -0500
MIME-Version: 1.0
References: <1542878075-61314-1-git-send-email-biju.das@bp.renesas.com> <1542878075-61314-3-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1542878075-61314-3-git-send-email-biju.das@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 30 Nov 2018 09:48:48 +0100
Message-ID: <CAMuHMdUiWDtafBtHvKH5CAOx1ntBdHrmE-d__nrayykKdZYdDg@mail.gmail.com>
Subject: Re: [PATCH 2/7] ARM: dts: r8a7744: Initial SoC device tree
To: Biju Das <biju.das@bp.renesas.com>
Cc: Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
        <devicetree@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Biju,

On Thu, Nov 22, 2018 at 10:23 AM Biju Das <biju.das@bp.renesas.com> wrote:
> Basic support for the RZ/G1N (R8A7744) SoC. Added placeholders
> to avoid compilation error with the common platform code.
>
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>

Thanks for your patch!

> --- /dev/null
> +++ b/arch/arm/boot/dts/r8a7744.dtsi

> +       soc {

> +               pfc: pin-controller@e6060000 {
> +                       compatible = "renesas,pfc-r8a7744";
> +                       reg = <0 0xe6060000 0 0x164>;

Given the datasheet mentions (reserved) registers up to offset 0x24c,
you may want to use 0x250 for the register block length.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
