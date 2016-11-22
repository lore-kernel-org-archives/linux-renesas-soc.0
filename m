Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:41236 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755131AbcKVNQw (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 22 Nov 2016 08:16:52 -0500
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCH v2 06/13] drm: panels: Add LVDS panel driver
Date: Tue, 22 Nov 2016 15:17:09 +0200
Message-ID: <3357569.dBCZ3D9MU7@avalon>
In-Reply-To: <20161122111457.GC22735@ulmo.ba.sec>
References: <1479526093-7014-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com> <1479526093-7014-7-git-send-email-laurent.pinchart+renesas@ideasonboard.com> <20161122111457.GC22735@ulmo.ba.sec>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Thierry,

On Tuesday 22 Nov 2016 12:14:57 Thierry Reding wrote:
> On Sat, Nov 19, 2016 at 05:28:06AM +0200, Laurent Pinchart wrote:
> > This driver supports LVDS panels that don't require device-specific
> > handling of power supplies or control signals. It implements automatic
> > backlight handling if the panel is attached to a backlight controller.
> > 
> > Signed-off-by: Laurent Pinchart
> > <laurent.pinchart+renesas@ideasonboard.com>
> > ---
> > 
> >  drivers/gpu/drm/panel/Kconfig      |  10 ++
> >  drivers/gpu/drm/panel/Makefile     |   1 +
> >  drivers/gpu/drm/panel/panel-lvds.c | 284 ++++++++++++++++++++++++++++++++
> >  3 files changed, 295 insertions(+)
> >  create mode 100644 drivers/gpu/drm/panel/panel-lvds.c
> 
> The bulk of this is a duplicate of panel-simple.c

Implementing the panel API should obviously be expected to produce some 
quantity of similar code.

> and it adds all the things on top that I've been repeatedly rejecting in the
> past.

It's a good thing I haven't tried to add them to panel-simple.c then :-)

-- 
Regards,

Laurent Pinchart
