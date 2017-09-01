Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:60106 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751237AbdIAItp (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 1 Sep 2017 04:49:45 -0400
Date: Fri, 1 Sep 2017 10:49:23 +0200
From: Simon Horman <horms@verge.net.au>
To: Chris Paterson <Chris.Paterson2@renesas.com>
Cc: Biju Das <biju.das@bp.renesas.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org"
        <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH ] ARM: dts: iwg22d-sodimm: Add Ethernet AVB support
Message-ID: <20170901084923.GC14918@verge.net.au>
References: <1504106234-41450-1-git-send-email-biju.das@bp.renesas.com>
 <20170831084534.GF29946@verge.net.au>
 <KL1PR06MB170280A3D466C9B35AF73939B89D0@KL1PR06MB1702.apcprd06.prod.outlook.com>
 <TY1PR06MB07029D315FC6EE500D1EEA55B79D0@TY1PR06MB0702.apcprd06.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <TY1PR06MB07029D315FC6EE500D1EEA55B79D0@TY1PR06MB0702.apcprd06.prod.outlook.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, Aug 31, 2017 at 09:32:25AM +0000, Chris Paterson wrote:
> Hello,
> 
> > From: Biju Das
> > Sent: 31 August 2017 10:24
> > 
> > > From: Simon Horman [mailto:horms@verge.net.au]
> > > Sent: 31 August 2017 09:46
> 
> <snip>
> 
> > > > +	phy3: ethernet-phy@3 {
> > > > +	/*
> > > > +	 * On some older versions of the platform (before R4.0) the phy
> > > address
> > > > +	 * may be 1 or 3. The address is fixed to 3 for R4.0 onwards.
> > > > +	 */
> > > > +		reg = <3>;
> > > > +		micrel,led-mode = <1>;
> > >
> > > Does the phy have an interrupt?
> > 
> > The current board doesn't support interrupt . But there is a plan to support this
> > in future board variants through (GPIO3_28).
> 
> Actually, the plan has recently changed and at the moment interrupt support will not be added in the production version of the board.
> 
> If in the end the plan changes again and the actual hardware does add interrupt support we'll submit a new patch accordingly.

Thanks for following-up on this. I'm still surprised there is no interrupt
- does link speed renegotiation initiated by the other end of the link work
in a timely manner? - but if its not there and my wishful thinking won't
make it so.

I have applied this patch for v4.15.
