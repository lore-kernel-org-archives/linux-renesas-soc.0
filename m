Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:33105 "EHLO
	kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751211AbcFXDF3 (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Thu, 23 Jun 2016 23:05:29 -0400
Date: Fri, 24 Jun 2016 12:05:23 +0900
From: Simon Horman <horms@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Khiem Nguyen <khiem.nguyen.xt@rvc.renesas.com>,
	Magnus Damm <magnus.damm@gmail.com>
Subject: Re: [PATCH v3 0/3] arm64: Add Renesas R8A7796 SoC support
Message-ID: <20160624030523.GA14973@verge.net.au>
References: <1464054880-25843-1-git-send-email-horms+renesas@verge.net.au>
 <20160606013345.GB6258@verge.net.au>
 <20160606015201.GA2317@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20160606015201.GA2317@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Mon, Jun 06, 2016 at 10:52:01AM +0900, Simon Horman wrote:
> On Mon, Jun 06, 2016 at 10:33:45AM +0900, Simon Horman wrote:
> > On Tue, May 24, 2016 at 10:54:37AM +0900, Simon Horman wrote:
> > > Hi,
> > > 
> > > this short series aims to add basic support for the
> > > Gen 3 R-Car M3-W (r8a7796) SoC.
> > > 
> > > It has few bells and whistles but is sufficient to bring up
> > > an r8a7795/salvator-x. I have provided a boot-log at the bottom
> > > of this email in case it is of interest.
> > > 
> > > 
> > > Dependency:
> > > 
> > > "[PATCH 0/4] clk: renesas: cpg-mssr: Add support for R-Car M3-W"
> > > 
> > > 
> > > Availability:
> > > 
> > > In order to aid review this series, its dependency (above)
> > > and the related patch "serial: sh-sci: Document SoC specific bindings for
> > > r8a7796", which has been posted separately, are available at:
> > > 
> > > git://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas.git topic/r8a7796-v3
> > > 
> > > To be entirely clear, at the time of writing I have _not_ queued up this
> > > series for mainline.
> > 
> > I have queued this up for v4.8.
> > 
> > 
> > I acknowledge that there has been some discussion of sharing DT between
> > the r8a7795 and r8a7796. However it is my considered opinion that the level
> > of duplication in the approach taken by this patchset is in keeping with
> > the practice already used in the tree. And that material benefits in terms
> > of ease of maintenance can only be realised with a solution that goes
> > beyond breaking common nodes into a shared dtsi file.
> > 
> > It is my request that my decision as co-maintainer of the files
> > in question be respected.
> 
> Bother, I spoke to soon.
> 
> There is a compile-time dependency on 8a7796-cpg-mssr.h
> so "[PATCH 0/4] clk: renesas: cpg-mssr: Add support for R-Car M3-W"
> needs to be present. I have deferred these patches pending that.

I have requeued this on top of
"clk: renesas: Add r8a7796 CPG Core Clock Definitions"
