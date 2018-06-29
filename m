Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from perceval.ideasonboard.com ([213.167.242.64]:50942 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752226AbeF2RAY (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 29 Jun 2018 13:00:24 -0400
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>,
        Gerd Hoffmann <kraxel@redhat.com>
Subject: [PROTO] [VIRTIO] [PATCH 0/2] Improve display performances when VIRGL is not available
Date: Fri, 29 Jun 2018 20:00:39 +0300
Message-Id: <20180629170041.13722-1-laurent.pinchart@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello,

This patch series is a prototype that attemps to solve the display performance
problem inherent to the virtio-gpu protocol when VIRGL support isn't available
on the host side.

The first patch is the latest version (I found) of the virtio-gpu protocol
specification patch from Gerd Hoffmann. I have included it verbatim.

The second patch is an extension to the virtio-gpu protocol to allow memory
for buffers to be allocated by the host and mapped to the guest, in an attempt
to remove a full-frame memcpy() for each page flip.

I haven't finished implementing this specification in QEMU and the Linux
kernel virtio-gpu driver yet, so it remains untested for now. One problem
remains to be solved, as the specification doesn't document how the
host-allocated backing storage can be mapped to the guest. I plan to
experiment with KVM_SET_USER_MEMORY_REGION, but adding random memory regions
to guests at runtime isn't a good idea as the guest memory space is mostly
managed by the guest. One possible solution would be to declare a large device
memory range (through a separate PCI BAR or mmio memory range) that would be
initially unpopulated, and map the buffers in that range. Whether that option
is viable remains to be analyzed, but feedback would already be welcome.

Gerd Hoffmann (1):
  Add virtio gpu device specification.

Laurent Pinchart (1):
  virtio-gpu: Support host-allocated backing storage

 content.tex    |   2 +
 virtio-gpu.tex | 529 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 531 insertions(+)
 create mode 100644 virtio-gpu.tex

-- 
Regards,

Laurent Pinchart
