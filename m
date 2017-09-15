Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:52613 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750838AbdIOHQK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 15 Sep 2017 03:16:10 -0400
Date: Fri, 15 Sep 2017 09:15:50 +0200
From: Simon Horman <horms@verge.net.au>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH LOCAL/RFC] arm64: defconfig: Add renesas_defconfig
Message-ID: <20170915071549.GC32275@verge.net.au>
References: <1504631724-27363-1-git-send-email-geert+renesas@glider.be>
 <20170906084422.GD10048@verge.net.au>
 <CAMuHMdXYJaxU=Gt6dwqcYrA_rZgJHqsiZ9uMoH9H0vt3F67eDA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdXYJaxU=Gt6dwqcYrA_rZgJHqsiZ9uMoH9H0vt3F67eDA@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, Sep 13, 2017 at 05:28:28PM +0200, Geert Uytterhoeven wrote:
> Hi Simon,
> 
> On Wed, Sep 6, 2017 at 10:44 AM, Simon Horman <horms@verge.net.au> wrote:
> > On Tue, Sep 05, 2017 at 07:15:24PM +0200, Geert Uytterhoeven wrote:
> >> Add a defconfig for Renesas R-Car Gen3 boards.
> >>
> >> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> >> ---
> >> Not intended for upstream merge.
> >>
> >> Loosely based on arm64 defconfig, with support for non-Renesas SoCs and
> >> boards removed, and missing support added.
> >
> > Thanks,
> >
> > this seems reasonable to me and I'm happy to maintain this driver,
> > out of mainline, in a branch in the renesas tree - f.e. topic/defconfig.
> >
> > I am curious to know which tree you ran savedefconfig against.
> > I tried renesas-devel-20170905-v4.13 and renesas-drivers-2017-09-05-v4.13
> > but both seemed to generate a diff against the file created in your patch.
> 
> I used my current development tree, which is based on
> renesas-drivers-2017-09-05-v4.13.
> But I see no diff when running savedefconfig against the latter?

Perhaps there was an error on my side. In any case its not a big deal.

> > I tested this defconfig against renesas-devel-20170905-v4.13 on
> > a salvator-x/m3 ES1.0. It boots to user-space but I observed the following:
> >
> > [   13.000428] sh-sci e6e88000.serial: dma_request_slave_channel failed
> > [   13.015167] sh-sci e6e88000.serial: dma_request_slave_channel failed
> 
> The scif2 node in r8a7796.dtsi doesn't have "dmas" properties.
> These were removed from the datasheet, and scif2 has always been a bit
> weird on R-Car Gen3...

Ok, so its unrelated?
