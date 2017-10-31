Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mga01.intel.com ([192.55.52.88]:4843 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752769AbdJaLiP (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 31 Oct 2017 07:38:15 -0400
Date: Tue, 31 Oct 2017 17:11:13 +0530
From: Vinod Koul <vinod.koul@intel.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Dan Williams <dan.j.williams@intel.com>,
        Niklas =?iso-8859-1?Q?S=F6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>, dmaengine@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Hiroyuki Yokoyama <hiroyuki.yokoyama.vx@renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH v3] dmaengine: rcar-dmac: use TCRB instead of TCR for
 residue
Message-ID: <20171031114113.GR3187@localhost>
References: <87bml4c5e0.wl%kuninori.morimoto.gx@renesas.com>
 <20171020061516.GM30097@localhost>
 <CAMuHMdUqZb-ba9_c+TyE6dFMiWcBPj+39QFOfOtsK8vTw-FSxg@mail.gmail.com>
 <CAMuHMdXc9tpNW-PDScm5OWwciP_tFh19y=b0O+4UKhUUSvwJPA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdXc9tpNW-PDScm5OWwciP_tFh19y=b0O+4UKhUUSvwJPA@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, Oct 31, 2017 at 11:46:36AM +0100, Geert Uytterhoeven wrote:
> CC linux-renesas-soc
> 
> On Tue, Oct 31, 2017 at 11:45 AM, Geert Uytterhoeven
> <geert@linux-m68k.org> wrote:
> > Hi Vinod, Morimoto-san, Yokoyama-san,
> >
> > On Fri, Oct 20, 2017 at 8:15 AM, Vinod Koul <vinod.koul@intel.com> wrote:
> >> On Thu, Oct 19, 2017 at 01:15:13AM +0000, Kuninori Morimoto wrote:
> >>> From: Hiroyuki Yokoyama <hiroyuki.yokoyama.vx@renesas.com>
> >>>
> >>> SYS/RT/Audio DMAC includes independent data buffers for reading
> >>> and writing. Therefore, the read transfer counter and write transfer
> >>> counter have different values.
> >>> TCR indicates read counter, and TCRB indicates write counter.
> >>> The relationship is like below.
> >>>
> >>>         TCR       TCRB
> >>> [SOURCE] -> [DMAC] -> [SINK]
> >>>
> >>> In the MEM_TO_DEV direction, what really matters is how much data has
> >>> been written to the device. If the DMA is interrupted between read and
> >>> write, then, the data doesn't end up in the destination, so shouldn't
> >>> be counted. TCRB is thus the register we should use in this cases.
> >>>
> >>> In the DEV_TO_MEM direction, the situation is more complex. Both the
> >>> read and write side are important. What matters from a data consumer
> >>> point of view is how much data has been written to memory.
> >>> On the other hand, if the transfer is interrupted between read and
> >>> write, we'll end up losing data. It can also be important to report.
> >>>
> >>> In the MEM_TO_MEM direction, what matters is of course how much data
> >>> has been written to memory from data consumer point of view.
> >>> Here, because read and write have independent data buffers, it will
> >>> take a while for TCR and TCRB to become equal. Thus we should check
> >>> TCRB in this case, too.
> >>>
> >>> Thus, all cases we should check TCRB instead of TCR.
> >>>
> >>> Without this patch, Sound Capture has noise after PluseAudio support
> >>> (= 07b7acb51d2 ("ASoC: rsnd: update pointer more accurate")), because
> >>> the recorder will use wrong residue counter which indicates transferred
> >>> from sound device, but in reality the data was not yet put to memory
> >>> and recorder will record it.
> >>
> >> Applied, thanks.
> >
> > This is now commit 847449f23dcbff68 ("dmaengine: rcar-dmac: use TCRB
> > instead of TCR for residue") in slave-dma/next, and breaks serial console
> > input on koelsch (shmobile_defconfig) and salvator-x (renesas_defconfig).
> > Reverting that commit fixes the issue for me.

Okay since we are close to merge window I can drop this patch for now,
unless we identify the fix very quickly

-- 
~Vinod
