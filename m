Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from perceval.ideasonboard.com ([213.167.242.64]:45302 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726581AbeHVTe5 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 22 Aug 2018 15:34:57 -0400
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 0/2] drm: convert to SPDX identifiers for Renesas
Date: Wed, 22 Aug 2018 19:10:25 +0300
Message-ID: <2376789.0OvbKyfeX6@avalon>
In-Reply-To: <87ftz7f9v4.wl-kuninori.morimoto.gx@renesas.com>
References: <87ftz7f9v4.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Morimoto-san,

On Wednesday, 22 August 2018 04:56:37 EEST Kuninori Morimoto wrote:
> Hi Laurent
> 
> These are not yet appear on Linus tree.
> I will re-post it.

Thank you, but there was no need to, they're stored safely in my tree :-) I'll 
send a pull request for v4.20.

> Kuninori Morimoto (2):
>   drm: rcar-du: convert to SPDX identifiers
>   drm: shmobile: convert to SPDX identifiers
> 
>  drivers/gpu/drm/rcar-du/Kconfig                | 1 +
>  drivers/gpu/drm/rcar-du/rcar_du_crtc.c         | 6 +-----
>  drivers/gpu/drm/rcar-du/rcar_du_crtc.h         | 6 +-----
>  drivers/gpu/drm/rcar-du/rcar_du_drv.c          | 6 +-----
>  drivers/gpu/drm/rcar-du/rcar_du_drv.h          | 6 +-----
>  drivers/gpu/drm/rcar-du/rcar_du_encoder.c      | 6 +-----
>  drivers/gpu/drm/rcar-du/rcar_du_encoder.h      | 6 +-----
>  drivers/gpu/drm/rcar-du/rcar_du_group.c        | 6 +-----
>  drivers/gpu/drm/rcar-du/rcar_du_group.h        | 6 +-----
>  drivers/gpu/drm/rcar-du/rcar_du_kms.c          | 6 +-----
>  drivers/gpu/drm/rcar-du/rcar_du_kms.h          | 6 +-----
>  drivers/gpu/drm/rcar-du/rcar_du_plane.c        | 6 +-----
>  drivers/gpu/drm/rcar-du/rcar_du_plane.h        | 6 +-----
>  drivers/gpu/drm/rcar-du/rcar_du_regs.h         | 5 +----
>  drivers/gpu/drm/rcar-du/rcar_du_vsp.c          | 6 +-----
>  drivers/gpu/drm/rcar-du/rcar_du_vsp.h          | 6 +-----
>  drivers/gpu/drm/rcar-du/rcar_dw_hdmi.c         | 6 +-----
>  drivers/gpu/drm/rcar-du/rcar_lvds_regs.h       | 5 +----
>  drivers/gpu/drm/shmobile/Kconfig               | 1 +
>  drivers/gpu/drm/shmobile/shmob_drm_backlight.c | 6 +-----
>  drivers/gpu/drm/shmobile/shmob_drm_backlight.h | 6 +-----
>  drivers/gpu/drm/shmobile/shmob_drm_crtc.c      | 6 +-----
>  drivers/gpu/drm/shmobile/shmob_drm_crtc.h      | 6 +-----
>  drivers/gpu/drm/shmobile/shmob_drm_drv.c       | 6 +-----
>  drivers/gpu/drm/shmobile/shmob_drm_drv.h       | 6 +-----
>  drivers/gpu/drm/shmobile/shmob_drm_kms.c       | 6 +-----
>  drivers/gpu/drm/shmobile/shmob_drm_kms.h       | 6 +-----
>  drivers/gpu/drm/shmobile/shmob_drm_plane.c     | 6 +-----
>  drivers/gpu/drm/shmobile/shmob_drm_plane.h     | 6 +-----
>  drivers/gpu/drm/shmobile/shmob_drm_regs.h      | 6 +-----
>  30 files changed, 30 insertions(+), 138 deletions(-)

-- 
Regards,

Laurent Pinchart
