Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:49387 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S935261AbdCJJ3H (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 10 Mar 2017 04:29:07 -0500
Date: Fri, 10 Mar 2017 10:28:50 +0100
From: Simon Horman <horms@verge.net.au>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Magnus Damm <magnus.damm@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Sudeep Holla <sudeep.holla@arm.com>,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 0/5] arm64: dts: r8a7796: Add Secondary CPU Cores
Message-ID: <20170310092850.GG21820@verge.net.au>
References: <1488909806-3322-1-git-send-email-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1488909806-3322-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, Mar 07, 2017 at 07:03:21PM +0100, Geert Uytterhoeven wrote:
> 	Hi Simon, Magnus,
> 
> This patch series adds the second Cortex-A57 CPU core, the Cortex-A57
> PMU, and the Cortex-A53 L2 cache-controller, CPU, and PMU nodes on the
> Renesas R-Car M3-W SoC to its DTS file.
> 
> Note that these patches add hardware description; actual enabling of the
> CPU depends on the PSCI firmware.
> 
> With the current firmware version (v2.16.0), only the CA57 CPU cores are
> enabled, hence the last patch does not introduce undeterministic
> scheduling behavior due to migration between big and LITTLE cores.
> 
> Changes compared to v1:
>   - Add Cortex-A57 and Cortex-A53 PMU nodes,
>   - Drop unit address and reg property for integrated cache-controller.
> 
> Tested on r8a7796/salvator-x, with CPU hot(un)plug and system suspend.
> 
> Thanks for applying!

Thanks.

This is appears to be in keeping with the discussion between Magnus,
yourself, myself and others in Brussels last month. Accordingly I have
queued-up these changes.
