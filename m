Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mga04.intel.com ([192.55.52.120]:14777 "EHLO mga04.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751211AbcHHIEp (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Mon, 8 Aug 2016 04:04:45 -0400
Date: Mon, 8 Aug 2016 13:42:25 +0530
From: Vinod Koul <vinod.koul@intel.com>
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: dan.j.williams@intel.com, dmaengine@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] dmaengine: usb-dmac: check CHCR.DE bit in
 usb_dmac_isr_channel()
Message-ID: <20160808081225.GU9681@localhost>
References: <1470308381-11206-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1470308381-11206-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, Aug 04, 2016 at 07:59:41PM +0900, Yoshihiro Shimoda wrote:
> The USB-DMAC's interruption happens even if the CHCR.DE is not set to 1
> because CHCR.NULLE is set to 1. So, this driver should call
> usb_dmac_isr_transfer_end() if the DE bit is set to 1 only. Otherwise,
> the desc is possible to be NULL in the usb_dmac_isr_transfer_end().

Applied, thanks

-- 
~Vinod
