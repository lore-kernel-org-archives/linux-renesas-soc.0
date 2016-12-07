Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wj0-f193.google.com ([209.85.210.193]:34533 "EHLO
        mail-wj0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750960AbcLGAkA (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 6 Dec 2016 19:40:00 -0500
Date: Tue, 6 Dec 2016 16:39:57 -0800
From: Eduardo Valentin <edubezval@gmail.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-pm@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Zhang Rui <rui.zhang@intel.com>,
        Khiem Nguyen <khiem.nguyen.xt@renesas.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@gmail.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v4 5/4] thermal: rcar_gen3_thermal: restrict to 64BIT
Message-ID: <20161207003956.GA12562@localhost.localdomain>
References: <20161201220442.22057-1-wsa+renesas@sang-engineering.com>
 <20161202204422.21832-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20161202204422.21832-1-wsa+renesas@sang-engineering.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Fri, Dec 02, 2016 at 09:44:22PM +0100, Wolfram Sang wrote:
> COMPILE_TEST triggers problems on 32 bit machines, so limit this driver
> to 64BIT for now. This is no loss because the hardware is only available
> on 64 bit SoCs anyhow. After we obtained more data from the hardware
> engineers, we will refactor the code to be usable with COMPILE_TEST.
> 

Don't you want to fold this one into patch 2 and mention the limitation
on that patch's commit log?

> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
> 
> buildbot reported the problem and seems to be happy now.
> 
>  drivers/thermal/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/thermal/Kconfig b/drivers/thermal/Kconfig
> index 3912d24a07b10f..edaed1282791bf 100644
> --- a/drivers/thermal/Kconfig
> +++ b/drivers/thermal/Kconfig
> @@ -247,7 +247,7 @@ config RCAR_THERMAL
>  
>  config RCAR_GEN3_THERMAL
>  	tristate "Renesas R-Car Gen3 thermal driver"
> -	depends on ARCH_RENESAS || COMPILE_TEST
> +	depends on ARCH_RENESAS && 64BIT
>  	depends on HAS_IOMEM
>  	depends on OF
>  	help
> -- 
> 2.10.2
> 
