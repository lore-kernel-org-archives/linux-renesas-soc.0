Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:43730 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726421AbeKHUVB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 8 Nov 2018 15:21:01 -0500
Date: Thu, 8 Nov 2018 11:46:05 +0100
From: Simon Horman <horms@verge.net.au>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Lee Jones <lee.jones@linaro.org>,
        Jiri Kosina <trivial@kernel.org>, linux-mmc@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] [trivial] mfd: tmio: Typo s/use use/use/
Message-ID: <20181108104604.hkav5rnlc44ayrrz@verge.net.au>
References: <20181107135001.14543-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181107135001.14543-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, Nov 07, 2018 at 02:50:01PM +0100, Geert Uytterhoeven wrote:
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

> ---
>  include/linux/mfd/tmio.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/linux/mfd/tmio.h b/include/linux/mfd/tmio.h
> index 1e70060c92ce0a11..aa696bcb1d12e750 100644
> --- a/include/linux/mfd/tmio.h
> +++ b/include/linux/mfd/tmio.h
> @@ -83,7 +83,7 @@
>  /* Some controllers have a CBSY bit */
>  #define TMIO_MMC_HAVE_CBSY		BIT(11)
>  
> -/* Some controllers that support HS400 use use 4 taps while others use 8. */
> +/* Some controllers that support HS400 use 4 taps while others use 8. */
>  #define TMIO_MMC_HAVE_4TAP_HS400	BIT(13)
>  
>  int tmio_core_mmc_enable(void __iomem *cnf, int shift, unsigned long base);
> -- 
> 2.17.1
> 
