Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:34098 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S964862AbeF0OtI (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 27 Jun 2018 10:49:08 -0400
Date: Wed, 27 Jun 2018 16:49:04 +0200
From: Simon Horman <horms@verge.net.au>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH] [LOCAL/RFC] MAINTAINERS: renesas_defconfig does not
 exist upstream
Message-ID: <20180627144859.k3arjyrpxgctk7my@verge.net.au>
References: <20180619181835.23926-1-geert+renesas@glider.be>
 <20180620090320.kxgq2cavrzg727p6@verge.net.au>
 <20180625093433.l6tt332iv5uavexu@verge.net.au>
 <CAMuHMdVu9jozG-XAUyntzQeTDt16LA7CAnzQSd8ZweYC5cVzmg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdVu9jozG-XAUyntzQeTDt16LA7CAnzQSd8ZweYC5cVzmg@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Mon, Jun 25, 2018 at 11:41:55AM +0200, Geert Uytterhoeven wrote:
> Hi Simon,
> 
> On Mon, Jun 25, 2018 at 11:34 AM Simon Horman <horms@verge.net.au> wrote:
> > On Wed, Jun 20, 2018 at 11:03:21AM +0200, Simon Horman wrote:
> > > On Tue, Jun 19, 2018 at 08:18:35PM +0200, Geert Uytterhoeven wrote:
> > > > Make sure patches for arch/arm64/configs/renesas_defconfig are sent to
> > > > the right people, and don't bother anyone outside linux-renesas-soc.
> > > >
> > > > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > > > ---
> > > > Not intended for upstream merge.
> > > >
> > > > Is this a good idea, or will it cause too many merge conflicts in
> > > > MAINTAINERS?
> > >
> > > It seems like a good idea to me.
> > > We can drop it if it becomes a headache.
> >
> > Geert, shall I apply this to topic/renesas-defconfig?
> 
> Yes please. Thanks!

Thanks,

I have applied this to the topic/renesas-defconfig branch which is included
in the devel branch and tags of the Renesas tree as a convenience to
developers.  The branch is not, however, included in the next branch or
tags nor is it targeted at upstream.
