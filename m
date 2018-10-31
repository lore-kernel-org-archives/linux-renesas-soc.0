Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:43315 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729513AbeJaX3D (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 31 Oct 2018 19:29:03 -0400
Date: Wed, 31 Oct 2018 15:30:42 +0100
From: Simon Horman <horms@verge.net.au>
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Rob Herring <robh+dt@kernel.org>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Valentine Barshak <valentine.barshak@cogentembedded.com>
Subject: Re: [PATCH] arm64: dts: renesas: condor: switch from EtherAVB to
 GEther
Message-ID: <20181031143042.3j4ohumfpxmn7xdu@verge.net.au>
References: <fb4eb097-40aa-82df-68c7-9b727c858a8b@cogentembedded.com>
 <4f9e79ca-5d61-8dd4-fe79-42e8f7562f90@cogentembedded.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4f9e79ca-5d61-8dd4-fe79-42e8f7562f90@cogentembedded.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, Oct 18, 2018 at 07:48:53PM +0300, Sergei Shtylyov wrote:
> The "official" Condor boards have always been wired to mount NFS via
> GEther, not EtherAVB -- the boards resoldered for EtherAVB were local
> to Cogent Embedded, so we've been having an unpleasant situation where
> a "normal" Condor board still can't mount NFS (unless an EtherAVB PHY
> extension board is plugged in). Switch from EtherAVB to GEther at last!
> 
> Fixes: 8091788f3d38 ("arm64: dts: renesas: condor: add EtherAVB support")
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

Thanks, applied for v4.21.
