Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:56463 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731125AbeGQMeG (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 17 Jul 2018 08:34:06 -0400
Date: Tue, 17 Jul 2018 14:01:44 +0200
From: Simon Horman <horms@verge.net.au>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH v2 00/03] arm64: dts: renesas: Add IPMMU device nodes V2
Message-ID: <20180717120143.exzfzsm7zzicrsdx@verge.net.au>
References: <152923212426.18394.1638836062311758848.sendpatchset@little-apple>
 <20180620091416.s4vdg5tgkl3mnoxd@verge.net.au>
 <20180716074939.76mes7rt5ddqnyy6@verge.net.au>
 <CAMuHMdWMj-91DHg5H2bfFDphLmrj5Er-vksKy0X0OcFso+zLNQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdWMj-91DHg5H2bfFDphLmrj5Er-vksKy0X0OcFso+zLNQ@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Mon, Jul 16, 2018 at 10:07:25AM +0200, Geert Uytterhoeven wrote:
> Hi Simon,
> 
> On Mon, Jul 16, 2018 at 9:50 AM Simon Horman <horms@verge.net.au> wrote:
> > On Wed, Jun 20, 2018 at 11:14:17AM +0200, Simon Horman wrote:
> > > On Sun, Jun 17, 2018 at 07:42:04PM +0900, Magnus Damm wrote:
> > > > arm64: dts: renesas: Add IPMMU device nodes V2
> > > >
> > > > [PATCH v2 01/03] arm64: dts: renesas: r8a77965: Add IPMMU devices nodes
> > > > [PATCH v2 02/03] arm64: dts: renesas: r8a77980: Add IPMMU devices nodes
> > > > [PATCH v2 03/03] arm64: dts: renesas: r8a77990: Add IPMMU devices nodes
> > > >
> > > > This series is the second attempt to add IPMMU device nodes to R-Car M3-N,
> > > > R-Car V3H and R-Car E3 SoCs.
> > > >
> > > > The IPMMU DT binding changes are not yet merged upstream however they
> > > > have been documented by the following patches:
> > > >
> > > > [PATCH] iommu/ipmmu-vmsa: Document R-Car M3-N IPMMU DT bindings
> > > > [PATCH] iommu/ipmmu-vmsa: Document R-Car V3H and E3 IPMMU DT bindings
> > > >
> > > > Please see each individual patch for list of changes.
> > >
> > > Hi Magnus,
> > >
> > > as per my comment on v1, did you consider merging these patches into one
> > > patch. Olof has asked that we consider such consolidation.
> >
> > The above dependencies now appear have been accepted for v4.19.
> >
> > I have now applied this series. I took the liberty of squashing all three
> > patches into one. The result is as follows.
> 
> I tend to disagree...
> 
> > From: Magnus Damm <damm+renesas@opensource.se>
> > Date: Sun, 17 Jun 2018 19:42:13 +0900
> > Subject: [PATCH] arm64: dts: renesas: r8a779{65,80,90}: Add IPMMU devices
> >  nodes
> >
> > Add IPMMU device nodes for the R-Car M3-N (r8a77965),
> > V3H (r8a77980) and E3 (r8a77990) SoCs.
> >
> > * The r8a77965 IPMMU is quite similar to r8a7796 however VP0
> >   has been added and PV1 has been removed. Also the IMSSTR
> >   bit assignment has been reworked.
> >
> > * The r8a77980 IPMMU is quite similar to r8a77970 however VC0
> >   has been added. The IMSSTR bit assignment has also been
> >   reworked. Power domains are also quite different however the
> >   the documentation is rather unclear about this topic.
> >
> >   Until we know better VC0 gets assigned to R8A77980_PD_ALWAYS_ON.
> >
> > * The r8a77990 IPMMU is similar to r8a77995. Power domains are
> >   however different and the public documentation is still unclear.
> >
> >   Based on preliminary information from the hardware team the R-Car E3
> >   SoC comes with an IPMMU-VP0 device in an Always-on power domain and
> >   the IPMMU-VC0 is placed as expected in the A3VC power domain.
> >
> > Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
> > Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
> 
> As is obvious from the need for three bullets with extensive explanation
> above, the IPMMU hierarchies for the various SoCs do differ a lot.  Hence
> this is not a case of mindless copying/adjusting  the device node for the
> (same and identical) device found on multiple SoC variants.
> 
> There's also a high probability of future fixes, cfr. "Until we know better ..."
> and "the public documentation is still unclear".
> 
> Given the above, I think it's better to keep them as 3 separate commits.

Sure, there are details, and they are important.
But at a high level we are adding all the IPMMU nodes to 3 different SoCs.
