Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-io0-f194.google.com ([209.85.223.194]:45868 "EHLO
        mail-io0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751136AbeDSNSP (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 19 Apr 2018 09:18:15 -0400
Received: by mail-io0-f194.google.com with SMTP id a7-v6so6520116ioc.12
        for <linux-renesas-soc@vger.kernel.org>; Thu, 19 Apr 2018 06:18:14 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20180418182101.5723-1-wsa+renesas@sang-engineering.com>
References: <20180418182101.5723-1-wsa+renesas@sang-engineering.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 19 Apr 2018 15:18:13 +0200
Message-ID: <CAPDyKFrOYSg3khTwBB6zbqFPNU_eGhDx44Ug4jXaP9fwYx1vGw@mail.gmail.com>
Subject: Re: [PATCH v3 0/5] mmc: renesas_sdhi_internal_dmac: DMA handling fixes
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Simon Horman <horms@verge.net.au>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 18 April 2018 at 20:20, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> I have collected the patches floating around for renesas_sdhi_internal_dm=
ac and
> grouped them to avoid dependency issues.
>
> Regarding stable: I think patch 1 is clearly for stable. Patch 3 maybe, b=
ut it
> needs patch 2 which is not. Not sure if it is worth the hazzle. Patches 4=
 & 5
> are not for stable.
>

Patch 1 applied for fixes (added a stable tag) and the rest applied
for next. Please tell if you want me to change something in regards to
this.

Kind regards
Uffe

> Changes since v2:
>         * fixed checkpatch issues (Thanks Sergei!)
>         * rebased to mmc/next
>
> Changes since v1:
>         * patch 1: drop superfluous NULL check on soc->date
>                    (Thanks Geert!)
>         * patches 2,3,5: added Simon's tag
>
> Kind regards,
>
>    Wolfram
>
>
> Masaharu Hayakawa (1):
>   mmc: renesas_sdhi: Fix alignment check of sg buffer
>
> Niklas S=C3=B6derlund (1):
>   mmc: renesas_sdhi: use helpers to access struct scatterlist members
>
> Wolfram Sang (3):
>   mmc: renesas_sdhi_internal_dmac: limit DMA RX for old SoCs
>   mmc: renesas_sdhi_internal_dmac: use more generic whitelisting
>   mmc: renesas_sdhi_internal_dmac: remove superfluous WARN
>
>  drivers/mmc/host/renesas_sdhi_internal_dmac.c | 64 +++++++++++++++++++--=
------
>  1 file changed, 45 insertions(+), 19 deletions(-)
>
> --
> 2.11.0
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-mmc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
