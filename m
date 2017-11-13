Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:37553 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751865AbdKMKc2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 13 Nov 2017 05:32:28 -0500
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-renesas-soc@vger.kernel.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Liviu Dudau <Liviu.Dudau@arm.com>,
        Daniel Vetter <daniel.vetter@intel.com>
Subject: [PATCH/RFC 0/2] R-Car DU: Support importing non-contiguous dma-buf with VSP
Date: Mon, 13 Nov 2017 12:32:26 +0200
Message-Id: <20171113103228.23312-1-laurent.pinchart+renesas@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello everybody,

This patch series fixes two issues related to dma-buf import for the Renesas
R-Car DU when the imported buffer is either not physically contiguous or
located in high memory.

Both cases require the use of an IOMMU to remap the buffers contiguously and
in 32-bit DMA space. On Gen2 platforms this is transparent and works already,
but on Gen3 platforms the situation is more complex.

The Gen3 DU doesn't perform DMA access directly but instead goes through a VSP
IP core that acts as an external composer. When importing a dma-buf buffer the
GEM PRIME helper drm_gem_prime_import() maps the buffer to the DU device, and
the DU driver later remaps it to the VSP device. The driver unfortunately
can't use the drm_gem_prime_import_dev() helper to map th buffer to the VSP
device directly, as at import time we don't know yet to which VSP device the
buffer will need to be mapped (there is one VSP composer per CRTC). Mapping
the buffer to the VSP can thus only be done when pinning the framebuffer, as
we know at that time which plane and CRTC it will be used with.

This works currently (with the caveat that an unneeded mapping to the DU is
created), but fails when the imported buffer is not physically contiguous or
is located in high memory. In the first case the GEM CMA helper
drm_gem_cma_prime_import_sg_table() will reject the buffer as it hasn't been
mapped contiguously in the DU DMA address space (because the DU has no IOMMU),
and in the second case the DMA mapping API will try to allocate a bounce
buffer and fail due to bounce buffer memory exhaustion.

The first patch in this series fixes the second issue by setting the DMA
coherent mask of the DU device to the full 40 bits address space. All memory
will thus be accepted without trying to allocate a bounce buffer.

The second patch in this series fixes the first issue by using an internal
copy of the drm_gem_cma_prime_import_sg_table() function that doesn't ensure
that the buffer is contiguous in memory. This is what caused me to post this
series as an RFC, as I'm not very happy with duplication of helper code in the
driver that could lead to breakages when the GEM CMA helpers are modified. If
this approach is accepted, I would prefer implementing the code in the GEM CMA
helpers.

Another point that bothers me is that buffers can now be imported
unconditionally on Gen3 platforms, but atomic commits will fail if the buffer
can't be remapped through the VSP (for instance if no IOMMU is available).
Given the hardware architecture and the DRM/KMS API I don't really see a way
around this.

Testing this series isn't easy as it requires getting hold of exported
dma-bufs located in high memory or not physically contiguous. I have used the
V4L2 vivid driver as an exporter for that purpose, with a few hacks that can
be found at

	git://linuxtv.org/pinchartl/media.git drm/du/devel/iommu

On the userspace side I have used the v4l2-drm-example test application
available at

	git://git.infradead.org/users/kmpark/public-apps

and run with

dmabuf-sharing -M rcar-du -i /dev/video0 -S 640,480 -f YUYV -F YUYV \
	-s 640,480@0,0 -t 640,480@0,0 -o 70:68:640x480 -b 4 -e v4l2

(the -o argument needs to be modified based on the connector and CRTC ID).

Up to patch "[DEBUG] v4l: videobuf2-dma-contig: Print allocated buffer
address" buffer sharing should work. Patch "[HACK] vivid: Allocate buffers
from high memory" then breaks buffer import, and the issue is fixed by patch
"drm: rcar-du: Set the DMA coherent mask for the DU device". Patch "[HACK]
vivid: Use vmalloc allocator" breaks buffer import again, and is fixed by
"drm: rcar-du: Allow importing non-contiguous dma-buf with VSP".

Kieran, I have tested this remotely on your Salvator-X H3 ES1.1 and haven't
noticed any problem, but couldn't check the output on the screen. Would you be
able to rerun the test locally for me ? Please note that the IPMMU is known to
have issues on H3 ES1.1, so you might need to test the code on H3 ES2.0
instead.

Laurent Pinchart (2):
  drm: rcar-du: Set the DMA coherent mask for the DU device
  drm: rcar-du: Allow importing non-contiguous dma-buf with VSP

 drivers/gpu/drm/rcar-du/rcar_du_drv.c | 13 +++++++++++-
 drivers/gpu/drm/rcar-du/rcar_du_kms.c | 39 +++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/rcar-du/rcar_du_kms.h |  7 +++++++
 3 files changed, 58 insertions(+), 1 deletion(-)

-- 
Regards,

Laurent Pinchart
