Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:60891 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751212AbdGJJ1A (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 10 Jul 2017 05:27:00 -0400
Date: Mon, 10 Jul 2017 11:26:55 +0200
From: Simon Horman <horms@verge.net.au>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org"
        <linux-arm-kernel@lists.infradead.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: Re: [PATCH 0/7] ARM: dts: renesas: Add Inter Connect RAM
Message-ID: <20170710092654.GP13680@verge.net.au>
References: <1499181798-28859-1-git-send-email-geert+renesas@glider.be>
 <20170710084010.GJ13680@verge.net.au>
 <CAMuHMdU7KC4X8+kOFUBiBw2ZHs=aukf+_1iR+Gjw2M+RgJ6mBQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdU7KC4X8+kOFUBiBw2ZHs=aukf+_1iR+Gjw2M+RgJ6mBQ@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Mon, Jul 10, 2017 at 10:45:23AM +0200, Geert Uytterhoeven wrote:
> Hi Simon,
> 
> On Mon, Jul 10, 2017 at 10:40 AM, Simon Horman <horms@verge.net.au> wrote:
> > On Tue, Jul 04, 2017 at 05:23:11PM +0200, Geert Uytterhoeven wrote:
> >> R-Car Gen2 and RZ/G1 SoCs contain two or three blocks of SRAM, which can be
> >> used for several purposes.  One such purpose is holding a jump stub for CPU
> >> core bringup.
> >>
> >> This patch series adds the SRAM blocks to the various DTS files, following
> >> the generic DT bindings for "mmio-sram" in
> >> Documentation/devicetree/bindings/sram/sram.txt.  Reserving SRAM for jump
> >> stub for CPU core bringup will be handled in a follow-up series.
> >>
> >> Thanks!
> >
> > Geert, these seem nice and clean to me.
> > Are they ready to be applied?
> 
> I think they are.

Thanks, all patches applied for v4.14.
