Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-ua0-f193.google.com ([209.85.217.193]:39153 "EHLO
        mail-ua0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731599AbeGTNyt (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 20 Jul 2018 09:54:49 -0400
MIME-Version: 1.0
References: <1531275016-9809-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <20180711051800.GK3219@vkoul-mobl>
In-Reply-To: <20180711051800.GK3219@vkoul-mobl>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 20 Jul 2018 15:06:25 +0200
Message-ID: <CAMuHMdWxrTtp9yP6hzdFUEZvkRLqGjYC9J8c8JPc8UunwthgGA@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] dmaengine: sh: rcar-dmac: Add dma_pause operation
To: vkoul@kernel.org
Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Vinod Koul <vinod.koul@intel.com>, dmaengine@vger.kernel.org,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Vinod,

On Wed, Jul 11, 2018 at 7:18 AM Vinod <vkoul@kernel.org> wrote:
> On 11-07-18, 11:10, Yoshihiro Shimoda wrote:
> > This patch set is based on the lasest slave-dma / next branch.
> >
> > This issue can be reproduced by the following commands on r8a7795
> > Salvator-XS with the fixed patch [1] and Windows Teraterm :) :
> >  # stty 921600
> >  (Change Teraterm baud rate)
> >  # cat > rx.txt
> >  (Send 5MiB file by Teraterm.)
> >  # cmp <somewhere the 5MiB file> rx.txt
> >  output "differ: byte NNNNN, line MMM"
>
> Applied, thanks

I can't seem to find this patch in today's next, nor in your next or
topic/renesas branches.

Am I looking at the wrong places?
Thanks, and have a nice weekend!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
