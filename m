Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:60188 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727409AbeGaME1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 31 Jul 2018 08:04:27 -0400
Date: Tue, 31 Jul 2018 12:24:45 +0200
From: Simon Horman <horms@verge.net.au>
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: linux-renesas-soc@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] arm64: dts: renesas: r8a77980: move IPMMU nodes
Message-ID: <20180731102444.w4tlzk26mnr37wak@verge.net.au>
References: <2368353.xfo5beGC5E@wasted.cogentembedded.com>
 <5f7daa87-b0b3-faa7-0331-640c39961b4a@cogentembedded.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5f7daa87-b0b3-faa7-0331-640c39961b4a@cogentembedded.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, Jul 26, 2018 at 09:51:18PM +0300, Sergei Shtylyov wrote:
> The IPMMU nodes should follow the GEther node, not the CAN-FD node,
> according to the <unit-address> part of the startng IPMMU-DS1 node.
> While moving the nodes, also do sort them by label alphanumerically...
> 
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

Thanks Sergei, applied for v4.20.
