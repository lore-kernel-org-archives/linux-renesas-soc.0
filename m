Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([89.238.76.85]:45927 "EHLO pokefinder.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753738AbcGUQ5z (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Thu, 21 Jul 2016 12:57:55 -0400
Date: Thu, 21 Jul 2016 18:57:45 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Dirk Behme <dirk.behme@de.bosch.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	linux-clk <linux-clk@vger.kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Simon Horman <horms@verge.net.au>,
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH] clk: renesas: r8a7795: Fix SD clocks
Message-ID: <20160721165744.GB1911@katana>
References: <1468380049-5712-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <CAMuHMdWkD96cVe14ps8B0BbRUzA7pQuMogat25PehnDaoqhS=w@mail.gmail.com>
 <20160720120623.GA1601@katana>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20160720120623.GA1601@katana>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, Jul 20, 2016 at 02:06:24PM +0200, Wolfram Sang wrote:
> 
> > Wolfram, Dirk: any comments?
> 
> Looks proper.
> 
> Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> 
> I couldn't really test it, though, since I still have problems with the
> Gen3 DMA series.

... which are gone now since this series landed in renesas-drivers.
Dunno why but DMA works now, so I can see Shimoda-san's patch makes a
difference if we apply a missing fix which I will send in a second. Long
story short:

Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
