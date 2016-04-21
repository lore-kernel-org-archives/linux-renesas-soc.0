Return-Path: <devicetree-owner@vger.kernel.org>
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: Simon Horman <horms@verge.net.au>
CC: "magnus.damm@gmail.com" <magnus.damm@gmail.com>,
	"robh+dt@kernel.org" <robh+dt@kernel.org>,
	"pawel.moll@arm.com" <pawel.moll@arm.com>,
	"mark.rutland@arm.com" <mark.rutland@arm.com>,
	"ijc+devicetree@hellion.org.uk" <ijc+devicetree@hellion.org.uk>,
	"galak@codeaurora.org" <galak@codeaurora.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH] arm64: defconfig: Add Renesas R-Car USB 3.0 driver
 support
Date: Thu, 21 Apr 2016 09:44:57 +0000
Message-ID: <SG2PR06MB09199B8168E3822A9B09E9C6D86E0@SG2PR06MB0919.apcprd06.prod.outlook.com>
References: <1461142034-5008-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <20160421031514.GB11116@verge.net.au>
 <SG2PR06MB0919C567798F775F2685811ED86E0@SG2PR06MB0919.apcprd06.prod.outlook.com>
 <20160421035623.GB28575@verge.net.au>
In-Reply-To: <20160421035623.GB28575@verge.net.au>
Content-Language: ja-JP
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
MIME-Version: 1.0
Sender: devicetree-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Simon-san,

> From: Simon Horman
> Sent: Thursday, April 21, 2016 12:56 PM
> 
< snip >
> > > > diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> > > > index a44ef99..a95751d 100644
> > > > --- a/arch/arm64/configs/defconfig
> > > > +++ b/arch/arm64/configs/defconfig
> > > > @@ -1,7 +1,6 @@
> > > >  # CONFIG_LOCALVERSION_AUTO is not set
> > > >  CONFIG_SYSVIPC=y
> > > >  CONFIG_POSIX_MQUEUE=y
> > > > -CONFIG_FHANDLE=y
> > > >  CONFIG_AUDIT=y
> > > >  CONFIG_NO_HZ_IDLE=y
> > > >  CONFIG_HIGH_RES_TIMERS=y
> > >
> > > Is the hunk above intended?
> > > It does not seem to match my reading of the changelog.
> >
> > Perhaps I should make a patch for this change because
> > if I did the following commands, this change appeared.
> 
> I'm not sure how the ARM-SoC maintainers feel about such cleanups
> these days. I suggest just dropping that part of the change for now.

Thank you for the suggestion!
I agree with you. So, I will submit v2 patch today.

Best regards,
Yoshihiro Shimoda

> > on renesas-devel-20160420-v4.6-rc4
> > $ make defconfig
> > $ cp defconfig arch/arm64/config
> > $ git diff
> >
> > Best regards,
> > Yoshihiro Shimoda
> >
> > > > @@ -192,7 +191,7 @@ CONFIG_SND_SOC_AK4613=y
> > > >  CONFIG_USB=y
> > > >  CONFIG_USB_OTG=y
> > > >  CONFIG_USB_XHCI_HCD=y
> > > > -CONFIG_USB_XHCI_PLATFORM=y
> > > > +CONFIG_USB_XHCI_RCAR=y
> > > >  CONFIG_USB_EHCI_HCD=y
> > > >  CONFIG_USB_EHCI_MSM=y
> > > >  CONFIG_USB_EHCI_HCD_PLATFORM=y
> > > > --
> > > > 1.9.1
