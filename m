Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-it0-f67.google.com ([209.85.214.67]:34478 "EHLO
        mail-it0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752723AbcIAHsk (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 1 Sep 2016 03:48:40 -0400
MIME-Version: 1.0
In-Reply-To: <1472637779-14741-1-git-send-email-vladimir.barinov@cogentembedded.com>
References: <1472637712-14583-1-git-send-email-vladimir.barinov@cogentembedded.com>
 <1472637779-14741-1-git-send-email-vladimir.barinov@cogentembedded.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 1 Sep 2016 09:48:39 +0200
Message-ID: <CAMuHMdVwO+uyR9P7NBGFCyMPHzwFX2umZL=UT2-B7qme8nenPg@mail.gmail.com>
Subject: Re: [PATCH v3 04/12] arm64: dts: h3ulcb: enable EthernetAVB
To: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
Cc: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, Aug 31, 2016 at 12:02 PM, Vladimir Barinov
<vladimir.barinov@cogentembedded.com> wrote:
> This supports Ethernet AVB on H3ULCB board
>
> Signed-off-by: Vladimir Barinov <vladimir.barinov@cogentembedded.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

> --- a/arch/arm64/boot/dts/renesas/r8a7795-h3ulcb.dts
> +++ b/arch/arm64/boot/dts/renesas/r8a7795-h3ulcb.dts

> @@ -62,3 +68,29 @@
>         clock-frequency = <14745600>;
>         status = "okay";
>  };
> +
> +&avb {
> +       pinctrl-0 = <&avb_pins>;
> +       pinctrl-names = "default";
> +       renesas,no-ether-link;
> +       phy-handle = <&phy0>;
> +       status = "okay";
> +
> +       phy0: ethernet-phy@0 {
> +               rxc-skew-ps = <900>;
> +               rxdv-skew-ps = <0>;
> +               rxd0-skew-ps = <0>;
> +               rxd1-skew-ps = <0>;
> +               rxd2-skew-ps = <0>;
> +               rxd3-skew-ps = <0>;
> +               txc-skew-ps = <900>;
> +               txen-skew-ps = <0>;
> +               txd0-skew-ps = <0>;
> +               txd1-skew-ps = <0>;
> +               txd2-skew-ps = <0>;
> +               txd3-skew-ps = <0>;
> +               reg = <0>;
> +               interrupt-parent = <&gpio2>;
> +               interrupts = <11 IRQ_TYPE_LEVEL_LOW>;

Just wondering (it's done the same way on Salvator-X) why this is using a
GPIO interrupt, and not the dedicated AVB_PHY_INT?

> +       };
> +};

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
