Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:51514 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752673AbcKGNf6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 7 Nov 2016 08:35:58 -0500
Date: Mon, 7 Nov 2016 14:35:51 +0100
From: Simon Horman <horms@verge.net.au>
To: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
Cc: Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 0/9] arm64: renesas: add M3ULCB board
Message-ID: <20161107133551.GD29721@verge.net.au>
References: <1478196375-1131-1-git-send-email-vladimir.barinov@cogentembedded.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1478196375-1131-1-git-send-email-vladimir.barinov@cogentembedded.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, Nov 03, 2016 at 09:06:15PM +0300, Vladimir Barinov wrote:
> Hello,
> 
> This adds the folowing:
> - R8A7796 SoC based M3ULCB (R-Car Starter Kit Pro) device tree
> - Document DT bindings
> 
> Vladimir Barinov (9):
> [1/9] dt: arm: shmobile: add M3ULCB board DT bindings

I took the liberty of changing the subject of the above patch to:

arm64: dts: m3ulcb: add M3ULCB board DT bindings

> [2/9] arm64: dts: m3ulcb: initial device tree
> [3/9] arm64: dts: m3ulcb: enable SCIF clk and pins
> [4/9] arm64: dts: m3ulcb: enable GPIO leds
> [5/9] arm64: dts: m3ulcb: enable GPIO keys
> [6/9] arm64: dts: m3ulcb: enable SDHI0
> [7/9] arm64: dts: m3ulcb: enable EXTALR clk
> [8/9] arm64: dts: m3ulcb: enable WDT
> [9/9] arm64: dts: m3ulcb: enable SDHI2

I have queued up patches 1-5,7,8.
Please repost the SDHI patches when you are ready.
