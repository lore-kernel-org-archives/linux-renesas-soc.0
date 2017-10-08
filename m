Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mga06.intel.com ([134.134.136.31]:13066 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751533AbdJHKrG (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 8 Oct 2017 06:47:06 -0400
Date: Sun, 8 Oct 2017 16:21:11 +0530
From: Vinod Koul <vinod.koul@intel.com>
To: Biju Das <biju.das@bp.renesas.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Simon Horman <horms@verge.net.au>,
        Chris Paterson <chris.paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        dmaengine@vger.kernel.org
Subject: Re: [PATCH v2] dmaengine: usb-dmac: Add compatible string for
 r8a7743/5
Message-ID: <20171008105111.GN30097@localhost>
References: <1507310117-9436-1-git-send-email-biju.das@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1507310117-9436-1-git-send-email-biju.das@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Fri, Oct 06, 2017 at 06:15:17PM +0100, Biju Das wrote:
> This patch adds support for r8a7743/5 SoCs. The Renesas RZ/G1[ME]
> (R8A7743/5) usbdmac engine is identical to the R-Car Gen2 family.
> 
> No driver change is needed due to the fallback compatible value
> "renesas,r8a7743-usb-dmac".
> Adding the SoC-specific compatible values here has two purposes:
>   1. Document which SoCs have this hardware module,
>   2. Allow checkpatch to validate compatible values.

Applied, thanks

-- 
~Vinod
