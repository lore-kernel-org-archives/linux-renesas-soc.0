Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:33437 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1756858AbdGLIpk (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 12 Jul 2017 04:45:40 -0400
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH v2 2/7] arm64: dts: renesas: r8a7796: Add FCPF and FCPV instances
Date: Wed, 12 Jul 2017 11:45:41 +0300
Message-ID: <4182319.3cM5zgc3T9@avalon>
In-Reply-To: <CAMuHMdXpJ4ccT8_01pXBAYK99_DD+dvrkP5QpLF8a=T_4QJQxQ@mail.gmail.com>
References: <20170621093133.5677-1-laurent.pinchart+renesas@ideasonboard.com> <20170621093133.5677-3-laurent.pinchart+renesas@ideasonboard.com> <CAMuHMdXpJ4ccT8_01pXBAYK99_DD+dvrkP5QpLF8a=T_4QJQxQ@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Geert,

On Wednesday 12 Jul 2017 09:22:50 Geert Uytterhoeven wrote:
> On Wed, Jun 21, 2017 at 11:31 AM, Laurent Pinchart wrote:
> > The FCPs handle the interface between various IP cores and memory. Add
> > the instances related to the FDPs and VSP2s.
> > 
> > Signed-off-by: Laurent Pinchart
> > <laurent.pinchart+renesas@ideasonboard.com>
> > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> 
> Ah, the pitfalls of reposting patches 8 months later...
> 
> >  arch/arm64/boot/dts/renesas/r8a7796.dtsi | 42
> >  ++++++++++++++++++++++++++++++++ 1 file changed, 42 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/renesas/r8a7796.dtsi
> > b/arch/arm64/boot/dts/renesas/r8a7796.dtsi index
> > 1f6710912045..28b0e2127021 100644
> > --- a/arch/arm64/boot/dts/renesas/r8a7796.dtsi
> > +++ b/arch/arm64/boot/dts/renesas/r8a7796.dtsi
> > @@ -1440,6 +1440,48 @@
> >                         /* placeholder */
> >                 };
> > 
> > +               fcpf0: fcp@fe950000 {
> > +                       compatible = "renesas,fcpf";
> > +                       reg = <0 0xfe950000 0 0x200>;
> > +                       clocks = <&cpg CPG_MOD 615>;
> > +                       power-domains = <&sysc R8A7796_PD_A3VC>;
> 
> ... missing resets properties.

Oops :-/

Simon, can I send an incremental patch ?

-- 
Regards,

Laurent Pinchart
