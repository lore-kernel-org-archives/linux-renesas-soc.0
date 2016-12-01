Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:43941 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753677AbcLAIsF (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 1 Dec 2016 03:48:05 -0500
Date: Thu, 1 Dec 2016 09:47:58 +0100
From: Simon Horman <horms@verge.net.au>
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-kernel@lists.infradead.org, arm@kernel.org,
        Kevin Hilman <khilman@kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, Olof Johansson <olof@lixom.net>
Subject: Re: [GIT PULL] Renesas ARM Based SoC Match Updates for v4.10
Message-ID: <20161201084758.GC18042@verge.net.au>
References: <cover.1479928995.git.horms+renesas@verge.net.au>
 <6791283.iMDbrK21lt@wuerfel>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6791283.iMDbrK21lt@wuerfel>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, Nov 30, 2016 at 04:50:20PM +0100, Arnd Bergmann wrote:
> On Wednesday, November 23, 2016 9:13:31 PM CET Simon Horman wrote:
> > This pull request is based on the pull request "soc_device_match()
> > interface for matching against soc_bus attributes" sent by Geert
> > Uytterhoeven which corresponds to the soc-device-match-tag1 tag in his
> > renesas-driver's tree. It provides infrastructure used by changes in this
> > pull request.
> > 
> > This pull request is broken out of an earlier pull request,
> > "Second Round of Renesas ARM Based SoC Drivers Updates for v4.10".
> > The motivation for breaking up the pull request is to provide
> > branches with minimal dependencies.
> > 
> > This pull request is targeted at the next/drivers branch of the arm-soc tree.
> > 
> > It introduces some minor merge conflicts in drivers/soc/renesas/Makefile.
> > The resolution is to take both sides.  A sample merge resolution is
> > provided in the renesas-next-20161123v2-v4.9-rc1 tag of the renesas tree.
> > 
> 
> Pulled into next/drivers, thanks!

Thanks for pulling this and other outstanding pull requests from Geert and
myself. I don't think we have anything more outstanding at this time.
