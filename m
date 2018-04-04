Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-io0-f193.google.com ([209.85.223.193]:36410 "EHLO
        mail-io0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751419AbeDDMqf (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 4 Apr 2018 08:46:35 -0400
Received: by mail-io0-f193.google.com with SMTP id o4so26201068iod.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 04 Apr 2018 05:46:35 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20180403215703.12110-1-wsa@the-dreams.de>
References: <20180403215703.12110-1-wsa@the-dreams.de>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 4 Apr 2018 14:46:34 +0200
Message-ID: <CAPDyKFoYz3Gqh2jBkYAx_D0eSjfFacRHmMCGyKBxP6W=zMcatA@mail.gmail.com>
Subject: Re: [PATCH] mmc: tmio: Fix error handling when issuing CMD23
To: Wolfram Sang <wsa@the-dreams.de>
Cc: "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Masaharu Hayakawa <masaharu.hayakawa.ry@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 3 April 2018 at 23:57, Wolfram Sang <wsa@the-dreams.de> wrote:
> From: Masaharu Hayakawa <masaharu.hayakawa.ry@renesas.com>
>
> If an error was detected when CMD23 was issued, command sequence should
> be terminated with errors and CMD23 should be issued after retuning.
>
> Fixes: 8b22c3c18be5 ("mmc: tmio: add CMD23 support")
> Signed-off-by: Masaharu Hayakawa <masaharu.hayakawa.ry@renesas.com>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Applied for fixes, thanks!

Kind regards
Uffe

> ---
>
> Ulf: I'd think this is suitable for stable...
>
>  drivers/mmc/host/tmio_mmc_core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/mmc/host/tmio_mmc_core.c b/drivers/mmc/host/tmio_mmc_core.c
> index e30df9ad8197..308029930304 100644
> --- a/drivers/mmc/host/tmio_mmc_core.c
> +++ b/drivers/mmc/host/tmio_mmc_core.c
> @@ -913,7 +913,7 @@ static void tmio_mmc_finish_request(struct tmio_mmc_host *host)
>                 host->check_scc_error(host);
>
>         /* If SET_BLOCK_COUNT, continue with main command */
> -       if (host->mrq) {
> +       if (host->mrq && !mrq->cmd->error) {
>                 tmio_process_mrq(host, mrq);
>                 return;
>         }
> --
> 2.11.0
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-mmc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
