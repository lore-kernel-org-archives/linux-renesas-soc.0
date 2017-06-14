Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:44329 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932088AbdFNJCK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 14 Jun 2017 05:02:10 -0400
Date: Wed, 14 Jun 2017 11:02:04 +0200
From: Simon Horman <horms@verge.net.au>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [GIT PULL FOR renesas-drivers] mmc: renesas_sdhi: add support
 for R-Car Gen3 SDHI DMAC
Message-ID: <20170614090203.GF26958@verge.net.au>
References: <20170612094718.GD15434@verge.net.au>
 <CAMuHMdVn2oPBbF0xpWjKdRmLwGdA9OJcrt+o4BLOTLypS8=6dw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdVn2oPBbF0xpWjKdRmLwGdA9OJcrt+o4BLOTLypS8=6dw@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Mon, Jun 12, 2017 at 12:06:00PM +0200, Geert Uytterhoeven wrote:
> Hi Simon,
> 
> On Mon, Jun 12, 2017 at 11:47 AM, Simon Horman
> <horms+renesas@verge.net.au> wrote:
> > please consider pulling changes to add support for R-Car Gen3 SDHI DMAC.
> >
> > This gives a significant performance boost;
> > the headline figure is 9.5MB/s -> 39.7MB/s.
> >
> > This pull request is based on mmc/next.
> 
> Unfortunately Ulf rebases mmc/next regularly, causing lots of conflicts.
> 
> > The following changes since commit 6e75316c15df8333506377743c75fcd626193849:
> >
> >   mmc: tmio: make sure SDIO gets reinitialized after resume (2017-05-30 11:51:55 +0200)
> >
> > are available in the git repository at:
> >
> >   git://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas.git topic/sdhi-gen3-dma-2017
> >
> > for you to fetch changes up to fd9437fc8884f039ba4a510ac99d350fd693b0dc:
> >
> >   mmc: renesas-sdhi: remove gen3 support from sysc dmac driver (2017-06-08 15:03:03 +0200)
> 
> So feel free to rebase the top 5 commits on top of today's mmc/next (and
> risk new conflicts if/when Ulf rebases his tree again tonight), or let me
> handle that tomorrow myself ;-)

Ooops, I read this a little late.
Let me know if you'd still like me to rebase.
