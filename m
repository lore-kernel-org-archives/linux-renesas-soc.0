Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wm0-f65.google.com ([74.125.82.65]:56056 "EHLO
        mail-wm0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754437AbeD3O4y (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 30 Apr 2018 10:56:54 -0400
Received: by mail-wm0-f65.google.com with SMTP id a8so13683809wmg.5
        for <linux-renesas-soc@vger.kernel.org>; Mon, 30 Apr 2018 07:56:53 -0700 (PDT)
Date: Mon, 30 Apr 2018 16:56:40 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
        linux-renesas-soc@vger.kernel.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Ulrich Hecht <ulrich.hecht@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        IGT development <igt-dev@lists.freedesktop.org>
Subject: Re: igt trouble with planes shared between multiple CRTCs (Re:
 [PATCH v2 0/8] R-Car DU: Support CRC calculation)
Message-ID: <20180430145640.GK12521@phenom.ffwll.local>
References: <20180422223430.16407-1-laurent.pinchart+renesas@ideasonboard.com>
 <3482108.jirjkbZynl@avalon>
 <20180430145524.GJ12521@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180430145524.GJ12521@phenom.ffwll.local>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Mon, Apr 30, 2018 at 04:55:24PM +0200, Daniel Vetter wrote:
> On Sat, Apr 28, 2018 at 12:07:04AM +0300, Laurent Pinchart wrote:
> > Hi Daniel,
> > 
> > (Removing the linux-media mailing list from CC as it is out of scope)
> > 
> > You enquired on IRC whether this patch series passes the igt CRC tests.
> > 
> > # ./kms_pipe_crc_basic --run-subtest read-crc-pipe-A
> > IGT-Version: 1.22-gf447f5fc531d (aarch64) (Linux: 4.17.0-rc1-00085-g56e849d93cc9 aarch64)
> > read-crc-pipe-A: Testing connector LVDS-1 using pipe A
> > (kms_pipe_crc_basic:1638) igt-debugfs-CRITICAL: Test assertion failure function igt_pipe_crc_start, file igt_debugfs.c:764:
> > (kms_pipe_crc_basic:1638) igt-debugfs-CRITICAL: Failed assertion: pipe_crc->crc_fd != -1
> > (kms_pipe_crc_basic:1638) igt-debugfs-CRITICAL: Last errno: 5, Input/output error
> > Stack trace:
> > Subtest read-crc-pipe-A failed.
> > **** DEBUG ****
> > (kms_pipe_crc_basic:1638) DEBUG: Test requirement passed: !(pipe >= data->display.n_pipes)
> > (kms_pipe_crc_basic:1638) INFO: read-crc-pipe-A: Testing connector LVDS-1 using pipe A
> > (kms_pipe_crc_basic:1638) igt-kms-DEBUG: display: LVDS-1: set_pipe(A)
> > (kms_pipe_crc_basic:1638) igt-kms-DEBUG: display: LVDS-1: Selecting pipe A
> > (kms_pipe_crc_basic:1638) DEBUG: Clearing the fb with color (0.00,1.00,0.00)
> > (kms_pipe_crc_basic:1638) igt-fb-DEBUG: igt_create_fb_with_bo_size(width=1024, height=768, format=0x34325258, tiling=0x0, size=0)
> > (kms_pipe_crc_basic:1638) igt-fb-DEBUG: igt_create_fb_with_bo_size(handle=1, pitch=4096)
> > (kms_pipe_crc_basic:1638) igt-kms-DEBUG: Test requirement passed: plane_idx >= 0 && plane_idx < pipe->n_planes
> > (kms_pipe_crc_basic:1638) igt-kms-DEBUG: display: A.0: plane_set_fb(140)
> > (kms_pipe_crc_basic:1638) igt-kms-DEBUG: display: A.0: plane_set_size (1024x768)
> > (kms_pipe_crc_basic:1638) igt-kms-DEBUG: display: A.0: fb_set_position(0,0)
> > (kms_pipe_crc_basic:1638) igt-kms-DEBUG: display: A.0: fb_set_size(1024x768)
> > (kms_pipe_crc_basic:1638) igt-kms-DEBUG: display: commit {
> > (kms_pipe_crc_basic:1638) igt-kms-DEBUG: display:     LVDS-1: SetCrtc pipe A, fb 140, src (0, 0), mode 1024x768
> > (kms_pipe_crc_basic:1638) igt-kms-DEBUG: display:     SetCrtc pipe A, disabling
> > (kms_pipe_crc_basic:1638) igt-kms-DEBUG: display:     SetPlane pipe A, plane 2, disabling
> > (kms_pipe_crc_basic:1638) igt-kms-DEBUG: display:     SetPlane pipe A, plane 3, disabling
> > (kms_pipe_crc_basic:1638) igt-kms-DEBUG: display:     SetPlane pipe A, plane 4, disabling
> > (kms_pipe_crc_basic:1638) igt-kms-DEBUG: display:     SetCrtc pipe B, disabling
> > (kms_pipe_crc_basic:1638) igt-kms-DEBUG: display:     SetPlane pipe B, plane 1, disabling
> > (kms_pipe_crc_basic:1638) igt-kms-DEBUG: display:     SetPlane pipe B, plane 2, disabling
> > (kms_pipe_crc_basic:1638) igt-kms-DEBUG: display:     SetPlane pipe B, plane 3, disabling
> > (kms_pipe_crc_basic:1638) igt-kms-DEBUG: display:     SetPlane pipe B, plane 4, disabling
> > (kms_pipe_crc_basic:1638) igt-kms-DEBUG: display:     SetCrtc pipe C, disabling
> > (kms_pipe_crc_basic:1638) igt-kms-DEBUG: display:     SetPlane pipe C, plane 1, disabling
> > (kms_pipe_crc_basic:1638) igt-kms-DEBUG: display:     SetPlane pipe C, plane 2, disabling
> > (kms_pipe_crc_basic:1638) igt-kms-DEBUG: display:     SetPlane pipe C, plane 3, disabling
> > (kms_pipe_crc_basic:1638) igt-kms-DEBUG: display:     SetPlane pipe C, plane 4, disabling
> > (kms_pipe_crc_basic:1638) igt-kms-DEBUG: display:     SetCrtc pipe D, disabling
> > (kms_pipe_crc_basic:1638) igt-kms-DEBUG: display:     SetCrtc pipe D, disabling
> > (kms_pipe_crc_basic:1638) igt-kms-DEBUG: display:     SetPlane pipe D, plane 2, disabling
> > (kms_pipe_crc_basic:1638) igt-kms-DEBUG: display:     SetPlane pipe D, plane 3, disabling
> > (kms_pipe_crc_basic:1638) igt-kms-DEBUG: display:     SetPlane pipe D, plane 4, disabling
> > (kms_pipe_crc_basic:1638) igt-kms-DEBUG: display: }
> > (kms_pipe_crc_basic:1638) igt-debugfs-DEBUG: Opening debugfs directory '/sys/kernel/debug/dri/0'
> > (kms_pipe_crc_basic:1638) igt-debugfs-DEBUG: Opening debugfs directory '/sys/kernel/debug/dri/0'
> > (kms_pipe_crc_basic:1638) igt-debugfs-CRITICAL: Test assertion failure function igt_pipe_crc_start, file igt_debugfs.c:764:
> > (kms_pipe_crc_basic:1638) igt-debugfs-CRITICAL: Failed assertion: pipe_crc->crc_fd != -1
> > (kms_pipe_crc_basic:1638) igt-debugfs-CRITICAL: Last errno: 5, Input/output error
> > (kms_pipe_crc_basic:1638) igt-core-INFO: Stack trace:
> > ****  END  ****
> > Subtest read-crc-pipe-A: FAIL (0.061s)
> > 
> > I think the answer is no, but I don't think it's the fault of this patch
> > series. Opening the CRC data file returns -EIO because the CRTC is not active,
> > and I'm trying to find out why that is the case. The debug log shows a commit
> > that seems strange to me, enabling pipe A and immediately disabling right
> > afterwards. After some investigation I believe that this is caused by sharing
> > primary planes between CRTCs.
> > 
> > The R-Car DU groups CRTCs by two and shares 5 planes between the two CRTCs of
> > the group. This specific SoC has two groups of two CRTCs, but that's not
> > relevant here, so we can ignore pipes C and D.
> > 
> > Pipes A and B thus shared 5 planes that I will number 0 to 4 for simplicity.
> > The driver sets plane 0 as the primary plane for CRTC A and plane 1 as the
> > primary plane for CRTC B. Planes 2, 3 and 4 are created as overlay planes.
> > 
> > When igt iterates over all planes for pipe A, it will first encounter plane 0
> > that has a framebuffer, and thus enables the pipe. It then iterates over
> > plane 1, recognizes it as a primary plane without a framebuffer, and thus
> > disables the pipe. Planes 2, 3 and 4 are recognized as overlay planes and thus
> > don't affect the pipe active state. Pipe B is handled the same way, and igt
> > disables it twice as planes 0 and 1 are primary.
> > 
> > I don't know if the fault here is with igt that doesn't properly support this
> > architecture, or with the driver that shouldn't have two primary planes
> > available for a CRTC. In the former case, I'm not sure how to fix it, as I'm
> > not familiar enough with igt to rearchitecture the commit helpers. In the
> > latter case, how would you recommend fixing it on the driver side ?
> 
> I guess thus far no one did run igt on a chip which did have reassignable
> primary planes. The problem here is that it's pretty hard to figure out
> which one is the real primary plane, since with possible CRTCs you could
> have multiple primary planes on 1 CRTC. There's no property or anything
> that explicitly tells you this. Two fixes:
> 
> 1. Change drivers to limit primary planes to 1 crtc. Same for cursor
>    overlays. There's probably other userspace than igt that gets confused
>    by this, but this has the ugly downside that we artifically limit plane
>    usage - if only 1 CRTC is on, we want to use all the available planes
>    on that one.
> 
> 2. Add some implicit or explicit uapi to allow userspace to figure out
>    which primary plane is the primary plane for this crtc.
> 
>    a) Explicit option: We add a PRIMARY_ID property (and CURSOR_ID prop
>       while at it) on the CRTC which points at the primary/cursor plane.
> 
>    b) Implicit option: We require primary planes are assigned to CRTC in the
>       same order as they're created. So first primary plane you encouter
>       is the one for the first CRTC, 2nd primary plane is the one for the
>       2nd CRTC and so on. If we go with this we probably should add a bit
>       of code to the kernel to check that invariant (by making sure the
>       primary plane has the corresponding CRTC included in its
>       possible_crtc mask).
> 
> Either way igt needs to be patched to not treat any primary plane that
> could work on a CRTC as the primary plane for that CRTC.
> 
> Personally I'm leaning towards 2b).

Adding Maarten and igt-dev.
-Daniel

> 
> Cheers, Daniel
> 
> > 
> > On Monday, 23 April 2018 01:34:22 EEST Laurent Pinchart wrote:
> > > Hello,
> > > 
> > > This patch series adds support for CRC calculation to the rcar-du-drm
> > > driver.
> > > 
> > > CRC calculation is supported starting at the Renesas R-Car Gen3 SoCs, as
> > > earlier versions don't have the necessary hardware. On Gen3 SoCs, the CRC is
> > > computed by the DISCOM module part of the VSP-D and VSP-DL.
> > > 
> > > The DISCOM is interfaced to the VSP through the UIF glue and appears as a
> > > VSP entity with a sink pad and a source pad.
> > > 
> > > The series starts with a switch to SPDX license headers in patch 1/8,
> > > prompted by a checkpatch.pl warning for a later patch that complained about
> > > missing SPDX license headers. It then continues with cleanup and
> > > refactoring. Patches 2/8 and 3/8 prepare for DISCOM and UIF support by
> > > extending generic code to make it usable for the UIF. Patch 4/8 documents a
> > > structure that will receive new fields.
> > > 
> > > Patch 5/8 then extends the API exposed by the VSP driver to the DU driver to
> > > support CRC computation configuration and reporting. The patch
> > > unfortunately needs to touch both the VSP and DU drivers, so the whole
> > > series will need to be merged through a single tree.
> > > 
> > > Patch 5/8 adds support for the DISCOM and UIF in the VSP driver, patch 7/8
> > > integrates it in the DRM pipeline, and patch 8/8 finally implements the CRC
> > > API in the DU driver to expose CRC computation to userspace.
> > > 
> > > The hardware supports computing the CRC at any arbitrary point in the
> > > pipeline on a configurable window of the frame. This patch series supports
> > > CRC computation on input planes or pipeline output, but on the full frame
> > > only. Support for CRC window configuration can be added later if needed but
> > > will require extending the userspace API, as the DRM/KMS CRC API doesn't
> > > support this feature.
> > > 
> > > Compared to v1, the CRC source names for plane inputs are now constructed
> > > from plane IDs instead of plane indices. This allows userspace to match CRC
> > > sources with planes.
> > > 
> > > Note that exposing the DISCOM and UIF though the V4L2 API isn't supported as
> > > the module is only found in VSP-D and VSP-DL instances that are not exposed
> > > through V4L2. It is possible to expose those instances through V4L2 with a
> > > small modification to the driver for testing purpose. If the need arises to
> > > test DISCOM and UIF with such an out-of-tree patch, support for CRC
> > > reporting through a V4L2 control can be added later without affecting how
> > > CRC is exposed through the DRM/KMS API.
> > > 
> > > The patches are based on top of the "[PATCH v2 00/15] R-Car VSP1:
> > > Dynamically assign blend units to display pipelines" patch series, itself
> > > based on top of the Linux media master branch and scheduled for merge in
> > > v4.18. The new base caused heavy conflicts, requiring this series to be
> > > merged through the V4L2 tree. Once the patches receive the necessary review
> > > I will ask Dave to ack the merge plan.
> > > 
> > > For convenience the patches are available at
> > > 
> > >         git://linuxtv.org/pinchartl/media.git vsp1-discom-v2-20180423
> > > 
> > > The code has been tested through the kms-test-crc.py script part of the DU
> > > test suite available at
> > > 
> > >         git://git.ideasonboard.com/renesas/kms-tests.git discom
> > > 
> > > Laurent Pinchart (8):
> > >   v4l: vsp1: Use SPDX license headers
> > >   v4l: vsp1: Share the CLU, LIF and LUT set_fmt pad operation code
> > >   v4l: vsp1: Reset the crop and compose rectangles in the set_fmt helper
> > >   v4l: vsp1: Document the vsp1_du_atomic_config structure
> > >   v4l: vsp1: Extend the DU API to support CRC computation
> > >   v4l: vsp1: Add support for the DISCOM entity
> > >   v4l: vsp1: Integrate DISCOM in display pipeline
> > >   drm: rcar-du: Add support for CRC computation
> > > 
> > >  drivers/gpu/drm/rcar-du/rcar_du_crtc.c    | 156 ++++++++++++++++-
> > >  drivers/gpu/drm/rcar-du/rcar_du_crtc.h    |  19 +++
> > >  drivers/gpu/drm/rcar-du/rcar_du_vsp.c     |  13 +-
> > >  drivers/media/platform/vsp1/Makefile      |   2 +-
> > >  drivers/media/platform/vsp1/vsp1.h        |  10 +-
> > >  drivers/media/platform/vsp1/vsp1_brx.c    |   6 +-
> > >  drivers/media/platform/vsp1/vsp1_brx.h    |   6 +-
> > >  drivers/media/platform/vsp1/vsp1_clu.c    |  71 ++------
> > >  drivers/media/platform/vsp1/vsp1_clu.h    |   6 +-
> > >  drivers/media/platform/vsp1/vsp1_dl.c     |   8 +-
> > >  drivers/media/platform/vsp1/vsp1_dl.h     |   6 +-
> > >  drivers/media/platform/vsp1/vsp1_drm.c    | 127 ++++++++++++--
> > >  drivers/media/platform/vsp1/vsp1_drm.h    |  20 ++-
> > >  drivers/media/platform/vsp1/vsp1_drv.c    |  26 ++-
> > >  drivers/media/platform/vsp1/vsp1_entity.c | 103 +++++++++++-
> > >  drivers/media/platform/vsp1/vsp1_entity.h |  13 +-
> > >  drivers/media/platform/vsp1/vsp1_hgo.c    |   6 +-
> > >  drivers/media/platform/vsp1/vsp1_hgo.h    |   6 +-
> > >  drivers/media/platform/vsp1/vsp1_hgt.c    |   6 +-
> > >  drivers/media/platform/vsp1/vsp1_hgt.h    |   6 +-
> > >  drivers/media/platform/vsp1/vsp1_histo.c  |  65 +------
> > >  drivers/media/platform/vsp1/vsp1_histo.h  |   6 +-
> > >  drivers/media/platform/vsp1/vsp1_hsit.c   |   6 +-
> > >  drivers/media/platform/vsp1/vsp1_hsit.h   |   6 +-
> > >  drivers/media/platform/vsp1/vsp1_lif.c    |  71 ++------
> > >  drivers/media/platform/vsp1/vsp1_lif.h    |   6 +-
> > >  drivers/media/platform/vsp1/vsp1_lut.c    |  71 ++------
> > >  drivers/media/platform/vsp1/vsp1_lut.h    |   6 +-
> > >  drivers/media/platform/vsp1/vsp1_pipe.c   |   6 +-
> > >  drivers/media/platform/vsp1/vsp1_pipe.h   |   6 +-
> > >  drivers/media/platform/vsp1/vsp1_regs.h   |  46 ++++-
> > >  drivers/media/platform/vsp1/vsp1_rpf.c    |   6 +-
> > >  drivers/media/platform/vsp1/vsp1_rwpf.c   |   6 +-
> > >  drivers/media/platform/vsp1/vsp1_rwpf.h   |   6 +-
> > >  drivers/media/platform/vsp1/vsp1_sru.c    |   6 +-
> > >  drivers/media/platform/vsp1/vsp1_sru.h    |   6 +-
> > >  drivers/media/platform/vsp1/vsp1_uds.c    |   6 +-
> > >  drivers/media/platform/vsp1/vsp1_uds.h    |   6 +-
> > >  drivers/media/platform/vsp1/vsp1_uif.c    | 271 +++++++++++++++++++++++++++
> > >  drivers/media/platform/vsp1/vsp1_uif.h    |  32 ++++
> > >  drivers/media/platform/vsp1/vsp1_video.c  |   6 +-
> > >  drivers/media/platform/vsp1/vsp1_video.h  |   6 +-
> > >  drivers/media/platform/vsp1/vsp1_wpf.c    |   6 +-
> > >  include/media/vsp1.h                      |  39 ++++-
> > >  44 files changed, 896 insertions(+), 417 deletions(-)
> > >  create mode 100644 drivers/media/platform/vsp1/vsp1_uif.c
> > >  create mode 100644 drivers/media/platform/vsp1/vsp1_uif.h
> > 
> > -- 
> > Regards,
> > 
> > Laurent Pinchart
> > 
> > 
> > 
> 
> -- 
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
