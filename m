Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:54821 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753061AbcJHUo2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 8 Oct 2016 16:44:28 -0400
Date: Sat, 8 Oct 2016 11:28:51 +0900
From: Simon Horman <horms@verge.net.au>
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: linux-renesas-soc@vger.kernel.org, robh+dt@kernel.org,
        mark.rutland@arm.com, devicetree@vger.kernel.org,
        magnus.damm@gmail.com, linux@arm.linux.org.uk,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 04/11] ARM: dts: r8a7743: initial SoC device tree
Message-ID: <20161008022851.GA14617@verge.net.au>
References: <2056698.ncAHq8vRQ3@wasted.cogentembedded.com>
 <2883940.Oo8sg10L7m@wasted.cogentembedded.com>
 <20161007030932.GH13721@verge.net.au>
 <cd1391d1-d2b5-6315-ee15-0253019d9836@cogentembedded.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cd1391d1-d2b5-6315-ee15-0253019d9836@cogentembedded.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Fri, Oct 07, 2016 at 12:57:28PM +0300, Sergei Shtylyov wrote:
> On 10/7/2016 6:09 AM, Simon Horman wrote:
> 
> >>The  initial R8A7743 SoC device tree including CPU cores, GIC, timer, SYSC,
> >>CPG, and the required clock descriptions.
> >>
> >>Based on the original (and large) patch by Dmitry Shifrin
> >><dmitry.shifrin@cogentembedded.com>.
> >>
> >>Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> >
> >I notice that this patch enables two CPUs. Have you tested SMP and:
> >- CPU hotplug
> >- Suspend to RAM
> 
>    No, not really. I'll remove CPU1. :-<

Thanks.
