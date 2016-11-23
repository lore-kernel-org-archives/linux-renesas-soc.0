Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:52228 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S964996AbcKWO3o (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 23 Nov 2016 09:29:44 -0500
Date: Wed, 23 Nov 2016 15:29:38 +0100
From: Simon Horman <horms@verge.net.au>
To: Marc Kleine-Budde <mkl@pengutronix.de>
Cc: Chris Paterson <chris.paterson2@renesas.com>,
        Wolfgang Grandegger <wg@grandegger.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Ramesh Shanmugasundaram <ramesh.shanmugasundaram@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-can@vger.kernel.org
Subject: Re: [PATCH 0/3] arm64: dts: r8a7796: Add CAN/CAN FD support
Message-ID: <20161123142938.GF9057@verge.net.au>
References: <1479903243-1860-1-git-send-email-chris.paterson2@renesas.com>
 <f358442c-8373-328c-1270-709498c133f5@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f358442c-8373-328c-1270-709498c133f5@pengutronix.de>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, Nov 23, 2016 at 02:18:13PM +0100, Marc Kleine-Budde wrote:
> On 11/23/2016 01:14 PM, Chris Paterson wrote:
> > This patch series adds CAN and CAN FD support to the r8a7796.
> > 
> > Based on renesas-devel-20161122-v4.9-rc6.
> > 
> > Chris Paterson (3):
> >   arm64: dts: r8a7796: Add CAN external clock support
> >   arm64: dts: r8a7796: Add CAN support
> >   arm64: dts: r8a7796: Add CAN FD support
> > 
> >  .../devicetree/bindings/net/can/rcar_can.txt       | 12 +++--
> >  .../devicetree/bindings/net/can/rcar_canfd.txt     | 12 +++--
> >  arch/arm64/boot/dts/renesas/r8a7796.dtsi           | 61 ++++++++++++++++++++++
> >  3 files changed, 75 insertions(+), 10 deletions(-)
> 
> For all three:
> 
> Acked-by: Marc Kleine-Budde <mkl@pengutronix.de>
> 
> Who takes this series?

I would like to see these patches split up so that the
.../devicetree/bindings/ portions can go through you whole
the arch/arm64/boot/dts/renesas/ portions go thorugh my renesas tree.

Regarding the arch/arm64/boot/dts/renesas/ portion, I would like
some consideration given to what effect enabling memory above 4Gb
(64bit addressing) would have.
