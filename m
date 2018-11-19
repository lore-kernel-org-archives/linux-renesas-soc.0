Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:52068 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728676AbeKSWhZ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 19 Nov 2018 17:37:25 -0500
Date: Mon, 19 Nov 2018 20:13:28 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: Fernando Ramos <greenfoo@gluegarage.com>
Cc: dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Sean Paul <sean@poorly.run>, Jonathan Corbet <corbet@lwn.net>,
        Alexey Brodkin <abrodkin@synopsys.com>,
        Boris Brezillon <boris.brezillon@bootlin.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Ludovic Desroches <ludovic.desroches@microchip.com>,
        Gerd Hoffmann <kraxel@redhat.com>,
        Archit Taneja <architt@codeaurora.org>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Lucas Stach <l.stach@pengutronix.de>,
        Russell King <linux+etnaviv@armlinux.org.uk>,
        Christian Gmeiner <christian.gmeiner@gmail.com>,
        Marek Vasut <marex@denx.de>, Stefan Agner <stefan@agner.ch>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Julia Lawall <Julia.Lawall@lip6.fr>,
        Gilles Muller <Gilles.Muller@lip6.fr>,
        Nicolas Palix <nicolas.palix@imag.fr>,
        Michal Marek <michal.lkml@markovi.net>,
        Haneen Mohammed <hamohammed.sa@gmail.com>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        virtualization@lists.linux-foundation.org,
        etnaviv@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        cocci@systeme.lip6.fr
Subject: Re: [PATCH 3/9] drm: replace "drm_dev_unref" function with
 "drm_dev_put"
Message-ID: <20181119121327.GS5829@dragon>
References: <20181115221634.22715-1-greenfoo@gluegarage.com>
 <20181115221634.22715-4-greenfoo@gluegarage.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181115221634.22715-4-greenfoo@gluegarage.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, Nov 15, 2018 at 11:16:23PM +0100, Fernando Ramos wrote:
> This patch unifies the naming of DRM functions for reference counting as
> requested on Documentation/gpu/todo.rst
> 
> Signed-off-by: Fernando Ramos <greenfoo@gluegarage.com>
> ---
>  drivers/gpu/drm/arc/arcpgu_drv.c             | 4 ++--
>  drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c | 4 ++--
>  drivers/gpu/drm/etnaviv/etnaviv_drv.c        | 4 ++--
>  drivers/gpu/drm/mxsfb/mxsfb_drv.c            | 4 ++--
>  drivers/gpu/drm/rcar-du/rcar_du_drv.c        | 2 +-
>  drivers/gpu/drm/shmobile/shmob_drm_drv.c     | 4 ++--
>  drivers/gpu/drm/tve200/tve200_drv.c          | 4 ++--
>  drivers/gpu/drm/zte/zx_drm_drv.c             | 4 ++--

We have already queued a patch [1] from Thomas Zimmermann for
zx_drm_drv.

Shawn

[1] https://patchwork.kernel.org/patch/10615837/
