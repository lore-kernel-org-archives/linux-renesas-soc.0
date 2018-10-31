Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wm1-f67.google.com ([209.85.128.67]:35229 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727858AbeJaKQg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 31 Oct 2018 06:16:36 -0400
Subject: Re: [PATCH 1/2] pinctrl: sh-pfc: r8a7790: initialize TDSEL register
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-gpio@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert@linux-m68k.org>
References: <20181028212457.1017-1-wsa+renesas@sang-engineering.com>
 <20181028212457.1017-2-wsa+renesas@sang-engineering.com>
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <8976b08f-ed27-6e4d-f10d-8ace5c75b8fc@gmail.com>
Date: Wed, 31 Oct 2018 02:19:18 +0100
MIME-Version: 1.0
In-Reply-To: <20181028212457.1017-2-wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 10/28/2018 10:24 PM, Wolfram Sang wrote:
> Documentation says that some bits in TDSEL must be set (ch 5.3.39 in R-Car H2
> v0.91). However, the reset value of the register is 0, so software has to do
> it. Add this to the kernel driver to ensure this is really done independent of
> firmware versions.
> 
> This is needed for some SD cards supporting SDR104 transfer mode. For
> me, TDSEL was not initialized by the firmware and I had problems with
> the card when re-inserting it.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Marek Vasut <marek.vasut@gmail.com>

> ---
>  drivers/pinctrl/sh-pfc/pfc-r8a7790.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a7790.c b/drivers/pinctrl/sh-pfc/pfc-r8a7790.c
> index ab7a35392cd8..c0e679105df9 100644
> --- a/drivers/pinctrl/sh-pfc/pfc-r8a7790.c
> +++ b/drivers/pinctrl/sh-pfc/pfc-r8a7790.c
> @@ -11,6 +11,7 @@
>  #include <linux/io.h>
>  #include <linux/kernel.h>
>  
> +#include "core.h"
>  #include "sh_pfc.h"
>  
>  /*
> @@ -5691,7 +5692,16 @@ static int r8a7790_pin_to_pocctrl(struct sh_pfc *pfc, unsigned int pin, u32 *poc
>  	return 31 - (pin & 0x1f);
>  }
>  
> +static int r8a7790_pinmux_soc_init(struct sh_pfc *pfc)
> +{
> +	/* Initialize TDSEL according to datasheet */
> +	sh_pfc_write(pfc, 0xe6060088, 0x00155554);
> +
> +	return 0;
> +}
> +
>  static const struct sh_pfc_soc_operations r8a7790_pinmux_ops = {
> +	.init = r8a7790_pinmux_soc_init,
>  	.pin_to_pocctrl = r8a7790_pin_to_pocctrl,
>  };
>  
> 


-- 
Best regards,
Marek Vasut
