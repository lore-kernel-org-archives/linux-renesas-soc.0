Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lj1-f193.google.com ([209.85.208.193]:40290 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726179AbeKYH1h (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 25 Nov 2018 02:27:37 -0500
Received: by mail-lj1-f193.google.com with SMTP id n18-v6so13268601lji.7
        for <linux-renesas-soc@vger.kernel.org>; Sat, 24 Nov 2018 12:38:22 -0800 (PST)
MIME-Version: 1.0
References: <20181115221634.22715-1-greenfoo@gluegarage.com> <20181115221634.22715-2-greenfoo@gluegarage.com>
In-Reply-To: <20181115221634.22715-2-greenfoo@gluegarage.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sat, 24 Nov 2018 21:38:09 +0100
Message-ID: <CACRpkda9HhODvWgsUb_ErFVpJ_o3frp-xz_Syvzh0yJRw8US8g@mail.gmail.com>
Subject: Re: [PATCH 1/9] drm: replace "drm_gem_object_unreference_unlocked"
 function with "*put_unlocked"
To: greenfoo@gluegarage.com
Cc: "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
        Dave Airlie <airlied@linux.ie>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <maxime.ripard@bootlin.com>, sean@poorly.run,
        Jonathan Corbet <corbet@lwn.net>, abrodkin@synopsys.com,
        Boris Brezillon <boris.brezillon@bootlin.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Ludovic Desroches <ludovic.desroches@microchip.com>,
        Gerd Hoffmann <kraxel@redhat.com>,
        Archit Taneja <architt@codeaurora.org>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Lucas Stach <l.stach@pengutronix.de>,
        linux+etnaviv@armlinux.org.uk,
        Christian Gmeiner <christian.gmeiner@gmail.com>,
        Marek Vasut <marex@denx.de>, Stefan Agner <stefan@agner.ch>,
        kieran.bingham+renesas@ideasonboard.com,
        Shawn Guo <shawnguo@kernel.org>,
        Julia Lawall <Julia.Lawall@lip6.fr>,
        Gilles Muller <Gilles.Muller@lip6.fr>,
        Nicolas Palix <nicolas.palix@imag.fr>, michal.lkml@markovi.net,
        Haneen Mohammed <hamohammed.sa@gmail.com>,
        linux-doc@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        virtualization@lists.linux-foundation.org,
        etnaviv@lists.freedesktop.org,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        cocci@systeme.lip6.fr
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, Nov 15, 2018 at 11:17 PM Fernando Ramos <greenfoo@gluegarage.com> wrote:

> This patch unifies the naming of DRM functions for reference counting as
> requested on Documentation/gpu/todo.rst
>
> Signed-off-by: Fernando Ramos <greenfoo@gluegarage.com>

This is already fixed in drm-misc-next as it happens:

commit a0d4d42cb5854400baa47bf63d9aae65fa9f484e
Author: Thomas Zimmermann <tzimmermann@suse.de>
Date:   Wed Sep 26 13:36:23 2018 +0200

    drm/bochs: Replace drm_commit a0d4d42cb5854400baa47bf63d9aae65fa9f484e
Author: Thomas Zimmermann <tzimmermann@suse.de>
Date:   Wed Sep 26 13:36:23 2018 +0200

    drm/bochs: Replace drm_gem_object_unreference_unlocked with put function

    This patch unifies the naming of DRM functions for reference counting
    of struct drm_gem_object. The resulting code is more aligned with the
    rest of the Linux kernel interfaces.

    v2:
            * rebase onto fbdev rework

    Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
    Link: http://patchwork.freedesktop.org/patch/msgid/20180926113623.22679-1-tzimmermann@suse.de
    Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
gem_object_unreference_unlocked with put function

    This patch unifies the naming of DRM functions for reference counting
    of struct drm_gem_object. The resulting code is more aligned with the
    rest of the Linux kernel interfaces.

    v2:
            * rebase onto fbdev rework

    Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
    Link: http://patchwork.freedesktop.org/patch/msgid/20180926113623.22679-1-tzimmermann@suse.de
    Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>

Going on to try and apply the rest.

Yours,
Linus Walleij
