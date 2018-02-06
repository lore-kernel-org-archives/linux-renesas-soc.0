Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:59352 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751963AbeBFNRR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 6 Feb 2018 08:17:17 -0500
Date: Tue, 6 Feb 2018 14:17:13 +0100
From: Simon Horman <horms@verge.net.au>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        "David S . Miller" <davem@davemloft.net>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: net: renesas-ravb: Make stream buffer
 optional
Message-ID: <20180206131712.yzobmc7utxt7n77i@verge.net.au>
References: <1517922354-28421-1-git-send-email-geert+renesas@glider.be>
 <1517922354-28421-2-git-send-email-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1517922354-28421-2-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, Feb 06, 2018 at 02:05:52PM +0100, Geert Uytterhoeven wrote:
> The Stream Buffer for EtherAVB-IF (STBE) is an optional component, and
> is not present on all SoCs.
> 
> Document this in the DT bindings, including a list of SoCs that do have
> it.
> 
> Fixes: 785ec87483d1e24a ("ravb: document R8A77970 bindings")
> Fixes: f231c4178a655b09 ("dt-bindings: net: renesas-ravb: Add support for R8A77995 RAVB")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
