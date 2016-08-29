Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-it0-f67.google.com ([209.85.214.67]:36376 "EHLO
        mail-it0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751597AbcH2QM1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 29 Aug 2016 12:12:27 -0400
Received: by mail-it0-f67.google.com with SMTP id x131so7072271ite.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 29 Aug 2016 09:12:09 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1470745752-23738-3-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
References: <1470745752-23738-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
 <1470745752-23738-3-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 29 Aug 2016 18:12:07 +0200
Message-ID: <CAMuHMdUZ65WiNLR-YJq46L_vP-BxpSsQRzoYEjbMECd0_MO11w@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] arm64: dts: renesas: r8a7795: Add VSP instances
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Laurent,

On Tue, Aug 9, 2016 at 2:29 PM, Laurent Pinchart
<laurent.pinchart+renesas@ideasonboard.com> wrote:
> The r8a7795 has 9 VSP instances.

7?

> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> ---
>  arch/arm64/boot/dts/renesas/r8a7795.dtsi | 90 ++++++++++++++++++++++++++++++++
>  1 file changed, 90 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/renesas/r8a7795.dtsi b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
> index f8b1c421e845..d9c6653471f4 100644
> --- a/arch/arm64/boot/dts/renesas/r8a7795.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a7795.dtsi

> @@ -1323,6 +1363,16 @@
>                         power-domains = <&sysc R8A7795_PD_A3VP>;
>                 };
>
> +               vspi2: vsp@fe9c0000 {
> +                       compatible = "renesas,vsp2";
> +                       reg = <0 0xfe9c0000 0 0x8000>;
> +                       interrupts = <GIC_SPI 446 IRQ_TYPE_LEVEL_HIGH>;
> +                       clocks = <&cpg CPG_MOD 629>;
> +                       power-domains = <&sysc R8A7795_PD_A3VP>;
> +
> +                       renesas,fcp = <&fcpvi2>;
> +               };
> +
>                 fcpvi2: fcp@fe9cf000 {
>                         compatible = "renesas,r8a7795-fcpv", "renesas,fcpv";
>                         reg = <0 0xfe9cf000 0 0x200>;

> @@ -1351,6 +1431,16 @@
>                         power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;
>                 };
>
> +               vspd3: vsp@fea38000 {
> +                       compatible = "renesas,vsp2";
> +                       reg = <0 0xfea38000 0 0x4000>;
> +                       interrupts = <GIC_SPI 469 IRQ_TYPE_LEVEL_HIGH>;
> +                       clocks = <&cpg CPG_MOD 620>;
> +                       power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;
> +
> +                       renesas,fcp = <&fcpvd3>;
> +               };
> +

Looks like vspi2 and vspd3 are no more...

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
