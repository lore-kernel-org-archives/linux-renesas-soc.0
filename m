Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.136]:41108 "EHLO mail.kernel.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751635AbcFUPKK (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Tue, 21 Jun 2016 11:10:10 -0400
Date: Tue, 21 Jun 2016 10:03:52 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: wangyijing <wangyijing@huawei.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>,
	Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
	Jason Cooper <jason@lakedaemon.net>,
	Scott Branden <sbranden@broadcom.com>,
	Jon Mason <jonmason@broadcom.com>, linux-pci@vger.kernel.org,
	Pratyush Anand <pratyush.anand@gmail.com>,
	linux-kernel@vger.kernel.org, Ray Jui <rjui@broadcom.com>,
	rfi@lists.rocketboards.org, linux-renesas-soc@vger.kernel.org,
	Simon Horman <horms@verge.net.au>,
	Thierry Reding <thierry.reding@gmail.com>,
	Tanmay Inamdar <tinamdar@apm.com>,
	Jingoo Han <jingoohan1@gmail.com>, linux-tegra@vger.kernel.org,
	Ley Foon Tan <lftan@altera.com>,
	Michal Simek <michal.simek@xilinx.com>,
	=?iso-8859-1?Q?S=F6ren?= Brinkmann <soren.brinkmann@xilinx.com>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v1 00/25] PCI: Request host bridge window resources
Message-ID: <20160621150352.GB31917@localhost>
References: <20160606225630.20936.77349.stgit@bhelgaas-glaptop2.roam.corp.google.com>
 <20160618180735.GB20504@localhost>
 <57692BD0.6030609@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <57692BD0.6030609@huawei.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, Jun 21, 2016 at 07:58:08PM +0800, wangyijing wrote:
> Hi Bjorn, use devm_request_resource() for host bridge resource is cool,
> what about do the similar change for x86, now we request host bridge resource
> in pci_acpi_root_add_resources() in x86, and we would release the host bridge
> resource when host bridge device refcount reach 0. This logic may introduce issue,
> E.g.
> If we try to remove a pci host bridge, but there is a child pci device which refcount
> cannot decrease to 0 after remove the device, in this case, its parent pci_bus and
> parent device, all their refcount cannot reach to 0, the result is pci host bridge
> refcount can not reach 0, so its .release_fn() won't be called, and host bridge
> resouces can not release. If we want to add the pci host bridge again, all pci devices
> can not work because the resource is conflict with the old.
> 
> devm resource would be released when the driver detach, this is better than what we do now, I think.

I'm not going to convert pci_root.c to use devm right now.  That might
be a good thing, but this current series is mostly trivial.  I think
changing pci_root.c would not be trivial, so that looks like a project
all by itself.

I don't quite follow the example of removing a host bridge while a
child PCI device refcount is non-zero.  That sounds like an invalid
scenario regardless of whether the resources are released by a
.release_fn() or by devm.

Bjorn
