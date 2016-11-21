Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:39113 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753521AbcKUKz7 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 21 Nov 2016 05:55:59 -0500
Date: Mon, 21 Nov 2016 11:55:54 +0100
From: Simon Horman <horms@verge.net.au>
To: Olof Johansson <olof@lixom.net>
Cc: arm@kernel.org, linux-renesas-soc@vger.kernel.org,
        Kevin Hilman <khilman@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>
Subject: Re: [GIT PULL] Second Round of Renesas ARM64 Based SoC DT Updates
 for v4.10
Message-ID: <20161121105554.GB19845@verge.net.au>
References: <cover.1479388193.git.horms+renesas@verge.net.au>
 <20161119014150.GC2543@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20161119014150.GC2543@localhost>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Fri, Nov 18, 2016 at 05:41:50PM -0800, Olof Johansson wrote:
> On Thu, Nov 17, 2016 at 03:04:55PM +0100, Simon Horman wrote:
> > Hi Olof, Hi Kevin, Hi Arnd,
> > 
> > Please consider these second round of Renesas ARM64 based SoC DT updates
> > for v4.10.
> > 
> > This pull request is based on a merge of:
> > 
> > * The previous round of such requests, tagged as renesas-arm64-dt-for-v4.10,
> >   which I have already sent a pull-request for.
> > * The "Second Round of Renesas ARM Based SoC Drivers Updates for v4.10",
> >   tagged as renesas-drivers2-for-v4.10, which I have also sent a pull
> >   request for. This is included to provide dependencies for adding device
> >   nodes for PRR.
> 
> Please avoid entangling these pull requests, since now I can't merge DT since
> I'm rejecting your drivers pull request.
> 
> I also don't understand why you need a driver branch as base. The PRR
> nodes are literally just a compatible field and a reg entry. It should
> depend on nothing.
> 
> So, I'm a little confused here. Please disentangle this and send a separate
> pull request, I'll be happy to merge that.

Sorry about this.

As you correctly point out the PRR patches do not depend on anything and
the merge described above is unnecessary.

I will prepare a fresh pull request based (only) on
renesas-arm64-dt-for-v4.10.
