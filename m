Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:50177 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S943889AbdDTJDf (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 20 Apr 2017 05:03:35 -0400
Date: Thu, 20 Apr 2017 18:03:30 +0900
From: Simon Horman <horms@verge.net.au>
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Vladimir Barinov <vladimir.barinov+renesas@cogentembedded.com>
Subject: Re: [PATCH] arm64: dts: m3ulcb: Fix EthernetAVB PHY timing
Message-ID: <20170420090330.GI3760@verge.net.au>
References: <1492477578-10228-1-git-send-email-horms+renesas@verge.net.au>
 <a7afb651-d103-248c-5610-2fc41a773c52@cogentembedded.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a7afb651-d103-248c-5610-2fc41a773c52@cogentembedded.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, Apr 18, 2017 at 12:26:25PM +0300, Sergei Shtylyov wrote:
> Hello.
> 
> On 4/18/2017 4:06 AM, Simon Horman wrote:
> 
> >Set PHY rxc-skew-ps to 1500 and all other values to their default values.
> >
> >This is intended to to address failures in the case of 1Gbps communication
> >using the by salvator-x board with the KSZ9031RNX phy. This has been
> 
>    The by? :-)
> 
> >reported to occur with both the r8a7795 (H3) and r8a7796 (M3-W) SoCs.
> >
> >Based in a similar patch for the r8a7796 salvator-x by Kazuya Mizuguchi.
> >
> >Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
> [...]

Thanks, I have queued this up with the typo fixed.
