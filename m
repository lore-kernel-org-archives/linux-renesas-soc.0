Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-io0-f196.google.com ([209.85.223.196]:38885 "EHLO
        mail-io0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754309AbeDWJSG (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 23 Apr 2018 05:18:06 -0400
Received: by mail-io0-f196.google.com with SMTP id d24-v6so7767598iob.5
        for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Apr 2018 02:18:06 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <66c0b103-ed6e-36e0-74a6-9809ba55939c@cogentembedded.com>
References: <66c0b103-ed6e-36e0-74a6-9809ba55939c@cogentembedded.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 23 Apr 2018 11:18:05 +0200
Message-ID: <CAPDyKFrBJzqwj-NhuopwTSjBeX1U=zYdG4J703h93YCPgRK8Rg@mail.gmail.com>
Subject: Re: [PATCH] mmc: renesas_sdhi_internal_dmac: add R8A77980 to whitelist
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 19 April 2018 at 22:07, Sergei Shtylyov
<sergei.shtylyov@cogentembedded.com> wrote:
> I've successfully tested eMMC on R8A77980/Condor. R8A77980 has a single
> SDHI core anyway, so can't be a subject of the known RX DMA errata...
>
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

Thanks, applied for next!

Kind regards
Uffe

>
> ---
> This patch is against the 'next' branch of Ulf Hansson's 'mmc.git' repo.
>
>  drivers/mmc/host/renesas_sdhi_internal_dmac.c |    1 +
>  1 file changed, 1 insertion(+)
>
> Index: mmc/drivers/mmc/host/renesas_sdhi_internal_dmac.c
> ===================================================================
> --- mmc.orig/drivers/mmc/host/renesas_sdhi_internal_dmac.c
> +++ mmc/drivers/mmc/host/renesas_sdhi_internal_dmac.c
> @@ -276,6 +276,7 @@ static const struct soc_device_attribute
>         /* generic ones */
>         { .soc_id = "r8a7795" },
>         { .soc_id = "r8a7796" },
> +       { .soc_id = "r8a77980" },
>         { .soc_id = "r8a77995" },
>         { /* sentinel */ }
>  };
