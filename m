Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from conssluserg-02.nifty.com ([210.131.2.81]:62726 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727546AbeKBP61 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 2 Nov 2018 11:58:27 -0400
MIME-Version: 1.0
References: <20181031230554.1660-1-niklas.soderlund@ragnatech.se> <20181031230554.1660-2-niklas.soderlund@ragnatech.se>
In-Reply-To: <20181031230554.1660-2-niklas.soderlund@ragnatech.se>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Fri, 2 Nov 2018 15:51:29 +0900
Message-ID: <CAK7LNATe-ocOiMsxHw_LC_UMzZ8xPBzwBY1GffB0Yg_zH6e4oQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] mmc: tmio: enable module clock before resetting
 when resuming
To: niklas.soderlund@ragnatech.se
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        linux-mmc <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        =?UTF-8?Q?Niklas_S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, Nov 1, 2018 at 8:52 AM Niklas S=C3=B6derlund
<niklas.soderlund@ragnatech.se> wrote:
>
> From: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.se>
>
> On runtime power management resume, the host clock needs to be
> enabled before calling tmio_mmc_reset. If the mmc device has a power
> domain entry, the host clock is enabled via genpd_runtime_resume,
> running before tmio_mmc_host_runtime_resume. If the mmc device has no
> power domain entry, however, genpd_runtime_resume is not called. This
> patch changes tmio_mmc_host_runtime_resume to enable the host clock
> before calling tmio_mmc_reset.
>
> Based on work from Masaharu Hayakawa.
>
> Signed-off-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.=
se>


Reviewed-by: Masahiro Yamada <yamada.masahiro@socionext.com>




> ---
>  drivers/mmc/host/tmio_mmc_core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/mmc/host/tmio_mmc_core.c b/drivers/mmc/host/tmio_mmc=
_core.c
> index 8d64f6196f33e882..953562a12a0d6ebc 100644
> --- a/drivers/mmc/host/tmio_mmc_core.c
> +++ b/drivers/mmc/host/tmio_mmc_core.c
> @@ -1328,8 +1328,8 @@ int tmio_mmc_host_runtime_resume(struct device *dev=
)
>  {
>         struct tmio_mmc_host *host =3D dev_get_drvdata(dev);
>
> -       host->reset(host);
>         tmio_mmc_clk_enable(host);
> +       host->reset(host);
>
>         if (host->clk_cache)
>                 host->set_clock(host, host->clk_cache);
> --
> 2.19.1
>


--
Best Regards
Masahiro Yamada
