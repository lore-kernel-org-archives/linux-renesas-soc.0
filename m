Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-qk0-f195.google.com ([209.85.220.195]:43504 "EHLO
        mail-qk0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755145AbeBOJUX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 15 Feb 2018 04:20:23 -0500
Received: by mail-qk0-f195.google.com with SMTP id i184so18979813qkf.10
        for <linux-renesas-soc@vger.kernel.org>; Thu, 15 Feb 2018 01:20:23 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20180215000415.19077-7-laurent.pinchart+renesas@ideasonboard.com>
References: <20180215000415.19077-1-laurent.pinchart+renesas@ideasonboard.com> <20180215000415.19077-7-laurent.pinchart+renesas@ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 15 Feb 2018 10:20:22 +0100
Message-ID: <CAMuHMdWvFe1oHnTG9fTN46jOEbns_QS1Ff1BTyw1BFwLjVkAQQ@mail.gmail.com>
Subject: Re: [PATCH v3 06/12] ARM: dts: r8a7790: Convert to new LVDS DT bindings
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: DRI Development <dri-devel@lists.freedesktop.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, Feb 15, 2018 at 1:04 AM, Laurent Pinchart
<laurent.pinchart+renesas@ideasonboard.com> wrote:
> The internal LVDS encoder now has DT bindings separate from the DU. Port
> the device tree over to the new model.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> --- a/arch/arm/boot/dts/r8a7790.dtsi
> +++ b/arch/arm/boot/dts/r8a7790.dtsi
> @@ -1067,17 +1067,13 @@

> @@ -1092,11 +1088,61 @@
>                         port@1 {
>                                 reg = <1>;
>                                 du_out_lvds0: endpoint {
> +                                       remote-endpoint = <&lvds0_in>;
>                                 };
>                         };
>                         port@2 {
>                                 reg = <2>;
>                                 du_out_lvds1: endpoint {
> +                                       remote-endpoint = <&lvds1_in>;
> +                               };
> +                       };
> +               };
> +       };
> +
> +       lvds0: lvds@feb90000 {
> +               compatible = "renesas,r8a7790-lvds";
> +               reg = <0 0xfeb90000 0 0x1c>;
> +               clocks = <&cpg CPG_MOD 726>;
> +               status = "disabled";

Missing resets, power-domains (for all lvds nodes in all DTS patches).

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
