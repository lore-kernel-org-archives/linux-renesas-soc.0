Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:52203 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750741AbdHQI12 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 17 Aug 2017 04:27:28 -0400
Date: Thu, 17 Aug 2017 10:27:26 +0200
From: Simon Horman <horms@verge.net.au>
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: magnus.damm@gmail.com, robh+dt@kernel.org, mark.rutland@arm.com,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: renesas: r8a77995: add pfc device node
Message-ID: <20170817082726.GD27693@verge.net.au>
References: <1502281247-24124-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <20170810081318.GI16647@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170810081318.GI16647@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, Aug 10, 2017 at 10:13:19AM +0200, Simon Horman wrote:
> On Wed, Aug 09, 2017 at 09:20:47PM +0900, Yoshihiro Shimoda wrote:
> > Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> > ---
> > 
> >  This patch set is based on the renesas-drivers.git /
> > topic/r8a77995-integration branch and depends on the following patch
> >  "pinctrl: sh-pfc: r8a77995: Initial R8A77995 PFC support"
> 
> Thanks Shimoda-san,
> 
> this patch looks fine to me, however, I am marking it as deferred pending
> acceptance of the dependency listed above. Please repost or otherwise
> ping me once Geert has indicated he will accept that patch.

That dependency appears to be satisfied now,
I have applied this patch.
