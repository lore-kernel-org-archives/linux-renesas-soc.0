Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:57850 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933443AbdKQOP3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 17 Nov 2017 09:15:29 -0500
Date: Fri, 17 Nov 2017 06:15:24 -0800
From: Simon Horman <horms@verge.net.au>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Vladimir Barinov <vladimir.barinov@cogentembedded.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH v2] arm64: dts: ulcb-kf: enable USB2 PHY of channel 0
Message-ID: <20171117141524.qizfhukb2ufw5lbt@verge.net.au>
References: <1510143698-17306-1-git-send-email-vladimir.barinov@cogentembedded.com>
 <CAMuHMdWuHV38=XupXxH1TXFONpsjmY=3zN7iaKDT54xBd_DSGw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdWuHV38=XupXxH1TXFONpsjmY=3zN7iaKDT54xBd_DSGw@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, Nov 15, 2017 at 05:36:21PM +0100, Geert Uytterhoeven wrote:
> Hi Vladimir,
> 
> On Wed, Nov 8, 2017 at 1:21 PM, Vladimir Barinov
> <vladimir.barinov@cogentembedded.com> wrote:
> > This supports USB2 PHY channel #0 on ULCB Kingfisher board
> >
> > The dedicated USB0_PWEN pin is used to control CN13 VBUS source from U43
> > power supply.
> > MAX3355 can also provide VBUS, hence it should be disabled via OTG_OFFVBUSn
> > node coming from gpio expander TCA9539.
> > Set MAX3355 enabled using OTG_EXTLPn node to be able to read OTG ID of CN13.

I took the liberty of line-wrapping the line above to keep it from going
over 75 characters wide to keep checkpatch happy.

> >
> > Signed-off-by: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
> > ---
> > Changes in version 2:
> > - added gpio hogs for MAX3355 VBUS and SHDN
> 
> Thanks for the update!
> 
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thanks, applied.
