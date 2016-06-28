Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mga01.intel.com ([192.55.52.88]:38433 "EHLO mga01.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752091AbcF1O3n (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Tue, 28 Jun 2016 10:29:43 -0400
Date: Tue, 28 Jun 2016 20:06:41 +0530
From: Vinod Koul <vinod.koul@intel.com>
To: Niklas =?iso-8859-1?Q?S=F6derlund?=
	<niklas.soderlund+renesas@ragnatech.se>
Cc: dmaengine@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	geert+renesas@glider.be, laurent.pinchart+renesas@ideasonboard.com,
	mfarooq@visteon.com
Subject: Re: [PATCH 0/4] Residue patches for rcar-dmac from renesas-drivers
Message-ID: <20160628143640.GC14945@localhost>
References: <20160615111308.28739-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20160615111308.28739-1-niklas.soderlund+renesas@ragnatech.se>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, Jun 15, 2016 at 01:13:04PM +0200, Niklas S�derlund wrote:
> Hi all,
> 
> Laurent Pinchart (1):
>   dmaengine: rcar-dmac: Fix residue reporting for pending descriptors
> 
> Muhammad Hamza Farooq (2):
>   dma: rcar-dma: use result of updated get_residue in tx_status
>   dma: rcar-dma: Fixed active descriptor initializing
> 
> Niklas S�derlund (1):
>   dmaengine: rcar-dmac: warn if transfer cannot start as TE = 1

At least maintain consistency in patch title, 2 are dma and two dmaengine.
Correct one is latter..

> 
>  drivers/dma/sh/rcar-dmac.c | 40 +++++++++++++++++++++++++++++++++++++---
>  1 file changed, 37 insertions(+), 3 deletions(-)
> 
> -- 
> 2.8.3
> 

-- 
~Vinod
