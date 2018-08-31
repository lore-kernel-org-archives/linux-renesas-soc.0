Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:53578 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727430AbeHaTAl (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 31 Aug 2018 15:00:41 -0400
Date: Fri, 31 Aug 2018 16:52:46 +0200
From: Simon Horman <horms@verge.net.au>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        Chris Paterson <chris.paterson2@renesas.com>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
        <devicetree@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Biju Das <biju.das@bp.renesas.com>
Subject: Re: [PATCH] arm64: dts: renesas: r8a774a1: Add CAN nodes
Message-ID: <20180831145241.7ahp77jrlpievtmw@verge.net.au>
References: <1535034166-24798-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <CAMuHMdUL0Ck=6er8rvx_kCSi7KR9kjBqjNRiLOL41nxeJXQG-w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdUL0Ck=6er8rvx_kCSi7KR9kjBqjNRiLOL41nxeJXQG-w@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Fri, Aug 31, 2018 at 10:44:10AM +0200, Geert Uytterhoeven wrote:
> Hi Fabrizio,
> 
> On Thu, Aug 23, 2018 at 4:22 PM Fabrizio Castro
> <fabrizio.castro@bp.renesas.com> wrote:
> > From: Chris Paterson <chris.paterson2@renesas.com>
> >
> > Add the device nodes for both RZ/G2M CAN channels.
> >
> > Signed-off-by: Chris Paterson <chris.paterson2@renesas.com>
> > Reviewed-by: Biju Das <biju.das@bp.renesas.com>
> > ---
> >
> > This patch depends on:
> > https://lkml.org/lkml/2018/8/23/1049
> > https://www.mail-archive.com/linux-renesas-soc@vger.kernel.org/msg30550.html
> >
> >
> >  arch/arm64/boot/dts/renesas/r8a774a1.dtsi | 24 ++++++++++++++++++++++++
> >  1 file changed, 24 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/renesas/r8a774a1.dtsi b/arch/arm64/boot/dts/renesas/r8a774a1.dtsi
> > index 5d0109a..cd204f5 100644
> > --- a/arch/arm64/boot/dts/renesas/r8a774a1.dtsi
> > +++ b/arch/arm64/boot/dts/renesas/r8a774a1.dtsi
> > @@ -816,6 +816,30 @@
> >                         status = "disabled";
> >                 };
> >
> > +               can0: can@e6c30000 {
> > +                       compatible = "renesas,can-r8a774a1",
> > +                                    "renesas,rzg-gen2-can";
> 
> Please don't introduce "renesas,rzg-gen2-can", cfr. my comments in
> https://lore.kernel.org/lkml/CAMuHMdWPuqfXOgh_-qp8q6wATU3Lj_WpX0bAOxPBX76SKvyXCQ@mail.gmail.com/

Thanks Geert,

I was ok with the compat string but it was unwise to pick up this patch
before that discussion had concluded. I have dropped this patch accordingly.

Fabrizio, please post a v2 once the binding is agreed on.
