Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-vk0-f66.google.com ([209.85.213.66]:33164 "EHLO
        mail-vk0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726389AbeGMJga (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 13 Jul 2018 05:36:30 -0400
MIME-Version: 1.0
References: <1530523083-2106-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1530523083-2106-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 13 Jul 2018 11:22:30 +0200
Message-ID: <CAMuHMdWiGeaNeROwfHDsch7xp=nX6t-Z1PB_OZ2fZh3oLVhKiQ@mail.gmail.com>
Subject: Re: [PATCH] dma: sh: rcar-dmac: avoid to write CHCR.TE to 1 if TCR is
 set to 0
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: Vinod Koul <vinod.koul@intel.com>, dmaengine@vger.kernel.org,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Mon, Jul 2, 2018 at 11:41 AM Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> This patch fixes an issue that unexpected retransfering happens
> if TCR is set to 0 before rcar_dmac_sync_tcr() writes DE bit to
> the CHCR register. For example, sh-sci driver can reproduce this
> issue like below:
>
>  In rx_timer_fn():              /* CHCR DE bit may be set to 1 */
>   dmaengine_tx_status()
>    rcar_dmac_tx_status()
>     rcar_dmac_chan_get_residue()
>      rcar_dmac_sync_tcr()       /* TCR is possible to be set to 0 */
>
> According to the description of commit 73a47bd0da66 ("dmaengine:
> rcar-dmac: use TCRB instead of TCR for residue"), "this buffered data
> will be transferred if CHCR::DE bit was cleared". So, this patch
> doesn't need to check TCRB register.
>
> Fixes: 73a47bd0da66 ("dmaengine: rcar-dmac: use TCRB instead of TCR for residue")
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Looks reasonable
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
