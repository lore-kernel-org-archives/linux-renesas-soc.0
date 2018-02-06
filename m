Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:58936 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752689AbeBFMzN (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 6 Feb 2018 07:55:13 -0500
Date: Tue, 6 Feb 2018 13:55:09 +0100
From: Simon Horman <horms@verge.net.au>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        Rob Herring <robh+dt@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
        <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 06/11] arm64: dts: renesas: r8a77980: add SYS-DMAC support
Message-ID: <20180206125508.esre26zmpu2idguz@verge.net.au>
References: <46fca582-220d-e5a7-62cd-2fc77a29846b@cogentembedded.com>
 <70132f3d-0f37-ae7e-a44b-d65920620936@cogentembedded.com>
 <CAMuHMdWQoa1mTGMGTKYvKHG0DHwZsLN=4kHOiGYYbVxZyZQH_A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdWQoa1mTGMGTKYvKHG0DHwZsLN=4kHOiGYYbVxZyZQH_A@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, Feb 06, 2018 at 12:40:14PM +0100, Geert Uytterhoeven wrote:
> On Fri, Feb 2, 2018 at 7:36 PM, Sergei Shtylyov
> <sergei.shtylyov@cogentembedded.com> wrote:
> > Describe SYS-DMAC1/2 in the R8A77980 device tree.
> >
> > Based on the original (and large) patch by Vladimir Barinov.
> >
> > Signed-off-by: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
> > Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> 
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thanks, applied.
