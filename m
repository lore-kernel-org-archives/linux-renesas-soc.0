Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:49047 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751563AbdCMJMi (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 13 Mar 2017 05:12:38 -0400
Date: Mon, 13 Mar 2017 10:12:32 +0100
From: Simon Horman <horms@verge.net.au>
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] arm64: dts: r8a7796: add IMR-LX4 support
Message-ID: <20170313091232.GA19296@verge.net.au>
References: <20170220213129.182097269@cogentembedded.com>
 <20170310093049.GH21820@verge.net.au>
 <9d1d3e6d-ebe8-06a9-4d49-d62ee2f038bd@cogentembedded.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9d1d3e6d-ebe8-06a9-4d49-d62ee2f038bd@cogentembedded.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Fri, Mar 10, 2017 at 03:28:22PM +0300, Sergei Shtylyov wrote:
> On 03/10/2017 12:30 PM, Simon Horman wrote:
> 
> >>Describe the IMR-LX4 devices in the R8A7796 device tree.
> >>
> >>Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> >
> >Thanks, queued up for v4.12.
> 
>    This is probably premature, given some uncertainty with the "compatible"
> prop (I mean the SoC specific values).

Thanks for letting me know, I will drop the patch for now.
