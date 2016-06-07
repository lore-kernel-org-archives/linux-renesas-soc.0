Return-Path: <kieranbingham.mailinglists+caf_=kieranbingham=gmail.com@gmail.com>
Return-Path: <linux-kernel-owner@vger.kernel.org>
Date: Tue, 7 Jun 2016 18:34:27 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-kernel@lists.infradead.org,
	Bjorn Helgaas <bhelgaas@google.com>, linux-pci@vger.kernel.org,
	Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
	Jason Cooper <jason@lakedaemon.net>,
	Scott Branden <sbranden@broadcom.com>,
	Jon Mason <jonmason@broadcom.com>,
	Jingoo Han <jingoohan1@gmail.com>,
	Pratyush Anand <pratyush.anand@gmail.com>,
	linux-kernel@vger.kernel.org, rfi@lists.rocketboards.org,
	linux-renesas-soc@vger.kernel.org,
	Simon Horman <horms@verge.net.au>,
	Thierry Reding <thierry.reding@gmail.com>,
	Tanmay Inamdar <tinamdar@apm.com>, Ray Jui <rjui@broadcom.com>,
	linux-tegra@vger.kernel.org, Ley Foon Tan <lftan@altera.com>,
	Michal Simek <michal.simek@xilinx.com>,
	=?iso-8859-1?Q?S=F6ren?= Brinkmann <soren.brinkmann@xilinx.com>
Subject: Re: [PATCH v1 00/25] PCI: Request host bridge window resources
Message-ID: <20160607233427.GB4759@localhost>
References: <20160606225630.20936.77349.stgit@bhelgaas-glaptop2.roam.corp.google.com>
 <3416214.BpvATlfaN7@wuerfel>
 <20160607131105.GA2543@localhost>
 <3552943.lb56sJA8nL@wuerfel>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3552943.lb56sJA8nL@wuerfel>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, Jun 07, 2016 at 03:25:46PM +0200, Arnd Bergmann wrote:
> On Tuesday, June 7, 2016 8:11:05 AM CEST Bjorn Helgaas wrote:
> > > 
> > > What do you think is the correct behavior here, should the driver only
> > > request the PIO range with parent=ioport_resource, or should it also
> > > request the MMIO window for the I/O ports with parent=iomem_resource?
> > > In the latter case, any idea how that can be generalized?
> > 
> > I think it should request both because I think iomem_resource should
> > contain everything in the memory map.  This would be required if we ever
> > did any significant reassignment of top-level devices, e.g., ACPI devices.
> 
> Ok. Should we try to pass the mmio resource for the I/O window to
> the devm_request_pci_bus_resources() function along with the other
> arguments then?

I think memory-mapped I/O port windows are different enough that maybe
we ought to handle them separately.  It seems like there are several
things related to setting up those windows (requesting the resource,
ioremapping it, allocating the CPU port number space, etc.), and maybe
if we keep this out, a pattern will emerge.

Maybe I should rename this to "devm_request_pci_host_windows()" or
something?

> As far as I can tell, it should not go into the resource list
> because it is not something the PCI core code should access the
> way it handles the other resources.

Right.

Bjorn
