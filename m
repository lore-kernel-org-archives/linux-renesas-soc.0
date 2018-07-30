Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wm0-f68.google.com ([74.125.82.68]:56089 "EHLO
        mail-wm0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726463AbeG3JqV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 30 Jul 2018 05:46:21 -0400
Received: by mail-wm0-f68.google.com with SMTP id f21-v6so12073415wmc.5
        for <linux-renesas-soc@vger.kernel.org>; Mon, 30 Jul 2018 01:12:32 -0700 (PDT)
Subject: Re: [PATCH] thermal: rcar_gen3_thermal: convert to SPDX identifiers
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Zhang Rui <rui.zhang@intel.com>,
        Eduardo Valentin <edubezval@gmail.com>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-pm@vger.kernel.org
References: <87h8khkvp4.wl-kuninori.morimoto.gx@renesas.com>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
Message-ID: <1a82178e-6d7b-afaa-c8cb-aa609ae709f9@linaro.org>
Date: Mon, 30 Jul 2018 10:12:19 +0200
MIME-Version: 1.0
In-Reply-To: <87h8khkvp4.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 30/07/2018 09:57, Kuninori Morimoto wrote:
> 
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Reviewed-by: Daniel Lezcano <daniel.lezcano@linaro.org>

Adding Cc: Philippe Ombredanne <pombredanne@nexb.com>

> ---
>  drivers/thermal/rcar_gen3_thermal.c | 11 +----------
>  1 file changed, 1 insertion(+), 10 deletions(-)
> 
> diff --git a/drivers/thermal/rcar_gen3_thermal.c b/drivers/thermal/rcar_gen3_thermal.c
> index 766521e..7aed533 100644
> --- a/drivers/thermal/rcar_gen3_thermal.c
> +++ b/drivers/thermal/rcar_gen3_thermal.c
> @@ -1,19 +1,10 @@
> +// SPDX-License-Identifier: GPL-2.0
>  /*
>   *  R-Car Gen3 THS thermal sensor driver
>   *  Based on rcar_thermal.c and work from Hien Dang and Khiem Nguyen.
>   *
>   * Copyright (C) 2016 Renesas Electronics Corporation.
>   * Copyright (C) 2016 Sang Engineering
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
>   */
>  #include <linux/delay.h>
>  #include <linux/err.h>
> 


-- 
 <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
