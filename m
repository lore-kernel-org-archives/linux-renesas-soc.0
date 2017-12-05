Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-it0-f65.google.com ([209.85.214.65]:46473 "EHLO
        mail-it0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750810AbdLEQY3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 5 Dec 2017 11:24:29 -0500
Received: by mail-it0-f65.google.com with SMTP id t1so2845323ite.5
        for <linux-renesas-soc@vger.kernel.org>; Tue, 05 Dec 2017 08:24:29 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20171130144910.4320-1-wsa+renesas@sang-engineering.com>
References: <20171130144910.4320-1-wsa+renesas@sang-engineering.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 5 Dec 2017 17:24:28 +0100
Message-ID: <CAPDyKFqitcRpRjrvhw+yrP0tC5EGwX_XormEwEbWfr011UDVww@mail.gmail.com>
Subject: Re: [PATCH] mmc: core: properly init drv_type
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Simon Horman <horms@verge.net.au>,
        Colin Ian King <colin.king@canonical.com>,
        Dan Carpenter <dan.carpenter@oracle.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 30 November 2017 at 15:49, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> When the latest version of parsing the new eMMC bindings was moved from
> core.c to mmc.c, it was overlooked that drv_type could be used
> uninitialized. Fix it!
>
> Fixes: 6186d06c519e21 ("mmc: parse new binding for eMMC fixed driver type")
> Reported-by: Colin Ian King <colin.king@canonical.com>
> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Thanks, applied for fixes!

Kind regards
Uffe

> ---
>  drivers/mmc/core/mmc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/mmc/core/mmc.c b/drivers/mmc/core/mmc.c
> index a552f61060d212..0d1c6b025ca596 100644
> --- a/drivers/mmc/core/mmc.c
> +++ b/drivers/mmc/core/mmc.c
> @@ -1290,7 +1290,7 @@ int mmc_hs400_to_hs200(struct mmc_card *card)
>
>  static void mmc_select_driver_type(struct mmc_card *card)
>  {
> -       int card_drv_type, drive_strength, drv_type;
> +       int card_drv_type, drive_strength, drv_type = 0;
>         int fixed_drv_type = card->host->fixed_drv_type;
>
>         card_drv_type = card->ext_csd.raw_driver_strength |
> --
> 2.11.0
>
