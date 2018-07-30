Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-ua0-f195.google.com ([209.85.217.195]:44904 "EHLO
        mail-ua0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726622AbeG3KpA (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 30 Jul 2018 06:45:00 -0400
MIME-Version: 1.0
References: <1532507224-4213-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1532507224-4213-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 30 Jul 2018 11:10:46 +0200
Message-ID: <CAMuHMdVKSq6BccEZhWSRkzCeF-41=D+7gxDKFs2nzDD1z7jPOw@mail.gmail.com>
Subject: Re: [PATCH] dmaengine: sh: rcar-dmac: Should not stop the DMAC by rcar_dmac_sync_tcr()
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: Vinod Koul <vinod.koul@intel.com>, dmaengine@vger.kernel.org,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, Jul 25, 2018 at 10:29 AM Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> rcar_dmac_chan_get_residue() should not stop the DMAC, because
> the commit 538603c6026c ("dmaengine: sh: rcar-dmac: avoid to write
> CHCR.TE to 1 if TCR is set to 0") had fixed unexpected re-transferring
> issue. But it had caused the next issue which might stop the cyclic
> mode transferring. Thus, for example R-Car sound might be stopped
> suddenly.
>
> According to the commit 73a47bd0da66 ("dmaengine: rcar-dmac: use TCRB
> instead of TCR for residue"), the purpose of clearing CHCR.DE bit is
> flushing buffered data to calculate the exact residue.
>
> Such the "exact" residue had been required by sh-sci driver. sh-sci
> driver is calling dmaengine_pause() to stop transferring, and get
> "exact" residue. Otherwise, it might receive extra data during
> getting residue without pausing.
>
> In rx_timer_fn() of sh-sci driver:
>         dmaengine_tx_status();          /* For checking roughly */
>         dmaengine_pause();
>         dmaengine_tx_status();          /* For getting residue */
>         dmaengine_terminate_all();
>
> But, unfortunately the rcar-dmac driver didn't support dmaengine_pause()
> at that time. So, the sh-sci driver cannot get the "exact" residue
> without stopping the transferring, because rcar-dmac is buffering data
> inside.
>
> Because of these backgrounds, rcar-dmac had been cleared/set CHCR.DE
> bit in rcar_dmac_chan_get_residue() to synchronizing data and getting
> "exact" residue.
>
> However, rcar-dmac driver has rcar_dmac_chan_pause() now, and clearing
> CHCR.DE bit in rcar_dmac_chan_get_residue() doesn't need anymore.
> So, this patch removes the rcar_dmac_sync_tcr().
>
> Fixes: 73a47bd0da66 ("dmaengine: rcar-dmac: use TCRB instead of TCR for residue")
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> Tested-by: Hiroyuki Yokoyama <hiroyuki.yokoyama.vx@renesas.com>

Makes sense, so
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
