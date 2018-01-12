Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f66.google.com ([209.85.215.66]:36171 "EHLO
        mail-lf0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S964847AbeALUVD (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 12 Jan 2018 15:21:03 -0500
Received: by mail-lf0-f66.google.com with SMTP id e203so7215464lfg.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 12 Jan 2018 12:21:03 -0800 (PST)
Subject: Re: [PATCH 1/2] drm: rcar-du: lvds: fix LVDS startup on R-Car gen3
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        David Airlie <airlied@linux.ie>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
References: <20180112201550.368547609@cogentembedded.com>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <e7809d50-9f31-7882-d878-7f712f448ea0@cogentembedded.com>
Date: Fri, 12 Jan 2018 23:21:00 +0300
MIME-Version: 1.0
In-Reply-To: <20180112201550.368547609@cogentembedded.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 01/12/2018 11:12 PM, Sergei Shtylyov wrote:

> According to the latest revisions of the R-Car gen3 manual, the LVDS mode
> must be set before the LVDS I/O pins are enabled, not after --  fix  the
> gen3 LVDS startup sequence accordingly...
> 
> While  at it,  also fix the comment  preceding the first LVDCR0 write in
> the R-Car gen2 startup code that still talks about hardcoding the LVDS
> mode 0...
> 
> Fixes: e947eccbeba4 ("drm: rcar-du: Add support for LVDS mode selection")
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> 
> ---
>  drivers/gpu/drm/rcar-du/rcar_du_lvdsenc.c |   10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
> 
> Index: linux/drivers/gpu/drm/rcar-du/rcar_du_lvdsenc.c
> ===================================================================
> --- linux.orig/drivers/gpu/drm/rcar-du/rcar_du_lvdsenc.c
> +++ linux/drivers/gpu/drm/rcar-du/rcar_du_lvdsenc.c
[...]
> @@ -115,7 +118,8 @@ static void rcar_du_lvdsenc_start_gen3(s
>  	 * Turn the PLL on, set it to LVDS normal mode, wait for the startup
>  	 * delay and turn the output on.
>  	 */
> -	lvdcr0 = (lvds->mode << LVDCR0_LVMD_SHIFT) | LVDCR0_PLLON;
> +
> +	lvdcr0 = | LVDCR0_PLLON;

    Dunno how it slipped in -- I've surely built and tested the resulting 
kernel... should be |=, of course. Laurent, should I repost?

[...]

MBR, Sergei
