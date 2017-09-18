Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:51702 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752539AbdIRJJd (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 18 Sep 2017 05:09:33 -0400
Date: Mon, 18 Sep 2017 11:09:12 +0200
From: Simon Horman <horms@verge.net.au>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 0/4] arm64: dts: renesas: Add Support for R-Car D3 and
 Draak
Message-ID: <20170918090909.GF4644@verge.net.au>
References: <1500555277-22921-1-git-send-email-geert+renesas@glider.be>
 <20170727151622.GG16143@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170727151622.GG16143@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, Jul 27, 2017 at 05:16:23PM +0200, Simon Horman wrote:
> On Thu, Jul 20, 2017 at 02:54:33PM +0200, Geert Uytterhoeven wrote:
> > 	Hi Simon, Magnus,
> > 
> > This patch series adds minimal support for the R-Car D3 SoC and the
> > Draak development board, allowing to boot from a ramdisk using a serial
> > console.
> > 
> >   - The first two patches add DT sources for R-Car D3 and Draak.
> >     Due to the use of hardcoded constants, they have no further (build)
> >     dependencies (obviously there is a runtime dependency).
> >   - The last two patches replace the hardcoded constants by symbols from
> >     DT binding headers, and thus depend on those headers.  Hence it
> >     should be postponed to v4.15.
> > 
> > For proper operation, this depends on the 3 series I have just sent:
> >   - [PATCH 0/3] arm64: renesas: Base R-Car D3 support,
> 
> I have applied the above patchset for v4.14.
> 
> >   - [PATCH 0/4] soc: renesas: Add R-Car D3 support,
> 
> And this one too.
> 
> >   - [PATCH 0/4] clk: renesas: Add R-Car D3 support.
> 
> And this one seems to have been acked, so I assume you will
> apply it once you are back from holidays.
> 
> So I have applied the first two patches for v4.14.
> Please repost the remaining two after v4.13-rc6 at which time I should
> be able to queue them up for v4.15.

I have now done so.
