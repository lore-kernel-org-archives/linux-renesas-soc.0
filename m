Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:39118 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753521AbcKUK4D (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 21 Nov 2016 05:56:03 -0500
Date: Mon, 21 Nov 2016 11:55:58 +0100
From: Simon Horman <horms@verge.net.au>
To: Olof Johansson <olof@lixom.net>
Cc: arm@kernel.org, linux-renesas-soc@vger.kernel.org,
        Kevin Hilman <khilman@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>
Subject: Re: [GIT PULL] Renesas ARM Based SoC EtherAVB Updates for v4.10
Message-ID: <20161121105558.GC19845@verge.net.au>
References: <cover.1479390880.git.horms+renesas@verge.net.au>
 <20161119014327.GD2543@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20161119014327.GD2543@localhost>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Fri, Nov 18, 2016 at 05:43:27PM -0800, Olof Johansson wrote:
> On Thu, Nov 17, 2016 at 03:05:08PM +0100, Simon Horman wrote:
> > Hi Olof, Hi Kevin, Hi Arnd,
> > 
> > Please consider these Renesas ARM based SoC EtherAVB updates for v4.10.
> > 
> > This pull request is based on the "Second Round of Renesas ARM64 Based SoC
> > DT Updates for v4.10", tagged as arm64-dt-for-v4.10, which I have also sent
> > a pull-request for.
> > 
> > The reason for this base is to provide dependencies. For the same reason
> > an ack has been provided by David Miller to facilitate a merge of the patch
> > via the Renesas tree.
> 
> And now we have cascading dependencies. Can't merge this either.
> 
> Why is the DT branch and this driver branch entangled?! Again, there is
> absolutely no functional dependency between them.

Sorry once again. I would like to withdraw this pull request.
