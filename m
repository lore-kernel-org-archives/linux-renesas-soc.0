Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-it1-f195.google.com ([209.85.166.195]:50199 "EHLO
        mail-it1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728775AbeKSWcM (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 19 Nov 2018 17:32:12 -0500
Received: by mail-it1-f195.google.com with SMTP id a185so6585414itc.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 19 Nov 2018 04:08:46 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20181031231340.1958-1-niklas.soderlund@ragnatech.se>
References: <20181031231340.1958-1-niklas.soderlund@ragnatech.se>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 19 Nov 2018 13:08:05 +0100
Message-ID: <CAPDyKFpMqbH-iazzJQgGAFgRgpPJ=2yyiMwj6Z+Lc13vToGrDg@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] mmc: renesas_sdhi: extend quirk selection to
 handle ES revisions
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        =?UTF-8?Q?Niklas_S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 1 November 2018 at 00:13, Niklas S=C3=B6derlund
<niklas.soderlund@ragnatech.se> wrote:
> From: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.se>
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
>   mmc: renesas_sdhi: disable HS400 on H3 ES1.x and M3-W ES1.x
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

I noticed there were a minor comment from Geert, however I decided to
pick this as is and leave further improvements to be made on top.

Kind regards
Uffe
