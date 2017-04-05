Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f54.google.com ([209.85.215.54]:34948 "EHLO
        mail-lf0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933105AbdDEJOL (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 5 Apr 2017 05:14:11 -0400
Received: by mail-lf0-f54.google.com with SMTP id j90so3897584lfk.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 05 Apr 2017 02:14:10 -0700 (PDT)
Date: Wed, 5 Apr 2017 11:14:07 +0200
From: Niklas =?iso-8859-1?Q?S=F6derlund?=
        <niklas.soderlund@ragnatech.se>
To: Vinod Koul <vinod.koul@intel.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
        dmaengine@vger.kernel.org,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Hiroyuki Yokoyama <hiroyuki.yokoyama.vx@renesas.com>
Subject: Re: [PATCH 3/3] dmaengine: rcar-dmac: wait for ISR to finish before
 freeing resources
Message-ID: <20170405091407.GG18945@bigcity.dyn.berto.se>
References: <20170328224035.8040-1-niklas.soderlund+renesas@ragnatech.se>
 <20170328224035.8040-4-niklas.soderlund+renesas@ragnatech.se>
 <CAMuHMdUOFBURWOCdAbTgWtJdgEabwLeic+KVS7bHhesH_Fe3Zg@mail.gmail.com>
 <20170329133042.GH24709@bigcity.dyn.berto.se>
 <20170330073839.GK24709@bigcity.dyn.berto.se>
 <20170405032531.GC4094@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20170405032531.GC4094@localhost>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Vinod,

On 2017-04-05 08:55:31 +0530, Vinod Koul wrote:
> On Thu, Mar 30, 2017 at 09:38:39AM +0200, Niklas S�derlund wrote:
> > Hi Geert,
> > 
> > On 2017-03-29 15:30:42 +0200, Niklas S�derlund wrote:
> > > Hi Geert,
> > > 
> > > On 2017-03-29 14:31:33 +0200, Geert Uytterhoeven wrote:
> > > > Hi Niklas,
> > > > 
> > > > On Wed, Mar 29, 2017 at 12:40 AM, Niklas S�derlund
> > > > <niklas.soderlund+renesas@ragnatech.se> wrote:
> > > > > This fixes a race condition where the channel resources could be freed
> > > > > before the ISR had finished running resulting in a NULL pointer
> > > > > reference from the ISR.
> > > > >
> > > > > [  167.148934] Unable to handle kernel NULL pointer dereference at virtual address 00000000
> > > > > [  167.157051] pgd = ffff80003c641000
> > > > > [  167.160449] [00000000] *pgd=000000007c507003, *pud=000000007c4ff003, *pmd=0000000000000000
> > > > > [  167.168719] Internal error: Oops: 96000046 [#1] PREEMPT SMP
> > > > > [  167.174289] Modules linked in:
> > > > > [  167.177348] CPU: 3 PID: 10547 Comm: dma_ioctl Not tainted 4.11.0-rc1-00001-g8d92afddc2f6633a #73
> > > > > [  167.186131] Hardware name: Renesas Salvator-X board based on r8a7795 (DT)
> > > > > [  167.192917] task: ffff80003a411a00 task.stack: ffff80003bcd4000
> > > > > [  167.198850] PC is at rcar_dmac_chan_prep_sg+0xe0/0x400
> > > > > [  167.203985] LR is at rcar_dmac_chan_prep_sg+0x48/0x400
> > > > 
> > > > Do you have a test case to trigger this?
> > > 
> > > Yes I have a testcase, it's rather complex and involves both a kernel 
> > > module and a userspaces application to stress the rcar-dmac. I'm 
> > > checking if I can share this publicly or not, please hold :-)
> > 
> > I have now received feedback that I'm unfortunately not allowed to share 
> > the test case :-(
> > 
> > The big picture in how to trigger this problem is that you start a DMA 
> > transfer like this:
> > 
> > struct dma_async_tx_descriptor *tx = ...;
> > 
> > ...
> > 
> > tx->tx_submit(tx);
> > 
> > And then you directly call dma_release_channel() on this channel without 
> > making sure the completion callback ran or anything. Now if you are 
> > unlucky the ISR have not finished running for the DMA when 
> > dma_release_channel() starts to clean up resources. The synchronisation 
> > point in the dma_release_channel() call path fixes this.
> 
> Well the API expectation would be you abort the txn before calling release.
> So the expected order should be:
> 
> dmaengine_terminate_all();
> dma_release_channel();

Agree this is the correct way and in this case patch 3/3 in this series 
could be dropped. Then device_synchronize() would added to rcar-dmac, 
dmaengine_terminate_all() would turn of the IRQ and 
dma_release_channel() would ensure that device_synchronize() is called 
prior to calling rcar-dmac device_free_chan_resources().

> 
> Terminate should then stop the channel, ie abort the pending descriptors..
> 

However for reasons unknown to me the rcar-dmac 
device_free_chan_resources() implementation implements logic to turn of 
IRQs before it frees the resources. And it's because of this patch 3/3 
is needed so that it can be sure no ISR is running before it frees 
resources.

I don't know how to best proceed here. I agree it feels a bit odd that 
device_free_chan_resources() is dealing with the IRQs as such things 
should be done before it's called. But on the other hand that code has 
been part of the driver since it was added upstream. I feel a bit 
uncomfortable just removing that part from the 
device_free_chan_resources() since the driver have been in use with it 
for such a long time.

How would you prefer I try and resolve this?

-- 
Regards,
Niklas S�derlund
