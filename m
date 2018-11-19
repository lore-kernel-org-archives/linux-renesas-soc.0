Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-it1-f194.google.com ([209.85.166.194]:39622 "EHLO
        mail-it1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728773AbeKSWcR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 19 Nov 2018 17:32:17 -0500
Received: by mail-it1-f194.google.com with SMTP id m15so7042993itl.4
        for <linux-renesas-soc@vger.kernel.org>; Mon, 19 Nov 2018 04:08:51 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20181105213935.11572-1-marek.vasut+renesas@gmail.com>
References: <20181105213935.11572-1-marek.vasut+renesas@gmail.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 19 Nov 2018 13:08:10 +0100
Message-ID: <CAPDyKFrMnF_ScT3gM2cKQfEpQt2JODo6BU9jAv6fg1nHmKm6kQ@mail.gmail.com>
Subject: Re: [PATCH] mmc: renesas_sdhi: Whitelist R8A77990 SDHI
To: Marek Vasut <marek.vasut@gmail.com>
Cc: "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms+renesas@verge.net.au>,
        Wolfram Sang <wsa@the-dreams.de>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 5 November 2018 at 22:39, Marek Vasut <marek.vasut@gmail.com> wrote:
> Whitelist R8A77990 E3 SoC in the SDHI driver. The SDHI core
> present in the SoC is an 8tap variant of the Gen3 SDHI core.
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> Cc: Simon Horman <horms+renesas@verge.net.au>
> Cc: Wolfram Sang <wsa@the-dreams.de>
> Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> Cc: Ulf Hansson <ulf.hansson@linaro.org>
> Cc: linux-renesas-soc@vger.kernel.org

Applied for next, thanks!

Kind regards
Uffe

> ---
>  drivers/mmc/host/renesas_sdhi_internal_dmac.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/mmc/host/renesas_sdhi_internal_dmac.c b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
> index b6f54102bfdd..ede7eec9b9aa 100644
> --- a/drivers/mmc/host/renesas_sdhi_internal_dmac.c
> +++ b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
> @@ -304,6 +304,7 @@ static const struct soc_device_attribute soc_whitelist[] = {
>         { .soc_id = "r8a77965" },
>         { .soc_id = "r8a77970" },
>         { .soc_id = "r8a77980" },
> +       { .soc_id = "r8a77990" },
>         { .soc_id = "r8a77995" },
>         { /* sentinel */ }
>  };
> --
> 2.18.0
>
