Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wr0-f195.google.com ([209.85.128.195]:52027 "EHLO
        mail-wr0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932628AbdJQICw (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 17 Oct 2017 04:02:52 -0400
MIME-Version: 1.0
In-Reply-To: <1508225421-25405-2-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1508225421-25405-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1508225421-25405-2-git-send-email-yoshihiro.shimoda.uh@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 17 Oct 2017 10:02:50 +0200
Message-ID: <CAMuHMdXyY-gvQGn2UxhUDsdhdWUMmTA80z73PF14otvcKuTMaw@mail.gmail.com>
Subject: Re: [PATCH 1/2] mmc: renesas_sdhi: fix swiotlb buffer is full
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Linux MMC List <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        iommu@lists.linux-foundation.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Shimoda-san,

CC iommu

On Tue, Oct 17, 2017 at 9:30 AM, Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> Since the commit de3ee99b097d ("mmc: Delete bounce buffer handling")
> deletes the bounce buffer handling, a request data size will be referred
> to max_{req,seg}_size instead of MMC_QUEUE_BOUNCESZ (64k bytes).
>
> In other hand, renesas_sdhi_internal_dmac.c will set very big value of
> max_{req,seg}_size because the max_blk_count is set to 0xffffffff.
> And then, "swiotlb buffer is full" happens because swiotlb can handle
> a memory size up to 256k bytes only (IO_TLB_SEGSIZE = 128 and
> IO_TLB_SHIFT = 11).
>
> So, this patch fixes the issue to set max_blk_count to 512. Then,
> the max_{req,seg}_size will be set to 256k bytes.
>
> Reported-by: Dirk Behme <dirk.behme@de.bosch.com>
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Thanks for your patch!

> ---
>  drivers/mmc/host/renesas_sdhi_internal_dmac.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/mmc/host/renesas_sdhi_internal_dmac.c b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
> index f905f23..6c9b4b2 100644
> --- a/drivers/mmc/host/renesas_sdhi_internal_dmac.c
> +++ b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
> @@ -80,8 +80,9 @@
>         .scc_offset     = 0x1000,
>         .taps           = rcar_gen3_scc_taps,
>         .taps_num       = ARRAY_SIZE(rcar_gen3_scc_taps),
> -       /* Gen3 SDHI DMAC can handle 0xffffffff blk count, but seg = 1 */
> -       .max_blk_count  = 0xffffffff,
> +       /* The swiotlb can handle memory size up to 256 kbytes for now. */
> +       .max_blk_count  = 512,

Fixing this in the individual drivers feels like the wrong solution to me.

iommu: Is there a better (generic) way to handle this?

> +       /* Gen3 SDHI DMAC cannot handle scatter-gather. So, max_segs = 1 */
>         .max_segs       = 1,
>  };

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
