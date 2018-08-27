Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:50363 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726918AbeH0Qlr (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 27 Aug 2018 12:41:47 -0400
Date: Mon, 27 Aug 2018 14:55:10 +0200
From: Simon Horman <horms@verge.net.au>
To: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc: Chris Paterson <Chris.Paterson2@renesas.com>,
        Wolfgang Grandegger <wg@grandegger.com>,
        Marc Kleine-Budde <mkl@pengutronix.de>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        "David S. Miller" <davem@davemloft.net>,
        "linux-can@vger.kernel.org" <linux-can@vger.kernel.org>,
        "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Biju Das <biju.das@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] dt-bindings: can: rcar_can: Add r8a774a1 support
Message-ID: <20180827125510.ahpk6basgrxbzq6i@verge.net.au>
References: <1534516703-11448-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <20180822104856.34nusjd4ajtwb4ef@verge.net.au>
 <TYAPR01MB2285834E95AB0D0D3E2C5B72B7300@TYAPR01MB2285.jpnprd01.prod.outlook.com>
 <20180824082643.7eapxf72iuvkdw3j@verge.net.au>
 <TY1PR01MB177055864EEAD487C2917860C0360@TY1PR01MB1770.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <TY1PR01MB177055864EEAD487C2917860C0360@TY1PR01MB1770.jpnprd01.prod.outlook.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Fri, Aug 24, 2018 at 08:31:42AM +0000, Fabrizio Castro wrote:
> Hello Simon,
> 
> Thank you for the feedback!
> 
> > >
> > > In theory CAN could be broken if renesas,can-clock-select is set to 0x1
> > > (clkp2) in the DT, as this value will be written to the CAN Clock Select
> > > Register. However if the documentation is followed there will be no
> > > problems.
> > >
> > > We should probably update the driver to fix this though, which will be a
> > > change specific to all RZ/G2 devices, so perhaps we should also be adding
> > > a "renesas,rzg-gen2-can" family compatible string as well? (to driver and
> > > documentation)
> >
> > Yes, I think that sounds reasonable.
> >
> > But in that case we should pre-emptively not use renesas,rcar-gen3-can for
> > RZ/G2.
> 
> What do you think about the following:
> https://patchwork.kernel.org/patch/10573795/
> https://patchwork.kernel.org/patch/10573791/
> https://patchwork.kernel.org/patch/10573805/

I think that is the right approach.
