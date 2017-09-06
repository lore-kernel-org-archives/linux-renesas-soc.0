Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:47499 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751880AbdIFIXq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 6 Sep 2017 04:23:46 -0400
Date: Wed, 6 Sep 2017 10:13:13 +0200
From: Simon Horman <horms@verge.net.au>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: ltsi-dev@lists.linuxfoundation.org,
        linux-renesas-soc@vger.kernel.org,
        Magnus Damm <magnus.damm@gmail.com>
Subject: Re: [GIT PULL LTSI-4.9 v2 00/13] Second Round of Renesas SoCs and
 Drivers to v4.12
Message-ID: <20170906081313.GB10048@verge.net.au>
References: <1504598808-19810-1-git-send-email-horms@verge.net.au>
 <20170905143327.GA12405@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170905143327.GA12405@kroah.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, Sep 05, 2017 at 04:33:27PM +0200, Greg KH wrote:
> On Tue, Sep 05, 2017 at 10:06:35AM +0200, Simon Horman wrote:
> > Hi,
> > 
> > This is a submission to LTSI-v4.9.
> > 
> > * Backport v4.9 of the rcar-gen3-thermal driver to its as of v4.12.
> > * Limited backport to v4.9 of:
> >   - usb core
> >   - ohci-platform
> >   - ehci-platform
> >   - cs2000
> > 
> > There are 13 patches.
> > 
> > This patches appear to apply ltsi-4.9 tree generated using
> > scripts/generate_git.
> 
> Thanks, that worked just fine, all now queued up.

Great, thanks for your patience.
