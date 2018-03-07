Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:32839 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750989AbeCGIJZ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 7 Mar 2018 03:09:25 -0500
Date: Wed, 7 Mar 2018 09:09:21 +0100
From: Simon Horman <horms@verge.net.au>
To: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc: Biju Das <biju.das@bp.renesas.com>, Joerg Roedel <joro@8bytes.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
        "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>,
        Alex Williamson <alex.williamson@redhat.com>
Subject: Re: [PATCH  1/3] dt-bindings: iommu: ipmmu-vmsa: Add device tree
 support for r8a774[35]
Message-ID: <20180307080919.2azwluc7fmoi53qc@verge.net.au>
References: <1516808522-17348-1-git-send-email-biju.das@bp.renesas.com>
 <1516808522-17348-2-git-send-email-biju.das@bp.renesas.com>
 <TY1PR01MB1770C8E18C014211F2A2D771C0D90@TY1PR01MB1770.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <TY1PR01MB1770C8E18C014211F2A2D771C0D90@TY1PR01MB1770.jpnprd01.prod.outlook.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

[CC Alex Williamson]

It looks like the last patch to this file was taken by Alex.
Perhaps he would be willing to take this one too if it it was
reposted with him CCed.

On Tue, Mar 06, 2018 at 04:55:44PM +0000, Fabrizio Castro wrote:
> Dear All,
> 
> I am very sorry to bother you, do you know who is supposed to take this patch?
> 
> Thanks,
> Fab
> 
> > -----Original Message-----
> > From: Biju Das [mailto:biju.das@bp.renesas.com]
> > Sent: 24 January 2018 15:42
> > To: Joerg Roedel <joro@8bytes.org>; Laurent Pinchart <laurent.pinchart@ideasonboard.com>; Geert Uytterhoeven
> > <geert+renesas@glider.be>
> > Cc: Simon Horman <horms@verge.net.au>; Magnus Damm <magnus.damm@gmail.com>; Chris Paterson
> > <Chris.Paterson2@renesas.com>; Fabrizio Castro <fabrizio.castro@bp.renesas.com>; iommu@lists.linux-foundation.org; linux-
> > renesas-soc@vger.kernel.org; Biju Das <biju.das@bp.renesas.com>
> > Subject: [PATCH 1/3] dt-bindings: iommu: ipmmu-vmsa: Add device tree support for r8a774[35]
> >
> > Document r8a774[35] specific compatible strings. The Renesas RZ/G1[ME]
> > (r8a774[35]) IPMMU are identical to the R-Car Gen2 family.
> >
> > Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> > Reviewed-by: Chris Paterson <chris.paterson2@renesas.com>
> > ---
> >  Documentation/devicetree/bindings/iommu/renesas,ipmmu-vmsa.txt | 5 ++++-
> >  1 file changed, 4 insertions(+), 1 deletion(-)
> >
> > diff --git a/Documentation/devicetree/bindings/iommu/renesas,ipmmu-vmsa.txt
> > b/Documentation/devicetree/bindings/iommu/renesas,ipmmu-vmsa.txt
> > index 857df92..7d300af 100644
> > --- a/Documentation/devicetree/bindings/iommu/renesas,ipmmu-vmsa.txt
> > +++ b/Documentation/devicetree/bindings/iommu/renesas,ipmmu-vmsa.txt
> > @@ -11,12 +11,15 @@ Required Properties:
> >      the device is compatible with the R-Car Gen2 VMSA-compatible IPMMU.
> >
> >      - "renesas,ipmmu-r8a73a4" for the R8A73A4 (R-Mobile APE6) IPMMU.
> > +    - "renesas,ipmmu-r8a7743" for the R8A7743 (RZ/G1M) IPMMU.
> > +    - "renesas,ipmmu-r8a7745" for the R8A7745 (RZ/G1E) IPMMU.
> >      - "renesas,ipmmu-r8a7790" for the R8A7790 (R-Car H2) IPMMU.
> >      - "renesas,ipmmu-r8a7791" for the R8A7791 (R-Car M2-W) IPMMU.
> >      - "renesas,ipmmu-r8a7793" for the R8A7793 (R-Car M2-N) IPMMU.
> >      - "renesas,ipmmu-r8a7794" for the R8A7794 (R-Car E2) IPMMU.
> >      - "renesas,ipmmu-r8a7795" for the R8A7795 (R-Car H3) IPMMU.
> > -    - "renesas,ipmmu-vmsa" for generic R-Car Gen2 VMSA-compatible IPMMU.
> > +    - "renesas,ipmmu-vmsa" for generic R-Car Gen2 or RZ/G1 VMSA-compatible
> > +   IPMMU.
> >
> >    - reg: Base address and size of the IPMMU registers.
> >    - interrupts: Specifiers for the MMU fault interrupts. For instances that
> > --
> > 2.7.4
> 
> 
> 
> 
> Renesas Electronics Europe Ltd, Dukes Meadow, Millboard Road, Bourne End, Buckinghamshire, SL8 5FH, UK. Registered in England & Wales under Registered No. 04586709.
> 
