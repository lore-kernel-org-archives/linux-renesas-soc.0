Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from smtp.codeaurora.org ([198.145.29.96]:55430 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750751AbdHGEOJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 7 Aug 2017 00:14:09 -0400
Subject: Re: [PATCH v2] drm: dw-hdmi-i2s: add missing company name on
 Copyright
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        David Airlie <airlied@linux.ie>,
        Andrzej Hajda <a.hajda@samsung.com>
Cc: Russell King <rmk+kernel@armlinux.org.uk>,
        Mark Brown <broonie@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux-Kernel <linux-kernel@vger.kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jose Abreu <joabreu@synopsys.com>,
        dri-devel@lists.freedesktop.org
References: <87tw1khvnq.wl%kuninori.morimoto.gx@renesas.com>
From: Archit Taneja <architt@codeaurora.org>
Message-ID: <eee05d74-7f7c-8df6-ce1e-1146823da203@codeaurora.org>
Date: Mon, 7 Aug 2017 09:44:03 +0530
MIME-Version: 1.0
In-Reply-To: <87tw1khvnq.wl%kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>



On 08/07/2017 09:39 AM, Kuninori Morimoto wrote:
> 
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> 
> This driver's Copyright is under Renesas Solutions Corp.
> This patch updates the year, because this driver was moved
> into synopsys folder in 2017.

Thanks. Queued to drm-misc-next.

Archit

> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
> v1 -> v2
> 
>   - update year 2016 -> 2017
> 
>   drivers/gpu/drm/bridge/synopsys/dw-hdmi-i2s-audio.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-i2s-audio.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-i2s-audio.c
> index b2cf59f..3b7e5c5 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-i2s-audio.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-i2s-audio.c
> @@ -1,7 +1,8 @@
>   /*
>    * dw-hdmi-i2s-audio.c
>    *
> - * Copyright (c) 2016 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> + * Copyright (c) 2017 Renesas Solutions Corp.
> + * Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
>    *
>    * This program is free software; you can redistribute it and/or modify
>    * it under the terms of the GNU General Public License version 2 as
> 

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
