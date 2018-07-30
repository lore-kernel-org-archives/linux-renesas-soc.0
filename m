Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wm0-f66.google.com ([74.125.82.66]:55233 "EHLO
        mail-wm0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726520AbeG3JoG (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 30 Jul 2018 05:44:06 -0400
Received: by mail-wm0-f66.google.com with SMTP id c14-v6so12067632wmb.4
        for <linux-renesas-soc@vger.kernel.org>; Mon, 30 Jul 2018 01:10:17 -0700 (PDT)
Subject: Re: [PATCH] thermal: rcar_thermal: convert to SPDX identifiers
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Zhang Rui <rui.zhang@intel.com>,
        Eduardo Valentin <edubezval@gmail.com>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-pm@vger.kernel.org,
        Philippe Ombredanne <pombredanne@nexb.com>
References: <87in4xkvra.wl-kuninori.morimoto.gx@renesas.com>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
Message-ID: <5289c2d7-1426-0432-6c64-aa0d5242f268@linaro.org>
Date: Mon, 30 Jul 2018 10:10:05 +0200
MIME-Version: 1.0
In-Reply-To: <87in4xkvra.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 30/07/2018 09:56, Kuninori Morimoto wrote:
> 
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> 
> As original license mentioned, it is GPL-2.0 in SPDX.
> Then, MODULE_LICENSE() should be "GPL v2" instead of "GPL".
> See ${LINUX}/include/linux/module.h
> 
> 	"GPL"           [GNU Public License v2 or later]
> 	"GPL v2"        [GNU Public License v2]
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Reviewed-by: Daniel Lezcano <daniel.lezcano@linaro.org>

Adding Cc: Philippe Ombredanne <pombredanne@nexb.com>



> ---
>  drivers/thermal/rcar_thermal.c | 16 ++--------------
>  1 file changed, 2 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/thermal/rcar_thermal.c b/drivers/thermal/rcar_thermal.c
> index 45fb284..14ab4a9 100644
> --- a/drivers/thermal/rcar_thermal.c
> +++ b/drivers/thermal/rcar_thermal.c
> @@ -1,21 +1,9 @@
> +// SPDX-License-Identifier: GPL-2.0
>  /*
>   *  R-Car THS/TSC thermal sensor driver
>   *
>   * Copyright (C) 2012 Renesas Solutions Corp.
>   * Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> - *
> - *  This program is free software; you can redistribute it and/or modify
> - *  it under the terms of the GNU General Public License as published by
> - *  the Free Software Foundation; version 2 of the License.
> - *
> - *  This program is distributed in the hope that it will be useful, but
> - *  WITHOUT ANY WARRANTY; without even the implied warranty of
> - *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> - *  General Public License for more details.
> - *
> - *  You should have received a copy of the GNU General Public License along
> - *  with this program; if not, write to the Free Software Foundation, Inc.,
> - *  59 Temple Place, Suite 330, Boston, MA 02111-1307 USA.
>   */
>  #include <linux/delay.h>
>  #include <linux/err.h>
> @@ -660,6 +648,6 @@ static struct platform_driver rcar_thermal_driver = {
>  };
>  module_platform_driver(rcar_thermal_driver);
>  
> -MODULE_LICENSE("GPL");
> +MODULE_LICENSE("GPL v2");
>  MODULE_DESCRIPTION("R-Car THS/TSC thermal sensor driver");
>  MODULE_AUTHOR("Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>");
> 


-- 
 <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
