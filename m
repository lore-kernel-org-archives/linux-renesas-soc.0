Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:42605 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751537AbdEIJ2Q (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 9 May 2017 05:28:16 -0400
Date: Tue, 9 May 2017 11:28:01 +0200
From: Simon Horman <horms@verge.net.au>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Magnus Damm <magnus.damm@gmail.com>, linux-mmc@vger.kernel.org,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH/RFC 0/5] mmc: renesas-sdhi: refactor DMA support
Message-ID: <20170509092801.GA8417@verge.net.au>
References: <1493723743-22821-1-git-send-email-horms+renesas@verge.net.au>
 <CAK8P3a10fwLwA=DzMoCbxoCewA8YqcJSzW8Avqt-vX+kSx0apA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK8P3a10fwLwA=DzMoCbxoCewA8YqcJSzW8Avqt-vX+kSx0apA@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, May 02, 2017 at 02:03:06PM +0200, Arnd Bergmann wrote:
> On Tue, May 2, 2017 at 1:15 PM, Simon Horman <horms+renesas@verge.net.au> wrote:
> > Hi Wolfram, Hi Arnd, Hi all,
> >
> > the intention of this patch-set is to refactor the DMA support in
> > the Renesas SDHI driver in order to make it easier to add support
> > for using the SDHI hardware with different DMA implementations.
> >
> > This is based on earlier work, posted as "[PATCH/RFC v3 0/6] mmc:
> > renesas_sdhi: add R-Car Gen-3 DMA support". It attempts to implement
> > the reworking of the driver proposed by Arnd[1] in his review of that
> > patch-set.
> >
> > [1] http://www.spinics.net/lists/linux-mmc/msg38004.html
> >
> > Unlike that patch-set this patch-set does not add support for
> > R-Car Gen-3 DMA. Rather it focuses on refactoring the code.
> 
> Looks fine overall. Remind me why we are not using the dma-engine
> framework though. IIRC this is because at least one of the possible
> DMA implementations is tightly integrated with the TMIO register
> set and not easily split out into another driver, right?

In a nutshell, yes, that is my understanding.

The DMA implementation that is currently present in mainline uses the
SYS-DMAC device and the DMA Engine framework is used. However, we expect to
support devices that make use of built-in bus master engine for SDHI DMA.
In this case it does not seem to make much sense to break out DMA support
into a separate driver as it can only be used as part of SDHI which it is a
part of. This is as opposed to SYS-DMAC where the SYS-DMAC device may be
used by several different devices, f.e. SDHI and SCIF (serial).
