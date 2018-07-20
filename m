Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:43230 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732550AbeGTQ5Y (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 20 Jul 2018 12:57:24 -0400
Date: Fri, 20 Jul 2018 21:38:18 +0530
From: Vinod <vkoul@kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Vinod Koul <vinod.koul@intel.com>, dmaengine@vger.kernel.org,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH v2 0/2] dmaengine: sh: rcar-dmac: Add dma_pause operation
Message-ID: <20180720160818.GT3219@vkoul-mobl>
References: <1531275016-9809-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <20180711051800.GK3219@vkoul-mobl>
 <CAMuHMdWxrTtp9yP6hzdFUEZvkRLqGjYC9J8c8JPc8UunwthgGA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdWxrTtp9yP6hzdFUEZvkRLqGjYC9J8c8JPc8UunwthgGA@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hey Geert,

On 20-07-18, 15:06, Geert Uytterhoeven wrote:
> On Wed, Jul 11, 2018 at 7:18 AM Vinod <vkoul@kernel.org> wrote:
> > On 11-07-18, 11:10, Yoshihiro Shimoda wrote:
> > > This patch set is based on the lasest slave-dma / next branch.
> > >
> > > This issue can be reproduced by the following commands on r8a7795
> > > Salvator-XS with the fixed patch [1] and Windows Teraterm :) :
> > >  # stty 921600
> > >  (Change Teraterm baud rate)
> > >  # cat > rx.txt
> > >  (Send 5MiB file by Teraterm.)
> > >  # cmp <somewhere the 5MiB file> rx.txt
> > >  output "differ: byte NNNNN, line MMM"
> >
> > Applied, thanks
> 
> I can't seem to find this patch in today's next, nor in your next or
> topic/renesas branches.
> 
> Am I looking at the wrong places?

Yes you are looking at the right place.

I seem to have applied but missed to merge to next and push.

Done now
-- 
~Vinod
