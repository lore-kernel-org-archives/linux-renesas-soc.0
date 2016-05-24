Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:34607 "EHLO
	kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752141AbcEXBoa (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Mon, 23 May 2016 21:44:30 -0400
Date: Tue, 24 May 2016 10:44:28 +0900
From: Simon Horman <horms@verge.net.au>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-renesas-soc@vger.kernel.org,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
	Magnus Damm <magnus.damm@gmail.com>
Subject: Re: [PATCH v2 1/3] arm64: dts: r8a7796: Add Renesas R8A7796 SoC
 support
Message-ID: <20160524014427.GB22751@verge.net.au>
References: <1463966906-15129-1-git-send-email-horms+renesas@verge.net.au>
 <1463966906-15129-2-git-send-email-horms+renesas@verge.net.au>
 <CAMuHMdXsu=O13rLysob1Xp+5vWcp7gq6byCffR-6hGc+W-837A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdXsu=O13rLysob1Xp+5vWcp7gq6byCffR-6hGc+W-837A@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Mon, May 23, 2016 at 09:07:20AM +0200, Geert Uytterhoeven wrote:
> On Mon, May 23, 2016 at 3:28 AM, Simon Horman
> <horms+renesas@verge.net.au> wrote:
> > Basic support for the Gen 3 R-Car M3-W SoC.
> >
> > Based on work for the r8a7795 and r8a7796 SoCs by
> > Takeshi Kihara, Dirk Behme and Geert Uytterhoeven.
> >
> > Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
> 
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/renesas/r8a7796.dtsi
> > @@ -0,0 +1,120 @@
> > +       psci {
> > +               compatible = "arm,psci-1.0";
> 
> Do we want to use 1.0 on r8a7795, too?
> 
> > +               method = "smc";
> > +       };
> 
> > +       soc {
> > +               compatible = "simple-bus";
> > +               interrupt-parent = <&gic>;
> > +               #address-cells = <2>;
> > +               #size-cells = <2>;
> > +               ranges;
> > +
> > +               gic: interrupt-controller@0xf1010000 {
> 
> If you drop the "0x" (which is BTW also present in r8a7795.dtsi), you can add
> my
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Deal :)
