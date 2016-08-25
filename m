Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wm0-f47.google.com ([74.125.82.47]:38700 "EHLO
        mail-wm0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933693AbcHYKIk (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 25 Aug 2016 06:08:40 -0400
Received: by mail-wm0-f47.google.com with SMTP id o80so63770253wme.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 25 Aug 2016 03:08:39 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20160824093438.2478-1-wsa+renesas@sang-engineering.com>
References: <20160824093438.2478-1-wsa+renesas@sang-engineering.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 25 Aug 2016 12:02:22 +0200
Message-ID: <CAPDyKFpOEE_LX=9rNffvXeS8yx8FGiLvuRGtk4nYtPNDEaG_dQ@mail.gmail.com>
Subject: Re: [PATCH 0/2] mmc: sh_mobile_sdhi: use SDR & card_busy only on Gen2+
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-mmc <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Simon Horman <horms@verge.net.au>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 24 August 2016 at 11:34, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> This series hopefully fixes a performance regression for r8a73a4 (pre Gen2)
> caused by a not working card_busy. Because we don't have documentation for its
> SDHI (and I don't have the hardware), just enable card_busy and SDR only for
> machines known to have hardware support for it.
>
> Geert, can you test, please?
>
> Wolfram Sang (2):
>   mmc: host: sh_mobile_sdhi: move card_busy from tmio to sdhi
>   mmc: host: sh_mobile_sdhi: don't populate unneeded functions
>
>  drivers/mmc/host/sh_mobile_sdhi.c | 16 +++++++++++++++-
>  drivers/mmc/host/tmio_mmc.h       |  1 +
>  drivers/mmc/host/tmio_mmc_pio.c   |  9 +--------
>  3 files changed, 17 insertions(+), 9 deletions(-)
>

Thanks, applied for next!

Kind regards
Uffe
