Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:59740 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751009AbdLAHCj (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 1 Dec 2017 02:02:39 -0500
Date: Fri, 1 Dec 2017 08:02:33 +0100
From: Simon Horman <horms@verge.net.au>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-pm@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Paul Gortmaker <paul.gortmaker@windriver.com>,
        Kevin Hilman <khilman@linaro.org>,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] bus: simple-pm-bus: convert bool SIMPLE_PM_BUS to
 tristate
Message-ID: <20171201070232.v4uilgo5cydaoyqa@verge.net.au>
References: <1512043020-23452-1-git-send-email-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1512043020-23452-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, Nov 30, 2017 at 12:57:00PM +0100, Geert Uytterhoeven wrote:
> From: Paul Gortmaker <paul.gortmaker@windriver.com>
> 
> The Kconfig currently controlling compilation of this code is:
> 
> config SIMPLE_PM_BUS
>         bool "Simple Power-Managed Bus Driver"
> 
> ...meaning that it currently is not being built as a module by anyone.
> 
> In removing the orphaned modular support in a previous patch set,
> Geert indicated he'd rather see this code converted to tristate.
> 
> I normally don't do that because it extends functionality that I
> can't easily run time test or even know if the use case makes sense,
> but since in this case the author has nominated it as such, we do
> the conversion here.
> 
> Note that doesn't change the lack of run time testing ; this change
> is only tested for sucessful compile and modpost.
> 
> [geert: Ethernet is probed successfully on sh73a0/kzm9g after
>         insmodding simple-pm-bus.ko]
> 
> Cc: Kevin Hilman <khilman@linaro.org>
> Cc: Simon Horman <horms+renesas@verge.net.au>
> Cc: linux-arm-kernel@lists.infradead.org
> Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
> Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Acked-by: Simon Horman <horms+renesas@verge.net.au>

> ---
>  drivers/bus/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/bus/Kconfig b/drivers/bus/Kconfig
> index dc7b3c7b7d42fd09..57e011d36a79fce3 100644
> --- a/drivers/bus/Kconfig
> +++ b/drivers/bus/Kconfig
> @@ -120,7 +120,7 @@ config QCOM_EBI2
>  	  SRAM, ethernet adapters, FPGAs and LCD displays.
>  
>  config SIMPLE_PM_BUS
> -	bool "Simple Power-Managed Bus Driver"
> +	tristate "Simple Power-Managed Bus Driver"
>  	depends on OF && PM
>  	help
>  	  Driver for transparent busses that don't need a real driver, but
> -- 
> 2.7.4
> 
