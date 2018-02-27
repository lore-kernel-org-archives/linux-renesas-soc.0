Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:54606 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752238AbeB0I0p (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 27 Feb 2018 03:26:45 -0500
Date: Tue, 27 Feb 2018 09:26:27 +0100
From: Simon Horman <horms@verge.net.au>
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH v3 0/2] mmc: renesas_sdhi: add eMMC HS400 mode support
Message-ID: <20180227082626.pcvg24xnt2mnecsd@verge.net.au>
References: <20180213123358.13212-1-horms+renesas@verge.net.au>
 <CAPDyKFryhg=5G9G3ss3hFSAuri1-_y0uu7ZK=PNGJ0TF=-__DA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPDyKFryhg=5G9G3ss3hFSAuri1-_y0uu7ZK=PNGJ0TF=-__DA@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, Feb 27, 2018 at 08:53:17AM +0100, Ulf Hansson wrote:
> On 13 February 2018 at 13:33, Simon Horman <horms+renesas@verge.net.au> wrote:
> > Hi,
> >
> > this patch-set provides SDHI driver support for eMMC HS400.
> >
> > Based on mmc/next
> >
> > Dependencies for applying these patches: none
> >
> > Dependencies to test eMMC HS400:
> > * [PATCH] clk: renesas: rcar-gen3: Fix SD divider setting
> > * [PATCH v2] arm64: dts: salvator-common: Enable HS400 of SDHI2
> >
> > To assist testing and review this patch and the above mentioned
> > dependencies, which are necessary and sufficient to enable HS400 on H3 /
> > Salvator-X, M3-W 1.0 / Salvator-X and H3 ES2.0 Salvator-XS are available
> > at:
> >
> > https://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas.git topic/hs400-v3
> >
> > Changes since v2:
> > * Consolidate disable_scc and reset_hs400_mode into reset_hs400_tuning
> >   callback
> > * Reuse renesas_sdhi_reset_hs400_mode() in renesas_sdhi_hw_reset()
> > * Factor out renesas_sdhi_reset_scc()
> >
> > Changes since v1:
> > * Use updated code from BSP v3.6.0
> > * Ironed out dependencies, eMMC HS400 is now working on
> >   H3 / Salvator-X, M3-W 1.0 / Salvator-X and H3 ES2.0 Salvator-XS.
> >
> > Masaharu Hayakawa (2):
> >   mmc: tmio: add eMMC HS400 mode support
> >   mmc: renesas_sdhi: add eMMC HS400 mode support
> >
> >  drivers/mmc/host/renesas_sdhi_core.c | 133 +++++++++++++++++++++++++++++------
> >  drivers/mmc/host/tmio_mmc.h          |   5 ++
> >  drivers/mmc/host/tmio_mmc_core.c     |  24 ++++++-
> >  3 files changed, 138 insertions(+), 24 deletions(-)
> >
> > --
> > 2.11.0
> >
> 
> Simon, Wolfram,
> 
> Is this ready to be queued up for next? It looks good to me.

Hi Ulf, I expect Wolfram would like some more time for review and testing.
