Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from out5-smtp.messagingengine.com ([66.111.4.29]:59003 "EHLO
	out5-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751450AbcEKIhQ (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Wed, 11 May 2016 04:37:16 -0400
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.nyi.internal (Postfix) with ESMTP id 001FB20A6D
	for <linux-renesas-soc@vger.kernel.org>; Wed, 11 May 2016 04:37:13 -0400 (EDT)
Date: Wed, 11 May 2016 10:37:11 +0200
From: Greg KH <greg@kroah.com>
To: Wolfram Sang <wsa@the-dreams.de>
Cc: driverdev-devel@linuxdriverproject.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 00/27] staging: add driver for KS7010 based SDIO cards
Message-ID: <20160511083711.GA29556@kroah.com>
References: <1462888360-21649-1-git-send-email-wsa@the-dreams.de>
 <20160510210534.GB17923@kroah.com>
 <20160511060614.GA1637@katana>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20160511060614.GA1637@katana>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, May 11, 2016 at 08:06:15AM +0200, Wolfram Sang wrote:
> On Tue, May 10, 2016 at 11:05:34PM +0200, Greg KH wrote:
> > On Tue, May 10, 2016 at 03:52:13PM +0200, Wolfram Sang wrote:
> > > This driver can be used with later Spectec SDW-821 and all SDW-823 cards.
> > > See patch 1 and README for more details about its origin. To have the card
> > > working, you need another patch which is already in mmc/next:
> > > 
> > > https://patchwork.kernel.org/patch/9043341/
> > > 
> > > A working topic branch for the Renesas H3 can be found here:
> > > 
> > > git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git renesas/topic/gen3-sdio
> > > 
> > > This series only can be found here:
> > > 
> > > git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git staging/ks7010
> > > 
> > > Note: I needed this driver to verify SDIO capabilities for the new Renesas H3
> > > SoC. The fact that the original KS7010 driver also comes from Renesas is a
> > > coincidence. It does not mean official support for this driver. Parts of this
> > > work were backed by the above mentioned SDIO verification task while other
> > > parts were my personal interest. Future patches and reviews will also done by
> > > me as a private person (unless something very surprising happens ;))
> > > 
> > > Please comment, review, apply...
> > 
> > Can you change the README file to be named TODO to match all of the
> > other staging driver files?  That way people can look at them by just
> > doing a staging/*/TODO match.
> 
> Will do. Do you want a) an incremental patch, b) and updated branch to
> pull from, or c) the whole series resend?

An add-on patch is probably easiest for everyone involved here.

thanks,

greg k-h
