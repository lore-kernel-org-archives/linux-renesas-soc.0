Return-Path: <SRS0=VX+A=O3=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBC61C43387
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 18 Dec 2018 07:39:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id BA236214C6
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 18 Dec 2018 07:39:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Fy3TkuKT"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726370AbeLRHjw (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 18 Dec 2018 02:39:52 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:33222 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726346AbeLRHjw (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 18 Dec 2018 02:39:52 -0500
Received: from avalon.localnet (dfj612ybrt5fhg77mgycy-3.rev.dnainternet.fi [IPv6:2001:14ba:21f5:5b00:2e86:4862:ef6a:2804])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2D74553A;
        Tue, 18 Dec 2018 08:39:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1545118789;
        bh=4Q4wZ4X6y1NmHhb0q6L3P1+ro0uP5EBl6elh7bEaOwM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Fy3TkuKTdeAhWxpSKlm5UE4g2YFs24EzKQ6EP+a1qsNLLlbZQiwNxY+nIL1sayzHn
         sZ0dsJm4a3cyHteYhOym9jhcPTt29Qqi+fv11mwl92kOYDK3iAjmWqoeBkiwgzJsb/
         SonZ/mpVEok2drE3m0RTL0w9Po4HU2K4J9QGUPHY=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     dri-devel@lists.freedesktop.org
Cc:     Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        linux-renesas-soc@vger.kernel.org,
        Daniel Vetter <daniel.vetter@intel.com>,
        Liviu Dudau <Liviu.Dudau@arm.com>
Subject: Re: [PATCH/RFC 0/2] R-Car DU: Support importing non-contiguous dma-buf with VSP
Date:   Tue, 18 Dec 2018 09:40:40 +0200
Message-ID: <1982141.kWhUBg2rcG@avalon>
Organization: Ideas on Board Oy
In-Reply-To: <e9dc2b5e-fb54-bdf9-6cf8-109d0bfda5a5@ideasonboard.com>
References: <20171113103228.23312-1-laurent.pinchart+renesas@ideasonboard.com> <e9dc2b5e-fb54-bdf9-6cf8-109d0bfda5a5@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Kieran,

On Monday, 13 November 2017 15:48:19 EET Kieran Bingham wrote:
> On 13/11/17 10:32, Laurent Pinchart wrote:
> > Hello everybody,
> > 
> > This patch series fixes two issues related to dma-buf import for the
> > Renesas R-Car DU when the imported buffer is either not physically
> > contiguous or located in high memory.
> > 
> > Both cases require the use of an IOMMU to remap the buffers contiguously
> > and in 32-bit DMA space. On Gen2 platforms this is transparent and works
> > already, but on Gen3 platforms the situation is more complex.
> > 
> > The Gen3 DU doesn't perform DMA access directly but instead goes through a
> > VSP IP core that acts as an external composer. When importing a dma-buf
> > buffer the GEM PRIME helper drm_gem_prime_import() maps the buffer to the
> > DU device, and the DU driver later remaps it to the VSP device. The
> > driver unfortunately can't use the drm_gem_prime_import_dev() helper to
> > map th buffer to the VSP device directly, as at import time we don't know
> > yet to which VSP device the buffer will need to be mapped (there is one
> > VSP composer per CRTC). Mapping the buffer to the VSP can thus only be
> > done when pinning the framebuffer, as we know at that time which plane
> > and CRTC it will be used with.
> > 
> > This works currently (with the caveat that an unneeded mapping to the DU
> > is created), but fails when the imported buffer is not physically
> > contiguous or is located in high memory. In the first case the GEM CMA
> > helper drm_gem_cma_prime_import_sg_table() will reject the buffer as it
> > hasn't been mapped contiguously in the DU DMA address space (because the
> > DU has no IOMMU), and in the second case the DMA mapping API will try to
> > allocate a bounce buffer and fail due to bounce buffer memory exhaustion.
> > 
> > The first patch in this series fixes the second issue by setting the DMA
> > coherent mask of the DU device to the full 40 bits address space. All
> > memory will thus be accepted without trying to allocate a bounce buffer.
> > 
> > The second patch in this series fixes the first issue by using an internal
> > copy of the drm_gem_cma_prime_import_sg_table() function that doesn't
> > ensure that the buffer is contiguous in memory. This is what caused me to
> > post this series as an RFC, as I'm not very happy with duplication of
> > helper code in the driver that could lead to breakages when the GEM CMA
> > helpers are modified. If this approach is accepted, I would prefer
> > implementing the code in the GEM CMA helpers.
> > 
> > Another point that bothers me is that buffers can now be imported
> > unconditionally on Gen3 platforms, but atomic commits will fail if the
> > buffer can't be remapped through the VSP (for instance if no IOMMU is
> > available). Given the hardware architecture and the DRM/KMS API I don't
> > really see a way around this.
> > 
> > Testing this series isn't easy as it requires getting hold of exported
> > dma-bufs located in high memory or not physically contiguous. I have used
> > the V4L2 vivid driver as an exporter for that purpose, with a few hacks
> > that can be found at
> > 
> > 	git://linuxtv.org/pinchartl/media.git drm/du/devel/iommu
> 
> Ok - testing from this branch with "drm: rcar-du: Allow importing
> non-contiguous dma-buf with VSP" applied on top (it appeared to be missing)
> 
> > On the userspace side I have used the v4l2-drm-example test application
> > available at
> > 
> > 	git://git.infradead.org/users/kmpark/public-apps
> > 
> > and run with
> > 
> > dmabuf-sharing -M rcar-du -i /dev/video0 -S 640,480 -f YUYV -F YUYV \
> > 
> > 	-s 640,480@0,0 -t 640,480@0,0 -o 70:68:640x480 -b 4 -e v4l2
> > 
> > (the -o argument needs to be modified based on the connector and CRTC ID).
> 
> I've build dmabuf-sharing from kmpark/public-apps/v4l2-drm-example, but it
> doesn't appear to have a "-e v4l2" option (not listed in the -h, and
> complains with "ERROR(dmabuf-sharing.c:560) : failed to parse arguments")
> 
> Have you also modified this application to run your tests?

Oops, yes, I have. Sorry for not mentioning that. The modified version can be 
found at

	git://git.ideasonboard.org/samsung-utils.git

> If it's easier, I can look at the screen while you run the test under your
> control as well.
> 
> > Up to patch "[DEBUG] v4l: videobuf2-dma-contig: Print allocated buffer
> > address" buffer sharing should work. Patch "[HACK] vivid: Allocate buffers
> > from high memory" then breaks buffer import, and the issue is fixed by
> > patch "drm: rcar-du: Set the DMA coherent mask for the DU device". Patch
> > "[HACK] vivid: Use vmalloc allocator" breaks buffer import again, and is
> > fixed by "drm: rcar-du: Allow importing non-contiguous dma-buf with VSP".
> > 
> > Kieran, I have tested this remotely on your Salvator-X H3 ES1.1 and
> > haven't noticed any problem, but couldn't check the output on the screen.
> > Would you be able to rerun the test locally for me ? Please note that the
> > IPMMU is known to have issues on H3 ES1.1, so you might need to test the
> > code on H3 ES2.0 instead.
> > 
> > Laurent Pinchart (2):
> >   drm: rcar-du: Set the DMA coherent mask for the DU device
> >   drm: rcar-du: Allow importing non-contiguous dma-buf with VSP
> >  
> >  drivers/gpu/drm/rcar-du/rcar_du_drv.c | 13 +++++++++++-
> >  drivers/gpu/drm/rcar-du/rcar_du_kms.c | 39 ++++++++++++++++++++++++++++++
> >  drivers/gpu/drm/rcar-du/rcar_du_kms.h |  7 +++++++
> >  3 files changed, 58 insertions(+), 1 deletion(-)

-- 
Regards,

Laurent Pinchart



