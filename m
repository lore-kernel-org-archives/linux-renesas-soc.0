Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-io0-f196.google.com ([209.85.223.196]:40251 "EHLO
        mail-io0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750943AbeDEGrB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 5 Apr 2018 02:47:01 -0400
Received: by mail-io0-f196.google.com with SMTP id e79so29297215ioi.7
        for <linux-renesas-soc@vger.kernel.org>; Wed, 04 Apr 2018 23:47:00 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20180404164507.3394-1-wsa@the-dreams.de>
References: <20180404164507.3394-1-wsa@the-dreams.de>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 5 Apr 2018 08:47:00 +0200
Message-ID: <CAPDyKFpAfBELH1fxhPjYrOm0bUxAri1C6gQj9kxHiyS7aV9Uug@mail.gmail.com>
Subject: Re: [RFC PATCH] mmc: renesas_sdhi_internal_dmac: limit DMA RX for old SoCs
To: Wolfram Sang <wsa@the-dreams.de>
Cc: "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 4 April 2018 at 18:45, Wolfram Sang <wsa@the-dreams.de> wrote:
> From: Wolfram Sang <wsa+renesas@sang-engineering.com>
>
> Early revisions of certain SoCs cannot do multiple DMA RX streams in
> parallel. To avoid data corruption, only allow one DMA RX channel and
> fall back to PIO, if needed.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>
> Okay, here is what I came up with to solve this problem. Compared to
> Shimoda-san's sketch, I replaced the semaphore with atomic bit operations. I
> think this should do because we really need only a flag telling us if RX is in
> use already. And bitops should be more lightweight and less complex.
>
> I used this test on the target with SD cards in both slots:
>
> ===
> #! /bin/sh -e
>
> IF="/dev/mmcblk$1p1"
> PTH="/mnt/mmcblk$1"
> CHK='/tmp/check'
>
> while :; do
>         mkdir -p $PTH
>         mount $IF $PTH &> /dev/null
>         cd $PTH
>         time md5sum -c $CHK >> /tmp/mmc$1
>         cd
>         umount $PTH
> done
> ===
>
> CHK was manually created beforehand. Before this patch, I got checksum failures
> within seconds. Now, it runs for hours without checksum problems. Of course,
> there is a performance regression because of falling back to PIO now, but we
> can't help that.
>
> I also ran the test on a H3 ES2.0 which doesn't suffer from the problem. No
> regressions, it works out of the box there.
>
> Shimoda-san: what do you think of this approach? Please note that I didn't
> remove the 'revision' from the whitelist yet. This will be done incrementally.
> I thought to first fix the data corruption issue.

I assume this is material for stable as well, right?

>
> Kind regards,
>
>    Wolfram
>
>  drivers/mmc/host/renesas_sdhi_internal_dmac.c | 35 ++++++++++++++++++++++++---
>  1 file changed, 32 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/mmc/host/renesas_sdhi_internal_dmac.c b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
> index 8e0acd197c43..380570a26a09 100644
> --- a/drivers/mmc/host/renesas_sdhi_internal_dmac.c
> +++ b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
> @@ -9,6 +9,7 @@
>   * published by the Free Software Foundation.
>   */
>
> +#include <linux/bitops.h>
>  #include <linux/device.h>
>  #include <linux/dma-mapping.h>
>  #include <linux/io-64-nonatomic-hi-lo.h>
> @@ -62,6 +63,17 @@
>   *   need a custom accessor.
>   */
>
> +static unsigned long global_flags = 0;

There's no need to initialize static variables to zero.

[...]

Kind regards
Uffe
