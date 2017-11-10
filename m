Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-qt0-f194.google.com ([209.85.216.194]:48231 "EHLO
        mail-qt0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751406AbdKJKAr (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 10 Nov 2017 05:00:47 -0500
MIME-Version: 1.0
In-Reply-To: <1510067449-17017-3-git-send-email-fabrizio.castro@bp.renesas.com>
References: <1510067449-17017-1-git-send-email-fabrizio.castro@bp.renesas.com> <1510067449-17017-3-git-send-email-fabrizio.castro@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 10 Nov 2017 11:00:46 +0100
Message-ID: <CAMuHMdV=8rAE5z2VmCjL-M_MXY6TsKM_+0c-bsqDsjDZYWU1FA@mail.gmail.com>
Subject: Re: [PATCH 2/8] pinctrl: sh-pfc: r8a7745: Add CAN[01] support
To: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Linus Walleij <linus.walleij@linaro.org>,
        Simon Horman <horms@verge.net.au>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Fabrizio,

On Tue, Nov 7, 2017 at 4:10 PM, Fabrizio Castro
<fabrizio.castro@bp.renesas.com> wrote:
> This patch adds PFC CAN0 and CAN1 pin groups and functions, enabling CAN
> bus on the RZ/G1E.
>
> Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> Reviewed-by: Biju Das <biju.das@bp.renesas.com>

Thanks for your patch!

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in sh-pfc-for-v4.16.

> +static const char * const can0_groups[] = {
> +       "can0_data",
> +       "can0_data_b",
> +       "can0_data_c",
> +       "can0_data_d",
> +       "can_clk",
> +       "can_clk_b",
> +       "can_clk_c",
> +       "can_clk_d",
> +};
> +
> +static const char * const can1_groups[] = {
> +       "can1_data",
> +       "can1_data_b",
> +       "can1_data_c",
> +       "can1_data_d",
> +       "can_clk",
> +       "can_clk_b",
> +       "can_clk_c",
> +       "can_clk_d",
> +};

> @@ -4102,6 +4246,8 @@ static const char * const vin1_groups[] = {
>  static const struct sh_pfc_function pinmux_functions[] = {
>         SH_PFC_FUNCTION(audio_clk),
>         SH_PFC_FUNCTION(avb),
> +       SH_PFC_FUNCTION(can0),
> +       SH_PFC_FUNCTION(can1),
>         SH_PFC_FUNCTION(du0),
>         SH_PFC_FUNCTION(du1),
>         SH_PFC_FUNCTION(eth),

One minor nit: on R-Car Gen3, there is a separate function for can_clk,
which is cleaner, as it reduces duplication, and allows for independent
configuration.

Consider e.g. the case where you want to use both can0 and can1, which
means you have to add "can_clk" to exactly one of the two pin nodes in DT:

        can0_pins: can0 {
                groups = "can0_data", "can_clk";
                function = "can0";
        };

        can1_pins: can1 {
                groups = "can0_data";
                function = "can0";
        };

However, as can_clk is integrated in both the can0 and can1 groups on RZ/G1M
(and R-Car M2-W/N, V2H, and M1A), I'll let this pass through.

You may want to consider adding the separate group anyway (later), to
provide a simpler upgrade path.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
