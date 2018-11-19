Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-io1-f65.google.com ([209.85.166.65]:38056 "EHLO
        mail-io1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728751AbeKSWby (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 19 Nov 2018 17:31:54 -0500
Received: by mail-io1-f65.google.com with SMTP id e9-v6so6726487iob.5
        for <linux-renesas-soc@vger.kernel.org>; Mon, 19 Nov 2018 04:08:28 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20181031225944.1226-1-niklas.soderlund@ragnatech.se>
References: <20181031225944.1226-1-niklas.soderlund@ragnatech.se>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 19 Nov 2018 13:07:47 +0100
Message-ID: <CAPDyKFqnvsMwJBCgZNFUvKvf4ZJBsFkD1qeC+-pVBC8RT3dDYA@mail.gmail.com>
Subject: Re: [PATCH] mmc: renesas_sdhi: remove workaround for HS400 clock
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

On 31 October 2018 at 23:59, Niklas S=C3=B6derlund
<niklas.soderlund@ragnatech.se> wrote:
> From: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.se>
>
> The driver sets an incorrect clock and depends on the clock driver
> knowledge of this incorrect setting to still set a 200Mhz SDn clock.
> Instead of spreading the workaround between the two drivers the clock
> driver should be made aware of the ES versions where the special clock
> handling is needed no need to keep this workaround in the SDHI driver.
>
> Signed-off-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.=
se>

Applied for next, thanks!

Kind regards
Uffe

> ---
>  drivers/mmc/host/renesas_sdhi_core.c | 9 ---------
>  1 file changed, 9 deletions(-)
>
> diff --git a/drivers/mmc/host/renesas_sdhi_core.c b/drivers/mmc/host/rene=
sas_sdhi_core.c
> index d3ac43c3d0b655dc..78bd117bbe65de46 100644
> --- a/drivers/mmc/host/renesas_sdhi_core.c
> +++ b/drivers/mmc/host/renesas_sdhi_core.c
> @@ -163,15 +163,6 @@ static void renesas_sdhi_set_clock(struct tmio_mmc_h=
ost *host,
>         if (new_clock =3D=3D 0)
>                 goto out;
>
> -       /*
> -        * Both HS400 and HS200/SD104 set 200MHz, but some devices need t=
o
> -        * set 400MHz to distinguish the CPG settings in HS400.
> -        */
> -       if (host->mmc->ios.timing =3D=3D MMC_TIMING_MMC_HS400 &&
> -           host->pdata->flags & TMIO_MMC_HAVE_4TAP_HS400 &&
> -           new_clock =3D=3D 200000000)
> -               new_clock =3D 400000000;
> -
>         clock =3D renesas_sdhi_clk_update(host, new_clock) / 512;
>
>         for (clk =3D 0x80000080; new_clock >=3D (clock << 1); clk >>=3D 1=
)
> --
> 2.19.1
>
