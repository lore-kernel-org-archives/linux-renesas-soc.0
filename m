Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-oi1-f194.google.com ([209.85.167.194]:38124 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726340AbeKFIvm (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 6 Nov 2018 03:51:42 -0500
Date: Mon, 5 Nov 2018 17:29:30 -0600
From: Rob Herring <robh@kernel.org>
To: Biju Das <biju.das@bp.renesas.com>
Cc: Vinod Koul <vkoul@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
        Biju Das <biju.das@bp.renesas.com>, dmaengine@vger.kernel.org,
        devicetree@vger.kernel.org, Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: dmaengine: usb-dmac: Add binding for
 r8a77470
Message-ID: <20181105232930.GA27057@bogus>
References: <1540479218-4954-1-git-send-email-biju.das@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1540479218-4954-1-git-send-email-biju.das@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, 25 Oct 2018 15:53:37 +0100, Biju Das wrote:
> This patch adds usb high-speed dmac binding for r8a77470 (RZ/G1C) SoC.
> 
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> ---
> This patch tested against linux-next.
> ---
>  Documentation/devicetree/bindings/dma/renesas,usb-dmac.txt | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
