Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:48080 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725845AbeHQLrU (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 17 Aug 2018 07:47:20 -0400
Date: Fri, 17 Aug 2018 10:44:45 +0200
From: Simon Horman <horms@verge.net.au>
To: Biju Das <biju.das@bp.renesas.com>
Cc: Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: Re: [PATCH v3 5/5] ARM: dts: iwg23s-sbc: Add pinctl support for
 EtherAVB
Message-ID: <20180817084445.3iud4quiwvawhkbf@verge.net.au>
References: <1533628626-26503-1-git-send-email-biju.das@bp.renesas.com>
 <1533628626-26503-6-git-send-email-biju.das@bp.renesas.com>
 <20180810121231.776wrl3cozakpsao@verge.net.au>
 <OSBPR01MB2103211FDAC790771BFFB765B8240@OSBPR01MB2103.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <OSBPR01MB2103211FDAC790771BFFB765B8240@OSBPR01MB2103.jpnprd01.prod.outlook.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Fri, Aug 10, 2018 at 01:47:12PM +0000, Biju Das wrote:
> Hello Simon,
> 
> Thanks for the feedback.
> 
> > Subject: Re: [PATCH v3 5/5] ARM: dts: iwg23s-sbc: Add pinctl support for
> > EtherAVB
> >
> > On Tue, Aug 07, 2018 at 08:57:06AM +0100, Biju Das wrote:
> > > Adding pinctrl support for EtherAVB interface.
> > >
> > > Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> > > Reviewed-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> > > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > > ---
> > > V1-->V2
> > >      * No change
> > > V2-->V3
> > >      * No change
> > >      Depend onthe below patch
> > >        https://patchwork.kernel.org/patch/10546801/
> >
> > What is the effect of applying this patch without that dependency present?
> 
> No build dependency. Only driver probe will fail during run time.
> [    0.838091] ravb: probe of e6800000.ethernet failed with error -22

Thanks, but does the driver probe fail without this patch?
If so I'd rather hold off on this until v4.21.
