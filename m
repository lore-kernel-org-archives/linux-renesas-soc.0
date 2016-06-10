Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-vk0-f42.google.com ([209.85.213.42]:34694 "EHLO
	mail-vk0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751382AbcFJTAz (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Fri, 10 Jun 2016 15:00:55 -0400
Received: by mail-vk0-f42.google.com with SMTP id e4so109574629vkb.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 10 Jun 2016 12:00:54 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20160606225630.20936.77349.stgit@bhelgaas-glaptop2.roam.corp.google.com>
References: <20160606225630.20936.77349.stgit@bhelgaas-glaptop2.roam.corp.google.com>
From: Duc Dang <dhdang@apm.com>
Date: Fri, 10 Jun 2016 12:00:23 -0700
Message-ID: <CADaLNDmnTCnswZLgvsCL=g8rmmCaNjj7ZA-qCaFWSgTjCZko3Q@mail.gmail.com>
Subject: Re: [PATCH v1 00/25] PCI: Request host bridge window resources
To: Bjorn Helgaas <bhelgaas@google.com>
Cc: linux-pci@vger.kernel.org,
	Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
	Jason Cooper <jason@lakedaemon.net>,
	Scott Branden <sbranden@broadcom.com>,
	Jon Mason <jonmason@broadcom.com>,
	Jingoo Han <jingoohan1@gmail.com>,
	Pratyush Anand <pratyush.anand@gmail.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	rfi@lists.rocketboards.org, linux-renesas-soc@vger.kernel.org,
	Simon Horman <horms@verge.net.au>,
	Thierry Reding <thierry.reding@gmail.com>,
	Tanmay Inamdar <tinamdar@apm.com>, Ray Jui <rjui@broadcom.com>,
	linux-tegra@vger.kernel.org, Ley Foon Tan <lftan@altera.com>,
	Michal Simek <michal.simek@xilinx.com>,
	=?UTF-8?Q?S=C3=B6ren_Brinkmann?= <soren.brinkmann@xilinx.com>,
	linux-arm <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Mon, Jun 6, 2016 at 4:04 PM, Bjorn Helgaas <bhelgaas@google.com> wrote:
> Several host bridge drivers (designware and all derivatives, iproc,
> xgene, xilinx, and xilinx-nwl) don't request the MMIO and I/O port
> windows they forward downstream to the PCI bus.
>
> That means the PCI core can't request resources for PCI bridge
> windows and PCI BARs.
>
> Several other drivers (altera, generic, mvebu, rcar, tegra) do request
> the windows, but use some duplicated code to do it.
>
> This adds a new devm_request_pci_bus_resources() interface and changes
> these drivers to use it.  It also fixes several error paths where we failed
> to free the resource list allocated by of_pci_get_host_bridge_resources().
>
> Tegra guys, please take a look at "PCI: tegra: Remove top-level resource
> from hierarchy" in particular.  Removing the top-level resource definitely
> makes /proc/iomem look uglier (although it will look more like that of
> other drivers).  A short-term fix could be to include device information in
> the resource name.  I think a better long-term fix would be to make the DT
> or platform device core request all the resources from the DT.
>
> Comments welcome.  I expect we'll trip over something here, so I marked
> this "v1" and I don't plan to put it into -next for a while.
>
> This is on my pci/host-request-windows branch, which you can pull or view
> at https://git.kernel.org/cgit/linux/kernel/git/helgaas/pci.git/log/?h=pci/host-request-windows
>
> ---
>
> Bjorn Helgaas (25):
>       PCI: Add devm_request_pci_bus_resources()
>       PCI: designware: Free bridge resource list on failure
>       PCI: designware: Request host bridge window resources
>       PCI: designware: Simplify host bridge window iteration
>       PCI: iproc: Request host bridge window resources
>       PCI: xgene: Free bridge resource list on failure
>       PCI: xgene: Request host bridge window resources
>       PCI: xilinx: Free bridge resource list on failure
>       PCI: xilinx: Request host bridge window resources
>       PCI: xilinx-nwl: Free bridge resource list on failure
>       PCI: xilinx-nwl: Request host bridge window resources
>       PCI: xilinx-nwl: Use dev_printk() when possible
>       PCI: altera: Request host bridge window resources with core function
>       PCI: altera: Simplify host bridge window iteration
>       PCI: generic: Free resource list close to where it's allocated
>       PCI: generic: Request host bridge window resources with core function
>       PCI: generic: Simplify host bridge window iteration
>       PCI: mvebu: Request host bridge window resources with core function
>       PCI: rcar Gen2: Request host bridge window resources
>       PCI: rcar: Request host bridge window resources with core function
>       PCI: rcar: Simplify host bridge window iteration
>       PCI: tegra: Remove top-level resource from hierarchy
>       PCI: tegra: Request host bridge window resources with core function
>       PCI: versatile: Request host bridge window resources with core function
>       PCI: versatile: Simplify host bridge window iteration

Thanks, Bjorn.

For the 2 X-Gene patches:
     PCI: xgene: Free bridge resource list on failure
     PCI: xgene: Request host bridge window resources

Tested-by: Duc Dang <dhdang@apm.com>

Regards,
Duc Dang.
>
>
>  drivers/pci/bus.c                  |   29 +++++++++++++++++
>  drivers/pci/host/pci-host-common.c |   61 +++++++++++++++---------------------
>  drivers/pci/host/pci-mvebu.c       |   17 ++++------
>  drivers/pci/host/pci-rcar-gen2.c   |    4 ++
>  drivers/pci/host/pci-tegra.c       |   35 +++------------------
>  drivers/pci/host/pci-versatile.c   |   29 ++++++-----------
>  drivers/pci/host/pci-xgene.c       |   16 ++++++++-
>  drivers/pci/host/pcie-altera.c     |   35 ++++++---------------
>  drivers/pci/host/pcie-designware.c |   34 +++++++++++++-------
>  drivers/pci/host/pcie-iproc.c      |    4 ++
>  drivers/pci/host/pcie-rcar.c       |   33 +++++--------------
>  drivers/pci/host/pcie-xilinx-nwl.c |   20 +++++++++---
>  drivers/pci/host/pcie-xilinx.c     |   16 ++++++++-
>  include/linux/pci.h                |    5 ++-
>  14 files changed, 170 insertions(+), 168 deletions(-)
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
