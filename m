Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:32845 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932250AbeDXJUg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 24 Apr 2018 05:20:36 -0400
Date: Tue, 24 Apr 2018 11:20:32 +0200
From: Simon Horman <horms@verge.net.au>
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Rob Herring <robh+dt@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 0/3] Add R8A77980/Condor PFC support
Message-ID: <20180424092032.kuxk2irgh6y27kax@verge.net.au>
References: <88e52531-e538-8685-110a-1a2e79a3fe49@cogentembedded.com>
 <4b325d8a-f018-5279-17b9-7fa8aac5b4da@cogentembedded.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4b325d8a-f018-5279-17b9-7fa8aac5b4da@cogentembedded.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Fri, Apr 20, 2018 at 08:33:20PM +0300, Sergei Shtylyov wrote:
> On 03/09/2018 03:04 PM, Sergei Shtylyov wrote:
> 
> > Here's the set of 3 patches against Simon Horman's 'renesas.git' repo's
> > 'renesas-devel-20180308-v4.16-rc4' tag.  We're adding the R8A77980 PFC node
> > and then describing the pins for SCIF0 and EtherAVB devices declared earlier.
> > These patches depend on the R8A77980 PFC support in order to work properly.
> 
>   ... and their time has finally come! Please merge.
> 
> > [1/3] arm64: dts: renesas: r8a77980: add PFC support
> > [2/3] arm64: dts: renesas: condor: add SCIF0 pins
> > [3/3] arm64: dts: renesas: condor: add EtherAVB pins

Thanks, applied.
