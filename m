Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wm0-f65.google.com ([74.125.82.65]:33201 "EHLO
        mail-wm0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750807AbcJEJKy (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 5 Oct 2016 05:10:54 -0400
Received: by mail-wm0-f65.google.com with SMTP id p138so23519930wmb.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 05 Oct 2016 02:10:54 -0700 (PDT)
Date: Wed, 5 Oct 2016 11:10:51 +0200
From: Gustavo Padovan <gustavo@padovan.org>
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCH 0/6] R-Car DU fixes and cleanups
Message-ID: <20161005091051.GD21711@joana>
References: <1475584299-21236-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1475584299-21236-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Laurent,

2016-10-04 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>:

> Hello,
> 
> This patch series contains five simple cleanups and fixes for the rcar-du-drm
> driver, as well as an argument constification patch for video/of.
> 
> The patches themselves are straightforward, see individual commit messages for
> details. Patch 2/6 (normally merged through the DRM tree) depends on patch 1/6
> (normally merged through the fbdev tree). As they don't conflict with patches
> 3/6 to 6/6, we can either merge the whole series through the DRM tree, or
> merge patches 1/6 and 2/6 through the fbdev tree and the rest through the DRM
> tree.
> 
> My preference would go for merging the whole series through the DRM tree to
> avoid potential conflicts with the other patches I'm working on for v4.10.
> There is no foreseen conflict at the moment, but I might rework encoder
> handling in the driver that could possibly result in a conflict. Dave, Tomi,
> any preference ? If you're fine with patches not going through your tree,
> could you please ack them ?
> 
> Cc: David Airlie <airlied@linux.ie>
> Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>
> 
> Laurent Pinchart (6):
>   video: of: Constify node argument to display timing functions
>   drm: rcar-du: Constify node argument to rcar_du_lvds_connector_init()
>   drm: rcar-du: Bring HDMI encoder comments in line with the driver
>   drm: rcar-du: Remove test for impossible error condition
>   drm: rcar-du: Remove memory allocation error message
>   drm: rcar-du: Fix crash in encoder failure error path
> 
>  drivers/gpu/drm/rcar-du/rcar_du_drv.c     |  6 ------
>  drivers/gpu/drm/rcar-du/rcar_du_hdmienc.c |  4 ++--
>  drivers/gpu/drm/rcar-du/rcar_du_kms.c     | 10 +++++-----
>  drivers/gpu/drm/rcar-du/rcar_du_lvdscon.c |  2 +-
>  drivers/gpu/drm/rcar-du/rcar_du_lvdscon.h |  2 +-
>  drivers/gpu/drm/rcar-du/rcar_du_lvdsenc.c |  4 +---
>  drivers/video/of_display_timing.c         |  6 +++---
>  include/video/of_display_timing.h         | 15 ++++++++-------
>  8 files changed, 21 insertions(+), 28 deletions(-)

For 1 to 6

Reviewed-by: Gustavo Padovan <gustavo.padovan@collabora.co.uk>

Gustavo
