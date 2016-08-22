Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:54066 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751754AbcHVJQA (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 22 Aug 2016 05:16:00 -0400
Date: Mon, 22 Aug 2016 11:15:54 +0200
From: Simon Horman <horms@verge.net.au>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org"
        <linux-arm-kernel@lists.infradead.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Takeshi Kihara <takeshi.kihara.df@renesas.com>
Subject: Re: [PATCH/RTF 5/7] arm64: dts: r8a7796: Add GPIO device nodes
Message-ID: <20160822091554.GB7896@verge.net.au>
References: <1471433516-4478-1-git-send-email-horms+renesas@verge.net.au>
 <1471433516-4478-6-git-send-email-horms+renesas@verge.net.au>
 <CAMuHMdVDHtpuK7ZC3gf6kp=KNWTD4bXHzs=UVgTy_dsyRFRhmQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdVDHtpuK7ZC3gf6kp=KNWTD4bXHzs=UVgTy_dsyRFRhmQ@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, Aug 17, 2016 at 05:41:21PM +0200, Geert Uytterhoeven wrote:
> On Wed, Aug 17, 2016 at 1:31 PM, Simon Horman
> <horms+renesas@verge.net.au> wrote:
> > From: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> >
> > Add GPIO device nodes to the DT of the r8a7796 SoC.
> >
> > Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> > Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
> 
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> 
> > ---
> >  arch/arm64/boot/dts/renesas/r8a7796.dtsi | 112 +++++++++++++++++++++++++++++++
> >  1 file changed, 112 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/renesas/r8a7796.dtsi b/arch/arm64/boot/dts/renesas/r8a7796.dtsi
> > index faea5a960abc..2741535f8b15 100644
> > --- a/arch/arm64/boot/dts/renesas/r8a7796.dtsi
> > +++ b/arch/arm64/boot/dts/renesas/r8a7796.dtsi
> > @@ -107,6 +107,118 @@
> >                         status = "disabled";
> >                 };
> >
> > +               gpio0: gpio@e6050000 {
> > +                       compatible = "renesas,gpio-r8a7796",
> 
> This compatible value should be documented in
> Documentation/devicetree/bindings/gpio/renesas,gpio-rcar.txt

Thanks, will do.
