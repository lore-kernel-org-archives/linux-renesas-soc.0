Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-it0-f66.google.com ([209.85.214.66]:36346 "EHLO
        mail-it0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932483AbcHSHZg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 19 Aug 2016 03:25:36 -0400
Received: by mail-it0-f66.google.com with SMTP id j124so1036726ith.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 19 Aug 2016 00:25:35 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1471536240-25082-6-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
References: <1471536240-25082-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
 <1471536240-25082-6-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 19 Aug 2016 09:06:57 +0200
Message-ID: <CAMuHMdUX1qM5_OTGUUUaRFDq9kkekbkmnBJG=Y4gr7E-SrjX0w@mail.gmail.com>
Subject: Re: [PATCH/HACK 5/7] [HACK] ARM: shmobile: r8a7790: Link the VSP1 and DU
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Laurent,

On Thu, Aug 18, 2016 at 6:03 PM, Laurent Pinchart
<laurent.pinchart+renesas@ideasonboard.com> wrote:
> In order to test VSP+DU integration for Gen3 on Gen2, link the VSPD
> instances to the DU and modify their features to match the Gen3 VSPD.

Why do you modify the feature properties? AFAIK the driver doesn't
look at them anyway.

> Remove the IOMMU properties for the DU as memory is now accessed through
> the VSPD.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> ---
>  arch/arm/boot/dts/r8a7790.dtsi | 14 +++++---------
>  1 file changed, 5 insertions(+), 9 deletions(-)
>
> diff --git a/arch/arm/boot/dts/r8a7790.dtsi b/arch/arm/boot/dts/r8a7790.dtsi
> index 637cb8be363f..0ff45867e711 100644
> --- a/arch/arm/boot/dts/r8a7790.dtsi
> +++ b/arch/arm/boot/dts/r8a7790.dtsi
> @@ -969,7 +969,7 @@
>                 renesas,#wpf = <4>;
>         };
>
> -       vsp1@fe930000 {
> +       vsp1d0: vsp1@fe930000 {
>                 compatible = "renesas,vsp1";
>                 reg = <0 0xfe930000 0 0x8000>;
>                 interrupts = <GIC_SPI 246 IRQ_TYPE_LEVEL_HIGH>;
> @@ -979,13 +979,11 @@
>                 iommus = <&ipmmu_mx 5 &ipmmu_mx 13>;
>
>                 renesas,has-lif;
> -               renesas,has-lut;
>                 renesas,#rpf = <4>;
> -               renesas,#uds = <1>;
> -               renesas,#wpf = <4>;
> +               renesas,#wpf = <1>;
>         };

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
