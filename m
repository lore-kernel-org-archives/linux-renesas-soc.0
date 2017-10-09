Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:48088 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750930AbdJIHab (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 9 Oct 2017 03:30:31 -0400
Date: Mon, 9 Oct 2017 09:30:11 +0200
From: Simon Horman <horms@verge.net.au>
To: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc: Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Russell King <linux@armlinux.org.uk>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>
Subject: Re: [PATCH v2 0/2] ARM: dts: iwg20d-q7: New DT architecture
Message-ID: <20171009073011.GR17360@verge.net.au>
References: <CAMuHMdW-Y7tK28YAGBRMqdgZK7vVqnUcud1FtzQd6wLrKii_AA@mail.gmail.com>
 <1507312793-6877-1-git-send-email-fabrizio.castro@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1507312793-6877-1-git-send-email-fabrizio.castro@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Fri, Oct 06, 2017 at 06:59:51PM +0100, Fabrizio Castro wrote:
> Some of the serial interfaces are exposed on the camera daughter board.
> The camera daughter board can be connected to the carrier board
> by means of expansion connectors 1, 2 and 3. The carrier board may host
> an RZ/G1M or an RZ/G1N based SoM.
> While adding support for the serial interfaces on the camera daughter
> board we faced the dilemma of how to properly describe all of the
> possible HW configurations and how to maximize code reuse.
> The best option would be to use device tree overlays, however there is
> still some work to be done on that front before actually using them,
> therefore for the time being we decided to provide .dtsi files to
> describe the carrier board and the camera daughter board, and provide
> .dts files to describe the HW configurations we need to support.
> 
> Best regards,
> 
> Fabrizio Castro (2):
>   ARM: dts: iwg20d-q7: Rework DT architecture
>   ARM: dts: iwg20d-q7-dbcm-ca: Add device trees for camera DB

Thanks, applied.
