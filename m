Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-it1-f195.google.com ([209.85.166.195]:35056 "EHLO
        mail-it1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728753AbeKSWb7 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 19 Nov 2018 17:31:59 -0500
Received: by mail-it1-f195.google.com with SMTP id v11so7068561itj.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 19 Nov 2018 04:08:32 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20181031230043.1302-1-niklas.soderlund@ragnatech.se>
References: <20181031230043.1302-1-niklas.soderlund@ragnatech.se>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 19 Nov 2018 13:07:52 +0100
Message-ID: <CAPDyKFpA7Ay15QDcXfrk+p4X0SD2yuU1Yja7O3UBkCYhakYtvw@mail.gmail.com>
Subject: Re: [PATCH] mmc: tmio: delete wait in tuning process
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Masaharu Hayakawa <masaharu.hayakawa.ry@renesas.com>,
        Takeshi Saito <takeshi.saito.xv@renesas.com>,
        =?UTF-8?Q?Niklas_S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 1 November 2018 at 00:00, Niklas S=C3=B6derlund
<niklas.soderlund@ragnatech.se> wrote:
> From: Masaharu Hayakawa <masaharu.hayakawa.ry@renesas.com>
>
> The manual does not contain information that a wait is needed in the
> tuning process, this might be a leftover from early development.
> Removing the wait don't have any effect on operation so delete the wait
> to shorten the initialization time.
>
> Signed-off-by: Masaharu Hayakawa <masaharu.hayakawa.ry@renesas.com>
> Signed-off-by: Takeshi Saito <takeshi.saito.xv@renesas.com>
> [Niklas: fixup commit message]
> Signed-off-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.=
se>

Applied for next, thanks!

Kind regards
Uffe

> ---
>  drivers/mmc/host/tmio_mmc_core.c | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/drivers/mmc/host/tmio_mmc_core.c b/drivers/mmc/host/tmio_mmc=
_core.c
> index 8d64f6196f33e882..a8f917f744fb9f63 100644
> --- a/drivers/mmc/host/tmio_mmc_core.c
> +++ b/drivers/mmc/host/tmio_mmc_core.c
> @@ -734,8 +734,6 @@ static int tmio_mmc_execute_tuning(struct mmc_host *m=
mc, u32 opcode)
>                 ret =3D mmc_send_tuning(mmc, opcode, NULL);
>                 if (ret =3D=3D 0)
>                         set_bit(i, host->taps);
> -
> -               usleep_range(1000, 1200);
>         }
>
>         ret =3D host->select_tuning(host);
> --
> 2.19.1
>
