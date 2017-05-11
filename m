Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:39432 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753820AbdEKOyy (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 11 May 2017 10:54:54 -0400
Date: Thu, 11 May 2017 16:54:51 +0200
From: Simon Horman <horms@verge.net.au>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Magnus Damm <magnus.damm@gmail.com>, linux-mmc@vger.kernel.org,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH v2 0/6] mmc: renesas-sdhi: refactor DMA support
Message-ID: <20170511145451.GE21895@verge.net.au>
References: <1494408330-28161-1-git-send-email-horms+renesas@verge.net.au>
 <CAK8P3a3b0cLAB_+52uXQU8NsSJ4PjAXo7JPAKKoYWiUqiP3Rjw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK8P3a3b0cLAB_+52uXQU8NsSJ4PjAXo7JPAKKoYWiUqiP3Rjw@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, May 10, 2017 at 12:07:02PM +0200, Arnd Bergmann wrote:
> On Wed, May 10, 2017 at 11:25 AM, Simon Horman
> <horms+renesas@verge.net.au> wrote:
> > Hi Wolfram, Hi Ulf, Hi Arnd, Hi all,
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
> (whole series)
> 
> Acked-by: Arnd Bergmann <arnd@arndb.de>

Wolfram, Ulf, could this series be considered for v4.13?
