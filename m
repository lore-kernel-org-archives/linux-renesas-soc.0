Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:41018 "EHLO
	kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750930AbcFPFTL (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Thu, 16 Jun 2016 01:19:11 -0400
Date: Thu, 16 Jun 2016 14:19:06 +0900
From: Simon Horman <horms@verge.net.au>
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: linux-renesas-soc@vger.kernel.org, magnus.damm@gmail.com,
	linux@arm.linux.org.uk, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v5 05/12] ARM: shmobile: r8a7792: add SMP support
Message-ID: <20160616051906.GB10590@verge.net.au>
References: <14666252.G84Ipxe6EL@wasted.cogentembedded.com>
 <8892035.WlgqvXCvaR@wasted.cogentembedded.com>
 <20160615023030.GC19186@verge.net.au>
 <dd2af098-c5ff-66a5-9812-f6b9956f401a@cogentembedded.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dd2af098-c5ff-66a5-9812-f6b9956f401a@cogentembedded.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, Jun 15, 2016 at 01:43:48PM +0300, Sergei Shtylyov wrote:
> On 6/15/2016 5:30 AM, Simon Horman wrote:
> 
> >>Add R8A7792 SMP support using the shared APMU code. This SoC has 2 ARM
> >>Cortex-A15  CPU cores.
> >>
> >>Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> >
> >I apologise for not raising this earlier.
> >
> >I would like you to remove SMP support from this series as I do
> >not wish to merge any more per-SoC C SMP code for Gen-2 SoCs.
> >
> >Rather, I believe the future is to use generic code to support
> >the APMU hardware and then describe it in DT. Something like this:
> >
> >http://www.spinics.net/lists/linux-sh/msg45229.html
> 
>    Sigh...
> 
> >As that code is not merged my suggestion is that we merge UP r8a7792 for
> >now. This is the same approach that has been taken for the r8a7793.
> 
>    It should be enough to drop the SMP patch from the series. Could you do
> it or should I repost again?

Sure, I think that is reasonable.

I have queued up the series with the following modifications:

* Omitted: "[PATCH v5 05/12] ARM: shmobile: r8a7792: add SMP support"
* Omitted cpu1 node from " [PATCH v5 06/12] ARM: dts: r8a7792: initial SoC device tree"
