Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:45393 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751915AbdKHEsd (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 7 Nov 2017 23:48:33 -0500
Date: Wed, 8 Nov 2017 13:48:23 +0900
From: Simon Horman <horms@verge.net.au>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Chris Paterson <chris.paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 1/2] ARM: dts: r8a7745: Add DU support
Message-ID: <20171108044822.ktnzzowzprqtdnsm@verge.net.au>
References: <1509992814-4543-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1509992814-4543-2-git-send-email-fabrizio.castro@bp.renesas.com>
 <9872942.on8edmfvcY@avalon>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9872942.on8edmfvcY@avalon>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, Nov 07, 2017 at 06:05:37AM +0200, Laurent Pinchart wrote:
> Hi Fabrizio,
> 
> Thank you for the patch.
> 
> On Monday, 6 November 2017 20:26:53 EET Fabrizio Castro wrote:
> > Add du node to r8a7745 SoC DT. Boards that want to enable the DU
> > need to specify the output topology.
> > 
> > Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> > Reviewed-by: Biju Das <biju.das@bp.renesas.com>
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> 
> > ---
> >  arch/arm/boot/dts/r8a7745.dtsi | 27 +++++++++++++++++++++++++++
> >  1 file changed, 27 insertions(+)
> > 
> > diff --git a/arch/arm/boot/dts/r8a7745.dtsi b/arch/arm/boot/dts/r8a7745.dtsi
> > index 846c27a..53eb1ce4 100644
> > --- a/arch/arm/boot/dts/r8a7745.dtsi
> > +++ b/arch/arm/boot/dts/r8a7745.dtsi
> > @@ -821,6 +821,33 @@
> >  			status = "disabled";
> >  		};
> > 
> > +		du: display@feb00000 {
> > +			compatible = "renesas,du-r8a7745";

Hi,

could you provide some information on the status of upstreaming
the binding used above?
