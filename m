Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:51041 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727615AbeJRVTV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 18 Oct 2018 17:19:21 -0400
Date: Thu, 18 Oct 2018 15:18:17 +0200
From: Simon Horman <horms@verge.net.au>
To: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc: Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org"
        <linux-arm-kernel@lists.infradead.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Biju Das <biju.das@bp.renesas.com>
Subject: Re: [PATCH v2 3/3] arm64: dts: renesas: r8a774a1: Add CAN nodes
Message-ID: <20181018131817.bzx4jrzu3ynvq7pe@verge.net.au>
References: <1536576195-11520-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1536576195-11520-4-git-send-email-fabrizio.castro@bp.renesas.com>
 <20180911133220.3kjx5dqp65drx3qs@verge.net.au>
 <TY1PR01MB1770B42824076BF5C57F12DDC0140@TY1PR01MB1770.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <TY1PR01MB1770B42824076BF5C57F12DDC0140@TY1PR01MB1770.jpnprd01.prod.outlook.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, Sep 27, 2018 at 10:53:41AM +0000, Fabrizio Castro wrote:
> Hello Simon,
> 
> > Subject: Re: [PATCH v2 3/3] arm64: dts: renesas: r8a774a1: Add CAN nodes
> >
> > On Mon, Sep 10, 2018 at 11:43:15AM +0100, Fabrizio Castro wrote:
> > > From: Chris Paterson <chris.paterson2@renesas.com>
> > >
> > > Add the device nodes for both RZ/G2M CAN channels.
> > >
> > > Signed-off-by: Chris Paterson <chris.paterson2@renesas.com>
> > > Reviewed-by: Biju Das <biju.das@bp.renesas.com>
> > > ---
> > >
> > > v1->v2:
> > > * replaced "renesas,rzg-gen2-can" with "renesas,rcar-gen3-can" as per
> > >   Geert's comment.
> > >
> > > This patch applies on top of renesas-devel-20180906-v4.19-rc2.
> >
> > Thanks Fabrizio,
> >
> > I would like to waif for the bindings to be accepted before accepting this
> > patch.
> 
> Marc has taken the bindings, I guess we can unblock this patch now?

Sorry for letting this slip.

Yes, applied for v4.21.
