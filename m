Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-it0-f66.google.com ([209.85.214.66]:34892 "EHLO
        mail-it0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750786AbcH2QO6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 29 Aug 2016 12:14:58 -0400
Received: by mail-it0-f66.google.com with SMTP id f128so7104876ith.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 29 Aug 2016 09:14:58 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1470745752-23738-2-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
References: <1470745752-23738-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
 <1470745752-23738-2-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 29 Aug 2016 18:14:57 +0200
Message-ID: <CAMuHMdVB3G1O2-LbarZrSumdbU5T_n-+Gpbtz3_FkU3QnS14Nw@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] arm64: dts: renesas: r8a7795: Add FCPV nodes
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Laurent,

On Tue, Aug 9, 2016 at 2:29 PM, Laurent Pinchart
<laurent.pinchart+renesas@ideasonboard.com> wrote:
> The FCPs handle the interface between various IP cores and memory. Add
> the instances related to the VSP2s.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> ---
>  arch/arm64/boot/dts/renesas/r8a7795.dtsi | 63 ++++++++++++++++++++++++++++++++
>  1 file changed, 63 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/renesas/r8a7795.dtsi b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
> index 99953ca9a45e..f8b1c421e845 100644
> --- a/arch/arm64/boot/dts/renesas/r8a7795.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a7795.dtsi

> +               fcpvi2: fcp@fe9cf000 {
> +                       compatible = "renesas,r8a7795-fcpv", "renesas,fcpv";
> +                       reg = <0 0xfe9cf000 0 0x200>;
> +                       clocks = <&cpg CPG_MOD 609>;
> +                       power-domains = <&sysc R8A7795_PD_A3VP>;
> +               };

> +               fcpvd3: fcp@fea3f000 {
> +                       compatible = "renesas,r8a7795-fcpv", "renesas,fcpv";
> +                       reg = <0 0xfea3f000 0 0x200>;
> +                       clocks = <&cpg CPG_MOD 600>;
> +                       power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;
> +               };
> +

Looks like fcpvi2 and fcpvd3 are no more?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
