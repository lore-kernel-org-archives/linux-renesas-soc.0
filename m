Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from perceval.ideasonboard.com ([213.167.242.64]:43594 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726535AbeK0Mh6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 27 Nov 2018 07:37:58 -0500
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Hoan <na-hoan@jinso.co.jp>
Cc: Simon Horman <horms@verge.net.au>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        kieran.bingham@ideasonboard.com
Subject: Re: [PATCH] drm: rcar-du: Fix DU3 start/stop on M3-N
Date: Tue, 27 Nov 2018 03:42:11 +0200
Message-ID: <2419901.SZS8ZpWnG2@avalon>
In-Reply-To: <9b997c47-2538-4777-0d2b-09f2db0e82a4@jinso.co.jp>
References: <20181123114809.19693-1-laurent.pinchart+renesas@ideasonboard.com> <20181126082125.5k4f2qyx2wczgddq@verge.net.au> <9b997c47-2538-4777-0d2b-09f2db0e82a4@jinso.co.jp>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello Hoan-san,

On Monday, 26 November 2018 11:46:56 EET Hoan wrote:
> Dear Laurent-san
> 
> Thank you for your comments on my patches! I understand.
> 
> With this patch,  the problem has been improved.
> 
> CC Simon-san
> 
> If you wait a little longer, the error log will look like this:

There is another display-related regression in v4.20, for which I have posted 
https://patchwork.linuxtv.org/patch/53083/. I believe it should fix the issue 
you're experienced.

> [    2.825800] [drm] No driver support for vblank timestamp query.
> [   13.027591] [drm:drm_atomic_helper_wait_for_flip_done] *ERROR*
> [CRTC:55:crtc-2] flip_done timed out
> [   23.267575] [drm:drm_atomic_helper_wait_for_dependencies] *ERROR*
> [CRTC:55:crtc-2] flip_done timed out
> [   33.507572] [drm:drm_atomic_helper_wait_for_dependencies] *ERROR*
> [CONNECTOR:57:VGA-1] flip_done timed out
> [   43.747572] [drm:drm_atomic_helper_wait_for_dependencies] *ERROR*
> [PLANE:30:plane-1] flip_done timed out
> [   53.987572] [drm:drm_atomic_helper_wait_for_flip_done] *ERROR*
> [CRTC:55:crtc-2] flip_done timed out
> [   53.990386] Console: switching to colour frame buffer device 128x48
> [   64.227573] [drm:drm_atomic_helper_wait_for_dependencies] *ERROR*
> [CRTC:55:crtc-2] flip_done timed out
> [   74.467571] [drm:drm_atomic_helper_wait_for_dependencies] *ERROR*
> [CONNECTOR:57:VGA-1] flip_done timed out
> [   84.707570] [drm:drm_atomic_helper_wait_for_dependencies] *ERROR*
> [PLANE:30:plane-1] flip_done timed out
> [   94.947573] [drm:drm_atomic_helper_wait_for_flip_done] *ERROR*
> [CRTC:55:crtc-2] flip_done timed out
> [   95.040503] rcar-du feb00000.display: fb0: DRM emulated frame buffer
> device
> [   95.048144] [drm] Initialized rcar-du 1.0.0 20130110 for
> feb00000.display on minor 0
> [   95.055907] [drm] Device feb00000.display probed
> ...
> 
> On 2018/11/26 17:21, Simon Horman wrote:
> > On Fri, Nov 23, 2018 at 01:48:08PM +0200, Laurent Pinchart wrote:
> >> Group start/stop is controlled by the DRES and DEN bits of DSYSR0 for
> >> the first group and DSYSR2 for the second group. On most DU instances,
> >> this maps to the first CRTC of the group. On M3-N, however, DU2 doesn't
> >> exist, but DSYSR2 does. There is no CRTC object there that maps to the
> >> correct DSYSR register.
> >> 
> >> Commit 9144adc5e5a9 ("drm: rcar-du: Cache DSYSR value to ensure known
> >> initial value") switched group start/stop from using group read/write
> >> access to DSYSR to a CRTC-based API to cache the DSYSR value. While
> >> doing so, it introduced a regression on M3-N by accessing DSYSR3 instead
> >> of DSYSR2 to start/stop the second group.
> >> 
> >> To fix this, access the DSYSR register directly through group read/write
> >> if the SoC is missing the first DU channel of the group. Keep using the
> >> rcar_du_crtc_dsysr_clr_set() function otherwise, to retain the DSYSR
> >> caching feature.
> >> 
> >> Fixes: 9144adc5e5a9 ("drm: rcar-du: Cache DSYSR value to ensure known
> >> initial value") Reported-by: Hoan Nguyen An <na-hoan@jinso.co.jp>
> >> Signed-off-by: Laurent Pinchart
> >> <laurent.pinchart+renesas@ideasonboard.com>
> > 
> > Thanks Laurent,
> > 
> > I have confirmed that with this patch applied on top of
> > renesas-devel-20181123-v4.20-rc3 Salvator-XS / M3-N ES1.0
> > boots to user-space when the kernel is compiled using renesas_defconfig.
> > 
> > Tested-by: Simon Horman <horms+renesas@verge.net.au>
> > 
> > 
> > Without this patch applied the boot log looks this:
> > 
> > Starting kernel ...

[snip]

-- 
Regards,

Laurent Pinchart
