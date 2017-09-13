Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-pg0-f68.google.com ([74.125.83.68]:37351 "EHLO
        mail-pg0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750993AbdIMOyb (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 13 Sep 2017 10:54:31 -0400
MIME-Version: 1.0
In-Reply-To: <1505305119-4257-3-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1505305119-4257-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1505305119-4257-3-git-send-email-yoshihiro.shimoda.uh@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 13 Sep 2017 16:54:30 +0200
Message-ID: <CAMuHMdX3q=foc1hkcqTc3WQYxCh1x+bc8fu9+YcqVAx9bp4qaA@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: renesas: r8a77995: draak: enable EthernetAVB
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Shimoda-san,

On Wed, Sep 13, 2017 at 2:18 PM, Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> This patch enables EthernetAVB for R-Car D3 draak board.
>
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Thanks for your patch!

> --- a/arch/arm64/boot/dts/renesas/r8a77995-draak.dts
> +++ b/arch/arm64/boot/dts/renesas/r8a77995-draak.dts

> @@ -37,6 +39,14 @@
>  };
>
>  &pfc {
> +       avb0_pins: avb {
> +               mux {
> +                       groups = "avb0_link", "avb0_phy_int", "avb0_mdc",
> +                                "avb0_mii";
> +                       function = "avb0";

This part depends on (an updated version of) "[PATCH 5/8] pinctrl: sh-pfc:
r8a77995: Add EthernetAVB pins, groups and functions", so it may change?

And we will probably have to add driver-strengths later, to avoid a
dependency on bootloader setup?

Apart from that:
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
