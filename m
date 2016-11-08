Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:38553 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932287AbcKHKOg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 8 Nov 2016 05:14:36 -0500
Date: Tue, 8 Nov 2016 11:14:29 +0100
From: Simon Horman <horms@verge.net.au>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Wolfram Sang <wsa@the-dreams.de>
Subject: Re: [PATCH v2 5/5] arm64: renesas: r8a7796: salvator-x: enable I2C
Message-ID: <20161108101428.GB14277@verge.net.au>
References: <1477491249-2976-1-git-send-email-ulrich.hecht+renesas@gmail.com>
 <1477491249-2976-6-git-send-email-ulrich.hecht+renesas@gmail.com>
 <CAMuHMdUyWwk5-40uGsY6m4E_hq09cDnzBFj5_VELveDipoO7iA@mail.gmail.com>
 <20161108100222.GA14277@verge.net.au>
 <CAMuHMdUE7-EN2z7KjW64WhOArWMe70Pxh4GoLgs4dF7NOLGdnQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdUE7-EN2z7KjW64WhOArWMe70Pxh4GoLgs4dF7NOLGdnQ@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, Nov 08, 2016 at 11:07:58AM +0100, Geert Uytterhoeven wrote:
> Hi Simon,
> 
> On Tue, Nov 8, 2016 at 11:02 AM, Simon Horman <horms@verge.net.au> wrote:
> > On Mon, Nov 07, 2016 at 07:53:04PM +0100, Geert Uytterhoeven wrote:
> >> On Wed, Oct 26, 2016 at 4:14 PM, Ulrich Hecht
> >> <ulrich.hecht+renesas@gmail.com> wrote:
> >> > Signed-off-by: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
> >> > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> >> > ---
> >> >  arch/arm64/boot/dts/renesas/r8a7796-salvator-x.dts | 12 ++++++++++++
> >> >  1 file changed, 12 insertions(+)
> >> >
> >> > diff --git a/arch/arm64/boot/dts/renesas/r8a7796-salvator-x.dts b/arch/arm64/boot/dts/renesas/r8a7796-salvator-x.dts
> >> > index 8255c56..e48de7c 100644
> >> > --- a/arch/arm64/boot/dts/renesas/r8a7796-salvator-x.dts
> >> > +++ b/arch/arm64/boot/dts/renesas/r8a7796-salvator-x.dts
> >> > @@ -111,6 +111,11 @@
> >> >                 function = "scif_clk";
> >> >         };
> >> >
> >> > +       i2c2_pins: i2c2 {
> >> > +               groups = "i2c2_a";
> >> > +               function = "i2c2";
> >> > +       };
> >> > +
> >> >         sdhi0_pins: sd0 {
> >> >                 groups = "sdhi0_data4", "sdhi0_ctrl";
> >> >                 function = "sdhi0";
> >>
> >> BTW, do we have a policy about (alphabetical) ordering?
> >
> > FWIW I think we should aim to have notes sorted by a) base address and
> > b) alphabetically.
> 
> I think "nodes" comes first, before "notes" ;-)

Yes, that's the spirit.
