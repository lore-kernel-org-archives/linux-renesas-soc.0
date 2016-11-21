Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:39030 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753972AbcKUKxY (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 21 Nov 2016 05:53:24 -0500
Date: Mon, 21 Nov 2016 11:53:18 +0100
From: Simon Horman <horms@verge.net.au>
To: Olof Johansson <olof@lixom.net>
Cc: arm@kernel.org, linux-renesas-soc@vger.kernel.org,
        Kevin Hilman <khilman@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>
Subject: Re: [GIT PULL] Second Round of Renesas ARM Based SoC DT Updates for
 v4.10
Message-ID: <20161121105315.GA19845@verge.net.au>
References: <cover.1479391750.git.horms+renesas@verge.net.au>
 <20161119014929.GE2543@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20161119014929.GE2543@localhost>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Fri, Nov 18, 2016 at 05:49:29PM -0800, Olof Johansson wrote:
> On Thu, Nov 17, 2016 at 03:11:45PM +0100, Simon Horman wrote:
> > Hi Olof, Hi Kevin, Hi Arnd,
> > 
> > Please consider these second round of Renesas ARM based SoC DT updates for v4.10.
> > 
> > This pull request is based on a merge of:
> > 
> > * The previous round of such requests, tagged as renesas-dt-for-v4.10,
> >   which I have already sent a pull-request for.
> > * The rzg-clock-defs tag of Geert Uytterhoeven's renesas-driver's tree.
> >   This is to provide dependencies for adding the r8a7743 and r8a7745 SoCs.
> > * The "Second Round of Renesas ARM Based SoC Drivers Updates for v4.10",
> >   tagged as renesas-drivers2-for-v4.10, which I have also sent a pull
> >   request for. This is included to provide dependencies for adding device
> >   nodes for PRR, and adding the r8a7743 and r8a7745 SoCs.
> 
> Again, nack. And again, I don't understand why you create dependencies that
> aren't needed. Please fix.

Hi Olof,

I agree that calling out PRR above was incorrect. Please disregard that.

However, there are dependencies for adding r8a7743 and r8a7745 SoCs
in the form of header files:

* The rzg-clock-defs tag provides dt-bindings/clock/r8a774[35]-cpg-mssr.h
* The renesas-drivers2-for-v4.10 tag provides
  dt-bindings/power/r8a774[35]-sysc.h

The drivers branches are usually pretty light-weight. But this time it is a
bit heavy and you rightly raised some questions about it. After some
discussion with Geert we'd like to suggest that for future releases
we provide a "driver-defs" branch which both driver code and DT can
depend on. Thus avoiding pulling (non essential) driver changes into the DT
branch.

Unfortunately its a bit late to do that for v4.10 as the r8a7743 sysc
driver and its defines were already accepted accepted together
(renesas-drivers-for-v4.10 tag). So for this release we would be grateful
if you could re-consider the renesas-drivers2-for-v4.10 tag given the
feedback which Geert has provided. And in turn re-consider this pull
request.
