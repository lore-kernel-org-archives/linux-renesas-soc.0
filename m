Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-io1-f68.google.com ([209.85.166.68]:37544 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731826AbeK3CBR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 29 Nov 2018 21:01:17 -0500
Received: by mail-io1-f68.google.com with SMTP id a3so1789263ioc.4
        for <linux-renesas-soc@vger.kernel.org>; Thu, 29 Nov 2018 06:55:40 -0800 (PST)
MIME-Version: 1.0
References: <20181115221634.22715-1-greenfoo@gluegarage.com>
 <CACRpkdZmTSo02yQeU=qe9WyJMXEq76CNmc2kkFEHuwdo=HKPJw@mail.gmail.com>
 <20181121094233.GN4266@phenom.ffwll.local> <CACRpkdaXUFwSiQnMqv2WBXr2ytn7kx3CeAuamkj9ZYU1C6bpnw@mail.gmail.com>
 <20181126141241.GM4266@phenom.ffwll.local> <CACRpkdYmBSVKBvu=YOV87zWK8WCC+pcn9ux_W4VEYwzRzexQ_A@mail.gmail.com>
In-Reply-To: <CACRpkdYmBSVKBvu=YOV87zWK8WCC+pcn9ux_W4VEYwzRzexQ_A@mail.gmail.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Thu, 29 Nov 2018 15:55:28 +0100
Message-ID: <CAKMK7uF9Q-LySAXg=kT9B-ueFR9qhr_B0N3y1g1D_OTc-+Vbdg@mail.gmail.com>
Subject: Re: [PATCH 0/9] drm: remove deprecated functions
To: Linus Walleij <linus.walleij@linaro.org>
Cc: greenfoo@gluegarage.com,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Sean Paul <sean@poorly.run>, Dave Airlie <airlied@linux.ie>,
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
        Shawn Guo <shawnguo@kernel.org>,
        Julia Lawall <Julia.Lawall@lip6.fr>,
        Gilles Muller <Gilles.Muller@lip6.fr>,
        Nicolas Palix <nicolas.palix@imag.fr>,
        Michal Marek <michal.lkml@markovi.net>,
        Haneen Mohammed <hamohammed.sa@gmail.com>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "open list:VIRTIO CORE, NET..."
        <virtualization@lists.linux-foundation.org>,
        etnaviv@lists.freedesktop.org,
        "open list:DRM DRIVERS FOR RENESAS"
        <linux-renesas-soc@vger.kernel.org>, cocci@systeme.lip6.fr
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, Nov 29, 2018 at 3:45 PM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> On Mon, Nov 26, 2018 at 3:12 PM Daniel Vetter <daniel@ffwll.ch> wrote:
> > On Sat, Nov 24, 2018 at 10:17:13PM +0100, Linus Walleij wrote:
>
> > > It was especially scary.
> > >
> > > But I think I managed to apply the patches and push the
> > > branch now.
> >
> > Except when you're racing with someone else you should only see conflicts
> > with stuff you've just pushed. Or if someone forgot to fix up their mess.
> > What was the conflict?
>
> dim push-branches was complaining that one of the commits was
> missing the proper committer sign-off, it was the bottom commit under
> mine (IIRC "drm/atomic-helper: WARN if fake_commit->hw_done is not
> completed as expected")
> and dim update-branches seemed to rebase and fix up my patches
> and then everything was fine.

This sounds like you (or dim?) accidentaly amended that commit (which
changes the committer and results in the warning), and a rebase would
indeed have fixed that. If the first patch conflicts this can happen
because dim apply-branch doesn't bail out correctly. Or at least did
in the past, I recently fixed that in

commit ee299e510ae468aab27610bcbc4fdd4de932f74b
Author: Daniel Vetter <daniel.vetter@ffwll.ch>
Date:   Wed Oct 17 08:53:00 2018 +0200

    dim: make apply-patch fail again

> I just felt slightly out of control :D

If your dim didn't have the above commit and you had a conflict it's
all explained. Otherwise I'm not sure what's been going on ...
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch
