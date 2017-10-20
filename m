Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-it0-f66.google.com ([209.85.214.66]:52136 "EHLO
        mail-it0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752499AbdJTKDt (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 20 Oct 2017 06:03:49 -0400
Received: by mail-it0-f66.google.com with SMTP id o135so12867962itb.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 20 Oct 2017 03:03:49 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1508469162-12322-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1508469162-12322-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Fri, 20 Oct 2017 12:03:48 +0200
Message-ID: <CAPDyKFp5rtmNiQgkpiaBfnLP4ERePY8ckvF+MTPajbG6G+Rorg@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] mmc: renesas_sdhi and tmio: bugfixes for v4.14
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 20 October 2017 at 05:12, Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> This patch set is based on mainline v4.14-rc5.
>
> Changes from v1:
>  - Calculate the max size of swiotlb memory instead of hardcoded value
>    in patch 1.
>  - Add Reviewed-by from Geert-san in patch 2. (Geert-san, thanks!)
>
> Yoshihiro Shimoda (2):
>   mmc: tmio: fix swiotlb buffer is full
>   mmc: renesas_sdhi: fix kernel panic in _internal_dmac.c
>
>  drivers/mmc/host/renesas_sdhi_internal_dmac.c | 17 ++++++++++-------
>  drivers/mmc/host/tmio_mmc_core.c              | 13 +++++++++++++
>  2 files changed, 23 insertions(+), 7 deletions(-)
>
> --
> 1.9.1
>

Thanks, applied for fixes!

Kind regards
Uffe
