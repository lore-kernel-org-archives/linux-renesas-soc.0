Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from out5-smtp.messagingengine.com ([66.111.4.29]:59835 "EHLO
        out5-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725888AbeKPI0p (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 16 Nov 2018 03:26:45 -0500
From: Fernando Ramos <greenfoo@gluegarage.com>
To: dri-devel@lists.freedesktop.org
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Jonathan Corbet <corbet@lwn.net>,
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
        Shawn Guo <shawnguo@kernel.org>,
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
Subject: [PATCH 0/9] drm: remove deprecated functions
Date: Thu, 15 Nov 2018 23:16:20 +0100
Message-Id: <20181115221634.22715-1-greenfoo@gluegarage.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi all,

One of the things in the DRM TODO list ("Documentation/gpu/todo.rst") was to
"switch from reference/unreference to get/put". That's what this patch series is
about.

In the past year or so most of the functions had already been renamed and only a
few remained, which are the ones I fix here.

In addition, now that all calls to these deprecated functions are gone, this
patch also removes their implementation and the coccinelle script that takes
care of them (which is no longer needed).

Anyway, this is my first patch and I'm sure I've done something wrong. Please
let me know :)

Fernando Ramos (9):
  drm: replace "drm_gem_object_unreference_unlocked" function with
    "*put_unlocked"
  drm: remove deprecated "[__]drm_gem_object_[un]reference[_locked]"
    functions
  drm: replace "drm_dev_unref" function with "drm_dev_put"
  drm: remove deprecated "drm_dev_unref" function
  drm: replace "drm_connector_unreference" with "drm_connector_put"
  drm: remove deprecated "drm_connector_[un]reference" functions
  drm: remove deprecated "drm_framebuffer_[un]reference" functions
  drm: remove no longer needed drm-get-put coccinelle script
  docs: drm: remove no longer relevant TODO entry

 Documentation/gpu/todo.rst                   | 17 -----
 drivers/gpu/drm/arc/arcpgu_drv.c             |  4 +-
 drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c |  4 +-
 drivers/gpu/drm/bochs/bochs_mm.c             |  4 +-
 drivers/gpu/drm/bridge/tc358764.c            |  2 +-
 drivers/gpu/drm/drm_drv.c                    | 13 ----
 drivers/gpu/drm/etnaviv/etnaviv_drv.c        |  4 +-
 drivers/gpu/drm/mxsfb/mxsfb_drv.c            |  4 +-
 drivers/gpu/drm/rcar-du/rcar_du_drv.c        |  2 +-
 drivers/gpu/drm/shmobile/shmob_drm_drv.c     |  4 +-
 drivers/gpu/drm/tve200/tve200_drv.c          |  4 +-
 drivers/gpu/drm/zte/zx_drm_drv.c             |  4 +-
 include/drm/drm_connector.h                  | 24 ------
 include/drm/drm_drv.h                        |  1 -
 include/drm/drm_framebuffer.h                | 24 ------
 include/drm/drm_gem.h                        | 50 -------------
 scripts/coccinelle/api/drm-get-put.cocci     | 78 --------------------
 17 files changed, 18 insertions(+), 225 deletions(-)
 delete mode 100644 scripts/coccinelle/api/drm-get-put.cocci

-- 
2.19.1
