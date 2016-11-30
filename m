Return-Path: <devicetree-owner@vger.kernel.org>
Date: Wed, 30 Nov 2016 14:37:38 -0600
From: Rob Herring <robh@kernel.org>
To: Chris Paterson <chris.paterson2@renesas.com>
Cc: Simon Horman <horms@verge.net.au>,
        Wolfgang Grandegger <wg@grandegger.com>,
        Marc Kleine-Budde <mkl@pengutronix.de>,
        Magnus Damm <magnus.damm@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Ramesh Shanmugasundaram <ramesh.shanmugasundaram@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-can@vger.kernel.org
Subject: Re: [PATCH 3/3] arm64: dts: r8a7796: Add CAN FD support
Message-ID: <20161130203738.qi4y6c3nycxa5umu@rob-hp-laptop>
References: <1479903288-2009-1-git-send-email-chris.paterson2@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1479903288-2009-1-git-send-email-chris.paterson2@renesas.com>
Sender: devicetree-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, Nov 23, 2016 at 12:14:48PM +0000, Chris Paterson wrote:
> Adds CAN FD controller node for r8a7796.
> 
> Based on a patch for r8a7795 by Ramesh Shanmugasundaram.
> 
> Signed-off-by: Chris Paterson <chris.paterson2@renesas.com>
> ---
>  .../devicetree/bindings/net/can/rcar_canfd.txt     | 12 ++++++-----
>  arch/arm64/boot/dts/renesas/r8a7796.dtsi           | 24 ++++++++++++++++++++++
>  2 files changed, 31 insertions(+), 5 deletions(-)

Acked-by: Rob Herring <robh@kernel.org>
