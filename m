Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:41764 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750905AbdI0HTL (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 27 Sep 2017 03:19:11 -0400
Date: Wed, 27 Sep 2017 09:18:49 +0200
From: Simon Horman <horms@verge.net.au>
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH 2/2] arm64: dts: renesas: r8a77995: draak: enable
 EthernetAVB
Message-ID: <20170927071846.GA18275@verge.net.au>
References: <1505305119-4257-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1505305119-4257-3-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <CAMuHMdX3q=foc1hkcqTc3WQYxCh1x+bc8fu9+YcqVAx9bp4qaA@mail.gmail.com>
 <TY1PR06MB0992906ACD39FA3D176CDFE6D86E0@TY1PR06MB0992.apcprd06.prod.outlook.com>
 <20170915073501.GD3924@verge.net.au>
 <TY1PR06MB09920DE49B74D16FABE7699DD8660@TY1PR06MB0992.apcprd06.prod.outlook.com>
 <20170925070742.GC1019@verge.net.au>
 <TY1PR06MB0992BB60AFD2AC0E24032FE2D8780@TY1PR06MB0992.apcprd06.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <TY1PR06MB0992BB60AFD2AC0E24032FE2D8780@TY1PR06MB0992.apcprd06.prod.outlook.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, Sep 27, 2017 at 02:03:14AM +0000, Yoshihiro Shimoda wrote:
> Hi Simon-san,
> > From: Simon Horman
> > Sent: Monday, September 25, 2017 4:08 PM
> > On Thu, Sep 21, 2017 at 10:37:15AM +0000, Yoshihiro Shimoda wrote:
> > > Hi Simon-san,
> > > > From: Simon Horman
> > > > Sent: Friday, September 15, 2017 4:35 PM

...

> > > > Thanks. I have marked this as "Deferred" pending acceptance of the PFC
> > > > patch. Please repost or ping me, f.e. via a reply-to-all to this email,
> > > > once that dependency is resolved.
> > >
> > > Since the PFC patch is applied into renesas-drivers.git / sh-pfc-for-v4.15 branch,
> > > I'd like to ping you :)
> > >
> > https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git/commit/?h=sh-pfc-for-v4.15&id=66abd968d0ef
> > 3eb10dea45b48a31321eb29258f8
> > >
> > > Or, should I rebase this patch on latest devel tag?
> > > If so, I will rebase it in next Monday because I'll take a day off tomorrow.
> > 
> > Thanks for pinging me. I have applied this patch.
> > There was some fuzz when doing so. Please check that the applied
> > patch is correct once I have pushed an updated devel branch later today.
> 
> Thank you for applying!
> I checked renesas.git / renesas-devel-20170925-v4.14-rc2 tag, and it's correct.

Thanks for checking, much appreciated.
