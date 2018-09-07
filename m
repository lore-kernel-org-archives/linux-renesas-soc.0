Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lj1-f195.google.com ([209.85.208.195]:42682 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727093AbeIGNpK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 7 Sep 2018 09:45:10 -0400
Received: by mail-lj1-f195.google.com with SMTP id f1-v6so11651729ljc.9
        for <linux-renesas-soc@vger.kernel.org>; Fri, 07 Sep 2018 02:05:10 -0700 (PDT)
Subject: Re: [PATCH] ethernet: renesas: convert to SPDX identifiers
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        "David S. Miller" <davem@davemloft.net>,
        Mark Brown <broonie@kernel.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
        Robin Murphy <robin.murphy@arm.com>, netdev@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
References: <875zziqdem.wl-kuninori.morimoto.gx@renesas.com>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <d55d4d25-9966-cf34-7258-97009a9fa5ce@cogentembedded.com>
Date: Fri, 7 Sep 2018 12:05:08 +0300
MIME-Version: 1.0
In-Reply-To: <875zziqdem.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello!

On 9/7/2018 5:02 AM, Kuninori Morimoto wrote:

> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> 
> This patch updates license to use SPDX-License-Identifier
> instead of verbose license text.
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
>   drivers/net/ethernet/renesas/Kconfig    | 1 +
>   drivers/net/ethernet/renesas/Makefile   | 1 +
>   drivers/net/ethernet/renesas/ravb_ptp.c | 6 +-----
>   3 files changed, 3 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/net/ethernet/renesas/Kconfig b/drivers/net/ethernet/renesas/Kconfig
> index f3f7477..bb0ebdf 100644
> --- a/drivers/net/ethernet/renesas/Kconfig
> +++ b/drivers/net/ethernet/renesas/Kconfig
> @@ -1,3 +1,4 @@
> +# SPDX-License-Identifier: GPL-2.0
>   #
>   # Renesas device configuration
>   #

    There was no license at all on this file...

> diff --git a/drivers/net/ethernet/renesas/Makefile b/drivers/net/ethernet/renesas/Makefile
> index a05102a..f21ab8c 100644
> --- a/drivers/net/ethernet/renesas/Makefile
> +++ b/drivers/net/ethernet/renesas/Makefile
> @@ -1,3 +1,4 @@
> +# SPDX-License-Identifier: GPL-2.0
>   #
>   # Makefile for the Renesas device drivers.
>   #

    Likewise.

> diff --git a/drivers/net/ethernet/renesas/ravb_ptp.c b/drivers/net/ethernet/renesas/ravb_ptp.c
> index eede70e..0721b5c 100644
> --- a/drivers/net/ethernet/renesas/ravb_ptp.c
> +++ b/drivers/net/ethernet/renesas/ravb_ptp.c
> @@ -1,13 +1,9 @@
> +// SPDX-License-Identifier: GPL-2.0+
>   /* PTP 1588 clock using the Renesas Ethernet AVB
>    *
>    * Copyright (C) 2013-2015 Renesas Electronics Corporation
>    * Copyright (C) 2015 Renesas Solutions Corp.
>    * Copyright (C) 2015-2016 Cogent Embedded, Inc. <source@cogentembedded.com>
> - *
> - *  This program is free software; you can redistribute it and/or modify
> - *  it under the terms of the GNU General Public License as published by
> - *  the Free Software Foundation; either version 2 of the License, or
> - *  (at your option) any later version.
>    */
>   
>   #include "ravb.h"

    This part looks valid, don't know why this file was missed by Wolfram who 
did the previous patch...

MBR, Sergei
