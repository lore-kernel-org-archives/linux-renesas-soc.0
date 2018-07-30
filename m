Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-it0-f67.google.com ([209.85.214.67]:36024 "EHLO
        mail-it0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726661AbeG3QmJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 30 Jul 2018 12:42:09 -0400
Received: by mail-it0-f67.google.com with SMTP id p81-v6so134351itp.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 30 Jul 2018 08:06:45 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20180724145138.26536-1-niklas.soderlund+renesas@ragnatech.se>
References: <20180724145138.26536-1-niklas.soderlund+renesas@ragnatech.se>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 30 Jul 2018 17:06:44 +0200
Message-ID: <CAPDyKFrfEG18A1vqWS9vZkE+A1=04BdxQQistdiwK0i5WytDig@mail.gmail.com>
Subject: Re: [PATCH v4 0/2] mmc: {tmio,renesas_sdhi}: fix tuning behavior
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 24 July 2018 at 16:51, Niklas S=C3=B6derlund
<niklas.soderlund+renesas@ragnatech.se> wrote:
> Hi,
>
> Tuning failed on my R-Car H3 ES2.0 board using latest mmc/next while the
> Renesas BSP kernel worked. After some digging I found patches in the BSP
> which remedied this and whit these applied tuning now works for me.
>
> I have done small fixes, updated commit messages and rebased on latest
> mmc/next but Hayakawa-san did all the real work. This change helped me
> to successfully tune a stubborn card I have had trouble in the past to
> get to work.
>
> Since v3 of this patchset I have dropped 2 patches as they requier more
> work as HS400 have been merged since the initial posting. These two
> patches stand alone still fixes tuning issues so while work continues on
> the dropped two these two are ready for upstream consumption.
>
> Masaharu Hayakawa (1):
>   mmc: tmio: Fix tuning flow
>
> Niklas S=C3=B6derlund (1):
>   mmc: renesas_sdhi: Fix sampling clock position selecting
>
>  drivers/mmc/host/renesas_sdhi_core.c | 12 ++++++++++++
>  drivers/mmc/host/tmio_mmc_core.c     |  2 --
>  2 files changed, 12 insertions(+), 2 deletions(-)
>
> --
> 2.18.0
>

Thanks, applied for next!

Kind regards
Uffe
