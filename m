Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-vk0-f66.google.com ([209.85.213.66]:41824 "EHLO
        mail-vk0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753075AbeGFHFl (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 6 Jul 2018 03:05:41 -0400
MIME-Version: 1.0
References: <20180705141841.11121-1-niklas.soderlund+renesas@ragnatech.se> <20180705141841.11121-2-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20180705141841.11121-2-niklas.soderlund+renesas@ragnatech.se>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 6 Jul 2018 09:05:29 +0200
Message-ID: <CAMuHMdX9sCFCx2ACyr6PQXUWJhkjTyA4+UYGiLA0Y_NUO6-42Q@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] mmc: tmio: Fix tuning flow
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Linux MMC List <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Masaharu Hayakawa <masaharu.hayakawa.ry@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Niklas,

On Thu, Jul 5, 2018 at 4:20 PM Niklas Söderlund
<niklas.soderlund+renesas@ragnatech.se> wrote:
> From: Masaharu Hayakawa <masaharu.hayakawa.ry@renesas.com>
>
> If the return value of mmc_send_tuning() is error other than -EILSEQ,
> the tuning fails and process goes out of for_loop. The correct
> processing is to judge their TAP as not good (NG) and continue.
>
> Signed-off-by: Masaharu Hayakawa <masaharu.hayakawa.ry@renesas.com>
> [Niklas: update commit message]
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
>
> ---
>
> * Changes since v1
> - Change '!mmc_send_tuning()' to 'mmc_send_tuning() == 0'.
> ---
>  drivers/mmc/host/tmio_mmc_core.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
>
> diff --git a/drivers/mmc/host/tmio_mmc_core.c b/drivers/mmc/host/tmio_mmc_core.c
> index 416f9e078fda8b24..000fa9dff784ecb0 100644
> --- a/drivers/mmc/host/tmio_mmc_core.c
> +++ b/drivers/mmc/host/tmio_mmc_core.c
> @@ -817,10 +817,7 @@ static int tmio_mmc_execute_tuning(struct mmc_host *mmc, u32 opcode)
>                 if (host->prepare_tuning)
>                         host->prepare_tuning(host, i % host->tap_num);
>
> -               ret = mmc_send_tuning(mmc, opcode, NULL);
> -               if (ret && ret != -EILSEQ)
> -                       goto out;

I'd just drop the two lines above, and keep the assignment to and test of ret.
Kernel coding style is to not do checks on function return values in
if statements,
but assign to and check an intermediate variable.

> -               if (ret == 0)
> +               if (mmc_send_tuning(mmc, opcode, NULL) == 0)
>                         set_bit(i, host->taps);
>
>                 usleep_range(1000, 1200);

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
