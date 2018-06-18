Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:46328 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S965996AbeFRJg2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 18 Jun 2018 05:36:28 -0400
Date: Mon, 18 Jun 2018 11:36:23 +0200
From: Simon Horman <horms@verge.net.au>
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Rob Herring <robh+dt@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 0/2] Add R8A77980/Condor PCIe support
Message-ID: <20180618093623.s33bkiptazxem463@verge.net.au>
References: <b37d458c-071a-833a-2057-be8a07c880be@cogentembedded.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b37d458c-071a-833a-2057-be8a07c880be@cogentembedded.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, Jun 14, 2018 at 10:16:32PM +0300, Sergei Shtylyov wrote:
> Hello!
> 
> Here's the set of 2 patches against Simon Horman's 'renesas.git' repo's
> 'renesas-devel-20180614v2-v4.17' tag. We're adding the R8A77980 PCIe related
> device nodes and then enable PCIe on the Condor board. These patches depend
> on the R8A77980 PCIe PHY driver support in order to work properly. Note that
> in case the PCIe PHY driver is not enabled, the kernel will BUG() due to I/O
> space page leak in the PCIe driver...

Is that problem specific to the presence of PCIe nodes for
condor/r8a77980 or is it also true of other (R-Car) boards where
PCIe is enabled?

Regardless, it sounds like these patches expose a kernel bug.
Is it being fixed?

> 
> [1/2] arm64: dts: renesas: r8a77980: add PCIe support
> [2/2] arm64: dts: renesas: condor: add PCIe support
> 
> WBR, Sergei
> 
