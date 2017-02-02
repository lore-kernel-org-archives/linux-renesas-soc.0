Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:45889 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751019AbdBBJTF (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 2 Feb 2017 04:19:05 -0500
Date: Thu, 2 Feb 2017 10:18:59 +0100
From: Simon Horman <horms@verge.net.au>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Vladimir Barinov <vladimir.barinov@cogentembedded.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH 1/2] arm64: dts: h3ulcb: Update memory node to 4 GiB map
Message-ID: <20170202091858.GJ21831@verge.net.au>
References: <1485443606-22566-1-git-send-email-vladimir.barinov@cogentembedded.com>
 <1485443632-22612-1-git-send-email-vladimir.barinov@cogentembedded.com>
 <CAMuHMdV8Mn83rpkqaB655GPSjw1E_QLCcRJKoU+QYyogMEv1mw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdV8Mn83rpkqaB655GPSjw1E_QLCcRJKoU+QYyogMEv1mw@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, Feb 01, 2017 at 01:40:08PM +0100, Geert Uytterhoeven wrote:
> On Thu, Jan 26, 2017 at 4:13 PM, Vladimir Barinov
> <vladimir.barinov@cogentembedded.com> wrote:
> > From: Vladimir Barinov <vladimir.barinov+renesas@cogentembedded.com>
> >
> > This patch adds memory region:
> >
> >   - After changes, the H3ULCB board has the following map:
> >     Bank0: 1GiB RAM : 0x000048000000 -> 0x0007fffffff
> >     Bank1: 1GiB RAM : 0x000500000000 -> 0x0053fffffff
> >     Bank2: 1GiB RAM : 0x000600000000 -> 0x0063fffffff
> >     Bank3: 1GiB RAM : 0x000700000000 -> 0x0073fffffff
> >
> >   - Before changes, the old map looked like this:
> >     Bank0: 1GiB RAM : 0x000048000000 -> 0x0007fffffff
> >
> > Signed-off-by: Vladimir Barinov <vladimir.barinov+renesas@cogentembedded.com>
> 
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thanks, I have queued this up.
