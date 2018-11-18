Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail2-relais-roc.national.inria.fr ([192.134.164.83]:38576 "EHLO
        mail2-relais-roc.national.inria.fr" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726077AbeKRVYU (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 18 Nov 2018 16:24:20 -0500
Date: Sun, 18 Nov 2018 12:04:04 +0100 (CET)
From: Julia Lawall <julia.lawall@lip6.fr>
To: Fernando Ramos <greenfoo@gluegarage.com>
cc: dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
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
Subject: Re: [PATCH 8/9] drm: remove no longer needed drm-get-put coccinelle
 script
In-Reply-To: <20181115221634.22715-9-greenfoo@gluegarage.com>
Message-ID: <alpine.DEB.2.21.1811181203410.3530@hadrien>
References: <20181115221634.22715-1-greenfoo@gluegarage.com> <20181115221634.22715-9-greenfoo@gluegarage.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>



On Thu, 15 Nov 2018, Fernando Ramos wrote:

> The coccinelle script was used to rename some (deprecated) functions
> which no longer exist now.
>
> Signed-off-by: Fernando Ramos <greenfoo@gluegarage.com>

Acked-by: Julia Lawall <julia.lawall@lip6.fr>


> ---
>  scripts/coccinelle/api/drm-get-put.cocci | 78 ------------------------
>  1 file changed, 78 deletions(-)
>  delete mode 100644 scripts/coccinelle/api/drm-get-put.cocci
>
> diff --git a/scripts/coccinelle/api/drm-get-put.cocci b/scripts/coccinelle/api/drm-get-put.cocci
> deleted file mode 100644
> index 3a09c97ad87d..000000000000
> --- a/scripts/coccinelle/api/drm-get-put.cocci
> +++ /dev/null
> @@ -1,78 +0,0 @@
> -// SPDX-License-Identifier: GPL-2.0
> -///
> -/// Use drm_*_get() and drm_*_put() helpers instead of drm_*_reference() and
> -/// drm_*_unreference() helpers.
> -///
> -// Confidence: High
> -// Copyright: (C) 2017 NVIDIA Corporation
> -// Options: --no-includes --include-headers
> -//
> -
> -virtual patch
> -virtual report
> -
> -@depends on patch@
> -expression object;
> -@@
> -
> -(
> -- drm_connector_reference(object)
> -+ drm_connector_get(object)
> -|
> -- drm_connector_unreference(object)
> -+ drm_connector_put(object)
> -|
> -- drm_framebuffer_reference(object)
> -+ drm_framebuffer_get(object)
> -|
> -- drm_framebuffer_unreference(object)
> -+ drm_framebuffer_put(object)
> -|
> -- drm_gem_object_reference(object)
> -+ drm_gem_object_get(object)
> -|
> -- drm_gem_object_unreference(object)
> -+ drm_gem_object_put(object)
> -|
> -- __drm_gem_object_unreference(object)
> -+ __drm_gem_object_put(object)
> -|
> -- drm_gem_object_unreference_unlocked(object)
> -+ drm_gem_object_put_unlocked(object)
> -|
> -- drm_dev_unref(object)
> -+ drm_dev_put(object)
> -)
> -
> -@r depends on report@
> -expression object;
> -position p;
> -@@
> -
> -(
> -drm_connector_unreference@p(object)
> -|
> -drm_connector_reference@p(object)
> -|
> -drm_framebuffer_unreference@p(object)
> -|
> -drm_framebuffer_reference@p(object)
> -|
> -drm_gem_object_unreference@p(object)
> -|
> -drm_gem_object_reference@p(object)
> -|
> -__drm_gem_object_unreference(object)
> -|
> -drm_gem_object_unreference_unlocked(object)
> -|
> -drm_dev_unref@p(object)
> -)
> -
> -@script:python depends on report@
> -object << r.object;
> -p << r.p;
> -@@
> -
> -msg="WARNING: use get/put helpers to reference and dereference %s" % (object)
> -coccilib.report.print_report(p[0], msg)
> --
> 2.19.1
>
>
