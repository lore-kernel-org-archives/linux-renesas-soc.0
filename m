Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lj1-f195.google.com ([209.85.208.195]:36456 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726229AbeKYIGq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 25 Nov 2018 03:06:46 -0500
Received: by mail-lj1-f195.google.com with SMTP id g11-v6so13327125ljk.3
        for <linux-renesas-soc@vger.kernel.org>; Sat, 24 Nov 2018 13:17:26 -0800 (PST)
MIME-Version: 1.0
References: <20181115221634.22715-1-greenfoo@gluegarage.com>
 <CACRpkdZmTSo02yQeU=qe9WyJMXEq76CNmc2kkFEHuwdo=HKPJw@mail.gmail.com> <20181121094233.GN4266@phenom.ffwll.local>
In-Reply-To: <20181121094233.GN4266@phenom.ffwll.local>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sat, 24 Nov 2018 22:17:13 +0100
Message-ID: <CACRpkdaXUFwSiQnMqv2WBXr2ytn7kx3CeAuamkj9ZYU1C6bpnw@mail.gmail.com>
Subject: Re: [PATCH 0/9] drm: remove deprecated functions
To: greenfoo@gluegarage.com,
        "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <maxime.ripard@bootlin.com>, sean@poorly.run,
        Dave Airlie <airlied@linux.ie>,
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

On Wed, Nov 21, 2018 at 10:42 AM Daniel Vetter <daniel@ffwll.ch> wrote:
> On Thu, Nov 15, 2018 at 11:38:35PM +0100, Linus Walleij wrote:
> > On Thu, Nov 15, 2018 at 11:17 PM Fernando Ramos <greenfoo@gluegarage.com> wrote:
> >
> > > One of the things in the DRM TODO list ("Documentation/gpu/todo.rst") was to
> > > "switch from reference/unreference to get/put". That's what this patch series is
> > > about.
> >
> > The series:
> > Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
>
> Since your reviewed it all, and there's a pile of acks for the driver
> parts too: Want to go ahead and apply it too?

OK I did... the git was quirky, patches changes around
under my feet and dim started to complain about problems
with commits that weren't even mine.

It was especially scary.

But I think I managed to apply the patches and push the
branch now.

Yours,
Linus Walleij
