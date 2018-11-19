Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:49223 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727728AbeKSVR1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 19 Nov 2018 16:17:27 -0500
Date: Mon, 19 Nov 2018 11:54:07 +0100
From: Simon Horman <horms@verge.net.au>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Linus Walleij <linus.walleij@linaro.org>,
        Ulrich Hecht <uli+renesas@fpond.eu>,
        linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH] pinctrl: sh-pfc: r8a77995: Remove unused
 PINMUX_IPSR_{MSEL2,PHYS}()
Message-ID: <20181119105406.d3u3ayt5ssjp6x34@verge.net.au>
References: <20181119102152.5144-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181119102152.5144-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Mon, Nov 19, 2018 at 11:21:52AM +0100, Geert Uytterhoeven wrote:
> The PINMUX_IPSR_MSEL2() and PINMUX_IPSR_PHYS() macros are unused, and
> will conflict with generic macros that are to be added.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> To be queued in sh-pfc-for-v4.21, before "pinctrl: sh-pfc: Add physical
> pin multiplexing helper macros".

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

> 
>  drivers/pinctrl/sh-pfc/pfc-r8a77995.c | 6 ------
>  1 file changed, 6 deletions(-)
> 
> diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a77995.c b/drivers/pinctrl/sh-pfc/pfc-r8a77995.c
> index 9484eaa8522aec6f..e457539a61c55bb9 100644
> --- a/drivers/pinctrl/sh-pfc/pfc-r8a77995.c
> +++ b/drivers/pinctrl/sh-pfc/pfc-r8a77995.c
> @@ -468,12 +468,6 @@ enum {
>  #undef FM
>  };
>  
> -#define PINMUX_IPSR_MSEL2(ipsr, fn, msel1, msel2) \
> -	PINMUX_DATA(fn##_MARK, FN_##msel1, FN_##msel2, FN_##fn, FN_##ipsr)
> -
> -#define PINMUX_IPSR_PHYS(ipsr, fn, msel) \
> -	PINMUX_DATA(fn##_MARK, FN_##msel)
> -
>  static const u16 pinmux_data[] = {
>  	PINMUX_DATA_GP_ALL(),
>  
> -- 
> 2.17.1
> 
