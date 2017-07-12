Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-io0-f196.google.com ([209.85.223.196]:33628 "EHLO
        mail-io0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1756647AbdGLHWv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 12 Jul 2017 03:22:51 -0400
Received: by mail-io0-f196.google.com with SMTP id z62so1309803ioi.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 12 Jul 2017 00:22:51 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20170621093133.5677-3-laurent.pinchart+renesas@ideasonboard.com>
References: <20170621093133.5677-1-laurent.pinchart+renesas@ideasonboard.com> <20170621093133.5677-3-laurent.pinchart+renesas@ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 12 Jul 2017 09:22:50 +0200
Message-ID: <CAMuHMdXpJ4ccT8_01pXBAYK99_DD+dvrkP5QpLF8a=T_4QJQxQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/7] arm64: dts: renesas: r8a7796: Add FCPF and FCPV instances
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Laurent, Simon,

On Wed, Jun 21, 2017 at 11:31 AM, Laurent Pinchart
<laurent.pinchart+renesas@ideasonboard.com> wrote:
> The FCPs handle the interface between various IP cores and memory. Add
> the instances related to the FDPs and VSP2s.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Ah, the pitfalls of reposting patches 8 months later...

>  arch/arm64/boot/dts/renesas/r8a7796.dtsi | 42 ++++++++++++++++++++++++++++++++
>  1 file changed, 42 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/renesas/r8a7796.dtsi b/arch/arm64/boot/dts/renesas/r8a7796.dtsi
> index 1f6710912045..28b0e2127021 100644
> --- a/arch/arm64/boot/dts/renesas/r8a7796.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a7796.dtsi
> @@ -1440,6 +1440,48 @@
>                         /* placeholder */
>                 };
>
> +               fcpf0: fcp@fe950000 {
> +                       compatible = "renesas,fcpf";
> +                       reg = <0 0xfe950000 0 0x200>;
> +                       clocks = <&cpg CPG_MOD 615>;
> +                       power-domains = <&sysc R8A7796_PD_A3VC>;

... missing resets properties.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
