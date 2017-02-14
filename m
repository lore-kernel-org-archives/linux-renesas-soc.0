Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mga01.intel.com ([192.55.52.88]:43749 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752126AbdBNHxn (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 14 Feb 2017 02:53:43 -0500
Date: Tue, 14 Feb 2017 13:24:19 +0530
From: Vinod Koul <vinod.koul@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Dan Williams <dan.j.williams@intel.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Niklas =?iso-8859-1?Q?S=F6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>, dmaengine@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2] dmaengine: rcar-dmac: Widen DMA mask to 40 bits
Message-ID: <20170214075418.GO2843@localhost>
References: <1486983626-10744-1-git-send-email-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1486983626-10744-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Mon, Feb 13, 2017 at 12:00:26PM +0100, Geert Uytterhoeven wrote:
> By default, the DMA mask covers only the low 32-bit address space, which
> causes SWIOTLB on arm64 to fall back to a bounce buffer for DMA
> transfers involving memory outside the 32-bit address space.
> 
> The R-Car DMA controller hardware supports a 40-bit address space, hence
> widen the DMA mask to 40 bits to actually make use of this feature.

Applied, thanks

-- 
~Vinod
