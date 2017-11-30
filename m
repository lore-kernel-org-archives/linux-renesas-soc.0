Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-it0-f66.google.com ([209.85.214.66]:46677 "EHLO
        mail-it0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751819AbdK3NJj (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 30 Nov 2017 08:09:39 -0500
Received: by mail-it0-f66.google.com with SMTP id t1so8188517ite.5
        for <linux-renesas-soc@vger.kernel.org>; Thu, 30 Nov 2017 05:09:38 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1511971606-580-2-git-send-email-ulrich.hecht+renesas@gmail.com>
References: <1511971606-580-1-git-send-email-ulrich.hecht+renesas@gmail.com> <1511971606-580-2-git-send-email-ulrich.hecht+renesas@gmail.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 30 Nov 2017 14:09:38 +0100
Message-ID: <CAPDyKFrxgrp5wt82AtW9YtzwRn0+fO2Db4T=-Bu0OT2-zOkVYA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] mmc: renesas_sdhi: enable R-Car D3 (r8a77995) support
To: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
Cc: Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Wolfram Sang <wsa@the-dreams.de>,
        Magnus Damm <magnus.damm@gmail.com>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        Marek Vasut <marek.vasut@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 29 November 2017 at 17:06, Ulrich Hecht
<ulrich.hecht+renesas@gmail.com> wrote:
> Whitelists for internal DMAC implementation.
>
> Signed-off-by: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thanks, applied for next!

Kind regards
Uffe

> ---
>  drivers/mmc/host/renesas_sdhi_internal_dmac.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/mmc/host/renesas_sdhi_internal_dmac.c b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
> index 41cbe84..396ae8a 100644
> --- a/drivers/mmc/host/renesas_sdhi_internal_dmac.c
> +++ b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
> @@ -255,6 +255,7 @@ static const struct soc_device_attribute gen3_soc_whitelist[] = {
>          { .soc_id = "r8a7795", .revision = "ES1.*" },
>          { .soc_id = "r8a7795", .revision = "ES2.0" },
>          { .soc_id = "r8a7796", .revision = "ES1.0" },
> +        { .soc_id = "r8a77995", .revision = "ES1.0" },
>          { /* sentinel */ }
>  };
>
> --
> 2.7.4
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-mmc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
