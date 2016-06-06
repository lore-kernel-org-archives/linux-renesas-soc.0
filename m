Return-Path: <devicetree-owner@vger.kernel.org>
Date: Mon, 6 Jun 2016 10:53:02 +0900
From: Simon Horman <horms@verge.net.au>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Magnus Damm <damm+renesas@opensource.se>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH 0/2] arm64: dts: r8a7796: Add SYSC PM Domains
Message-ID: <20160606015301.GB2317@verge.net.au>
References: <1464685726-21611-1-git-send-email-geert+renesas@glider.be>
 <20160606013359.GE4859@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20160606013359.GE4859@verge.net.au>
Sender: devicetree-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Mon, Jun 06, 2016 at 10:33:59AM +0900, Simon Horman wrote:
> On Tue, May 31, 2016 at 11:08:43AM +0200, Geert Uytterhoeven wrote:
> > 	Hi Simon, Magnus,
> > 
> > This patch series adds support for the power areas exposed by the System
> > Controller on the Renesas R-Car M3-W SoC to the DTS.
> > 
> > This series is against Simon's "[PATCH v3 0/3] arm64: Add Renesas
> > R8A7796 SoC support".  It has a build and runtime dependency on my series
> > "[PATCH v2 0/3] soc: renesas: rcar-sysc: Add support for R-Car M3-W power
> > areas".
> > 
> > For your convenience, I've pushed this series to the
> > topic/r8a7796-sysc-dt-v1 branch of
> > https://git.kernel.org/cgit/linux/kernel/git/geert/renesas-drivers.git.
> > This has been tested on r8a7796/salvator-x.
> 
> Thanks, I have tentatively queued this up.

Bother, I spoke to soon.

There is a compile-time dependency on 8a7796-cpg-mssr.h in the basic
support for r8a7796 which this series depends on.  So "[PATCH 0/4] clk:
renesas: cpg-mssr: Add support for R-Car M3-W" needs to be present. I have
deferred these patches pending that. 
