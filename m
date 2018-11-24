Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf1-f66.google.com ([209.85.167.66]:32930 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726395AbeKYHdk (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 25 Nov 2018 02:33:40 -0500
Received: by mail-lf1-f66.google.com with SMTP id i26so10853288lfc.0
        for <linux-renesas-soc@vger.kernel.org>; Sat, 24 Nov 2018 12:44:24 -0800 (PST)
MIME-Version: 1.0
References: <20181115221634.22715-1-greenfoo@gluegarage.com>
 <20181115221634.22715-4-greenfoo@gluegarage.com> <1542363310.23489.22.camel@pengutronix.de>
 <1542387884.1134874.1579436592.07F916C5@webmail.messagingengine.com>
In-Reply-To: <1542387884.1134874.1579436592.07F916C5@webmail.messagingengine.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sat, 24 Nov 2018 21:44:11 +0100
Message-ID: <CACRpkda1FJOzBn42=7GgExA3fdNJabc_=JUba4y7k34uy9tsKA@mail.gmail.com>
Subject: Re: [PATCH 3/9] drm: replace "drm_dev_unref" function with "drm_dev_put"
To: greenfoo@gluegarage.com
Cc: Lucas Stach <l.stach@pengutronix.de>,
        "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
        Haneen Mohammed <hamohammed.sa@gmail.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Gilles Muller <Gilles.Muller@lip6.fr>,
        Dave Airlie <airlied@linux.ie>,
        virtualization@lists.linux-foundation.org,
        Gerd Hoffmann <kraxel@redhat.com>, cocci@systeme.lip6.fr,
        Marek Vasut <marex@denx.de>, Jonathan Corbet <corbet@lwn.net>,
        linux-doc@vger.kernel.org, abrodkin@synopsys.com,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Ludovic Desroches <ludovic.desroches@microchip.com>,
        linux+etnaviv@armlinux.org.uk,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Nicolas Palix <nicolas.palix@imag.fr>,
        etnaviv@lists.freedesktop.org, Julia Lawall <Julia.Lawall@lip6.fr>,
        sean@poorly.run, Linux ARM <linux-arm-kernel@lists.infradead.org>,
        michal.lkml@markovi.net,
        Boris Brezillon <boris.brezillon@bootlin.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        kieran.bingham+renesas@ideasonboard.com,
        Shawn Guo <shawnguo@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Fri, Nov 16, 2018 at 6:04 PM Fernando <greenfoo@gluegarage.com> wrote:

> I'm new on this, how should I proceed? Should I create a new (V2) patch series with
> these changes reverted? Or will the maintainer automatically take care
> of this when merging?

I fixed it :) I think. At least I hope I didn't do something bad.

Yours,
Linus Walleij
