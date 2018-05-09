Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:45151 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751803AbeEITFh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 9 May 2018 15:05:37 -0400
Date: Wed, 9 May 2018 21:05:17 +0200
From: Simon Horman <horms@verge.net.au>
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
        <devicetree@vger.kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH] arm64: dts: renesas: r8a77970: add SMP support
Message-ID: <20180509190517.ho5og3grbuzf4wz4@verge.net.au>
References: <14666252.G84Ipxe6EL@wasted.cogentembedded.com>
 <54dbd1d2-8279-5073-cffb-c647fba91e42@cogentembedded.com>
 <CAMuHMdUqVVWz0jLb2Vmrkk3BQBsYVsCOW1zsaPUi8o6jr_mojQ@mail.gmail.com>
 <db136ee6-4ce6-756e-743d-3342b2e65f2b@cogentembedded.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <db136ee6-4ce6-756e-743d-3342b2e65f2b@cogentembedded.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, May 08, 2018 at 09:47:10PM +0300, Sergei Shtylyov wrote:
> On 05/08/2018 09:40 PM, Geert Uytterhoeven wrote:
> 
> >> Add the device node for the second Cortex-A53 CPU core.
> >>
> >> Based on the original (and large) patch by Daisuke Matsushita
> >> <daisuke.matsushita.ns@hitachi.com>.
> >>
> >> Signed-off-by: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
> >> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> > 
> > Dupe of https://patchwork.kernel.org/patch/10032875/
> 
>    Sorry!
>    Not an exact dupe, though -- mine has clock/power #define's used,
> yours -- only bare #s. :-)
> 
> > From series "[PATCH 0/2] arm64: dts: renesas: r8a77970: Add SMP Support"
> > (https://www.spinics.net/lists/linux-renesas-soc/msg19681.html)
> 
>    Hmm... what's the fate of this series?

There is now a v2 of Geert's series which incorporates your enhancements.
I will apply that.
