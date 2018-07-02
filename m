Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:51506 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1753987AbeGBLvc (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 2 Jul 2018 07:51:32 -0400
Date: Mon, 2 Jul 2018 13:51:23 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-renesas-soc@vger.kernel.org,
        Tomeu Vizoso <tomeu.vizoso@collabora.com>
Subject: Re: [PROTO] [VIRTIO] [PATCH 0/2] Improve display performances when
 VIRGL is not available
Message-ID: <20180702115123.dvyen4aeh2iqyk3l@sirius.home.kraxel.org>
References: <20180629170041.13722-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180629170041.13722-1-laurent.pinchart@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

  Hi,

> The second patch is an extension to the virtio-gpu protocol to allow memory
> for buffers to be allocated by the host and mapped to the guest, in an attempt
> to remove a full-frame memcpy() for each page flip.

> I haven't finished implementing this specification in QEMU and the Linux
> kernel virtio-gpu driver yet, so it remains untested for now. One problem
> remains to be solved, as the specification doesn't document how the
> host-allocated backing storage can be mapped to the guest. I plan to
> experiment with KVM_SET_USER_MEMORY_REGION, but adding random memory regions
> to guests at runtime isn't a good idea as the guest memory space is mostly
> managed by the guest. One possible solution would be to declare a large device
> memory range (through a separate PCI BAR or mmio memory range) that would be
> initially unpopulated, and map the buffers in that range. Whether that option
> is viable remains to be analyzed, but feedback would already be welcome.

I don't think it makes sense to work on the spec without having a
solution for this issue ...

I'd prefer to handle this on the host side.  I have a hackish prototype
which uses my udmabuf driver.

kernel driver:
	https://git.kraxel.org/cgit/linux/log/?h=udmabuf

qemu patches:
	https://git.kraxel.org/cgit/qemu/log/?h=sirius/udmabuf

Basic idea is to create dma-bufs for guest resources, which then can
either be mapped by qemu to get a linear mapping of the resource (done
by the patch branch above) or even passed on to other processes on the
host (spice client, wayland server, not in the prototype).

The prototype has no virtio-gpu protocol change, instead it just
shortcuts copy requests.  A non-prototype version should of course not
do that, we'll need a feature flag and probably a resource flag too so
the guest knows what is happening and can set the flag depending on the
buffer type.

cheers,
  Gerd
