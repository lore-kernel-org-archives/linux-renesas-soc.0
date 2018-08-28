Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-it0-f65.google.com ([209.85.214.65]:40672 "EHLO
        mail-it0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727028AbeH1LvP (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 28 Aug 2018 07:51:15 -0400
Received: by mail-it0-f65.google.com with SMTP id h23-v6so1338177ita.5
        for <linux-renesas-soc@vger.kernel.org>; Tue, 28 Aug 2018 01:00:49 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20180827151321.18015-2-niklas.soderlund+renesas@ragnatech.se>
References: <20180827151321.18015-1-niklas.soderlund+renesas@ragnatech.se> <20180827151321.18015-2-niklas.soderlund+renesas@ragnatech.se>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 28 Aug 2018 10:00:48 +0200
Message-ID: <CAPDyKFrj2DV72LB+_tcmwXfQ2vk4r6oCNEA6KwzX7BTnb0xLGA@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] mmc: renesas_sdhi: skip SCC error check when retuning
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Masaharu Hayakawa <masaharu.hayakawa.ry@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 27 August 2018 at 17:13, Niklas S=C3=B6derlund
<niklas.soderlund+renesas@ragnatech.se> wrote:
> From: Masaharu Hayakawa <masaharu.hayakawa.ry@renesas.com>
>
> Checking for SCC error during retuning is unnecessary.
>
> Signed-off-by: Masaharu Hayakawa <masaharu.hayakawa.ry@renesas.com>
> [Niklas: fix small style issue]
> Signed-off-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.=
se>
>
> ---
>
> * Changes since v2
> - Add comment to describe why checking SCC errors when using 4 taps is
>   not needed.
>
> * Changes since v1
> - Use intermediate variable use_4tap to simplify check.
> ---
>  drivers/mmc/host/renesas_sdhi_core.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>
> diff --git a/drivers/mmc/host/renesas_sdhi_core.c b/drivers/mmc/host/rene=
sas_sdhi_core.c
> index 777e32b0e410e850..4427f0e7058f3ee5 100644
> --- a/drivers/mmc/host/renesas_sdhi_core.c
> +++ b/drivers/mmc/host/renesas_sdhi_core.c
> @@ -443,6 +443,19 @@ static int renesas_sdhi_select_tuning(struct tmio_mm=
c_host *host)
>  static bool renesas_sdhi_check_scc_error(struct tmio_mmc_host *host)
>  {
>         struct renesas_sdhi *priv =3D host_to_priv(host);
> +       bool use_4tap =3D host->pdata->flags & TMIO_MMC_HAVE_4TAP_HS400;
> +
> +       /*
> +        * Skip checking SCC errors when running on 4 taps in HS400 mode =
as
> +        * any retuning would still result in the same 4 taps being used.
> +        */
> +       if (!(host->mmc->ios.timing =3D=3D MMC_TIMING_UHS_SDR104) &&
> +           !(host->mmc->ios.timing =3D=3D MMC_TIMING_MMC_HS200) &&
> +           !(host->mmc->ios.timing =3D=3D MMC_TIMING_MMC_HS400 && !use_4=
tap))
> +               return false;
> +
> +       if (host->mmc->doing_retune)

To keep the tuning internals close to the mmc core, please add a new
inline function in include/linux/mmc/host.h to give the value of the
"doing_retune", something along the lines of this:

/* Allows hosts to distinguish between re-tuning and first time tuning. */
static inline bool mmc_doing_retune(struct mmc_host *host)
{
        return host->doing_retune =3D=3D 1;
}

And of course in separate patch.

[...]

Otherwise this looks okay to me.

Kind regards
Uffe
