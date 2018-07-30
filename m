Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-it0-f68.google.com ([209.85.214.68]:40516 "EHLO
        mail-it0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727440AbeG3Qlx (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 30 Jul 2018 12:41:53 -0400
Received: by mail-it0-f68.google.com with SMTP id h23-v6so87437ita.5
        for <linux-renesas-soc@vger.kernel.org>; Mon, 30 Jul 2018 08:06:28 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20180721111449.10103-1-wsa+renesas@sang-engineering.com>
References: <20180721111449.10103-1-wsa+renesas@sang-engineering.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 30 Jul 2018 17:06:27 +0200
Message-ID: <CAPDyKFqdO6-R0dt2F1PsjJ3tb3xKvZtwBYdBBBUUwSc104F+VQ@mail.gmail.com>
Subject: Re: [PATCH] mmc: renesas_sdhi: Add r8a77990 support
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Simon Horman <horms@verge.net.au>,
        =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 21 July 2018 at 13:14, Wolfram Sang <wsa+renesas@sang-engineering.com> wrote:
> This patch adds SDHI support for the R8A77990 SoC (R-Car E3). No driver changes
> needed for anything except HS400 which we will enable separately later.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Thanks, applied for next!

Kind regards
Uffe

> ---
>
> Note: we shouldn't enable HS400 in the DTS files yet, since we don't have the 8
> tap support. But I think we can enable basic support.
>
>  Documentation/devicetree/bindings/mmc/tmio_mmc.txt | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/mmc/tmio_mmc.txt b/Documentation/devicetree/bindings/mmc/tmio_mmc.txt
> index 839f469f4525..c434200d19d5 100644
> --- a/Documentation/devicetree/bindings/mmc/tmio_mmc.txt
> +++ b/Documentation/devicetree/bindings/mmc/tmio_mmc.txt
> @@ -28,6 +28,7 @@ Required properties:
>                 "renesas,sdhi-r8a7796" - SDHI IP on R8A7796 SoC
>                 "renesas,sdhi-r8a77965" - SDHI IP on R8A77965 SoC
>                 "renesas,sdhi-r8a77980" - SDHI IP on R8A77980 SoC
> +               "renesas,sdhi-r8a77990" - SDHI IP on R8A77990 SoC
>                 "renesas,sdhi-r8a77995" - SDHI IP on R8A77995 SoC
>                 "renesas,sdhi-shmobile" - a generic sh-mobile SDHI controller
>                 "renesas,rcar-gen1-sdhi" - a generic R-Car Gen1 SDHI controller
> --
> 2.11.0
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-mmc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
