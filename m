Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-qk0-f169.google.com ([209.85.220.169]:36269 "EHLO
        mail-qk0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933157AbdGKOnq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 11 Jul 2017 10:43:46 -0400
Received: by mail-qk0-f169.google.com with SMTP id p21so2602279qke.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 11 Jul 2017 07:43:41 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20170630105649.16137-1-wsa+renesas@sang-engineering.com>
References: <20170630105649.16137-1-wsa+renesas@sang-engineering.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 11 Jul 2017 16:43:35 +0200
Message-ID: <CAPDyKFrjLfWmz=zoUe3P_SdMcmeAqOeprzW1TZ2KeQUEhQtSRg@mail.gmail.com>
Subject: Re: [PATCH 0/4] tmio/sdhi: use max sd_buf size & clean header file before
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Simon Horman <horms@verge.net.au>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Wolfram Sang <wsa@the-dreams.de>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 30 June 2017 at 12:56, Wolfram Sang <wsa+renesas@sang-engineering.com> wrote:
> From: Wolfram Sang <wsa@the-dreams.de>
>
> The main patch is patch 4 which uses the maximum sd_buf size, i.e. 32 bit on
> Gen2 and 64 bit on Gen3. Instead of a new flag, we use the bus_shift
> information we already have. See the patch description for details.
>
> Before fixing this, I wanted to remove a magic value in that function which is
> done in patch 3.
>
> When adding the new define, I noticed that some description is missing in the
> header which is fixed with patch 2.
>
> When adding the description, I noticed this meanwhile obsolete define which
> gets removed in patch 1.
>
> That's the way it went :)
>
> Tested on Salvator-X/M3-W and Lager/H2.

Thanks, applied for next!

Kind regards
Uffe

>
> Regards,
>
>    Wolfram
>
> Wolfram Sang (4):
>   mmc: tmio: remove obsolete TMIO_BBS
>   mmc: tmio: add references to bit defines in the header
>   mmc: tmio: no magic values when enabling DMA
>   mmc: sdhi: use maximum width for the sdbuf register
>
>  drivers/mmc/host/renesas_sdhi_core.c | 5 ++---
>  drivers/mmc/host/tmio_mmc.h          | 7 +++++--
>  2 files changed, 7 insertions(+), 5 deletions(-)
>
> --
> 2.11.0
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-mmc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
