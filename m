Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-vs1-f65.google.com ([209.85.217.65]:46583 "EHLO
        mail-vs1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727135AbeLEOX6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 5 Dec 2018 09:23:58 -0500
Received: by mail-vs1-f65.google.com with SMTP id n10so3337174vso.13
        for <linux-renesas-soc@vger.kernel.org>; Wed, 05 Dec 2018 06:23:58 -0800 (PST)
MIME-Version: 1.0
References: <20181128161829.27266-1-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20181128161829.27266-1-niklas.soderlund+renesas@ragnatech.se>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 5 Dec 2018 15:23:21 +0100
Message-ID: <CAPDyKFpBakCPokRP-ggPtnJ-v8Ex93uM4x8BowZErtH1fLKqrQ@mail.gmail.com>
Subject: Re: [PATCH v3 0/3] mmc: renesas_sdhi: extend quirk selection to
 handle ES revisions
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

On Wed, 28 Nov 2018 at 17:19, Niklas S=C3=B6derlund
<niklas.soderlund+renesas@ragnatech.se> wrote:
>
> Hi,
>
> Recent datasheet updates have made it clear that some quirks are not SoC
> specific but SoC + ES version specific. Currently the quirks are
> selected using compatibility values but whit this new information that
> is not enough.
>
> Patch 1/3 adds support to select quirks based on SoC + ES revision using
> soc_device_match() and converts the only existing quirk. Patch 2/3
> Removes the old method to select quirk based on compatibility string.
> While Patch 3/3 adds a new quirk from the BSP which blacklists some
> known problematic ES versions for HS400. HS400 is not yet enabled
> upstream so blacklisting these ES versions is not a regression of
> functionality.
>
> Based on mmc/next and tested on H3 and M3-N.
>
> Niklas S=C3=B6derlund (3):
>   mmc: renesas_sdhi: handle 4tap hs400 mode quirk based on SoC revision
>   mmc: renesas_sdhi: align compatibility properties for H3 and M3-W
>   mmc: renesas_sdhi: disable HS400 on H3 ES1.x and M3-W ES1.[012]
>
>  drivers/mmc/host/renesas_sdhi_core.c          | 36 +++++++++++++++++++
>  drivers/mmc/host/renesas_sdhi_internal_dmac.c | 20 ++---------
>  drivers/mmc/host/renesas_sdhi_sys_dmac.c      | 20 ++---------
>  3 files changed, 41 insertions(+), 35 deletions(-)
>
> --
> 2.19.1
>

Applied for next, thanks!

Kind regards
Uffe
