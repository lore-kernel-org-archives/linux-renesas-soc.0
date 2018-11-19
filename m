Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail.bootlin.com ([62.4.15.54]:54478 "EHLO mail.bootlin.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2390118AbeKTDTi (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 19 Nov 2018 22:19:38 -0500
Date: Mon, 19 Nov 2018 17:55:11 +0100
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
Subject: Re: [PATCH v3] drm/bridge/sii902x: Add missing dependency on
 I2C_MUX
Message-ID: <20181119175511.3992cf03@bbrezillon>
In-Reply-To: <1542633978-22064-1-git-send-email-fabrizio.castro@bp.renesas.com>
References: <1542633978-22064-1-git-send-email-fabrizio.castro@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Fabrizio,

On Mon, 19 Nov 2018 13:26:18 +0000
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
> Fixes: 21d808405fe4 ("drm/bridge/sii902x: Fix EDID readback")
> Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> Link: https://lists.01.org/pipermail/kbuild-all/2018-November/054924.html

I don't see the patch on the dri-devel ML, and it does not appear in
patchwork either :-/.

> ---
> v2->v3:
> * Changed the title
> 
> v1->v2:
> * Added "Fixes" tag
> 
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
