Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:54246 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751122AbdG0PEJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 27 Jul 2017 11:04:09 -0400
Date: Thu, 27 Jul 2017 17:03:40 +0200
From: Simon Horman <horms@verge.net.au>
To: Chris Brandt <chris.brandt@renesas.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 0/4] dts: rskrza1: Add pin configurations
Message-ID: <20170727150339.GD16143@verge.net.au>
References: <20170720182019.85075-1-chris.brandt@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170720182019.85075-1-chris.brandt@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, Jul 20, 2017 at 01:20:15PM -0500, Chris Brandt wrote:
> Now that the RZ/A1 pin control driver has appeared in 4.13-rc1, it
> is safe to now add pin configurations for RZ/A1 boards.
> 
> 
> Chris Brandt (4):
>   arm: dts: rskrza1: Add SCIF2 pin group
>   arm: dts: rskrza1: Add Ethernet pin group
>   arm: dts: rskrza1: Add SDHI1 pin group
>   arm: dts: rskrza1: Add LED0 pin support
> 
>  arch/arm/boot/dts/r7s72100-rskrza1.dts | 61 ++++++++++++++++++++++++++++++++++

Thanks, applied for v4.14.
