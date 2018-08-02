Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-ua0-f196.google.com ([209.85.217.196]:46670 "EHLO
        mail-ua0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729580AbeHBNWu (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 2 Aug 2018 09:22:50 -0400
Received: by mail-ua0-f196.google.com with SMTP id u11-v6so1178473uan.13
        for <linux-renesas-soc@vger.kernel.org>; Thu, 02 Aug 2018 04:32:05 -0700 (PDT)
MIME-Version: 1.0
References: <20180730073338.3639-1-wsa+renesas@sang-engineering.com> <20180802111352.3yxizsyuggfxwjz6@verge.net.au>
In-Reply-To: <20180802111352.3yxizsyuggfxwjz6@verge.net.au>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 2 Aug 2018 13:31:52 +0200
Message-ID: <CAMuHMdWcMO8CaLmBOa6f4c6yoLOu+yGc4eU+4F92Rc2zJUJu-Q@mail.gmail.com>
Subject: Re: [PATCH v2] arm64: dts: r8a77965: Add SATA controller node
To: Simon Horman <horms@verge.net.au>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Takeshi Kihara <takeshi.kihara.df@renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Simon,

On Thu, Aug 2, 2018 at 1:13 PM Simon Horman <horms@verge.net.au> wrote:
> On Mon, Jul 30, 2018 at 09:33:38AM +0200, Wolfram Sang wrote:
> > From: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> > This patch adds SATA controller node for the R8A77965 SoC.
> >
> > Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> > [wsa: rebased to upstream base]
> > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> > ---
> >
> > Changes since v1:
> >       * sorted it according to address (Thanks, Geert!)
> >       * added Geert's tag
> >
> >  arch/arm64/boot/dts/renesas/r8a77965.dtsi | 11 +++++++++++
> >  1 file changed, 11 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/renesas/r8a77965.dtsi b/arch/arm64/boot/dts/renesas/r8a77965.dtsi
> > index 0cd44461a0bd..bf22efb82cbf 100644
> > --- a/arch/arm64/boot/dts/renesas/r8a77965.dtsi
> > +++ b/arch/arm64/boot/dts/renesas/r8a77965.dtsi
> > @@ -1507,6 +1507,17 @@
> >                       status = "disabled";
> >               };
> >
> > +             sata: sata@ee300000 {
> > +                     compatible = "renesas,sata-r8a77965",
> > +                                  "renesas,rcar-gen3-sata";
> > +                     reg = <0 0xee300000 0 0x200000>;
> > +                     interrupts = <GIC_SPI 105 IRQ_TYPE_LEVEL_HIGH>;
> > +                     clocks = <&cpg CPG_MOD 815>;
> > +                     power-domains = <&sysc R8A77965_PD_ALWAYS_ON>;
> > +                     resets = <&cpg 815>;
> > +                     status = "disabled";
>
> Is it intentional that there is no iommus property here?

Because none of the other device nodes have iommus properties yet?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
