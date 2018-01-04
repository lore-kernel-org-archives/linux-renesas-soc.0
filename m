Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:46685 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751952AbeADQyt (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 4 Jan 2018 11:54:49 -0500
Date: Thu, 4 Jan 2018 17:54:46 +0100
From: Simon Horman <horms@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: r8a77970: move node which has no
 reg property out of bus
Message-ID: <20180104165445.odapc4somx6ksfp3@verge.net.au>
References: <20171220122549.9452-1-horms+renesas@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20171220122549.9452-1-horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, Dec 20, 2017 at 01:25:49PM +0100, Simon Horman wrote:
> Move timer node from soc node to root node.  The node that have been moved
> do not have any register properties and thus shouldn't be placed on the
> bus.
> 
> This problem is flagged by the compiler as follows:
> $ make W=1
> ...
>   DTC     arch/arm64/boot/dts/renesas/r8a77970-eagle.dtb
> arch/arm64/boot/dts/renesas/r8a77970-eagle.dtb: Warning (simple_bus_reg): Node /soc/timer missing or empty reg/ranges property
>   DTC     arch/arm64/boot/dts/renesas/r8a77970-v3msk.dtb
> arch/arm64/boot/dts/renesas/r8a77970-v3msk.dtb: Warning (simple_bus_reg): Node /soc/timer missing or empty reg/ranges property
> 
> Signed-off-by: Simon Horman <horms+renesas@verge.net.au>

Applied
