Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-qt0-f178.google.com ([209.85.216.178]:35642 "EHLO
        mail-qt0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752271AbdFHNwc (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 8 Jun 2017 09:52:32 -0400
Received: by mail-qt0-f178.google.com with SMTP id w1so41780335qtg.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 08 Jun 2017 06:52:22 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1496148654-20386-1-git-send-email-horms+renesas@verge.net.au>
References: <1496148654-20386-1-git-send-email-horms+renesas@verge.net.au>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 8 Jun 2017 15:52:21 +0200
Message-ID: <CAPDyKFpkSzfKDmWoeWtiJN77MdFtcQkyzK3-hqKesK1kdzX_yQ@mail.gmail.com>
Subject: Re: [PATCH 0/5] mmc: tmio, renesas-sdhi: cleanups
To: Simon Horman <horms+renesas@verge.net.au>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 30 May 2017 at 14:50, Simon Horman <horms+renesas@verge.net.au> wrote:
> Hi,
>
> this short series provides some cleanups to the tmio and renesas-sdhi
> drivers.
>
> * Update files listed in MAINTAINERS
> * Consistently use EXPORT_SYMBOL_GPL
> * Update Renesas related copyrights
> * Improve checkpatch cleanness
>
> Simon Horman (5):
>   MAINTAINERS: Update files for TMIO/SDHI MMC driver
>   mmc: tmio: use EXPORT_SYMBOL_GPL
>   mmc: tmio, renesas-sdhi: update Renesas related copyrights
>   mmc: tmio: improve checkpatch cleanness
>   mmc: renesas-sdhi: improve checkpatch cleanness
>
>  MAINTAINERS                              |   2 +-
>  drivers/mmc/host/renesas_sdhi.h          |   4 +-
>  drivers/mmc/host/renesas_sdhi_core.c     |  53 +++++++-----
>  drivers/mmc/host/renesas_sdhi_sys_dmac.c |  28 ++++---
>  drivers/mmc/host/tmio_mmc.c              |  10 ++-
>  drivers/mmc/host/tmio_mmc.h              |  22 +++--
>  drivers/mmc/host/tmio_mmc_core.c         | 139 ++++++++++++++++++-------------
>  include/linux/mfd/tmio.h                 |  33 ++++----
>  8 files changed, 167 insertions(+), 124 deletions(-)
>
> --
> 2.1.4
>

Thanks, applied patch 1->3 for next!

Kind regards
Uffe
