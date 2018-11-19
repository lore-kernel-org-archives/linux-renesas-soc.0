Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail.bootlin.com ([62.4.15.54]:45372 "EHLO mail.bootlin.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728701AbeKSXOi (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 19 Nov 2018 18:14:38 -0500
Date: Mon, 19 Nov 2018 13:51:04 +0100
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc: Peter Rosin <peda@axentia.se>,
        Archit Taneja <architt@codeaurora.org>,
        Andrzej Hajda <a.hajda@samsung.com>,
        David Airlie <airlied@linux.ie>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        dri-devel@lists.freedesktop.org, Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] drm/bridge: Fix 0-day build error
Message-ID: <20181119135104.75a0a075@bbrezillon>
In-Reply-To: <1542631463-21177-1-git-send-email-fabrizio.castro@bp.renesas.com>
References: <1542631463-21177-1-git-send-email-fabrizio.castro@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Fabrizio,

The prefix should be "drm/bridge/sii902x:" and I'd prefer a short
explanation of what is problematic in the subject rather than "Fix
0-day build error". Maybe something like

"drm/bridge/sii902x: Add missing dependency on I2C_MUX"

On Mon, 19 Nov 2018 12:44:23 +0000
Fabrizio Castro <fabrizio.castro@bp.renesas.com> wrote:

> kbuild test robot reports:
> 
> >> ERROR: "i2c_mux_add_adapter" [drivers/gpu/drm/bridge/sii902x.ko]  
> undefined!
> >> ERROR: "i2c_mux_alloc" [drivers/gpu/drm/bridge/sii902x.ko]  
> undefined!
> >> ERROR: "i2c_mux_del_adapters" [drivers/gpu/drm/bridge/sii902x.ko]  
> undefined!
> 
> Quite obviously the driver depends on I2C_MUX, but adding a "depends on"
> introduces a recursive dependency, therefore this patch selects I2C_MUX
> instead.
> 

You need a fixes tag here:

Fixes: 21d808405fe4 ("drm/bridge/sii902x: Fix EDID readback")

Thanks,

Boris

> Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> Link: https://lists.01.org/pipermail/kbuild-all/2018-November/054924.html
> ---
>  drivers/gpu/drm/bridge/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
> index 9eeb8ef..2fee47b 100644
> --- a/drivers/gpu/drm/bridge/Kconfig
> +++ b/drivers/gpu/drm/bridge/Kconfig
> @@ -95,6 +95,7 @@ config DRM_SII902X
>  	depends on OF
>  	select DRM_KMS_HELPER
>  	select REGMAP_I2C
> +	select I2C_MUX
>  	---help---
>  	  Silicon Image sii902x bridge chip driver.
>  
