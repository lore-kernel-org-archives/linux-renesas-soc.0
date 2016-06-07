Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:39534 "EHLO
	kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751169AbcFGAhi (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Mon, 6 Jun 2016 20:37:38 -0400
Date: Tue, 7 Jun 2016 09:37:36 +0900
From: Simon Horman <horms@verge.net.au>
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: linux-renesas-soc@vger.kernel.org, robh+dt@kernel.org,
	pawel.moll@arm.com, mark.rutland@arm.com,
	ijc+devicetree@hellion.org.uk, galak@codeaurora.org,
	devicetree@vger.kernel.org, magnus.damm@gmail.com,
	linux@arm.linux.org.uk, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 0/6] Add R8A7794/SILK sound DT support
Message-ID: <20160607003736.GB20591@verge.net.au>
References: <2378837.cigT3tNQPe@wasted.cogentembedded.com>
 <7d19e749-8264-9004-64f4-aefabda699c6@cogentembedded.com>
 <b77ad169-c9d1-4d67-0973-fc9639ddb613@cogentembedded.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b77ad169-c9d1-4d67-0973-fc9639ddb613@cogentembedded.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Mon, Jun 06, 2016 at 09:11:17PM +0300, Sergei Shtylyov wrote:
> Hello.
> 
> On 05/13/2016 12:16 AM, Sergei Shtylyov wrote:
> 
> >>   Here's the set of 6 patches against Simon Horman's 'renesas.git' repo,
> >>'renesas-devel-20160509-v4.6-rc7' tag. I'm adding the sound device tree support
> >>for the R8A7794 SoC based SILK board.
> >>
> >>[1/6] ARM: dts: r8a7794: add audio clocks
> >>[2/6] ARM: dts: r8a7794: add MSTP5 clocks
> >>[3/6] ARM: dts: r8a7794: add MSTP10 clocks
> >>[4/6] ARM: dts: r8a7794: add Audio-DMAC support
> >>[5/6] ARM: dts: r8a7794: add sound support
> >>[6/6] ARM: dts: silk: add sound support
> >
> >   Oops, forgot to mention that patch #5 depends on the R-Car sound patch
> >posted yesterday in order to get interpreted as intended (it uses a disabled
> >SRC node).
> 
>   Simon, that patch has already hit Linus' tree but this series seems to be
> stuck. Please merge!

Hi Sergei,

there seem to be some outstanding review comments for v3 of this patchset.
Could you address them and repost?

Thanks!
