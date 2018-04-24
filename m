Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:32803 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753084AbeDXJSf (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 24 Apr 2018 05:18:35 -0400
Date: Tue, 24 Apr 2018 11:18:31 +0200
From: Simon Horman <horms@verge.net.au>
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Rob Herring <robh+dt@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2] arm64: dts: renesas: eagle: add EtherAVB pins
Message-ID: <20180424091831.t3mpwmwiuht6nurc@verge.net.au>
References: <382aeecb-c484-ec27-1ef1-8da1673c2c14@cogentembedded.com>
 <8495a934-62f1-3b2e-3125-78844aef04e1@cogentembedded.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8495a934-62f1-3b2e-3125-78844aef04e1@cogentembedded.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Fri, Apr 20, 2018 at 02:25:46PM +0300, Sergei Shtylyov wrote:
> Hello!
> 
> On 03/14/2018 10:58 PM, Sergei Shtylyov wrote:
> 
> > Add the (previously omitted) EtherAVB pin data to the Eagle board's
> > device tree.
> > 
> > Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> > 
> > ---
> > The patch is against the 'renesas-devel-20180314-v4.16-rc5' tag of Simon's
> > 'renesas.git repo. It depends on the R8A77970 PFC driver patch adding EtherAVB
> > pin groups (posted yesterday) in order to work properly...
> 
>    The dependency has been now met, please merge this patch.

Thanks, applied.
