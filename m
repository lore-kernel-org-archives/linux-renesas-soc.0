Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from shards.monkeyblade.net ([184.105.139.130]:53056 "EHLO
        shards.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933351AbeCGPWw (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 7 Mar 2018 10:22:52 -0500
Date: Wed, 07 Mar 2018 10:22:50 -0500 (EST)
Message-Id: <20180307.102250.953694385634641400.davem@davemloft.net>
To: geert+renesas@glider.be
Cc: sergei.shtylyov@cogentembedded.com, robh+dt@kernel.org,
        mark.rutland@arm.com, netdev@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2] dt-bindings: net: renesas-ravb: Make stream buffer
 optional
From: David Miller <davem@davemloft.net>
In-Reply-To: <1520002908-24947-1-git-send-email-geert+renesas@glider.be>
References: <1520002908-24947-1-git-send-email-geert+renesas@glider.be>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Geert Uytterhoeven <geert+renesas@glider.be>
Date: Fri,  2 Mar 2018 16:01:48 +0100

> The Stream Buffer for EtherAVB-IF (STBE) is an optional component, and
> is not present on all SoCs.
> 
> Document this in the DT bindings, including a list of SoCs that do have
> it.
> 
> Fixes: 785ec87483d1e24a ("ravb: document R8A77970 bindings")
> Fixes: f231c4178a655b09 ("dt-bindings: net: renesas-ravb: Add support for R8A77995 RAVB")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
> Acked-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> ---
> v2:
>   - Add Reviewed-by, Acked-by,
>   - Add R-Car M3-N.

Applied, thanks Geert.
