Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:57286 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752146AbdDHUIx (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 8 Apr 2017 16:08:53 -0400
Date: Sat, 8 Apr 2017 16:08:48 -0400
From: Simon Horman <horms@verge.net.au>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
        Arnd Bergmann <arnd@arndb.de>,
        Kevin Hilman <khilman@kernel.org>,
        Olof Johansson <olof@lixom.net>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [git pull] base: soc: Improvements for the SoC bus and
 soc_device_match()
Message-ID: <20170408200848.GC6533@verge.net.au>
References: <1490950460-8945-1-git-send-email-geert+renesas@glider.be>
 <20170403102831.GF31988@verge.net.au>
 <20170408153505.GA1140@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170408153505.GA1140@kroah.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Sat, Apr 08, 2017 at 05:35:05PM +0200, Greg Kroah-Hartman wrote:
> On Mon, Apr 03, 2017 at 06:28:31AM -0400, Simon Horman wrote:
> > On Fri, Mar 31, 2017 at 10:54:20AM +0200, Geert Uytterhoeven wrote:
> > > 	Hi Greg,
> > > 	Hi Arnd, Kevin, Olof,
> > > 	Hi Magnus, Simon,
> > > 
> > > The following changes since commit c470abd4fde40ea6a0846a2beab642a578c0b8cd:
> > > 
> > >   Linux 4.10 (2017-02-19 14:34:00 -0800)
> > > 
> > > are available in the git repository at:
> > > 
> > >   git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git tags/soc-device-match-tag2
> > > 
> > > for you to fetch changes up to 6e12db376b60b7158e4e6006af60566f8c68f7ab:
> > > 
> > >   base: soc: Allow early registration of a single SoC device (2017-03-29 21:43:26 +0200)
> > 
> > Hi Geert,
> > 
> > I have pulled this into the renesas tree.
> > 
> > Hi Greg,
> > 
> > I would be most grateful if you could pull the above tag too.
> 
> Pull it into where?  Why do I need this if they are going in through
> your tree?

Good point. I don't think you need to pull it unless it would satisfy
dependencies you have and it seems there are none at this time.
