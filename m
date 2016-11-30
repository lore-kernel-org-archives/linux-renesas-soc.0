Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-yw0-f195.google.com ([209.85.161.195]:36529 "EHLO
        mail-yw0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753679AbcK3Ugr (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 30 Nov 2016 15:36:47 -0500
Date: Wed, 30 Nov 2016 14:36:37 -0600
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
Subject: Re: [PATCH 2/3] arm64: dts: r8a7796: Add CAN support
Message-ID: <20161130203637.gbndehnhkzn7pz6x@rob-hp-laptop>
References: <1479903279-1950-1-git-send-email-chris.paterson2@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1479903279-1950-1-git-send-email-chris.paterson2@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, Nov 23, 2016 at 12:14:39PM +0000, Chris Paterson wrote:
> Adds CAN controller nodes for r8a7796.
> 
> Based on a patch for r8a7795 by Ramesh Shanmugasundaram.
> 
> Signed-off-by: Chris Paterson <chris.paterson2@renesas.com>
> ---
>  .../devicetree/bindings/net/can/rcar_can.txt       | 12 +++++----
>  arch/arm64/boot/dts/renesas/r8a7796.dtsi           | 30 ++++++++++++++++++++++
>  2 files changed, 37 insertions(+), 5 deletions(-)

Acked-by: Rob Herring <robh@kernel.org>
