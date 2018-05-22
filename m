Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-it0-f67.google.com ([209.85.214.67]:38156 "EHLO
        mail-it0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751544AbeEVOcK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 22 May 2018 10:32:10 -0400
Received: by mail-it0-f67.google.com with SMTP id q4-v6so180072ite.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 22 May 2018 07:32:10 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20180418095700.29948-3-horms+renesas@verge.net.au>
References: <20180418095700.29948-1-horms+renesas@verge.net.au> <20180418095700.29948-3-horms+renesas@verge.net.au>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 22 May 2018 16:32:09 +0200
Message-ID: <CAPDyKFo+9yN2wGFjEHj2-mr3Na8UuM-RnYaKLPjUVcc1U2M7RA@mail.gmail.com>
Subject: Re: [PATCH v4 2/4] mmc: core: more fine-grained hooks for HS400 tuning
To: Simon Horman <horms+renesas@verge.net.au>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 18 April 2018 at 11:56, Simon Horman <horms+renesas@verge.net.au> wrote:
> This adds two new HS400 tuning operations:
> * prepare_hs400_tuning_downgrade
> * complete_hs400_tuning
>
> These supplement the existing HS400 operation:
> * prepare_hs400_tuning
>
> This is motivated by a requirement of Renesas SDHI for the following:
> 1. Disabling SCC before selecting to HS if selection of HS400 has occurred.
>    This can be done in an implementation of prepare_hs400_tuning_downgrade
> 2. Updating registers after switching to HS400
>    This can be done in an implementation of complete_hs400_tuning
>
> After this patch the call sequence is as follows:
>
> * Initial tuning
>   i. prepare_hs400_tuning
>   2. Tuning procedure
>   3. Select HS400
>   4. complete_hs400_tuning
>
> * Retune
>   1. prepare_hs400_tuning_downgrade
>   2. Select HS200
>   3. prepare_hs400_tuning
>   4. Tuning procedure
>   5. Select HS400
>   6. complete_hs400_tuning
>
> If prepare_hs400_tuning or complete_hs400_tuning are not implemented they
> are not called. And if neither are called the procedure is the same as
> before this patch.
>
> Design consideration: In the case of Renesas SDHI it is likely that
> prepare_hs400_tuning_downgrade and prepare_hs400_tuning could be combined
> if the latter was called before selecting HS200 during tuning. When I say
> likely, I believe it matches my understanding of the hardware. However, I
> did not test this as I am entirely unsure if moving the
> prepare_hs400_tuning call would work for other hardware that uses this
> operation and I am in no position to test such hardware.
>
> Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
> ---
> v4
> * New patch
> ---
>  drivers/mmc/core/host.c  | 13 ++++++++++++-
>  drivers/mmc/core/mmc.c   | 19 ++++++++++++++-----
>  include/linux/mmc/host.h | 26 +++++++++++++++++++++++++-
>  3 files changed, 51 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/mmc/core/host.c b/drivers/mmc/core/host.c
> index 64b03d6eaf18..5e60df7ca11f 100644
> --- a/drivers/mmc/core/host.c
> +++ b/drivers/mmc/core/host.c
> @@ -138,6 +138,10 @@ int mmc_retune(struct mmc_host *host)
>         host->doing_retune = 1;
>
>         if (host->ios.timing == MMC_TIMING_MMC_HS400) {
> +               if (host->ops->prepare_hs400_tuning_downgrade)
> +                       host->ops->prepare_hs400_tuning_downgrade(host,
> +                                                                 &host->ios);
> +

Quite a long lame for the callback, perhaps "hs400_downgrade" is sufficient?

Moreover, I suggest you move this new code snippet into
mmc_hs400_to_hs200() instead.

>                 err = mmc_hs400_to_hs200(host->card);
>                 if (err)
>                         goto out;
> @@ -152,8 +156,15 @@ int mmc_retune(struct mmc_host *host)
>         if (err)
>                 goto out;
>
> -       if (return_to_hs400)
> +       if (return_to_hs400) {
>                 err = mmc_hs200_to_hs400(host->card);
> +               if (err)
> +                       goto out;
> +
> +               if (host->ops->complete_hs400_tuning)
> +                       host->ops->complete_hs400_tuning(host, &host->ios);

Perhaps rename callback to "hs400_complete"?

And, please move this new code into mmc_select_hs400() (which is
called from mmc_hs200_to_hs400()), as I think it better belongs there.

> +       }
> +
>  out:
>         host->doing_retune = 0;
>
> diff --git a/drivers/mmc/core/mmc.c b/drivers/mmc/core/mmc.c
> index 099b327e10ca..a108a1a3e27f 100644
> --- a/drivers/mmc/core/mmc.c
> +++ b/drivers/mmc/core/mmc.c
> @@ -1508,22 +1508,31 @@ static int mmc_select_timing(struct mmc_card *card)
>  static int mmc_hs200_tuning(struct mmc_card *card)
>  {
>         struct mmc_host *host = card->host;
> +       bool run_hs400_ops;
>         int err;
>
> +       run_hs400_ops = card->mmc_avail_type & EXT_CSD_CARD_TYPE_HS400 &&
> +               host->ios.bus_width == MMC_BUS_WIDTH_8;
> +
>         /*
>          * Timing should be adjusted to the HS400 target
>          * operation frequency for tuning process
>          */
> -       if (card->mmc_avail_type & EXT_CSD_CARD_TYPE_HS400 &&
> -           host->ios.bus_width == MMC_BUS_WIDTH_8)
> -               if (host->ops->prepare_hs400_tuning)
> -                       host->ops->prepare_hs400_tuning(host, &host->ios);
> +       if (run_hs400_ops && host->ops->prepare_hs400_tuning)
> +               host->ops->prepare_hs400_tuning(host, &host->ios);
>
>         err = mmc_execute_tuning(card);
>         if (err)
>                 return err;
>
> -       return mmc_select_hs400(card);
> +       err = mmc_select_hs400(card);
> +       if (err)
> +               return err;
> +
> +       if (run_hs400_ops && host->ops->complete_hs400_tuning)
> +               host->ops->complete_hs400_tuning(host, &host->ios);
> +

I would suggest you to drop patch 1, then re-base $subject patch on
top of the patch I just sent ("mmc: core: Move calls to
->prepare_hs400_tuning() closer to mmc code").

In this way, we get less card specific code in mmc_retune(), which is
desirable - and in the end I think the code becomes a bit more easy to
understand.

> +       return 0;
>  }
>
>  /*
> diff --git a/include/linux/mmc/host.h b/include/linux/mmc/host.h
> index 85146235231e..5d3ae1071d2f 100644
> --- a/include/linux/mmc/host.h
> +++ b/include/linux/mmc/host.h
> @@ -143,8 +143,32 @@ struct mmc_host_ops {
>         /* The tuning command opcode value is different for SD and eMMC cards */
>         int     (*execute_tuning)(struct mmc_host *host, u32 opcode);
>
> -       /* Prepare HS400 target operating frequency depending host driver */
> +       /* Prepare for HS400 downgrade during tuning of target operating frequency depending on host driver
> +        * If provided and retuning is in progress, this is called before:
> +        * 1. Switching from HS400 to HS200; which preceeds
> +        * 2. Calling .prepare_hs400_tuning, if present; which preceeds
> +        * 3. The HS400 tuning procedure
> +        */
> +       void    (*prepare_hs400_tuning_downgrade)(struct mmc_host *host, struct mmc_ios *ios);
> +
> +       /* Prepare for tuning HS400 target operating frequency depending on host driver
> +        * If provided, this called:
> +        * - In the case that retuning is in progress, after:
> +        *   1. .prepare_hs400_tuning_downgrade(), if present
> +        *   2. Switching from HS400 to HS200
> +        * - And in any case before:
> +        *   3. The HS400 tuning procedure
> +        */
> +
>         int     (*prepare_hs400_tuning)(struct mmc_host *host, struct mmc_ios *ios);
> +
> +       /* Complete tuning HS400 target operating frequency depending host driver
> +        * If provided, this is called after:
> +        * 1. The HS400 tuning procedure
> +        * 2. Switching from HS200 to HS400
> +        */
> +       void    (*complete_hs400_tuning)(struct mmc_host *host, struct mmc_ios *ios);
> +
>         /* Prepare enhanced strobe depending host driver */
>         void    (*hs400_enhanced_strobe)(struct mmc_host *host,
>                                          struct mmc_ios *ios);
> --
> 2.11.0
>

Otherwise, as said, I like the approach.

Kind regards
Uffe
