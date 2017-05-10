Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-io0-f194.google.com ([209.85.223.194]:35865 "EHLO
        mail-io0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752605AbdEJIYy (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 10 May 2017 04:24:54 -0400
Received: by mail-io0-f194.google.com with SMTP id f102so1438203ioi.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 10 May 2017 01:24:54 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20170510070458.21193-2-laurent.pinchart+renesas@ideasonboard.com>
References: <20170510070458.21193-1-laurent.pinchart+renesas@ideasonboard.com> <20170510070458.21193-2-laurent.pinchart+renesas@ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 10 May 2017 10:24:47 +0200
Message-ID: <CAMuHMdVq17Z71hVohjE8rtMbn3o=V4Lzcx-Js3ysAe=HR5nt1A@mail.gmail.com>
Subject: Re: [PATCH v4 1/7] arm64: dts: r8a7795: Add HDMI encoder support
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Ulrich Hecht <ulrich.hecht@gmail.com>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Laurent, Uli,

On Wed, May 10, 2017 at 9:04 AM, Laurent Pinchart
<laurent.pinchart+renesas@ideasonboard.com> wrote:
> From: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
>
> Add DT nodes for the two HDMI encoders in disabled state.
>
> Based on work by Koji Matsuoka.
>
> Signed-off-by: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> ---
>  arch/arm64/boot/dts/renesas/r8a7795.dtsi | 50 ++++++++++++++++++++++++++++++++
>  1 file changed, 50 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/renesas/r8a7795.dtsi b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
> index 7d87dff70ac8..fdcafe7a85c3 100644
> --- a/arch/arm64/boot/dts/renesas/r8a7795.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
> @@ -1789,11 +1789,13 @@
>                                 port@1 {
>                                         reg = <1>;
>                                         du_out_hdmi0: endpoint {
> +                                               remote-endpoint = <&dw_hdmi0_in>;
>                                         };
>                                 };
>                                 port@2 {
>                                         reg = <2>;
>                                         du_out_hdmi1: endpoint {
> +                                               remote-endpoint = <&dw_hdmi1_in>;
>                                         };
>                                 };
>                                 port@3 {
> @@ -1862,5 +1864,53 @@
>                                 };
>                         };
>                 };
> +
> +               hdmi0: hdmi0@fead0000 {
> +                       compatible = "renesas,r8a7795-hdmi", "renesas,rcar-gen3-hdmi";
> +                       reg = <0 0xfead0000 0 0x10000>;
> +                       interrupts = <0 389 IRQ_TYPE_LEVEL_HIGH>;
> +                       clocks = <&cpg CPG_MOD 729>, <&cpg CPG_CORE R8A7795_CLK_HDMI>;
> +                       clock-names = "iahb", "isfr";
> +                       power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;

Missing "resets" property.

> +               hdmi1: hdmi1@feae0000 {
> +                       compatible = "renesas,r8a7795-hdmi", "renesas,rcar-gen3-hdmi";
> +                       reg = <0 0xfeae0000 0 0x10000>;
> +                       interrupts = <0 436 IRQ_TYPE_LEVEL_HIGH>;
> +                       clocks = <&cpg CPG_MOD 728>, <&cpg CPG_CORE R8A7795_CLK_HDMI>;
> +                       clock-names = "iahb", "isfr";
> +                       power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;

Likewise.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
