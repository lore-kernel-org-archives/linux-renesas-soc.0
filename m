Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-it0-f66.google.com ([209.85.214.66]:35948 "EHLO
        mail-it0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932754AbcH2Nwa (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 29 Aug 2016 09:52:30 -0400
MIME-Version: 1.0
In-Reply-To: <20160825153115.15291-1-chris.brandt@renesas.com>
References: <20160825153115.15291-1-chris.brandt@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 29 Aug 2016 15:34:57 +0200
Message-ID: <CAMuHMdXmJPcgDcLkeVuF5YVfpwxRkJpACHGwtbNab18gK-nBbQ@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: rskrza1: initial device tree
To: Chris Brandt <chris.brandt@renesas.com>
Cc: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        "linux-arm-kernel@lists.infradead.org"
        <linux-arm-kernel@lists.infradead.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Chris,

On Thu, Aug 25, 2016 at 5:31 PM, Chris Brandt <chris.brandt@renesas.com> wrote:
> Add the initial device tree for the RZ/A1 based development board (RSK).

Thanks for your patch!

> Signed-off-by: Chris Brandt <chris.brandt@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

> --- /dev/null
> +++ b/arch/arm/boot/dts/r7s72100-rskrza1.dts

> +       compatible = "renesas,rskrza1", "renesas,r7s72100";

scripts/checkpatch.pl says:

    DT compatible string "renesas,rskrza1" appears un-documented --
check ./Documentation/devicetree/bindings/

Please send a follow-up patch to add this compatible value to
Documentation/devicetree/bindings/arm/shmobile.txt.

> +&scif2 {
> +       status = "okay";
> +};
> +

Please drop the trailing empty line.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
