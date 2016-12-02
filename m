Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:39200 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751606AbcLBOAi (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 2 Dec 2016 09:00:38 -0500
Date: Fri, 2 Dec 2016 15:00:32 +0100
From: Simon Horman <horms@verge.net.au>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org"
        <linux-arm-kernel@lists.infradead.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: Re: [PATCH 0/4] ARM, arm64: dts: Use usb-phy fallback bindings
Message-ID: <20161202140031.GA29916@verge.net.au>
References: <1480602354-1446-1-git-send-email-horms+renesas@verge.net.au>
 <CAMuHMdUHBh-=nu3HqqwNq-f5QauAFAAHRS4TUYW10zP4BJMhvg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdUHBh-=nu3HqqwNq-f5QauAFAAHRS4TUYW10zP4BJMhvg@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, Dec 01, 2016 at 03:47:57PM +0100, Geert Uytterhoeven wrote:
> On Thu, Dec 1, 2016 at 3:25 PM, Simon Horman <horms+renesas@verge.net.au> wrote:
> > this short series makes use of fallback bindings for Renesas R-Car PHY
> > drivers in the DT of SoCs which already use those drivers.
> >
> > Simon Horman (4):
> >   ARM: dts: r8a7790: Use renesas,rcar-gen2-usb-phy fallback binding
> >   ARM: dts: r8a7791: Use renesas,rcar-gen2-usb-phy fallback binding
> >   ARM: dts: r8a7794: Use renesas,rcar-gen2-usb-phy fallback binding
> >   arm64: dts: r8a7795: Use renesas,rcar-gen3-usb2-phy fallback binding
> 
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thanks, I have queued these up for v4.11.
