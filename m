Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:58876 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726541AbeIFOBX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 6 Sep 2018 10:01:23 -0400
Date: Thu, 6 Sep 2018 11:26:46 +0200
From: Simon Horman <horms@verge.net.au>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: jacopo mondi <jacopo@jmondi.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Takeshi Kihara <takeshi.kihara.df@renesas.com>
Subject: Re: [PATCH 12/16] arm64: dts: renesas: r8a77990: Add I2C device nodes
Message-ID: <20180906092645.j7f2ggurkqohl6fj@verge.net.au>
References: <20180904121027.24031-1-laurent.pinchart+renesas@ideasonboard.com>
 <CAMuHMdUPQn4HgkXB1E-nkDef9-HTsb1jCMPNZGoD9oqxGkS2Tg@mail.gmail.com>
 <20180904144953.GE28160@w540>
 <3271850.40NKT2CM63@avalon>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3271850.40NKT2CM63@avalon>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, Sep 05, 2018 at 04:53:26PM +0300, Laurent Pinchart wrote:
> Hi Jacopo,
> 
> On Tuesday, 4 September 2018 17:49:53 EEST jacopo mondi wrote:
> > On Tue, Sep 04, 2018 at 04:32:32PM +0200, Geert Uytterhoeven wrote:
> > > On Tue, Sep 4, 2018 at 2:10 PM Laurent Pinchart wrote:
> > >> From: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> > >> 
> > >> Add device nodes for I2C ch{0,1,2,3,4,5,6,7} to R-Car E3 R8A77990 device
> > >> tree.
> > >> 
> > >> Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> > >> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> > > 
> > > My
> > > 
> > >     Reviewed-by: Geert Uytterhoeven <geert+renesas@xxxxxxxxx>
> > >     Tested-by: Geert Uytterhoeven <geert+renesas@xxxxxxxxx>
> > > 
> > > are still valid.
> > 
> > I was about to send a v2 with these and the slight change Geert
> > suggested on the ch[0-7] list.
> > 
> > Would you prefer me to drop it from my v2 series and re-base HDMI and
> > CVBS enablement for E3 on top of this series?
> 
> Please don't. We don't know which series will go in first. In any case I'd 
> like to fast-track this patch, so if you could post an updated version on its 
> own it would be helpful.

The patch should appear in the next branch later today.
Hopefully that will make everyones lives just that little
bit easier.
