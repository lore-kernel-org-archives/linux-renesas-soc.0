Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:45439 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751237AbdISLUt (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 19 Sep 2017 07:20:49 -0400
Date: Tue, 19 Sep 2017 13:20:31 +0200
From: Simon Horman <horms@verge.net.au>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org"
        <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH] arm64: dts: draak: Add serial console pins
Message-ID: <20170919112028.GD7933@verge.net.au>
References: <1503912370-20180-1-git-send-email-geert+renesas@glider.be>
 <20170830064402.GB10398@verge.net.au>
 <CAMuHMdVCUcy48qDvDSDZ9MAgCLiSUd4zgFD2iu5eWkTVinN1Jw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdVCUcy48qDvDSDZ9MAgCLiSUd4zgFD2iu5eWkTVinN1Jw@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, Sep 19, 2017 at 11:13:25AM +0200, Geert Uytterhoeven wrote:
> On Wed, Aug 30, 2017 at 8:44 AM, Simon Horman <horms@verge.net.au> wrote:
> > On Mon, Aug 28, 2017 at 11:26:10AM +0200, Geert Uytterhoeven wrote:
> >> Add pin control for SCIF2.
> >>
> >> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> >> ---
> >> To be applied after v4.14-rc1, when commit 794a6711764658a1 ("pinctrl:
> >> sh-pfc: Initial R8A77995 PFC support") has hit mainline.
> >>
> >> Else the serial console will fail, reporting (on earlycon):
> >>
> >>     sh-sci e6e88000.serial: could not find pctldev for node /soc/pin-controller@e6060000/scif2, deferring probe
> >
> > Thanks, please ping me once that has happened.
> > In the meantime I have marked this patch as deferred.
> 
> Ping...

Thanks, applied.
