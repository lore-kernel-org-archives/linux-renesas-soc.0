Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:40910 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752331AbdHGIzY (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 7 Aug 2017 04:55:24 -0400
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: David Airlie <airlied@linux.ie>,
        Archit Taneja <architt@codeaurora.org>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Russell King <rmk+kernel@armlinux.org.uk>,
        Mark Brown <broonie@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux-Kernel <linux-kernel@vger.kernel.org>,
        Jose Abreu <joabreu@synopsys.com>,
        dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2] drm: dw-hdmi-i2s: add missing company name on Copyright
Date: Mon, 07 Aug 2017 11:55:36 +0300
Message-ID: <1907475.QQHEzZqjT4@avalon>
In-Reply-To: <87tw1khvnq.wl%kuninori.morimoto.gx@renesas.com>
References: <87tw1khvnq.wl%kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Morimoto-san,

Thank you for the patch.

On Monday 07 Aug 2017 04:09:41 Kuninori Morimoto wrote:
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> 
> This driver's Copyright is under Renesas Solutions Corp.
> This patch updates the year, because this driver was moved
> into synopsys folder in 2017.
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
> v1 -> v2
> 
>  - update year 2016 -> 2017
> 
>  drivers/gpu/drm/bridge/synopsys/dw-hdmi-i2s-audio.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-i2s-audio.c
> b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-i2s-audio.c index
> b2cf59f..3b7e5c5 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-i2s-audio.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-i2s-audio.c
> @@ -1,7 +1,8 @@
>  /*
>   * dw-hdmi-i2s-audio.c
>   *
> - * Copyright (c) 2016 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> + * Copyright (c) 2017 Renesas Solutions Corp.
> + * Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

What does this mean ? The first line makes it clear that you want to assign 
copyright ownership to Renesas for the work you've done on this driver. The 
second line, however, isn't very clear. If you want to list your e-mail 
address as an author or contact person, you should make that explicit:

 * Author: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

or

 * Contact: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Or it could be that you have joint copyright ownership with Renesas, or own 
parts of the copyright yourself, in which case it should be

 * Copyright (c) 2017 Renesas Solutions Corp.
 * Copyright (c) 2017 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

>   *
>   * This program is free software; you can redistribute it and/or modify
>   * it under the terms of the GNU General Public License version 2 as

-- 
Regards,

Laurent Pinchart
