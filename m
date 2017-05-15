Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:49370 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750991AbdEOG5s (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 15 May 2017 02:57:48 -0400
Date: Mon, 15 May 2017 08:57:44 +0200
From: Simon Horman <horms@verge.net.au>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org"
        <linux-arm-kernel@lists.infradead.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Niklas =?utf-8?Q?S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
Subject: Re: [PATCH/RFT renesas-devel] arm64: dts: ulcb: Set drive-strength
 for ravb pins
Message-ID: <20170515065743.GG16545@verge.net.au>
References: <1493721024-15042-1-git-send-email-horms+renesas@verge.net.au>
 <CAMuHMdWeLAq7nZ7zu2xJ7vG-oM+-TSZm0eY68Cm-9eUREMjhXg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMuHMdWeLAq7nZ7zu2xJ7vG-oM+-TSZm0eY68Cm-9eUREMjhXg@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Fri, May 12, 2017 at 04:39:03PM +0200, Geert Uytterhoeven wrote:
> Hi Simon,
> 
> On Tue, May 2, 2017 at 12:30 PM, Simon Horman
> <horms+renesas@verge.net.au> wrote:
> > The EthernetAVB should not depend on the bootloader to setup correct
> > drive-strength values.  Values for drive-strength where found by
> > examining the registers after the bootloader has configured the
> > registers and successfully used the EthernetAVB.
> >
> > Based on:
> > * commit 7d73a4da2681 ("arm64: dts: r8a7795: salvator-x: Set drive-strength
> >   for ravb pins")
> > * commit 4903987033be ("arm64: dts: r8a7796: salvator-x: Set drive-strength
> >   for ravb pins")
> >
> > Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> > Cc: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> > Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
> 
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> 
> > * Compile tested only due to lack of hardware access
> 
> So how did you examine the registers? ;-)

You got me there: copy-paste gone wrong.

> Hence I examined the registers myself:
>   - H3ULCB has the same register settings as Salvator-X with H3 ES1.0
>   - M3ULCB has the same register settings as Salvator-X with M3-W ES1.0
>     or H3 ES2.0.

That was my assumption, which is what I should have written.
But as you have checked - thanks for that - I will leave the changelog
as-is and queue up the patch.
