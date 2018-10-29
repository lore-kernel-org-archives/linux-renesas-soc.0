Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:37057 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729487AbeJ2TMk (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 29 Oct 2018 15:12:40 -0400
Date: Mon, 29 Oct 2018 11:24:33 +0100
From: Simon Horman <horms@verge.net.au>
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Rob Herring <robh+dt@kernel.org>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH v2] arm64: dts: renesas: r8a779{7|8}0: add MSIOF support
Message-ID: <20181029102433.7tvtvjmoo4z4wqw7@verge.net.au>
References: <fb4eb097-40aa-82df-68c7-9b727c858a8b@cogentembedded.com>
 <451b2957-d272-f4e9-8bfc-cb1cdfeb442b@cogentembedded.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <451b2957-d272-f4e9-8bfc-cb1cdfeb442b@cogentembedded.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Fri, Oct 19, 2018 at 10:10:44PM +0300, Sergei Shtylyov wrote:
> Describe MSIOF in the R8A779{7|8}0 device trees.
> 
> The DMA props are omitted for R8A77980 as the RT-DMAC isn't supported
> (yet?)...
> 
> Based on the original (and large) patches by Vladimir Barinov.
> 
> Signed-off-by: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> 
> ---
> This patch is against the 'renesas-devel-20181015-v4.19-rc8' branch of
> Simon Horman's 'renesas.git' repo.
> 
> Changes in version 2:
> - removed the aliases;
> - restored the DMA props on R8A77970, updated the description accordingly;
> - mentioned Vladimir in the description and added his signoff;
> - refreshed the patch.

Thanks, applied for v4.21.
