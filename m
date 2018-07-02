Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-it0-f65.google.com ([209.85.214.65]:53202 "EHLO
        mail-it0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752069AbeGBNRR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 2 Jul 2018 09:17:17 -0400
Received: by mail-it0-f65.google.com with SMTP id p4-v6so12065794itf.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 02 Jul 2018 06:17:16 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20180618125751.27615-1-horms+renesas@verge.net.au>
References: <20180618125751.27615-1-horms+renesas@verge.net.au>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 2 Jul 2018 15:17:14 +0200
Message-ID: <CAPDyKFqT9YOZr-jdOXi7Y3X8X=xE5JGqWK5SJM+Ommifx6Xefw@mail.gmail.com>
Subject: Re: [PATCH v5 0/3] mmc: renesas_sdhi: add eMMC HS400 mode support
To: Simon Horman <horms+renesas@verge.net.au>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 18 June 2018 at 14:57, Simon Horman <horms+renesas@verge.net.au> wrote:
> Hi,
>
> this patch-set provides SDHI driver support for eMMC HS400.
>
> Based on mmc-v4.18-rc1
>
> Dependencies for applying these patches:
> * none
>
> Dependencies to test eMMC HS400:
> * [PATCH] clk: renesas: rcar-gen3: Fix SD divider setting
> * [PATCH v2] arm64: dts: salvator-common: Enable HS400 of SDHI2
>
> To assist testing and review this patch and the above mentioned
> dependencies, which are necessary and sufficient to enable HS400 on
> R-Car {H3,M3-W,M3-N} / Salvator-{X,XS}.
>
> https://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas.git topic/hs400-v5
>
> Changes since v4:
> * Refactor host tuning operations as suggested by Ulf
> * Differeniate between 4 tap and 8 tap support for HS400
> * Support HS400 with R-Car M3-N (r8a77965)
>
> Changes since v3:
> * As a follow-up to discussion with Ulf and Wolfram I have proposed
>   two new HS400 tuning host operations. These are provided, and explained,
>   in "mmc: core: more fine-grained hooks for HS400 tuning".
>
>   The following driver patches have been updated to use these new operations.
>
>   And "mmc: tmio: add eMMC HS400 mode support" proposes a minor cleanup
>   to make it a little cleaner to add the proposed new host operations to
>   the MMC core.
>
> Changes since v2:
> * Consolidate disable_scc and reset_hs400_mode into reset_hs400_tuning
>   callback
> * Reuse renesas_sdhi_reset_hs400_mode() in renesas_sdhi_hw_reset()
> * Factor out renesas_sdhi_reset_scc()
>
> Masaharu Hayakawa (2):
>   mmc: tmio: add eMMC HS400 mode support
>   mmc: renesas_sdhi: add eMMC HS400 mode support
>
> Simon Horman (1):
>   mmc: core: more fine-grained hooks for HS400 tuning
>
>  drivers/mmc/core/mmc.c                        |  10 ++
>  drivers/mmc/host/renesas_sdhi_core.c          | 127 +++++++++++++++++++++-----
>  drivers/mmc/host/renesas_sdhi_internal_dmac.c |  20 +++-
>  drivers/mmc/host/renesas_sdhi_sys_dmac.c      |  17 +++-
>  drivers/mmc/host/tmio_mmc.h                   |   6 ++
>  drivers/mmc/host/tmio_mmc_core.c              |  47 +++++++++-
>  include/linux/mfd/tmio.h                      |   3 +
>  include/linux/mmc/host.h                      |   7 ++
>  8 files changed, 209 insertions(+), 28 deletions(-)
>
> --
> 2.11.0
>

Thanks, applied for next!

Kind regards
Uffe
