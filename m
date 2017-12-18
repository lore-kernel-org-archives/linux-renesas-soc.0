Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-qt0-f195.google.com ([209.85.216.195]:39111 "EHLO
        mail-qt0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932831AbdLRK1J (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 18 Dec 2017 05:27:09 -0500
Received: by mail-qt0-f195.google.com with SMTP id k19so19337425qtj.6
        for <linux-renesas-soc@vger.kernel.org>; Mon, 18 Dec 2017 02:27:09 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1513350890-2446-5-git-send-email-ulrich.hecht+renesas@gmail.com>
References: <1513350890-2446-1-git-send-email-ulrich.hecht+renesas@gmail.com> <1513350890-2446-5-git-send-email-ulrich.hecht+renesas@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 18 Dec 2017 11:27:08 +0100
Message-ID: <CAMuHMdVYoUUAPtRer8RSOtf3JQW2X=9V8VP9SvSc6hRj8OLLbQ@mail.gmail.com>
Subject: Re: [PATCH 4/4] arm64: dts: r8a7796: Add DEVFREQ support for GSX
To: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Gaku Inami <gaku.inami.xw@bp.renesas.com>,
        Takeshi Kihara <takeshi.kihara.df@renesas.com>,
        Hien Dang <hien.dang.eb@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Uli,

On Fri, Dec 15, 2017 at 4:14 PM, Ulrich Hecht
<ulrich.hecht+renesas@gmail.com> wrote:
> From: Gaku Inami <gaku.inami.xw@bp.renesas.com>
>
> This patch supports GSX frequency scaling using devfreq.
>
> Includes update of the OPP tables for GSX because the typical voltage of
> VDD_DVFS (power optimized) was updated to 0.83V by R-Car Gen3 EC Rev0.54E
> specification.
>
> Signed-off-by: Gaku Inami <gaku.inami.xw@bp.renesas.com>
> Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> Signed-off-by: Hien Dang <hien.dang.eb@renesas.com>
> Signed-off-by: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>

Thanks for your patch!

> --- a/arch/arm64/boot/dts/renesas/r8a7796.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a7796.dtsi
> @@ -166,6 +166,27 @@
>                 };
>         };
>
> +       gsx_opp_table: gsx_opp_table {
> +               compatible = "operating-points-v2";
> +
> +               opp@200000000 {

opp-200000000 (try "make dtbs W=1")

> +                       opp-hz = /bits/ 64 <200000000>;
> +                       opp-microvolt = <830000>;
> +               };
> +               opp@300000000 {
> +                       opp-hz = /bits/ 64 <300000000>;
> +                       opp-microvolt = <830000>;
> +               };
> +               opp@400000000 {
> +                       opp-hz = /bits/ 64 <400000000>;
> +                       opp-microvolt = <830000>;
> +               };
> +               opp@600000000 {
> +                       opp-hz = /bits/ 64 <600000000>;
> +                       opp-microvolt = <830000>;

Do they really all use the same voltage?

And AFAIU, DVFS is shared between CPU and GPU.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
