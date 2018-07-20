Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-ua0-f194.google.com ([209.85.217.194]:42441 "EHLO
        mail-ua0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387869AbeGTRHV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 20 Jul 2018 13:07:21 -0400
MIME-Version: 1.0
References: <1531275016-9809-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <20180711051800.GK3219@vkoul-mobl> <CAMuHMdWxrTtp9yP6hzdFUEZvkRLqGjYC9J8c8JPc8UunwthgGA@mail.gmail.com>
 <20180720160818.GT3219@vkoul-mobl>
In-Reply-To: <20180720160818.GT3219@vkoul-mobl>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 20 Jul 2018 18:18:09 +0200
Message-ID: <CAMuHMdWnKGMDUtLgq--k6vLWY=sG7C5XtmSVyWRN=13EH1VXLA@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] dmaengine: sh: rcar-dmac: Add dma_pause operation
To: vkoul@kernel.org
Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Vinod Koul <vinod.koul@intel.com>, dmaengine@vger.kernel.org,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Vinod,

On Fri, Jul 20, 2018 at 6:08 PM Vinod <vkoul@kernel.org> wrote:
> On 20-07-18, 15:06, Geert Uytterhoeven wrote:
> > On Wed, Jul 11, 2018 at 7:18 AM Vinod <vkoul@kernel.org> wrote:
> > > On 11-07-18, 11:10, Yoshihiro Shimoda wrote:
> > > > This patch set is based on the lasest slave-dma / next branch.
> > > >
> > > > This issue can be reproduced by the following commands on r8a7795
> > > > Salvator-XS with the fixed patch [1] and Windows Teraterm :) :
> > > >  # stty 921600
> > > >  (Change Teraterm baud rate)
> > > >  # cat > rx.txt
> > > >  (Send 5MiB file by Teraterm.)
> > > >  # cmp <somewhere the 5MiB file> rx.txt
> > > >  output "differ: byte NNNNN, line MMM"
> > >
> > > Applied, thanks
> >
> > I can't seem to find this patch in today's next, nor in your next or
> > topic/renesas branches.
> >
> > Am I looking at the wrong places?
>
> Yes you are looking at the right place.
>
> I seem to have applied but missed to merge to next and push.
>
> Done now

Confirmed, thanks again!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
