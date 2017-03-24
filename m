Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:59818 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932818AbdCXGw6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 24 Mar 2017 02:52:58 -0400
Date: Fri, 24 Mar 2017 07:52:45 +0100
From: Simon Horman <horms@verge.net.au>
To: Olof Johansson <olof@lixom.net>
Cc: arm@kernel.org, linux-renesas-soc@vger.kernel.org,
        Kevin Hilman <khilman@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>
Subject: Re: [GIT PULL] Renesas ARM Based SoC Drivers Updates for v4.12
Message-ID: <20170324065245.GG1319@verge.net.au>
References: <cover.1490000158.git.horms+renesas@verge.net.au>
 <20170322003750.GI5129@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170322003750.GI5129@localhost>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, Mar 21, 2017 at 05:37:50PM -0700, Olof Johansson wrote:
> On Mon, Mar 20, 2017 at 09:58:23AM +0100, Simon Horman wrote:
> > Hi Olof, Hi Kevin, Hi Arnd,
> > 
> > Please consider these Renesas ARM based SoC drivers updates for v4.12.
> > 
> > 
> > The following changes since commit c1ae3cfa0e89fa1a7ecc4c99031f5e9ae99d9201:
> > 
> >   Linux 4.11-rc1 (2017-03-05 12:59:56 -0800)
> > 
> > are available in the git repository at:
> > 
> >   https://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas.git tags/renesas-drivers-for-v4.12
> > 
> > for you to fetch changes up to cd59de80dd34dd2d1a3ca97d7a6e712c048b135a:
> > 
> >   soc: renesas: Identify RZ/G1N (2017-03-13 10:26:08 +0100)
> > 
> > ----------------------------------------------------------------
> > Renesas ARM Based SoC Drivers Updates for v4.12
> > 
> > * Identify RZ/G1N and RZ/G1H
> > 
> > ----------------------------------------------------------------
> > Geert Uytterhoeven (2):
> >       soc: renesas: Identify RZ/G1H
> >       soc: renesas: Identify RZ/G1N
> 
> At first I was wondering why you'd applied the same patch twice. Renesas likes
> to make names similar *and* hard to remember sometimes. :-)

:-)

Thanks for queueing up this and the other pull-requests I sent.
