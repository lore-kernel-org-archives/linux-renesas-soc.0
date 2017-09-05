Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:51621 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750729AbdIEHuV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 5 Sep 2017 03:50:21 -0400
Date: Tue, 5 Sep 2017 09:50:01 +0200
From: Simon Horman <horms@verge.net.au>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: ltsi-dev@lists.linuxfoundation.org,
        linux-renesas-soc@vger.kernel.org,
        Magnus Damm <magnus.damm@gmail.com>
Subject: Re: [LTSI-dev] [GIT PULL LTSI-4.9] Third Round of Renesas SoCs and
 Drivers to v4.12
Message-ID: <20170905075001.GB10586@verge.net.au>
References: <20170831140447.GA24787@verge.net.au>
 <20170905072913.GA17948@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170905072913.GA17948@kroah.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, Sep 05, 2017 at 09:29:13AM +0200, Greg KH wrote:
> On Thu, Aug 31, 2017 at 04:04:47PM +0200, Simon Horman wrote:
> > Hi,
> > 
> > This is a submission to LTSI-v4.9.
> > 
> > This series is comprised of a limited backport to v4.9 of usb core,
> > ohci-platform, ehci-platform and cs2000.
> > 
> > These were have been suggested after examination and testing of
> > LTSI-4.9 RC1.
> > 
> > There are 5 patches.
> > 
> > This is based on a merge of:
> > * Earlier work posted as
> >   "[GIT PULL LTSI-4.9] Second Round Renesas SoCs and Drivers to v4.12"
> >   and is tagged as tags/backport/v4.9.45/snapshot2-to-v4.12-flattened
> > * v4.9.46
> 
> Did I merge from that tree?  I can't find it locally, so maybe I did...
> 
> > It appears to apply cleanly to an ltsi-4.9 tree generated using
> > scripts/generate_git
> > 
> > 
> > The following changes since commit 06ce9c3fa43d22ed328b979562b16216053d031d:
> > 
> >   Merge tag 'v4.9.46' into backport/v4.9.46/snapshot-flattened (2017-08-31 12:31:10 +0200)
> > 
> > are available in the git repository at:
> > 
> >   https://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas-backport.git tags/backport/v4.9.46/snapshot3-to-v4.12-flattened
> 
> Hm, this is going to be messy, as you are sending me a pull request
> based on something that I don't really have.
> 
> Can you just send the individual patches in email instead?  There are
> only 5 here, it should be pretty simple to do so, that way I can pick
> them up properly.

Sure, will do.
