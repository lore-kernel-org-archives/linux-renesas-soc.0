Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:46702 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751952AbeADQzV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 4 Jan 2018 11:55:21 -0500
Date: Thu, 4 Jan 2018 17:55:17 +0100
From: Simon Horman <horms@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: r8a77995: move nodes which have no
 reg property out of bus
Message-ID: <20180104165517.za3o44n7ikfs4vgg@verge.net.au>
References: <20171220122442.9199-1-horms+renesas@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20171220122442.9199-1-horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, Dec 20, 2017 at 01:24:42PM +0100, Simon Horman wrote:
> Move pmu_a53 and timer nodes from soc node to root node.  The nodes that
> have been moved do not have any register properties and thus shouldn't be
> placed on the bus.
> 
> This problem is flagged by the compiler as follows:
> $ make W=1
> ...
> arch/arm64/boot/dts/renesas/r8a77995-draak.dtb: Warning (simple_bus_reg): Node /soc/timer missing or empty reg/ranges property
> arch/arm64/boot/dts/renesas/r8a77995-draak.dtb: Warning (simple_bus_reg): Node /soc/pmu_a53 missing or empty reg/ranges property
> 
> Signed-off-by: Simon Horman <horms+renesas@verge.net.au>

Applied
