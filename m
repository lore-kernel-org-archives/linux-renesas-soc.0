Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf1-f66.google.com ([209.85.167.66]:34264 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726344AbeG3Jzq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 30 Jul 2018 05:55:46 -0400
Received: by mail-lf1-f66.google.com with SMTP id n96-v6so7512255lfi.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 30 Jul 2018 01:21:54 -0700 (PDT)
Date: Mon, 30 Jul 2018 10:21:52 +0200
From: Niklas =?iso-8859-1?Q?S=F6derlund?=
        <niklas.soderlund@ragnatech.se>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Zhang Rui <rui.zhang@intel.com>,
        Eduardo Valentin <edubezval@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-pm@vger.kernel.org
Subject: Re: [PATCH] thermal: rcar_gen3_thermal: convert to SPDX identifiers
Message-ID: <20180730082152.GC2867@bigcity.dyn.berto.se>
References: <87h8khkvp4.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87h8khkvp4.wl-kuninori.morimoto.gx@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Morimoto-san,

Thanks for your patch.

On 2018-07-30 07:57:22 +0000, Kuninori Morimoto wrote:
> 
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Reviewed-by: Niklas S�derlund <niklas.soderlund+renesas@ragnatech.se>

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
> -- 
> 2.7.4
> 

-- 
Regards,
Niklas S�derlund
