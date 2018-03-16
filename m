Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:60958 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751094AbeCPInU (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 16 Mar 2018 04:43:20 -0400
Date: Fri, 16 Mar 2018 09:43:17 +0100
From: Simon Horman <horms@verge.net.au>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH] arm64: dts: renesas: r8a7795: Add missing SYS-DMAC2 dmas
Message-ID: <20180316084315.dcvd6qw2otooqhh4@verge.net.au>
References: <1520518205-23351-1-git-send-email-geert+renesas@glider.be>
 <20180313184330.67oh6gyjwxv44q2i@verge.net.au>
 <CAMuHMdU3DPfq6TJdzbRskiQKGJZM-8MBPUn9cF+SAtyxGCNvrA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdU3DPfq6TJdzbRskiQKGJZM-8MBPUn9cF+SAtyxGCNvrA@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, Mar 13, 2018 at 08:23:40PM +0100, Geert Uytterhoeven wrote:
> Hi Simon,
> 
> On Tue, Mar 13, 2018 at 7:43 PM, Simon Horman <horms@verge.net.au> wrote:
> > On Thu, Mar 08, 2018 at 03:10:05PM +0100, Geert Uytterhoeven wrote:
> >> On R-Car H3, on-chip peripheral modules that can make use of DMA are
> >> wired to either SYS-DMAC0 only, or to both SYS-DMAC1 and SYS-DMAC2.
> >>
> >> Add the missing DMA properties pointing to SYS-DMAC2 for HSCIF[0-2],
> >> SCIF[015], and I2C[0-2].  These were initially left out because early
> >> firmware versions prohibited using SYS-DMAC2.  This restriction has been
> >> lifted in IPL and Secure Monitor Rev1.0.6 (released on Feb 25, 2016).
> >>
> >> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> >
> > Thanks, applied.
> 
> This one, or v2?

v2
