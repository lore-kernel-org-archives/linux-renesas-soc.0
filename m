Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f45.google.com ([209.85.215.45]:34071 "EHLO
        mail-lf0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753298AbdC2Naq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 29 Mar 2017 09:30:46 -0400
Received: by mail-lf0-f45.google.com with SMTP id z15so8385543lfd.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 29 Mar 2017 06:30:44 -0700 (PDT)
From: "Niklas =?iso-8859-1?Q?S=F6derlund?=" <niklas.soderlund@ragnatech.se>
Date: Wed, 29 Mar 2017 15:30:42 +0200
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Vinod Koul <vinod.koul@intel.com>, dmaengine@vger.kernel.org,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Hiroyuki Yokoyama <hiroyuki.yokoyama.vx@renesas.com>
Subject: Re: [PATCH 3/3] dmaengine: rcar-dmac: wait for ISR to finish before
 freeing resources
Message-ID: <20170329133042.GH24709@bigcity.dyn.berto.se>
References: <20170328224035.8040-1-niklas.soderlund+renesas@ragnatech.se>
 <20170328224035.8040-4-niklas.soderlund+renesas@ragnatech.se>
 <CAMuHMdUOFBURWOCdAbTgWtJdgEabwLeic+KVS7bHhesH_Fe3Zg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMuHMdUOFBURWOCdAbTgWtJdgEabwLeic+KVS7bHhesH_Fe3Zg@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Geert,

On 2017-03-29 14:31:33 +0200, Geert Uytterhoeven wrote:
> Hi Niklas,
> 
> On Wed, Mar 29, 2017 at 12:40 AM, Niklas S�derlund
> <niklas.soderlund+renesas@ragnatech.se> wrote:
> > This fixes a race condition where the channel resources could be freed
> > before the ISR had finished running resulting in a NULL pointer
> > reference from the ISR.
> >
> > [  167.148934] Unable to handle kernel NULL pointer dereference at virtual address 00000000
> > [  167.157051] pgd = ffff80003c641000
> > [  167.160449] [00000000] *pgd=000000007c507003, *pud=000000007c4ff003, *pmd=0000000000000000
> > [  167.168719] Internal error: Oops: 96000046 [#1] PREEMPT SMP
> > [  167.174289] Modules linked in:
> > [  167.177348] CPU: 3 PID: 10547 Comm: dma_ioctl Not tainted 4.11.0-rc1-00001-g8d92afddc2f6633a #73
> > [  167.186131] Hardware name: Renesas Salvator-X board based on r8a7795 (DT)
> > [  167.192917] task: ffff80003a411a00 task.stack: ffff80003bcd4000
> > [  167.198850] PC is at rcar_dmac_chan_prep_sg+0xe0/0x400
> > [  167.203985] LR is at rcar_dmac_chan_prep_sg+0x48/0x400
> 
> Do you have a test case to trigger this?

Yes I have a testcase, it's rather complex and involves both a kernel 
module and a userspaces application to stress the rcar-dmac. I'm 
checking if I can share this publicly or not, please hold :-)

> 
> Thanks!
> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> 
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds

-- 
Regards,
Niklas S�derlund
