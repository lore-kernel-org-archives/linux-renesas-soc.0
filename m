Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:60958 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751528AbdIUIYk (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 21 Sep 2017 04:24:40 -0400
Date: Thu, 21 Sep 2017 10:24:11 +0200
From: Simon Horman <horms@verge.net.au>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Vladimir Barinov <vladimir.barinov@cogentembedded.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Pantelis Antoniou <pantelis.antoniou@konsulko.com>
Subject: Re: [PATCH v2 04/18] arm64: dts: m3ulcb-kf: initial device tree
Message-ID: <20170921082410.GD15749@verge.net.au>
References: <1505398732-4614-1-git-send-email-vladimir.barinov@cogentembedded.com>
 <CAMuHMdX-7MG2fCzJ-K5iQLnJcmZBaWjqMhmOhCxEemmWTh9pvw@mail.gmail.com>
 <20170921082006.GC15749@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170921082006.GC15749@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, Sep 21, 2017 at 10:20:06AM +0200, Simon Horman wrote:
> On Wed, Sep 20, 2017 at 02:32:28PM +0200, Geert Uytterhoeven wrote:
> > Hi Vladimir,
> > 
> > [CC Pantelis]
> > 
> > On Thu, Sep 14, 2017 at 4:18 PM, Vladimir Barinov
> > <vladimir.barinov@cogentembedded.com> wrote:
> > > Add the initial device tree for the M3ULCB with Kingfisher extension
> > > infotainment board.
> > >
> > > Signed-off-by: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
> > > ---
> > > Changes in version 2:
> > > - added own compatible value "shimafuji,kingfisher"
> > 
> > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> 
> Thanks, applied.

Sorry, I spoke to soon. I seem to be missing
[PATCH v2 03/18] arm64: dts: ulcb-kf: initial device tree
