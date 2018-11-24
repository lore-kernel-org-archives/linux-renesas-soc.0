Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf1-f66.google.com ([209.85.167.66]:43128 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726238AbeKYHgy (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 25 Nov 2018 02:36:54 -0500
Received: by mail-lf1-f66.google.com with SMTP id u18so10844946lff.10
        for <linux-renesas-soc@vger.kernel.org>; Sat, 24 Nov 2018 12:47:37 -0800 (PST)
MIME-Version: 1.0
References: <20181115221634.22715-1-greenfoo@gluegarage.com> <20181115221634.22715-6-greenfoo@gluegarage.com>
In-Reply-To: <20181115221634.22715-6-greenfoo@gluegarage.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sat, 24 Nov 2018 21:47:25 +0100
Message-ID: <CACRpkdbUK-Xx4XfLPAzJdH_R_JADFDxKkvQLiYeZyd6sJ02Pzw@mail.gmail.com>
Subject: Re: [PATCH 5/9] drm: replace "drm_connector_unreference" with "drm_connector_put"
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

Patch applied.

Yours,
Linus Walleij
