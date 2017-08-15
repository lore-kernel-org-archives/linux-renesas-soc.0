Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:42734 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752453AbdHOWx1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 15 Aug 2017 18:53:27 -0400
Date: Tue, 15 Aug 2017 17:53:24 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Harunobu Kurokawa <harunobu.kurokawa.dn@renesas.com>
Cc: horms@verge.net.au, bhelgaas@google.com, linux-pci@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] PCI: rcar-pcie: Fix memory leak
Message-ID: <20170815225324.GT32525@bhelgaas-glaptop.roam.corp.google.com>
References: <20170804033255.27171-1-harunobu.kurokawa.dn@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170804033255.27171-1-harunobu.kurokawa.dn@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Fri, Aug 04, 2017 at 12:32:53PM +0900, Harunobu Kurokawa wrote:
> When no PCIe card is inserted, there is a memory leak as
> pci_free_resource_list is not called before returning.
> 
> v2:
>  separate the patch to two files.
> 
> Harunobu Kurokawa (1):
>   PCI: rcar-pcie: Fix memory leak when no PCIe card is inserted
> 
> Lorenzo Pieralisi (1):
>   PCI: rcar: Fix error exit path
> 
>  drivers/pci/host/pcie-rcar.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)

Applied with Simon's ack to pci/host-rcar for v4.14, thanks!
