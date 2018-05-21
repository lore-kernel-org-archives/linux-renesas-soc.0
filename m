Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-it0-f66.google.com ([209.85.214.66]:39039 "EHLO
        mail-it0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752707AbeEULfq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 21 May 2018 07:35:46 -0400
Received: by mail-it0-f66.google.com with SMTP id c3-v6so20699537itj.4
        for <linux-renesas-soc@vger.kernel.org>; Mon, 21 May 2018 04:35:46 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1525869528-3429-1-git-send-email-ykaneko0929@gmail.com>
References: <1525869528-3429-1-git-send-email-ykaneko0929@gmail.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 21 May 2018 13:35:45 +0200
Message-ID: <CAPDyKFrjV+1Y4Xx8T0FgZtd0qY_p=4UNHm0yFnyj6XvYhPb_Zg@mail.gmail.com>
Subject: Re: [PATCH v2] mmc: renesas_sdhi: Add r8a77965 support
To: Yoshihiro Kaneko <ykaneko0929@gmail.com>
Cc: "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 9 May 2018 at 14:38, Yoshihiro Kaneko <ykaneko0929@gmail.com> wrote:
> From: Masaharu Hayakawa <masaharu.hayakawa.ry@renesas.com>
>
> This patch adds r8a77965 support in SDHI.
>
> Signed-off-by: Masaharu Hayakawa <masaharu.hayakawa.ry@renesas.com>
> Signed-off-by: Yoshihiro Kaneko <ykaneko0929@gmail.com>
> Tested-by: Simon Horman <horms+renesas@verge.net.au>
> Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Thanks, applied for next!

Kind regards
Uffe

> ---
>
> This patch is based on the next branch of Ulf Hansson's mmc tree.
>
> v2 [Yoshihiro Kaneko]
> renesas_sdhi_internal_dmac.c
> * As suggested by Simon Horman
>   Dropped .revision for r8a77965 in gen3_soc_whitelist.
> * As suggested by Wolfram Sang
>   Dropped "renesas,rcar-gen3-sdhi" line in renesas_sdhi_internal_dmac_of_match.
>
>  Documentation/devicetree/bindings/mmc/tmio_mmc.txt | 1 +
>  drivers/mmc/host/renesas_sdhi_internal_dmac.c      | 1 +
>  2 files changed, 2 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/mmc/tmio_mmc.txt b/Documentation/devicetree/bindings/mmc/tmio_mmc.txt
> index ba38252..ee978c9 100644
> --- a/Documentation/devicetree/bindings/mmc/tmio_mmc.txt
> +++ b/Documentation/devicetree/bindings/mmc/tmio_mmc.txt
> @@ -26,6 +26,7 @@ Required properties:
>                 "renesas,sdhi-r8a7794" - SDHI IP on R8A7794 SoC
>                 "renesas,sdhi-r8a7795" - SDHI IP on R8A7795 SoC
>                 "renesas,sdhi-r8a7796" - SDHI IP on R8A7796 SoC
> +               "renesas,sdhi-r8a77965" - SDHI IP on R8A77965 SoC
>                 "renesas,sdhi-r8a77980" - SDHI IP on R8A77980 SoC
>                 "renesas,sdhi-r8a77995" - SDHI IP on R8A77995 SoC
>                 "renesas,sdhi-shmobile" - a generic sh-mobile SDHI controller
> diff --git a/drivers/mmc/host/renesas_sdhi_internal_dmac.c b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
> index a6bf123..b6edb7a 100644
> --- a/drivers/mmc/host/renesas_sdhi_internal_dmac.c
> +++ b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
> @@ -276,6 +276,7 @@ static void renesas_sdhi_internal_dmac_complete_tasklet_fn(unsigned long arg)
>         /* generic ones */
>         { .soc_id = "r8a7795" },
>         { .soc_id = "r8a7796" },
> +       { .soc_id = "r8a77965" },
>         { .soc_id = "r8a77980" },
>         { .soc_id = "r8a77995" },
>         { /* sentinel */ }
> --
> 1.9.1
>
