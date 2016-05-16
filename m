Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:55938 "EHLO
	kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751013AbcEPILJ (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Mon, 16 May 2016 04:11:09 -0400
Date: Mon, 16 May 2016 17:11:08 +0900
From: Simon Horman <horms@verge.net.au>
To: Niklas =?utf-8?Q?S=C3=B6derlund?=
	<niklas.soderlund+renesas@ragnatech.se>
Cc: magnus.damm@gmail.com, geert@linux-m68k.org, arnd@arndb.de,
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCHv4 0/4] Reference both DMA controllers
Message-ID: <20160516081108.GB4955@verge.net.au>
References: <1463043285-14702-1-git-send-email-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1463043285-14702-1-git-send-email-niklas.soderlund+renesas@ragnatech.se>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, May 12, 2016 at 10:54:41AM +0200, Niklas Söderlund wrote:
> Hi,
> 
> R-Car Gen2 have two DMA controllers, which are equivalent. However DMA
> slaves were tied only to a single DMA controller in .dtsi. This series
> add references to to both DMA controllers for all nodes that previously
> only referenced one of them. It also adds dma references to the SDHI
> nodes for r8a7794 which according to the datasheet should work but I
> have not access to HW to verify.
> 
> Tested on Koelsch (r8a7791) by altering the compatible value of either
> dmac0 or dmac1 and verifying that the DMA slaves pick the DMA controller
> that is available.

Thanks, I have queued these up.
