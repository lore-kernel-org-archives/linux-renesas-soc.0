Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:43226 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725898AbeIUNYx (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 21 Sep 2018 09:24:53 -0400
Date: Fri, 21 Sep 2018 09:37:13 +0200
From: Simon Horman <horms@verge.net.au>
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: "magnus.damm@gmail.com" <magnus.damm@gmail.com>,
        "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH] arm64: dts: renesas: revise properties for usb 2.0
Message-ID: <20180921073712.p2iqas3pspsoci3w@verge.net.au>
References: <1535703651-5152-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <20180905103326.lsn57rilweolpews@verge.net.au>
 <OSBPR01MB22938356A189FF10698CDBC4D8130@OSBPR01MB2293.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <OSBPR01MB22938356A189FF10698CDBC4D8130@OSBPR01MB2293.jpnprd01.prod.outlook.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, Sep 20, 2018 at 05:55:00AM +0000, Yoshihiro Shimoda wrote:
> Hi Simon-san,
> 
> > From: Simon Horman, Sent: Wednesday, September 5, 2018 7:33 PM
> > 
> > On Fri, Aug 31, 2018 at 05:20:51PM +0900, Yoshihiro Shimoda wrote:
> > > R-Car Gen3 needs to enable/deassert clocks/resets of both usb 2.0
> > > host (included phy) and peripheral. Otherwise, other side device
> > > cannot work correctly. So, this patch revises properties of clocks
> > > and resets. After that, each device driver can enable/deassert
> > > clocks/resets by its self.
> > >
> > > Notes:
> > >  - To work the renesas_usbhs driver correctly when host side drivers
> > >    are disabled and the renesas_usbhs driver doesn't have multiple
> > >    clock management, this patch doesn't change the order of the clocks
> > >    property in each hsusb node.
> > >  - This patch doesn't have any side-effects even if the renesas_usbhs
> > >    driver doesn't have reset_control and multiple clock management.
> > >
> > > Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> > 
> > Thanks Shimoda-san,
> > 
> > This looks fine to me but I will wait to see if there are other reviews
> > before applying.
> > 
> > Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
> 
> Thank you for your review!
> However, since clock-names will be not used by renesas_usbhs driver,
> I'll submit v2 patch to remove the properties.

Thanks, I'll wait for v2.
