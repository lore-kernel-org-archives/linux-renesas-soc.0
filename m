Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:50117 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752610AbdFPLvd (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 16 Jun 2017 07:51:33 -0400
Date: Fri, 16 Jun 2017 13:51:13 +0200
From: Simon Horman <horms@verge.net.au>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Magnus <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] arch/arm64: defconfig: Compile Renesas Sound related
 drivers as Module
Message-ID: <20170616115113.GA13576@verge.net.au>
References: <87d1a77yll.wl%kuninori.morimoto.gx@renesas.com>
 <20170615135606.GB22158@verge.net.au>
 <87lgosixo3.wl%kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87lgosixo3.wl%kuninori.morimoto.gx@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Fri, Jun 16, 2017 at 12:33:18AM +0000, Kuninori Morimoto wrote:
> 
> Hi Simon
> 
> > > Current Renesas Sound related drivers are compiled as built-in.
> > > Let's compile it as Module to reduce ARM64 Kernel size.
> > > 
> > > Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> > > ---
> > >  arch/arm64/configs/defconfig | 6 +++---
> > >  1 file changed, 3 insertions(+), 3 deletions(-)
> > 
> > This does not seem to apply to renesas-next-20170614-v4.12-rc1
> > This and the above I can fix but...

No problem. I would have fixed it up if it wasn't for the other question
below.

> 
> Oops sorry about that.
> I can post v2 patch
> 
> > > -CONFIG_SND_SOC_RCAR=y
> > > -CONFIG_SND_SOC_AK4613=y
> > > -CONFIG_SND_SIMPLE_CARD=y
> > > +CONFIG_SND_SOC_RCAR=m
> > > +CONFIG_SND_SOC_AK4613=m
> > > +CONFIG_SND_SIMPLE_CARD=m
> > 
> > Do other drivers depend on any pf the above?
> > If so what are the implications here?
> 
> SOC_RCAR is Renesas specific, no other driver is depends on it.
> SOC_AK4613 is Codec and maybe Renesas only is using it, but I don't know.
> no other driver is depends on it I think.
> SIMPLE_CARD might be used from some other ARM64 platform.
> 
> This patch should focus only for RCAR and AK4613 ?

I think that should be a safe approach.
