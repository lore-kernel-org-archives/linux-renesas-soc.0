Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-qt0-f176.google.com ([209.85.216.176]:36051 "EHLO
        mail-qt0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751930AbdFLIa3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 12 Jun 2017 04:30:29 -0400
Received: by mail-qt0-f176.google.com with SMTP id u19so117603843qta.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 12 Jun 2017 01:30:28 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20170408202006.27276-1-wsa+renesas@sang-engineering.com>
References: <20170408202006.27276-1-wsa+renesas@sang-engineering.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 12 Jun 2017 10:30:27 +0200
Message-ID: <CAPDyKFqSr+3B5wq7+3+fDhB5etwEGhBadA0X7L9Tu6FUmKJgcQ@mail.gmail.com>
Subject: Re: [RFC PATCH v2 0/2] mmc: core: process ECC errors raised in stop cmds
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 8 April 2017 at 22:20, Wolfram Sang <wsa+renesas@sang-engineering.com> wrote:
> Here is the second RFC for handling ECC errors flagged in the stop command
> after a multiblock transfer. It is still RFC because I could only test it by
> inducing ECC errors in software (see patch for TMIO below). Shimoda-san, can
> you try this series with the SD tester again? That would be very kind.
>
> Other than that, I hope the patch descriptions and comments explain the single
> steps. Looking forward for thoughts.

Apologize for the delay!

I looked into these and the changes seems reasonable. I have applied
them for next to allow them to get some test coverage.

Thanks and kind regards
Uffe

>
> Kind regards,
>
>    Wolfram
>
> Changes since RFC v1:
>
> * rebased to mmc/next as of today
> * reworded commit message for patch 1
> * added tested-tag from Shimoda-san for patch 1
> * added patch 2
>
> Wolfram Sang (2):
>   mmc: core: check also R1 response for stop commands
>   mmc: core: for data errors, take response of stop cmd into account
>
>  drivers/mmc/core/block.c | 16 +++++++++++++---
>  1 file changed, 13 insertions(+), 3 deletions(-)
>
> Patch to simulate ECC errors:
>
> diff --git a/drivers/mmc/host/tmio_mmc_pio.c b/drivers/mmc/host/tmio_mmc_pio.c
> index a2d92f10501bdd..9773c7e5e4d154 100644
> --- a/drivers/mmc/host/tmio_mmc_pio.c
> +++ b/drivers/mmc/host/tmio_mmc_pio.c
> @@ -553,6 +553,8 @@ void tmio_mmc_do_data_irq(struct tmio_mmc_host *host)
>         }
>
>         if (stop) {
> +               static unsigned int induce_cnt = 0;
> +
>                 if (stop->opcode != MMC_STOP_TRANSMISSION || stop->arg)
>                         dev_err(&host->pdev->dev, "unsupported stop: CMD%u,0x%x. We did CMD12,0\n",
>                                 stop->opcode, stop->arg);
> @@ -560,6 +562,9 @@ void tmio_mmc_do_data_irq(struct tmio_mmc_host *host)
>                 /* fill in response from auto CMD12 */
>                 stop->resp[0] = sd_ctrl_read16_and_16_as_32(host, CTL_RESPONSE);
>
> +               if (induce_cnt++ % 100 == 0)
> +                       stop->resp[0] |= R1_CARD_ECC_FAILED;
> +
>                 sd_ctrl_write16(host, CTL_STOP_INTERNAL_ACTION, 0);
>         }
>
> --
> 2.11.0
>
