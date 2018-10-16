Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-vs1-f67.google.com ([209.85.217.67]:33202 "EHLO
        mail-vs1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727447AbeJPOyS (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 16 Oct 2018 10:54:18 -0400
MIME-Version: 1.0
References: <20181016013832.2385-1-niklas.soderlund@ragnatech.se>
In-Reply-To: <20181016013832.2385-1-niklas.soderlund@ragnatech.se>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 16 Oct 2018 09:05:04 +0200
Message-ID: <CAMuHMdW-4_y1YU3c_V6kgRwuUaeHcYCJMXMWA34fjEmLcuoMCw@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] mmc: tmio: Fix reset operation
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Linux MMC List <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        =?UTF-8?Q?Niklas_S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Niklas,

On Tue, Oct 16, 2018 at 3:39 AM Niklas Söderlund
<niklas.soderlund@ragnatech.se> wrote:
> From: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> While looking at the Renesas BSP kernel I found patches which improves
> the state of the hardware at probe and after runtime resume.
>
> Patch 1/3 make sure the module clock is enabled after resuming before
> register are accessed. Patch 2/3 is the real change in this series and
> brings in reset of the vendor specific callback when resetting (SCC in
> the Renesas case). While 3/3 simply make sure that the IRQ mask for
> Renesas boards (Gen2 and later) are in a good shape after probe (and
> reset).
>
> In addition to addressing the state after resuming it helped unbreak a
> SD card I have which are very problematic on Koelsch. Without this
> series inserting the card results in:
>
> sh_mobile_sdhi ee100000.sd: timeout waiting for hardware interrupt (CMD19)
> sh_mobile_sdhi ee100000.sd: timeout waiting for hardware interrupt (CMD19)
> sh_mobile_sdhi ee100000.sd: timeout waiting for hardware interrupt (CMD19)
> sh_mobile_sdhi ee100000.sd: timeout waiting for hardware interrupt (CMD19)
> sh_mobile_sdhi ee100000.sd: timeout waiting for hardware interrupt (CMD19)
> sh_mobile_sdhi ee100000.sd: timeout waiting for hardware interrupt (CMD19)
> sh_mobile_sdhi ee100000.sd: timeout waiting for hardware interrupt (CMD19)
> sh_mobile_sdhi ee100000.sd: timeout waiting for hardware interrupt (CMD19)
> sh_mobile_sdhi ee100000.sd: timeout waiting for hardware interrupt (CMD19)
> sh_mobile_sdhi ee100000.sd: timeout waiting for hardware interrupt (CMD19)
> sh_mobile_sdhi ee100000.sd: Tuning procedure failed
> mmc0: tuning execution failed: -5
> mmc0: error -5 whilst initialising SD card
> sh_mobile_sdhi ee100000.sd: timeout waiting for hardware interrupt (CMD19)
>
> While with this series applied (patch 2/3):
>
> sh_mobile_sdhi ee100000.sd: timeout waiting for hardware interrupt (CMD19)
> mmc0: new ultra high speed SDR50 SDHC card at address aaaa
> mmcblk0: mmc0:aaaa SU04G 3.69 GiB
>  mmcblk0: p1 p2

Nice!

Can you please check if this fixes the similar issue on Magnus' ALT?
My (old, latest is v4.15) logs show the same timeout, but with errors
84 (EILSEQ)
or 110 (ETIMEDOUT) instead of 5 (EIO).

Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
