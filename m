Return-Path: <devicetree-owner@vger.kernel.org>
Date: Fri, 5 Feb 2016 10:57:59 +0100
From: Simon Horman <horms@verge.net.au>
To: Dirk Behme <dirk.behme@gmail.com>
Cc: linux-sh@vger.kernel.org, geert+renesas@glider.be,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2] arm64: dts: r8a7795: Add L2 cache-controller nodes
Message-ID: <20160205095758.GE16556@verge.net.au>
References: <1452953856-5146-1-git-send-email-dirk.behme@gmail.com>
 <56B2370D.2010102@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <56B2370D.2010102@gmail.com>
Sender: devicetree-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

[CC new linux-renesas-soc ML]

Hi Dirk,

On Wed, Feb 03, 2016 at 06:21:17PM +0100, Dirk Behme wrote:
> On 16.01.2016 15:17, Dirk Behme wrote:
> >From: Geert Uytterhoeven <geert+renesas@glider.be>
> >
> >Add device nodes for the L2 caches, and link the CPU node to its L2
> >cache node.
> >
> >The L2 cache for the Cortex-A57 CPU cores is 2 MiB large (organized as
> >128 KiB x 16 ways).
> >
> >Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> >Signed-off-by: Dirk Behme <dirk.behme@gmail.com>

[snip]

> Any further comments to this? If not, could this be applied?

Sorry for the delay.

This looks good; I have queued it up.

It should appear in the next (and devel) branches of my renesas tree soon.
And in linux-next whenever it includes my updated next branch.
