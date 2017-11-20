Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:54648 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750777AbdKTKHO (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 20 Nov 2017 05:07:14 -0500
Date: Mon, 20 Nov 2017 11:07:10 +0100
From: Simon Horman <horms@verge.net.au>
To: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc: Wolfgang Grandegger <wg@grandegger.com>,
        Marc Kleine-Budde <mkl@pengutronix.de>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Russell King <linux@armlinux.org.uk>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Linus Walleij <linus.walleij@linaro.org>,
        Magnus Damm <magnus.damm@gmail.com>, linux-can@vger.kernel.org,
        netdev@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>
Subject: Re: [PATCH 0/8] Add CAN support to iwg2[02]d
Message-ID: <20171120100710.f74cqhu5ngbs2faf@verge.net.au>
References: <1510067449-17017-1-git-send-email-fabrizio.castro@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1510067449-17017-1-git-send-email-fabrizio.castro@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, Nov 07, 2017 at 03:10:41PM +0000, Fabrizio Castro wrote:
> Hello,
> 
> this series delivers all of the changes necessary to add CAN bus
> support to the:
> * iW-RainboW-G22D SODIMM, and
> * iW-RainboW-G20M-Qseven-RZG1M
> development platforms, including documentation, pinctrl driver, SoC
> specific device trees, and board specific device trees.
> 
> This work has been based and tested on top of:
> renesas-devel-20171106-v4.14-rc8
> 
> Best regards,
> 
> Fabrizio Castro (8):
>   dt-bindings: can: rcar_can: document r8a774[35] can support
>   pinctrl: sh-pfc: r8a7745: Add CAN[01] support
>   ARM: dts: r8a7745: Add CAN[01] SoC support
>   ARM: dts: iwg22d-sodimm: Add can0 support to carrier board
>   ARM: dts: iwg22d-sodimm-dbhd-ca: Add can1 support to HDMI DB
>   ARM: dts: r8a7743: Add CAN[01] SoC support
>   ARM: dts: iwg20d-q7-common: Add can0 support to carrier board
>   ARM: dts: iwg20d-q7-dbcm-ca: Add can1 support to camera DB

Thanks, I have applied the "ARM: dts" patches for inclusion in v4.16.
