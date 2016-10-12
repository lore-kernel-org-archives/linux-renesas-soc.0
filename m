Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:33442 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754237AbcJLIJT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 12 Oct 2016 04:09:19 -0400
Date: Wed, 12 Oct 2016 10:09:05 +0200
From: Simon Horman <horms@verge.net.au>
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: linux-renesas-soc@vger.kernel.org, robh+dt@kernel.org,
        mark.rutland@arm.com, devicetree@vger.kernel.org,
        magnus.damm@gmail.com, linux@arm.linux.org.uk,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 0/11] Add R8A7743/SK-RZG1M board support
Message-ID: <20161012080905.GD31183@verge.net.au>
References: <2056698.ncAHq8vRQ3@wasted.cogentembedded.com>
 <5be99d76-a082-129b-1aa6-b6f7402ae79b@cogentembedded.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5be99d76-a082-129b-1aa6-b6f7402ae79b@cogentembedded.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Fri, Oct 07, 2016 at 07:40:34PM +0300, Sergei Shtylyov wrote:
> On 10/06/2016 12:23 AM, Sergei Shtylyov wrote:
> 
> >   Here's the set of 11 patches against Simon Horman's 'renesas.git' repo's
> >'renesas-devel-20161003-v4.8' tag. I'm adding the device tree support for
> >the R8A7743-based SK-RZG1M board. The SoC is close to R8A7791 and the board
> >seems identical to the R8A7791/Porter board. The device tree patches depend on
> >the R8A7743 CPG/MSSR driver series just posted in order to compile and work.
> 
>    Forgot to mention that this version causes a regression with the sh_eth
> driver (well, actually with phylib): since IRQC now gets a deferred probing,
> PHY IRQ doesn't work anymore -- phylib falls back to polling.

Is there a resolution to that problem?
