Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-qt0-f180.google.com ([209.85.216.180]:36453 "EHLO
        mail-qt0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933372AbdEVMDF (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 22 May 2017 08:03:05 -0400
Received: by mail-qt0-f180.google.com with SMTP id f55so99241562qta.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 22 May 2017 05:03:05 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20170519133155.22945-1-wsa+renesas@sang-engineering.com>
References: <20170519133155.22945-1-wsa+renesas@sang-engineering.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 22 May 2017 14:03:04 +0200
Message-ID: <CAPDyKFpHOmQSVVd8mkMjxdGWr=Tn8p4E3+0LWdzk-UGFkbhQGw@mail.gmail.com>
Subject: Re: [PATCH v2 0/6] tmio/sdhi: add cmd23 support
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 19 May 2017 at 15:31, Wolfram Sang <wsa+renesas@sang-engineering.com> wrote:
> This series adds CMD23 support to SDHI. It was tested on H2 (Gen2, Lager) and
> M3W (Gen3, Salvator-X). The test procedure can be found here:
>
> http://elinux.org/Tests:SDHI-CMD23
>
> Patches are based on mmc/next from today. A branch can be found here:
>
> git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git renesas/topic/sdhi-cmd23
>
> Changes since RFC:
>
> * rebased on top of Simon's DMA rework now in mmc/next
> * added Geerts tags
> * cosmetic change in patch 6, put new capability in a separate line
>
> Thanks,
>
>    Wolfram
>
>
> Wolfram Sang (6):
>   mmc: tmio: make tmio_mmc_request function more readable
>   mmc: tmio: refactor handling mrq
>   mmc: tmio: remove outdated comment
>   mmc: tmio: move finish_request function further down
>   mmc: tmio: add CMD23 support
>   mmc: sdhi: add CMD23 support to R-Car Gen2 & Gen3
>
>  drivers/mmc/host/renesas_sdhi_sys_dmac.c |   6 +-
>  drivers/mmc/host/tmio_mmc_core.c         | 135 ++++++++++++++++++-------------
>  2 files changed, 82 insertions(+), 59 deletions(-)


Thanks, applied for next!

Kind regards
Uffe
