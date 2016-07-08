Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mga01.intel.com ([192.55.52.88]:3203 "EHLO mga01.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751269AbcGHFdB (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Fri, 8 Jul 2016 01:33:01 -0400
Date: Fri, 8 Jul 2016 11:09:38 +0530
From: Vinod Koul <vinod.koul@intel.com>
To: Niklas =?iso-8859-1?Q?S=F6derlund?=
	<niklas.soderlund+renesas@ragnatech.se>
Cc: dmaengine@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	geert+renesas@glider.be, laurent.pinchart+renesas@ideasonboard.com,
	mfarooq@visteon.com
Subject: Re: [PATCHv2 0/4] Residue patches for rcar-dmac from renesas-drivers
Message-ID: <20160708053937.GO12591@localhost>
References: <20160630151518.32329-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20160630151518.32329-1-niklas.soderlund+renesas@ragnatech.se>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, Jun 30, 2016 at 05:15:14PM +0200, Niklas S�derlund wrote:
> Hi all,
> 
> I have looked over the DMA residue branches in renesas-drivers tree
> (topic/rcar-dmac-hamza-v3 and topic/rcar-dmac-residue-v1) hoping to
> bring them to upstream. The original author for the bulk of the patches
> Hamza Farooq have not shown any activity since autumn 2015.
> 
> In this cover letter I talk about all the patches in the above branches
> but for obvious reasons only patches I think should be forwarded to
> upstream are included in the series. All patches are based on top of
> v4.7-rc1 and are tested on Koelsch using Geerts sertest tool to generate
> DMA traffic. The highest baud I could get to work at was 921600 bps.
> From reading the original mail threads my conclusion is that this is
> good enough since all errors reported by Hamza Farooq where related to
> the serial sh-sci driver.

Applied all, thanks

-- 
~Vinod
