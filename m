Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:52974 "EHLO
	kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753569AbcEJADb (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Mon, 9 May 2016 20:03:31 -0400
Date: Tue, 10 May 2016 09:03:48 +0900
From: Simon Horman <horms@verge.net.au>
To: Arnd Bergmann <arnd@arndb.de>
Cc: arm@kernel.org, linux-renesas-soc@vger.kernel.org,
	Olof Johansson <olof@lixom.net>,
	Kevin Hilman <khilman@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	Magnus Damm <magnus.damm@gmail.com>
Subject: Re: [GIT PULL] Renesas ARM64 Based SoC DT PM Domain Updates for v4.7
Message-ID: <20160510000348.GC4530@verge.net.au>
References: <cover.1461730364.git.horms+renesas@verge.net.au>
 <20160506002125.GE24999@verge.net.au>
 <41128314.QPDQXbTtHX@wuerfel>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <41128314.QPDQXbTtHX@wuerfel>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Mon, May 09, 2016 at 03:10:40PM +0200, Arnd Bergmann wrote:
> On Friday 06 May 2016 09:21:25 Simon Horman wrote:
> > Hi,
> > 
> > On Wed, Apr 27, 2016 at 02:20:10PM +1000, Simon Horman wrote:
> > > Hi Olof, Hi Kevin, Hi Arnd,
> > > 
> > > Please consider these Renesas ARM64 based SoC DT PM Domain updates for v4.7.
> > > 
> > > This pull requests is based on a merge of:
> > > 
> > > * "[GIT PULL] Second Round of Renesas ARM Based SoC R-Car SYSC Updates for
> > >   v4.7", tagged as renesas-rcar-sysc2-for-v4.7, which you have already
> > >   pulled
> > > * "[GIT PULL] Second Round of Renesas ARM64 Based SoC DT Updates for v4.7",
> > >   tagged as renesas-arm64-dt2-for-v4.7, which I have sent a pull request
> > >   for.
> > > 
> > > The reason for the somewhat tedious base on
> > > renesas-rcar-sysc2-for-v4.7, which provides driver changes,
> > > is a hard run-time dependency.
> > > 
> > > I also have a similar set of changes for ARM (32-bit) which I will send
> > > separately.
> > 
> > I am wondering if this pull-request might have slipped through the cracks.
> > 
> > FWIW, all other pull requests I have submitted for v4.7 have been pulled
> > (thanks!) including a similar pull-request for ARM (32-bit) which is
> > present in the next/late branch of the arm-soc tree.
> > 
> > I do not plan to send any more non-fix pull requests for v4.7.
> > And at this stage I am not aware of any fixes for v4.7.
> > 
> 
> Indeed it did, thanks for the reminder! I've put it on my stack now
> and should start doing merges later today when I'm through my mail.

Great, thanks! I see that it has now been pulled.
