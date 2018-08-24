Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:34823 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726382AbeHXL5u (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 24 Aug 2018 07:57:50 -0400
Date: Fri, 24 Aug 2018 10:24:12 +0200
From: Simon Horman <horms@verge.net.au>
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Rob Herring <robh+dt@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH /2] arm64: dts: renesas: r8a77970: add MMC support
Message-ID: <20180824082412.c7hvqhnejijgzbei@verge.net.au>
References: <1af46bf9-d9e5-8dcf-0ac7-a85e7348a34e@cogentembedded.com>
 <28c2a0ef-dc89-1fad-6502-9b33738b59a5@cogentembedded.com>
 <20180822113119.4p2utcbx5ati74na@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180822113119.4p2utcbx5ati74na@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, Aug 22, 2018 at 01:31:19PM +0200, Simon Horman wrote:
> On Tue, Aug 21, 2018 at 10:49:26PM +0300, Sergei Shtylyov wrote:
> > Define the generic R8A77970 part of the MMC0 (SDHI2) device node.
> > 
> > Based on the original (and large) patches by Vladimir Barinov.
> > 
> > Signed-off-by: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
> > Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> 
> Thanks,
> 
> This looks fine to me but I will wait to see if there are other reviews
> before applying.
> 
> Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

I have now applied this for v4.20.
