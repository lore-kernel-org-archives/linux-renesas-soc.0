Return-Path: <devicetree-owner@vger.kernel.org>
Date: Thu, 28 Sep 2017 08:04:05 +0200
From: Simon Horman <horms@verge.net.au>
To: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc: Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Russell King <linux@armlinux.org.uk>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>
Subject: Re: [PATCH] ARM: dts: r8a7743: Add MSIOF[012] support
Message-ID: <20170928060405.GC5562@verge.net.au>
References: <1506506225-5015-1-git-send-email-fabrizio.castro@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1506506225-5015-1-git-send-email-fabrizio.castro@bp.renesas.com>
Sender: devicetree-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, Sep 27, 2017 at 10:57:04AM +0100, Fabrizio Castro wrote:
> Add the DT nodes needed by MSIOF[012] interfaces to the SoC dtsi.
> Also, define aliases for spi[123].
> 
> Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> Signed-off-by: Chris Paterson <chris.paterson2@renesas.com>
> ---
> 
> This patch depends on the corresponding dt-bindings patch:
> * spi: sh-msiof: Add r8a774[35] to the compatible list
> which has been applied to linux-next already.

Thanks, applied for v4.15 with Geert's tags.

Thanks for providing a cover letter and threading the
patches a reply to the cover letter. This is very helpful.

Please consider enumerating patches in a series. In this case it would be
0/2 for the cover then 1/2 and 2/2 for the patches themselves.
