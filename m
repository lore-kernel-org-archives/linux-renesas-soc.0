Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wr1-f68.google.com ([209.85.221.68]:41465 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727858AbeJaKQl (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 31 Oct 2018 06:16:41 -0400
Subject: Re: [PATCH 2/2] pinctrl: sh-pfc: r8a7794: initialize TDSEL register
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-gpio@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert@linux-m68k.org>
References: <20181028212457.1017-1-wsa+renesas@sang-engineering.com>
 <20181028212457.1017-3-wsa+renesas@sang-engineering.com>
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <84070373-d11f-d10c-7d41-abd91c762bb7@gmail.com>
Date: Wed, 31 Oct 2018 02:19:29 +0100
MIME-Version: 1.0
In-Reply-To: <20181028212457.1017-3-wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 10/28/2018 10:24 PM, Wolfram Sang wrote:
> Documentation says that some bits in TDSEL must be set (ch 5.3.35 in
> R-Car E2 v0.5). However, the reset value of the register is 0, so
> software has to do it. Add this to the kernel driver to ensure this is
> really done independent of firmware versions. This is needed for some SD
> cards supporting SDR104 transfer mode.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Marek Vasut <marek.vasut@gmail.com>

> ---
>  drivers/pinctrl/sh-pfc/pfc-r8a7794.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a7794.c b/drivers/pinctrl/sh-pfc/pfc-r8a7794.c
> index 6d1e5fdc03f8..8a16053d2bec 100644
> --- a/drivers/pinctrl/sh-pfc/pfc-r8a7794.c
> +++ b/drivers/pinctrl/sh-pfc/pfc-r8a7794.c
> @@ -5560,7 +5560,16 @@ static int r8a7794_pin_to_pocctrl(struct sh_pfc *pfc, unsigned int pin, u32 *poc
>  	return -EINVAL;
>  }
>  
> +static int r8a7794_pinmux_soc_init(struct sh_pfc *pfc)
> +{
> +	/* Initialize TDSEL according to datasheet */
> +	sh_pfc_write(pfc, 0xe6060068, 0x55555500);
> +
> +	return 0;
> +}
> +
>  static const struct sh_pfc_soc_operations r8a7794_pinmux_ops = {
> +	.init = r8a7794_pinmux_soc_init,
>  	.pin_to_pocctrl = r8a7794_pin_to_pocctrl,
>  };
>  
> 


-- 
Best regards,
Marek Vasut
