Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:40928 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933474AbcLMRSn (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 13 Dec 2016 12:18:43 -0500
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Daniel Vetter <daniel@ffwll.ch>
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2] drm: shmobile: Perform initialization/cleanup at probe/remove time
Date: Tue, 13 Dec 2016 19:19:15 +0200
Message-ID: <2835101.vUU6uQBUMJ@avalon>
In-Reply-To: <20161213171134.xg7ihewey7aa7gej@phenom.ffwll.local>
References: <20161213084300.5kvq6ymgrkqldf3t@phenom.ffwll.local> <1481633988-31267-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com> <20161213171134.xg7ihewey7aa7gej@phenom.ffwll.local>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Daniel,

On Tuesday 13 Dec 2016 18:11:34 Daniel Vetter wrote:
> On Tue, Dec 13, 2016 at 02:59:48PM +0200, Laurent Pinchart wrote:
> > From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > 
> > The drm driver .load() operation is prone to race conditions as it
> > initializes the driver after registering the device nodes. Its usage is
> > deprecated, inline it in the probe function and call drm_dev_alloc() and
> > drm_dev_register() explicitly.
> > 
> > For consistency inline the .unload() handler in the remove function as
> > well.
> > 
> > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> > ---
> > Changes since v1:
> > 
> > - Removed manual the drm_connector_register() that caused sysfs-related
> > 
> >   warnings
> 
> Hm, what did go boom there? We should catch multiple calls to
> drm_connector_register ...

Trying to register the connector before the DRM device is registered makes 
sysfs unhappy due to the lack of a parent.

> >  drivers/gpu/drm/shmobile/shmob_drm_crtc.c |   7 +-
> >  drivers/gpu/drm/shmobile/shmob_drm_drv.c  | 206 +++++++++++-------------
> >  2 files changed, 104 insertions(+), 109 deletions(-)

-- 
Regards,

Laurent Pinchart
