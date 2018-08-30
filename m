Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-it0-f67.google.com ([209.85.214.67]:53242 "EHLO
        mail-it0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728339AbeH3QcM (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 30 Aug 2018 12:32:12 -0400
Received: by mail-it0-f67.google.com with SMTP id h3-v6so2340513ita.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 30 Aug 2018 05:30:16 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20180829233207.30646-1-niklas.soderlund+renesas@ragnatech.se>
References: <20180829233207.30646-1-niklas.soderlund+renesas@ragnatech.se>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 30 Aug 2018 14:30:15 +0200
Message-ID: <CAPDyKFoiYR8XLxRN0fV1ZX5Shn717Ewa5C4YPXuhgBD+L5Txqw@mail.gmail.com>
Subject: Re: [PATCH v4 0/3] mmc: {tmio,renesas_sdhi}: retune if SCC error detected
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 30 August 2018 at 01:32, Niklas S=C3=B6derlund
<niklas.soderlund+renesas@ragnatech.se> wrote:
> Hi,
>
> These patches triggers a retune if a SCC error is detected. They where
> ported from the renesas BSP. Masaharu-san did all the real work I just
> ported them to upstream and did small fixups.
>
> These patches where broken out of my retuning series as more work where
> needed to adapt them to the recent HS400 series picked-up. It's tested
> on M3-N using both HS200 and HS400 and on H3 ES2.0 using HS200.
>
> Masaharu Hayakawa (2):
>   mmc: renesas_sdhi: skip SCC error check when retuning
>   mmc: tmio: Fix SCC error detection
>
> Niklas S=C3=B6derlund (1):
>   mmc: core: add helper to see if a host is doing a retune
>
>  drivers/mmc/host/renesas_sdhi_core.c | 13 +++++++++++++
>  drivers/mmc/host/tmio_mmc_core.c     |  4 ++--
>  include/linux/mmc/host.h             |  5 +++++
>  3 files changed, 20 insertions(+), 2 deletions(-)
>
> --
> 2.18.0
>

Applied for next, thanks!

Kind regards
Uffe
