Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:55724 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752882AbeFNHUE (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 14 Jun 2018 03:20:04 -0400
Date: Thu, 14 Jun 2018 09:20:00 +0200
From: Simon Horman <horms@verge.net.au>
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Rob Herring <robh+dt@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2] arm64: dts: renesas: condor/v3hsk: specify Ethernet
 PHY IRQs
Message-ID: <20180614071959.z6mt55lfqptb7hmg@verge.net.au>
References: <4acc208e-c593-1e8a-00ca-fc9a5574074e@cogentembedded.com>
 <42861d8f-3570-03b9-987c-bb15fa92a9c7@cogentembedded.com>
 <9d6f18ad-47d1-eb81-1a86-d124ca03e1c9@cogentembedded.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9d6f18ad-47d1-eb81-1a86-d124ca03e1c9@cogentembedded.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, Jun 13, 2018 at 07:44:02PM +0300, Sergei Shtylyov wrote:
> On 06/13/2018 07:42 PM, Sergei Shtylyov wrote:
> 
> > Specify Ethernet PHY IRQs in the Condor/V3HSK board device trees, now that
> > we have the GPIO support (previously phylib had  to resort to polling).
> > 
> > Based on the original (and large) patch by Vladimir Barinov.
> > 
> > Signed-off-by: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
> > Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> > 
> > ---
> 
>    Forgot to add the the patch is against the 'renesas-devel-20180613-v4.17' tag.
> 

Thanks Sergei, applied.
