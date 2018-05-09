Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:44323 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S935354AbeEISKK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 9 May 2018 14:10:10 -0400
Date: Wed, 9 May 2018 20:09:50 +0200
From: Simon Horman <horms@verge.net.au>
To: Rob Herring <robh@kernel.org>
Cc: Yoshihiro Kaneko <ykaneko0929@gmail.com>,
        linux-renesas-soc@vger.kernel.org, Zhang Rui <rui.zhang@intel.com>,
        Eduardo Valentin <edubezval@gmail.com>,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH/RFT v3 2/3] dt-bindings: thermal: rcar-thermal: add
 R8A77995 support
Message-ID: <20180509180950.b35wrl35sxunjmpg@verge.net.au>
References: <1522759385-17661-1-git-send-email-ykaneko0929@gmail.com>
 <1522759385-17661-3-git-send-email-ykaneko0929@gmail.com>
 <20180409212129.w55kgl6s6fz4pi6v@rob-hp-laptop>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180409212129.w55kgl6s6fz4pi6v@rob-hp-laptop>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Mon, Apr 09, 2018 at 04:21:29PM -0500, Rob Herring wrote:
> On Tue, Apr 03, 2018 at 09:43:04PM +0900, Yoshihiro Kaneko wrote:
> > Signed-off-by: Yoshihiro Kaneko <ykaneko0929@gmail.com>
> > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > ---
> >  Documentation/devicetree/bindings/thermal/rcar-thermal.txt | 7 +++++--
> >  1 file changed, 5 insertions(+), 2 deletions(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/thermal/rcar-thermal.txt b/Documentation/devicetree/bindings/thermal/rcar-thermal.txt
> > index 349e635..5ab5fcd 100644
> > --- a/Documentation/devicetree/bindings/thermal/rcar-thermal.txt
> > +++ b/Documentation/devicetree/bindings/thermal/rcar-thermal.txt
> > @@ -3,7 +3,8 @@
> >  Required properties:
> >  - compatible		: "renesas,thermal-<soctype>",
> >  			   "renesas,rcar-gen2-thermal" (with thermal-zone) or
> > -			   "renesas,rcar-thermal" (without thermal-zone) as fallback.
> > +			   "renesas,rcar-thermal" (without thermal-zone) as
> > +                           fallback except R-Car D3.
> >  			  Examples with soctypes are:
> >  			    - "renesas,thermal-r8a73a4" (R-Mobile APE6)
> >  			    - "renesas,thermal-r8a7743" (RZ/G1M)
> > @@ -12,13 +13,15 @@ Required properties:
> >  			    - "renesas,thermal-r8a7791" (R-Car M2-W)
> >  			    - "renesas,thermal-r8a7792" (R-Car V2H)
> >  			    - "renesas,thermal-r8a7793" (R-Car M2-N)
> > +			    - "renesas,thermal-r8a77995" (R-Car D3)
> >  - reg			: Address range of the thermal registers.
> >  			  The 1st reg will be recognized as common register
> >  			  if it has "interrupts".
> >  
> >  Option properties:
> >  
> > -- interrupts		: use interrupt
> > +- interrupts		: use interrupt.
> > +                          Should contain 3 interrupts for R-Car D3.
> 
> And how many for other chips?

How about this?

				If present should contain 3 interrupts for
				R-Car D3 or 1 interrupt otherwise.

> >  
> >  Example (non interrupt support):
> >  
> > -- 
> > 1.9.1
> > 
> 
