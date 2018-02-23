Return-Path: <devicetree-owner@vger.kernel.org>
Date: Fri, 23 Feb 2018 17:18:55 +0100
From: Simon Horman <horms@verge.net.au>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Magnus Damm <magnus.damm@gmail.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Takeshi Kihara <takeshi.kihara.df@renesas.com>
Subject: Re: [PATCH v2] arm64: dts: renesas: Add support for Salvator-XS with
 R-Car M3-N
Message-ID: <20180223161852.an5pmw6akj2na7tg@verge.net.au>
References: <1519064455-12505-1-git-send-email-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1519064455-12505-1-git-send-email-geert+renesas@glider.be>
Sender: devicetree-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Mon, Feb 19, 2018 at 07:20:55PM +0100, Geert Uytterhoeven wrote:
> From: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> 
> Add initial support for the Renesas Salvator-XS (Salvator-X 2nd version)
> development board equipped with an R-Car M3-N SiP.
> 
> Most features are enabled through the shared salvator-xs.dtsi board
> description.  The memory configuration is specific to the M3-N SiP.
> 
> Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> [geert: Switch to SPDX-License-Identifier, update patch description]
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> v2:
>   - Fix patch prefix.

Thanks, applied.
