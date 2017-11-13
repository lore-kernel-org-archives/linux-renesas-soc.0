Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:38419 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752576AbdKMNsY (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 13 Nov 2017 08:48:24 -0500
Subject: Re: [PATCH/RFC 0/2] R-Car DU: Support importing non-contiguous
 dma-buf with VSP
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org
Cc: linux-renesas-soc@vger.kernel.org,
        Liviu Dudau <Liviu.Dudau@arm.com>,
        Daniel Vetter <daniel.vetter@intel.com>
References: <20171113103228.23312-1-laurent.pinchart+renesas@ideasonboard.com>
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Message-ID: <e9dc2b5e-fb54-bdf9-6cf8-109d0bfda5a5@ideasonboard.com>
Date: Mon, 13 Nov 2017 13:48:19 +0000
MIME-Version: 1.0
In-Reply-To: <20171113103228.23312-1-laurent.pinchart+renesas@ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Laurent,

On 13/11/17 10:32, Laurent Pinchart wrote:
> Hello everybody,
> 
> This patch series fixes two issues related to dma-buf import for the Renesas
> R-Car DU when the imported buffer is either not physically contiguous or
> located in high memory.
> 
> Both cases require the use of an IOMMU to remap the buffers contiguously and
> in 32-bit DMA space. On Gen2 platforms this is transparent and works already,
> but on Gen3 platforms the situation is more complex.
> 
> The Gen3 DU doesn't perform DMA access directly but instead goes through a VSP
> IP core that acts as an external composer. When importing a dma-buf buffer the
> GEM PRIME helper drm_gem_prime_import() maps the buffer to the DU device, and
> the DU driver later remaps it to the VSP device. The driver unfortunately
> can't use the drm_gem_prime_import_dev() helper to map th buffer to the VSP
> device directly, as at import time we don't know yet to which VSP device the
> buffer will need to be mapped (there is one VSP composer per CRTC). Mapping
> the buffer to the VSP can thus only be done when pinning the framebuffer, as
> we know at that time which plane and CRTC it will be used with.
> 
> This works currently (with the caveat that an unneeded mapping to the DU is
> created), but fails when the imported buffer is not physically contiguous or
> is located in high memory. In the first case the GEM CMA helper
> drm_gem_cma_prime_import_sg_table() will reject the buffer as it hasn't been
> mapped contiguously in the DU DMA address space (because the DU has no IOMMU),
> and in the second case the DMA mapping API will try to allocate a bounce
> buffer and fail due to bounce buffer memory exhaustion.
> 
> The first patch in this series fixes the second issue by setting the DMA
> coherent mask of the DU device to the full 40 bits address space. All memory
> will thus be accepted without trying to allocate a bounce buffer.
> 
> The second patch in this series fixes the first issue by using an internal
> copy of the drm_gem_cma_prime_import_sg_table() function that doesn't ensure
> that the buffer is contiguous in memory. This is what caused me to post this
> series as an RFC, as I'm not very happy with duplication of helper code in the
> driver that could lead to breakages when the GEM CMA helpers are modified. If
> this approach is accepted, I would prefer implementing the code in the GEM CMA
> helpers.
> 
> Another point that bothers me is that buffers can now be imported
> unconditionally on Gen3 platforms, but atomic commits will fail if the buffer
> can't be remapped through the VSP (for instance if no IOMMU is available).
> Given the hardware architecture and the DRM/KMS API I don't really see a way
> around this.
> 
> Testing this series isn't easy as it requires getting hold of exported
> dma-bufs located in high memory or not physically contiguous. I have used the
> V4L2 vivid driver as an exporter for that purpose, with a few hacks that can
> be found at
> 
> 	git://linuxtv.org/pinchartl/media.git drm/du/devel/iommu
> 

Ok - testing from this branch with "drm: rcar-du: Allow importing non-contiguous
dma-buf with VSP" applied on top (it appeared to be missing)

> On the userspace side I have used the v4l2-drm-example test application
> available at
> 
> 	git://git.infradead.org/users/kmpark/public-apps
> 
> and run with
> 
> dmabuf-sharing -M rcar-du -i /dev/video0 -S 640,480 -f YUYV -F YUYV \
> 	-s 640,480@0,0 -t 640,480@0,0 -o 70:68:640x480 -b 4 -e v4l2
> 
> (the -o argument needs to be modified based on the connector and CRTC ID).

I've build dmabuf-sharing from kmpark/public-apps/v4l2-drm-example, but it
doesn't appear to have a "-e v4l2" option (not listed in the -h, and complains
with "ERROR(dmabuf-sharing.c:560) : failed to parse arguments")

Have you also modified this application to run your tests?

If it's easier, I can look at the screen while you run the test under your
control as well.


> Up to patch "[DEBUG] v4l: videobuf2-dma-contig: Print allocated buffer
> address" buffer sharing should work. Patch "[HACK] vivid: Allocate buffers
> from high memory" then breaks buffer import, and the issue is fixed by patch
> "drm: rcar-du: Set the DMA coherent mask for the DU device". Patch "[HACK]
> vivid: Use vmalloc allocator" breaks buffer import again, and is fixed by
> "drm: rcar-du: Allow importing non-contiguous dma-buf with VSP".
> 
> Kieran, I have tested this remotely on your Salvator-X H3 ES1.1 and haven't
> noticed any problem, but couldn't check the output on the screen. Would you be
> able to rerun the test locally for me ? Please note that the IPMMU is known to
> have issues on H3 ES1.1, so you might need to test the code on H3 ES2.0
> instead.
> 
> Laurent Pinchart (2):
>   drm: rcar-du: Set the DMA coherent mask for the DU device
>   drm: rcar-du: Allow importing non-contiguous dma-buf with VSP
> 
>  drivers/gpu/drm/rcar-du/rcar_du_drv.c | 13 +++++++++++-
>  drivers/gpu/drm/rcar-du/rcar_du_kms.c | 39 +++++++++++++++++++++++++++++++++++
>  drivers/gpu/drm/rcar-du/rcar_du_kms.h |  7 +++++++
>  3 files changed, 58 insertions(+), 1 deletion(-)
