Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from out5-smtp.messagingengine.com ([66.111.4.29]:38771 "EHLO
	out5-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751496AbcEJVFj (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Tue, 10 May 2016 17:05:39 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
	by mailout.nyi.internal (Postfix) with ESMTP id 6A17920BBF
	for <linux-renesas-soc@vger.kernel.org>; Tue, 10 May 2016 17:05:37 -0400 (EDT)
Date: Tue, 10 May 2016 23:05:34 +0200
From: Greg KH <greg@kroah.com>
To: Wolfram Sang <wsa@the-dreams.de>
Cc: driverdev-devel@linuxdriverproject.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 00/27] staging: add driver for KS7010 based SDIO cards
Message-ID: <20160510210534.GB17923@kroah.com>
References: <1462888360-21649-1-git-send-email-wsa@the-dreams.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1462888360-21649-1-git-send-email-wsa@the-dreams.de>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, May 10, 2016 at 03:52:13PM +0200, Wolfram Sang wrote:
> This driver can be used with later Spectec SDW-821 and all SDW-823 cards.
> See patch 1 and README for more details about its origin. To have the card
> working, you need another patch which is already in mmc/next:
> 
> https://patchwork.kernel.org/patch/9043341/
> 
> A working topic branch for the Renesas H3 can be found here:
> 
> git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git renesas/topic/gen3-sdio
> 
> This series only can be found here:
> 
> git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git staging/ks7010
> 
> Note: I needed this driver to verify SDIO capabilities for the new Renesas H3
> SoC. The fact that the original KS7010 driver also comes from Renesas is a
> coincidence. It does not mean official support for this driver. Parts of this
> work were backed by the above mentioned SDIO verification task while other
> parts were my personal interest. Future patches and reviews will also done by
> me as a private person (unless something very surprising happens ;))
> 
> Please comment, review, apply...

Can you change the README file to be named TODO to match all of the
other staging driver files?  That way people can look at them by just
doing a staging/*/TODO match.

thanks

greg k-h
