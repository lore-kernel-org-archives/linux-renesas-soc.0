Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:57582 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388126AbeGWRTU (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 23 Jul 2018 13:19:20 -0400
Date: Mon, 23 Jul 2018 18:17:19 +0200
From: Simon Horman <horms@verge.net.au>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Subject: Re: [PATCH] mmc: renesas_sdhi: Add r8a77990 support
Message-ID: <20180723161719.zlalebcsp6uph3dp@verge.net.au>
References: <20180721111449.10103-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180721111449.10103-1-wsa+renesas@sang-engineering.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Sat, Jul 21, 2018 at 01:14:49PM +0200, Wolfram Sang wrote:
> This patch adds SDHI support for the R8A77990 SoC (R-Car E3). No driver changes
> needed for anything except HS400 which we will enable separately later.

No driver update should be required for HS400, see below.

> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
> 
> Note: we shouldn't enable HS400 in the DTS files yet, since we don't have the 8
> tap support. But I think we can enable basic support.

8 tap support is included in the following patch which was accepted
for inclusion in upstream (search for 4TAP):

26eb2607fa28 ("mmc: renesas_sdhi: add eMMC HS400 mode support")

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
