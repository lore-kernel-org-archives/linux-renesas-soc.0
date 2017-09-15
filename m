Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:53659 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750838AbdIOIkd (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 15 Sep 2017 04:40:33 -0400
Date: Fri, 15 Sep 2017 10:40:13 +0200
From: Simon Horman <horms@verge.net.au>
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        davem@davemloft.net, robh+dt@kernel.org, mark.rutland@arm.com,
        netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: net: renesas-ravb: Add support for R8A77995
 RAVB
Message-ID: <20170915084012.GK3924@verge.net.au>
References: <1505347598-4156-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <de2287b5-f208-1ffd-e8a4-3779a11695f7@cogentembedded.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <de2287b5-f208-1ffd-e8a4-3779a11695f7@cogentembedded.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, Sep 14, 2017 at 12:44:58PM +0300, Sergei Shtylyov wrote:
> Hello!
> 
> On 9/14/2017 3:06 AM, Yoshihiro Shimoda wrote:
> 
> >Add a new compatible string for the R8A77995 (R-Car D3) RAVB.
> >
> >Acked-by: Geert Uytterhoeven <geert+renesas@glider.be>
> 
>    Usually those are added after sign-off.
> 
> >Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> 
> Acked-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> 
> >---
> >  Changes from v1:
> >   - Based on r8a77970 patch.
> >    https://marc.info/?l=linux-renesas-soc&m=150524655515476
> 
>    So this is against net-next, right? The net.git repo now has a patch
> making me a reviewer for the Renesas bindings too.

Acked-by: Simon Horman <horms+renesas@verge.net.au>
