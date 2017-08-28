Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:53784 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750873AbdH1HpO (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 28 Aug 2017 03:45:14 -0400
Date: Mon, 28 Aug 2017 09:44:54 +0200
From: Simon Horman <horms@verge.net.au>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 0/2] arm64: renesas: Add support for R-Car V3M
Message-ID: <20170828074453.GA22421@verge.net.au>
References: <1503665810-13945-1-git-send-email-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1503665810-13945-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Fri, Aug 25, 2017 at 02:56:48PM +0200, Geert Uytterhoeven wrote:
> 	Hi all,
> 
> This patch series adds initial R-Car V3M infrastructure:
>   1. SoC DT bindings,
>   2. Main Kconfig symbol.
> 
> Both follow the example set by R-Car D3 aka r8a77995, using 5-digit instead
> of 4-digit part numbers.
> Alternatively, we could stick to 4-digit part numbers if the fifth digit is
> a zero.
> 
> For your convenience, a branch with more preliminary work (thanks Sergei,
> for posting the clock driver!) for testing on v3m/eagle is also available
> in the topic/r8a77970-integration branch of my renesas-drivers git
> repository at
> git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git.
> 
> Thanks for your comments!

This looks good to me.

I am in favour of using the 5-digit scheme for all new R-Car Gen 3 SoCs
as it seems the safest option with regards to as yet unknown (to me) part
numbers..
