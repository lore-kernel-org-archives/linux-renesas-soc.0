Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:53166 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750757AbdFSJOf (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 19 Jun 2017 05:14:35 -0400
Date: Mon, 19 Jun 2017 11:14:29 +0200
From: Simon Horman <horms@verge.net.au>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
        Magnus <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH] arm64: renesas: salvator-common: sound clock-frequency
 needs descending order
Message-ID: <20170619091429.GC19284@verge.net.au>
References: <87fuf0iuiq.wl%kuninori.morimoto.gx@renesas.com>
 <20170616133813.GC26834@verge.net.au>
 <87k24825wi.wl%kuninori.morimoto.gx@renesas.com>
 <CAMuHMdWFK5XRJ8-GBxvDAHqEyTUo_2vamBttoEjDgvnEFdFu9Q@mail.gmail.com>
 <874lvc1ogz.wl%kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <874lvc1ogz.wl%kuninori.morimoto.gx@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Mon, Jun 19, 2017 at 06:33:08AM +0000, Kuninori Morimoto wrote:
> Hi Geert
> 
> > >> On Fri, Jun 16, 2017 at 01:41:20AM +0000, Kuninori Morimoto wrote:
> > >> > From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> > >> >
> > >> > It will be used ADG clock initial settings, and will be
> > >> > sound codec's initial system clock which needs maximum clock frequency.
> > >> > Thus, descending order is required
> > >> >
> > >> > Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> > >>
> > >> Thanks, I have queued this up for v4.14.
> > >
> > > Sorry for bother you, but is it possible this patch in v4.13 ?
> > 
> > I guess you forgot to add these tags, that would have hinted Simon they are
> > fixes for commits he was about to send a pull request for to arm-soc?
> > 
> > Fixes: d37d2b3c0ec2708a ("arm64: dts: salvator-x: add 12288000 for sound ADG")
> > Fixes: 0b03c32db03d63de ("arm64: dts: r8a7795: salvator-x: Add support
> > for R-Car H3 ES2.0")
> > 
> > In the mean time Olof has pulled them...
> 
> Yes, it was my fault, and (maybe) I posted this patch *after* simon's closing announce.
> If it is OK, I can post it with above Fixes tag

Its fine to post fixes after my tree closes (or at any other time) but it
helps me a lot if they come with "Fixes" tags if the resolve issues in
patches for which I have already sent pull requests. I'll re-apply this
patch as a fix for v4.13 with the tags above. No need to repost at this
stage.
