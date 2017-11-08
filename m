Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mga07.intel.com ([134.134.136.100]:45739 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750727AbdKHIeC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 8 Nov 2017 03:34:02 -0500
Date: Wed, 8 Nov 2017 14:07:10 +0530
From: Vinod Koul <vinod.koul@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Dan Williams <dan.j.williams@intel.com>,
        Niklas =?iso-8859-1?Q?S=F6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>, dmaengine@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Hiroyuki Yokoyama <hiroyuki.yokoyama.vx@renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH v3] dmaengine: rcar-dmac: use TCRB instead of TCR for
 residue
Message-ID: <20171108083710.GP3187@localhost>
References: <87bml4c5e0.wl%kuninori.morimoto.gx@renesas.com>
 <20171020061516.GM30097@localhost>
 <CAMuHMdUqZb-ba9_c+TyE6dFMiWcBPj+39QFOfOtsK8vTw-FSxg@mail.gmail.com>
 <CAMuHMdXc9tpNW-PDScm5OWwciP_tFh19y=b0O+4UKhUUSvwJPA@mail.gmail.com>
 <20171031114113.GR3187@localhost>
 <20171108053555.GM3187@localhost>
 <87a7zxe18o.wl%kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87a7zxe18o.wl%kuninori.morimoto.gx@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, Nov 08, 2017 at 06:33:33AM +0000, Kuninori Morimoto wrote:
> 
> Hi Vinod
> 
> > > > > This is now commit 847449f23dcbff68 ("dmaengine: rcar-dmac: use TCRB
> > > > > instead of TCR for residue") in slave-dma/next, and breaks serial console
> > > > > input on koelsch (shmobile_defconfig) and salvator-x (renesas_defconfig).
> > > > > Reverting that commit fixes the issue for me.
> > > 
> > > Okay since we are close to merge window I can drop this patch for now,
> > > unless we identify the fix very quickly
> > 
> > I have not seen a resolution to this, so reverted it.
> 
> We are sorry, but we still don't have solution about this.

thats okay, reverted seemed best in this situation. Once we have a solution
we can apply and mark to stable.

-- 
~Vinod
