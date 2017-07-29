Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:49408 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751461AbdG2U5a (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 29 Jul 2017 16:57:30 -0400
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        linux-renesas-soc@vger.kernel.org, intel-gfx@lists.freedesktop.org
Subject: Re: [PATCH v2 3/7] drm/rcar-du: Use new iterator macros, v2.
Date: Sat, 29 Jul 2017 23:57:40 +0300
Message-ID: <6593849.SxFAOB4sYE@avalon>
In-Reply-To: <1518645.4VQmJDGaiE@avalon>
References: <20170719143920.25685-1-maarten.lankhorst@linux.intel.com> <20170719143920.25685-4-maarten.lankhorst@linux.intel.com> <1518645.4VQmJDGaiE@avalon>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Maarten,

On Wednesday 26 Jul 2017 14:53:33 Laurent Pinchart wrote:
> On Wednesday 19 Jul 2017 16:39:16 Maarten Lankhorst wrote:
> > for_each_obj_in_state is about to be removed, so use the correct new
> > iterator macros.
> > 
> > Also look at new_plane_state instead of plane->state when looking up
> > the hw planes in use. They should be the same except when reallocating,
> > (in which case this code is skipped) and we should really stop looking
> > at obj->state whenever possible.
> > 
> > Changes since v1:
> > - Actually compile correctly.
> > 
> > Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > Cc: linux-renesas-soc@vger.kernel.org

I plan to send a pull request to Dave in the middle of next week with a bunch 
of rcar-du-drm patches that will generate a few conflicts with this one. 
They're all simple to solve as they're located in comments, but that will be 
annoying nonetheless. I can include a rebased version of this patch in my pull 
request if it can help, depending on when you plan to get this series merged 
in drm-misc-next.

-- 
Regards,

Laurent Pinchart
