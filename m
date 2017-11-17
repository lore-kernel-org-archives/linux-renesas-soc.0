Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:57938 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1757190AbdKQOUW (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 17 Nov 2017 09:20:22 -0500
Date: Fri, 17 Nov 2017 06:20:18 -0800
From: Simon Horman <horms@verge.net.au>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        Rob Herring <robh+dt@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        "linux-arm-kernel@lists.infradead.org"
        <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH 2/2] arm64: dts: renesas: eagle: specify EtherAVB PHY IRQ
Message-ID: <20171117142017.g6vg7m5k2tcd7ovy@verge.net.au>
References: <20171113213152.819421744@cogentembedded.com>
 <CAMuHMdUqX6OhsKBET5RkL0zcZO-aiTT4wHHuwuRTeVHAYkSnZg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdUqX6OhsKBET5RkL0zcZO-aiTT4wHHuwuRTeVHAYkSnZg@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, Nov 15, 2017 at 05:15:58PM +0100, Geert Uytterhoeven wrote:
> On Mon, Nov 13, 2017 at 10:23 PM, Sergei Shtylyov
> <sergei.shtylyov@cogentembedded.com> wrote:
> > Specify  EtherAVB PHY IRQ  in the Eagle board's device tree, now that we
> > have the GPIO support (previously phylib had to resort to polling).
> >
> > Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> 
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thanks, applied.
