Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lj1-f195.google.com ([209.85.208.195]:41972 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388493AbeGWN16 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 23 Jul 2018 09:27:58 -0400
Received: by mail-lj1-f195.google.com with SMTP id y17-v6so378057ljy.8
        for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Jul 2018 05:27:00 -0700 (PDT)
Date: Mon, 23 Jul 2018 14:26:57 +0200
From: Niklas =?iso-8859-1?Q?S=F6derlund?=
        <niklas.soderlund@ragnatech.se>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH] mmc: renesas_sdhi: Add r8a77990 support
Message-ID: <20180723122657.GE1432@bigcity.dyn.berto.se>
References: <20180721111449.10103-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20180721111449.10103-1-wsa+renesas@sang-engineering.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Wolfram,

Thanks for your patch.

On 2018-07-21 13:14:49 +0200, Wolfram Sang wrote:
> This patch adds SDHI support for the R8A77990 SoC (R-Car E3). No driver changes
> needed for anything except HS400 which we will enable separately later.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Niklas S�derlund <niklas.soderlund+renesas@ragnatech.se>

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
>  		"renesas,sdhi-r8a7796" - SDHI IP on R8A7796 SoC
>  		"renesas,sdhi-r8a77965" - SDHI IP on R8A77965 SoC
>  		"renesas,sdhi-r8a77980" - SDHI IP on R8A77980 SoC
> +		"renesas,sdhi-r8a77990" - SDHI IP on R8A77990 SoC
>  		"renesas,sdhi-r8a77995" - SDHI IP on R8A77995 SoC
>  		"renesas,sdhi-shmobile" - a generic sh-mobile SDHI controller
>  		"renesas,rcar-gen1-sdhi" - a generic R-Car Gen1 SDHI controller
> -- 
> 2.11.0
> 

-- 
Regards,
Niklas S�derlund
