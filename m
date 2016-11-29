Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:34068 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754848AbcK2RtI (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 29 Nov 2016 12:49:08 -0500
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Daniel Vetter <daniel@ffwll.ch>
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v3 09/13] drm: Add encoder_type field to the drm_bridge structure
Date: Tue, 29 Nov 2016 19:49:22 +0200
Message-ID: <2516383.b9AMKiZRXv@avalon>
In-Reply-To: <20161129102720.alacxa4bxcyyrn3j@phenom.ffwll.local>
References: <1480410283-28698-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com> <9030087.LEDx357bJm@avalon> <20161129102720.alacxa4bxcyyrn3j@phenom.ffwll.local>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Daniel,

On Tuesday 29 Nov 2016 11:27:20 Daniel Vetter wrote:
> On Tue, Nov 29, 2016 at 11:58:44AM +0200, Laurent Pinchart wrote:
> > On Tuesday 29 Nov 2016 10:56:53 Daniel Vetter wrote:
> >> On Tue, Nov 29, 2016 at 11:04:39AM +0200, Laurent Pinchart wrote:
> >>> The drm_bridge object models on- or off-chip hardware encoders and
> >>> provide an abstract control API to display drivers. In order to help
> >>> display drivers creating the right kind of drm_encoder object, expose
> >>> the type of the hardware encoder associated with each bridge.
> >>> 
> >>> Signed-off-by: Laurent Pinchart
> >>> <laurent.pinchart+renesas@ideasonboard.com>
> >> 
> >> DRM_MODE_ENCODER_BRIDGE. Problem solved, because in reality no one cares
> >> one iota about the encoder type.
> > 
> > It's exposed to userspace though, are you 100% sure we won't break
> > anything ?
>
> We've added DP, DSI, DPMST and DPI encoder types thus far, no one
> screamed.

In that case why don't we go one step further and remove the encoder type 
completely ? We can't remove the field from the API, but we can hardcode it to 
a single value.

There are however drivers that rely on the encoder type (radeon, nouveau, sti, 
amdgpu, msm and rcar-du, but I'll fix the last one) so we'd need to address 
that first. If we don't want to remove the encoder_type field from in-kernel 
structures and let drivers use it, then I don't think DRM_MODE_ENCODER_BRIDGE 
would be a good option, we should report the real type instead.

> We should be fine I think. Connector types are a bit different, userspace
> (at least X) wants to pretty-print them for xrandr names.

-- 
Regards,

Laurent Pinchart
