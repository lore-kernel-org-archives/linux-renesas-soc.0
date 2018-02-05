Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-pg0-f67.google.com ([74.125.83.67]:33596 "EHLO
        mail-pg0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752989AbeBEGJ2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 5 Feb 2018 01:09:28 -0500
Date: Mon, 5 Feb 2018 00:09:26 -0600
From: Rob Herring <robh@kernel.org>
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: vinod.koul@intel.com, dmaengine@vger.kernel.org,
        devicetree@vger.kernel.org, mark.rutland@arm.com,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] DT: dma: renesas,rcar-dmac: document R8A77980 support
Message-ID: <20180205041232.hzrwlrponxl2cjhg@rob-hp-laptop>
References: <8302f1c8-3deb-584b-d6c8-b46240275e9e@cogentembedded.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8302f1c8-3deb-584b-d6c8-b46240275e9e@cogentembedded.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, Feb 01, 2018 at 10:09:25PM +0300, Sergei Shtylyov wrote:
> Renesas  R-Car V3H SoC has the R-Car gen3 compatible DMA controllers.
> Document R-Car V3H (also known as R8A77980) SoC bindings.
> 
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> 
> ---
>  Documentation/devicetree/bindings/dma/renesas,rcar-dmac.txt |    1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Rob Herring <robh@kernel.org>
