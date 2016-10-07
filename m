Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:37539 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752455AbcJGDJi (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 6 Oct 2016 23:09:38 -0400
Date: Fri, 7 Oct 2016 12:09:32 +0900
From: Simon Horman <horms@verge.net.au>
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: linux-renesas-soc@vger.kernel.org, robh+dt@kernel.org,
        mark.rutland@arm.com, devicetree@vger.kernel.org,
        magnus.damm@gmail.com, linux@arm.linux.org.uk,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 04/11] ARM: dts: r8a7743: initial SoC device tree
Message-ID: <20161007030932.GH13721@verge.net.au>
References: <2056698.ncAHq8vRQ3@wasted.cogentembedded.com>
 <2883940.Oo8sg10L7m@wasted.cogentembedded.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2883940.Oo8sg10L7m@wasted.cogentembedded.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Sergei,

On Thu, Oct 06, 2016 at 12:38:18AM +0300, Sergei Shtylyov wrote:
> The  initial R8A7743 SoC device tree including CPU cores, GIC, timer, SYSC,
> CPG, and the required clock descriptions.
> 
> Based on the original (and large) patch by Dmitry Shifrin
> <dmitry.shifrin@cogentembedded.com>.
> 
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

I notice that this patch enables two CPUs. Have you tested SMP and:
- CPU hotplug
- Suspend to RAM
