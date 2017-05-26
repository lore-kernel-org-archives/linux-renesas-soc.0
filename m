Return-Path: <kieranbingham.mailinglists+caf_=kieranbingham=gmail.com@gmail.com>
Return-Path: <linux-kernel-owner@vger.kernel.org>
Date: Fri, 26 May 2017 08:56:27 +0200
From: Simon Horman <horms@verge.net.au>
To: jmondi <jacopo@jmondi.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Russell King <linux@armlinux.org.uk>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org"
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] arm: dts: r7s72100: Add support for GR-Peach
Message-ID: <20170526065627.GE2628@verge.net.au>
References: <1495567254-10226-1-git-send-email-jacopo+renesas@jmondi.org>
 <CAMuHMdUovD=6YfJYckoftWyJZ3eRjcKFkScj=wLhyTDSFPavgw@mail.gmail.com>
 <20170524070702.GB4253@w540>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170524070702.GB4253@w540>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, May 24, 2017 at 09:07:02AM +0200, jmondi wrote:
> Hello Simon,
> 
> On Tue, May 23, 2017 at 09:25:40PM +0200, Geert Uytterhoeven wrote:
> > On Tue, May 23, 2017 at 9:20 PM, Jacopo Mondi <jacopo+renesas@jmondi.org> wrote:
> > > Add device tree source for Renesas GR-Peach board.
> > > GR-Peach is an RZ/A1H based board with 10MB of on-chip SRAM and 8MB
> > > QSPI flash storage.
> > > Add support for the board, and create a 2MB partition to use as rootfs.
> > >
> > > Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> >
> > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> 
> I forgot to change subject to "PATCH v2".
> Could you please take this one, or would you like me to resend with
> Geert's reviewed-by ?

No need to repost, I've queued-up this version for v4.13.
