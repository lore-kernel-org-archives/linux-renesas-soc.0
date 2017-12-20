Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:56076 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754746AbdLTLxx (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 20 Dec 2017 06:53:53 -0500
Date: Wed, 20 Dec 2017 12:53:48 +0100
From: Simon Horman <horms@verge.net.au>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>
Subject: Re: [PATCH 2/2] ARM: dts: r8a7792: move timer node out of bus
Message-ID: <20171220115347.dgg4imm36w6frw4f@verge.net.au>
References: <20171218213233.3373-1-horms+renesas@verge.net.au>
 <20171218213233.3373-3-horms+renesas@verge.net.au>
 <CAMuHMdXRCvw3mMd4uWapin70_3h4F964qbD-xMkfF2MxgLafdA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdXRCvw3mMd4uWapin70_3h4F964qbD-xMkfF2MxgLafdA@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, Dec 19, 2017 at 09:39:56AM +0100, Geert Uytterhoeven wrote:
> On Mon, Dec 18, 2017 at 10:32 PM, Simon Horman
> <horms+renesas@verge.net.au> wrote:
> > The timer node does not have any register properties and thus shouldn't be
> > placed on the bus.
> >
> > This problem is flagged by the compiler as follows:
> > $ make dtbs W=1
> > ...
> >   DTC     arch/arm/boot/dts/r8a7792-wheat.dtb
> > arch/arm/boot/dts/r8a7792-blanche.dtb: Warning (simple_bus_reg): Node /soc/timer missing or empty reg/ranges property
> > arch/arm/boot/dts/r8a7792-wheat.dtb: Warning (simple_bus_reg): Node /soc/timer missing or empty reg/ranges property
> >
> > Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
> 
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thanks, applied.
