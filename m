Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:41156 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751396AbeEQJGk (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 17 May 2018 05:06:40 -0400
Date: Thu, 17 May 2018 10:56:07 +0200
From: Simon Horman <horms@verge.net.au>
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org,
        "David S. Miller" <davem@davemloft.net>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 3/3] sh_eth: add R8A77980 support
Message-ID: <20180517085607.igdglwpuswm43zgh@verge.net.au>
References: <087c91a3-a451-6de7-5e0f-a835f8cc98f1@cogentembedded.com>
 <d3fe7c8e-3356-4f3a-d550-bc813f3f72cd@cogentembedded.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d3fe7c8e-3356-4f3a-d550-bc813f3f72cd@cogentembedded.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, May 16, 2018 at 11:00:29PM +0300, Sergei Shtylyov wrote:
> Finally, add support for the DT probing of the R-Car V3H (AKA R8A77980) --
> it's the only R-Car gen3 SoC having the GEther controller -- others have
> only EtherAVB...
> 
> Based on the original (and large) patch by Vladimir Barinov.
> 
> Signed-off-by: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
