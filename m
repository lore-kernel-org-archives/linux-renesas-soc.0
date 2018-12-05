Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-ua1-f66.google.com ([209.85.222.66]:46568 "EHLO
        mail-ua1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727135AbeLEOXz (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 5 Dec 2018 09:23:55 -0500
Received: by mail-ua1-f66.google.com with SMTP id v24so7136967uap.13
        for <linux-renesas-soc@vger.kernel.org>; Wed, 05 Dec 2018 06:23:54 -0800 (PST)
MIME-Version: 1.0
References: <20181126170247.4076-1-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20181126170247.4076-1-niklas.soderlund+renesas@ragnatech.se>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 5 Dec 2018 15:23:17 +0100
Message-ID: <CAPDyKFrgk4MmPQ3k=6+La5MO_J-iJTOvbKjyE5HFTsA7Y5zFgg@mail.gmail.com>
Subject: Re: [PATCH v4 0/3] mmc: tmio: fix reset operation
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Mon, 26 Nov 2018 at 18:03, Niklas S=C3=B6derlund
<niklas.soderlund+renesas@ragnatech.se> wrote:
>
> Hi,
>
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
> sh_mobile_sdhi ee100000.sd: timeout waiting for hardware interrupt (CMD19=
)
> sh_mobile_sdhi ee100000.sd: timeout waiting for hardware interrupt (CMD19=
)
> sh_mobile_sdhi ee100000.sd: timeout waiting for hardware interrupt (CMD19=
)
> sh_mobile_sdhi ee100000.sd: timeout waiting for hardware interrupt (CMD19=
)
> sh_mobile_sdhi ee100000.sd: timeout waiting for hardware interrupt (CMD19=
)
> sh_mobile_sdhi ee100000.sd: timeout waiting for hardware interrupt (CMD19=
)
> sh_mobile_sdhi ee100000.sd: timeout waiting for hardware interrupt (CMD19=
)
> sh_mobile_sdhi ee100000.sd: timeout waiting for hardware interrupt (CMD19=
)
> sh_mobile_sdhi ee100000.sd: timeout waiting for hardware interrupt (CMD19=
)
> sh_mobile_sdhi ee100000.sd: timeout waiting for hardware interrupt (CMD19=
)
> sh_mobile_sdhi ee100000.sd: Tuning procedure failed
> mmc0: tuning execution failed: -5
> mmc0: error -5 whilst initialising SD card
> sh_mobile_sdhi ee100000.sd: timeout waiting for hardware interrupt (CMD19=
)
>
> While with this series applied (patch 2/3):
>
> sh_mobile_sdhi ee100000.sd: timeout waiting for hardware interrupt (CMD19=
)
> mmc0: new ultra high speed SDR50 SDHC card at address aaaa
> mmcblk0: mmc0:aaaa SU04G 3.69 GiB
>  mmcblk0: p1 p2
>
> Patch 1/3 was previously part of 2/3 but as it deals with a unrelated
> issue it's here broken out to a separate patch. Patch 3/3 have once been
> posted outside this series bit after comments from Wolfram it's brought
> back as it now deepens on 2/3.
>
> Most changes in this series are based on similar work from Masaharu
> Hayakawa but for this version all changes now differ quiet a lot from
> his work.  All mails sent to him bounce with a "Undelivered Mail
> Returned to Sender" error. I therefor felt the need to claim authorship
> as I don't want to post blame of my (potential) mistakes on some else.
>
> Niklas S=C3=B6derlund (3):
>   mmc: tmio: enable module clock before resetting when resuming
>   mmc: tmio: fix reset operation
>   mmc: renesas_sdhi: add initial setting of interrupt mask register
>
>  drivers/mmc/host/renesas_sdhi_core.c |  4 ++++
>  drivers/mmc/host/tmio_mmc.h          |  1 +
>  drivers/mmc/host/tmio_mmc_core.c     | 27 +++++++++++++++------------
>  3 files changed, 20 insertions(+), 12 deletions(-)
>
> --
> 2.19.1
>

Applied for next, thanks!

Kind regards
Uffe
