Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-it0-f65.google.com ([209.85.214.65]:38293 "EHLO
        mail-it0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751117AbeDEHCI (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 5 Apr 2018 03:02:08 -0400
Received: by mail-it0-f65.google.com with SMTP id 19-v6so2139189itw.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 05 Apr 2018 00:02:08 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20180404170035.5507-1-wsa@the-dreams.de>
References: <20180404170035.5507-1-wsa@the-dreams.de>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 5 Apr 2018 09:02:07 +0200
Message-ID: <CAPDyKFoFehR8PD_tdFa4gubvbFXUgm-ig25Jn6nC4jz1ffqJTw@mail.gmail.com>
Subject: Re: [RFC PATCH] mmc: renesas_sdhi_internal_dmac: fall back to PIO if
 scatterlist doesn't match
To: Wolfram Sang <wsa@the-dreams.de>
Cc: "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 4 April 2018 at 19:00, Wolfram Sang <wsa@the-dreams.de> wrote:
> From: Wolfram Sang <wsa+renesas@sang-engineering.com>
>
> If we detect an incompatible scatterlist, we should fall back to PIO,
> too.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>
> I found this while working on the RX DMA issue. I don't see a reason why we
> shouldn't fall back in this case as well. But maybe I am missing something.
>
> Shimoda-san: what do you think?
>
>  drivers/mmc/host/renesas_sdhi_internal_dmac.c | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)
>
> diff --git a/drivers/mmc/host/renesas_sdhi_internal_dmac.c b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
> index 380570a26a09..561e90755a3b 100644
> --- a/drivers/mmc/host/renesas_sdhi_internal_dmac.c
> +++ b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
> @@ -161,11 +161,7 @@ renesas_sdhi_internal_dmac_start_dma(struct tmio_mmc_host *host,
>         enum dma_data_direction dir;
>         int ret;
>
> -       /* This DMAC cannot handle if sg_len is not 1 */
> -       WARN_ON(host->sg_len > 1);
> -
> -       /* This DMAC cannot handle if buffer is not 8-bytes alignment */
> -       if (!IS_ALIGNED(sg->offset, 8))
> +       if (WARN_ON(host->sg_len > 1) || !IS_ALIGNED(sg->offset, 8))

The WARN_ON becomes a bit misleading being a part of the if statement,
as it should never happen when the driver has set ->max_segs = 1.

For the alignment check, and the moving to PIO, this certainly makes
sense to me.

>                 goto force_pio;
>
>         if (data->flags & MMC_DATA_READ) {

Kind regards
Uffe
