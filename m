Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-ed1-f66.google.com ([209.85.208.66]:33035 "EHLO
        mail-ed1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731706AbeKVTe0 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 22 Nov 2018 14:34:26 -0500
Received: by mail-ed1-f66.google.com with SMTP id r27so7080376eda.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 22 Nov 2018 00:55:53 -0800 (PST)
Date: Thu, 22 Nov 2018 09:55:49 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Daniel Vetter <daniel@ffwll.ch>,
        Linus Walleij <linus.walleij@linaro.org>,
        greenfoo@gluegarage.com,
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
        Lucas Stach <l.stach@pengutronix.de>,
        linux+etnaviv@armlinux.org.uk,
        Christian Gmeiner <christian.gmeiner@gmail.com>,
        Marek Vasut <marex@denx.de>, Stefan Agner <stefan@agner.ch>,
        kieran.bingham+renesas@ideasonboard.com,
        Shawn Guo <shawnguo@kernel.org>,
        Julia Lawall <Julia.Lawall@lip6.fr>,
        Gilles Muller <Gilles.Muller@lip6.fr>,
        Nicolas Palix <nicolas.palix@imag.fr>, michal.lkml@markovi.net,
        hamohammed.sa@gmail.com, linux-doc@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        virtualization@lists.linux-foundation.org,
        etnaviv@lists.freedesktop.org,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        cocci@systeme.lip6.fr
Subject: Re: [PATCH 0/9] drm: remove deprecated functions
Message-ID: <20181122085549.GX4266@phenom.ffwll.local>
References: <20181115221634.22715-1-greenfoo@gluegarage.com>
 <CACRpkdZmTSo02yQeU=qe9WyJMXEq76CNmc2kkFEHuwdo=HKPJw@mail.gmail.com>
 <20181121094233.GN4266@phenom.ffwll.local>
 <22044302.7aKok9czXB@avalon>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <22044302.7aKok9czXB@avalon>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, Nov 21, 2018 at 08:21:29PM +0200, Laurent Pinchart wrote:
> Hi Daniel,
> 
> On Wednesday, 21 November 2018 11:42:33 EET Daniel Vetter wrote:
> > On Thu, Nov 15, 2018 at 11:38:35PM +0100, Linus Walleij wrote:
> > > On Thu, Nov 15, 2018 at 11:17 PM Fernando Ramos wrote:
> > >> One of the things in the DRM TODO list ("Documentation/gpu/todo.rst")
> > >> was to "switch from reference/unreference to get/put". That's what this
> > >> patch series is about.
> > > 
> > > The series:
> > > Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> > 
> > Since your reviewed it all, and there's a pile of acks for the driver
> > parts too: Want to go ahead and apply it too?
> 
> Please remember to give at least a week to reviewers, especially with LPC last 
> week.

I think for this undisputed cocci series waiting for everyone is not
needed. There's really not much the driver-specific reviewer perspective
would help here.

In general I do agree though, if there's something driver maintainers can
have better insight on.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
