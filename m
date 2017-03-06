Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:42587 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752599AbdCFIut (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 6 Mar 2017 03:50:49 -0500
Date: Mon, 6 Mar 2017 09:47:48 +0100
From: Simon Horman <horms@verge.net.au>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Sudeep Holla <sudeep.holla@arm.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 0/2] arm64: dts: renesas: Remove unit-addresses and regs
 from integrated caches
Message-ID: <20170306084747.GD11468@verge.net.au>
References: <1488547097-4804-1-git-send-email-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1488547097-4804-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Fri, Mar 03, 2017 at 02:18:15PM +0100, Geert Uytterhoeven wrote:
> 	Hi Simon, Magnus,
> 
> This patch series removes the bogus unit-addresses and reg properties
> from the device nodes representing Cortex-A57/A53 cache controllers.
> 
> Note that the latter were added to remove warnings from dtc when using
> W=1:
> 
>     Warning (unit_address_vs_reg): Node /cache-controller@0 has a unit name, but no reg property
> 
> In hindsight, adding the reg properties turned out to be the wrong fix.
> Indeed, the Cortex-A57/A53 cache controllers are integrated controllers,
> and thus the device nodes representing them should not have
> unit-addresses or reg properties.
> 
> This series does not have a runtime effect, as Linux doesn't rely much
> on the properties of the cache-controller nodes.
> 
> After this patch has been accepted, I'll submit a similar series to fix
> the DTS files for the Renesas arm32 SoCs.

Thanks, applied.
