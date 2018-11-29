Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lj1-f195.google.com ([209.85.208.195]:37666 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732735AbeK3BvY (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 29 Nov 2018 20:51:24 -0500
Received: by mail-lj1-f195.google.com with SMTP id e5-v6so1984641lja.4
        for <linux-renesas-soc@vger.kernel.org>; Thu, 29 Nov 2018 06:45:47 -0800 (PST)
MIME-Version: 1.0
References: <20181115221634.22715-1-greenfoo@gluegarage.com>
 <CACRpkdZmTSo02yQeU=qe9WyJMXEq76CNmc2kkFEHuwdo=HKPJw@mail.gmail.com>
 <20181121094233.GN4266@phenom.ffwll.local> <CACRpkdaXUFwSiQnMqv2WBXr2ytn7kx3CeAuamkj9ZYU1C6bpnw@mail.gmail.com>
 <20181126141241.GM4266@phenom.ffwll.local>
In-Reply-To: <20181126141241.GM4266@phenom.ffwll.local>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 29 Nov 2018 15:45:33 +0100
Message-ID: <CACRpkdYmBSVKBvu=YOV87zWK8WCC+pcn9ux_W4VEYwzRzexQ_A@mail.gmail.com>
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

On Mon, Nov 26, 2018 at 3:12 PM Daniel Vetter <daniel@ffwll.ch> wrote:
> On Sat, Nov 24, 2018 at 10:17:13PM +0100, Linus Walleij wrote:

> > It was especially scary.
> >
> > But I think I managed to apply the patches and push the
> > branch now.
>
> Except when you're racing with someone else you should only see conflicts
> with stuff you've just pushed. Or if someone forgot to fix up their mess.
> What was the conflict?

dim push-branches was complaining that one of the commits was
missing the proper committer sign-off, it was the bottom commit under
mine (IIRC "drm/atomic-helper: WARN if fake_commit->hw_done is not
completed as expected")
and dim update-branches seemed to rebase and fix up my patches
and then everything was fine.

I just felt slightly out of control :D

Yours,
Linus Walleij
