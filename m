Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:46175 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751872AbdF3Lsf (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 30 Jun 2017 07:48:35 -0400
Date: Fri, 30 Jun 2017 13:48:29 +0200
From: Simon Horman <horms@verge.net.au>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: kbuild test robot <fengguang.wu@intel.com>,
        "kbuild-all@01.org" <kbuild-all@01.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Ai Kyuse <ai.kyuse.uw@renesas.com>
Subject: Re: [renesas-drivers:topic/sdhi-gen3-dma-2017-v2-rebased1 3/4]
 drivers/mmc//host/renesas_sdhi_internal_dmac.c:96:2: error: implicit
 declaration of function 'writeq'
Message-ID: <20170630114826.GI26710@verge.net.au>
References: <201706281100.6rIDiZIL%fengguang.wu@intel.com>
 <20170628190434.GB17318@verge.net.au>
 <CAMuHMdU0Wuat9762ayksF7RdQUeeO4Qg0kqik52itgNx-_crwg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdU0Wuat9762ayksF7RdQUeeO4Qg0kqik52itgNx-_crwg@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, Jun 28, 2017 at 09:08:39PM +0200, Geert Uytterhoeven wrote:
> Hi Simon,
> 
> On Wed, Jun 28, 2017 at 9:04 PM, Simon Horman <horms@verge.net.au> wrote:
> > On Wed, Jun 28, 2017 at 11:37:02AM +0800, kbuild test robot wrote:
> >> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git topic/sdhi-gen3-dma-2017-v2-rebased1
> >> head:   bcf4bf9f75e02e84971693bce04e5c3775b0f97e
> >> commit: 6e76773921ebc2c58d7878a8cb3cb26e57f5ed06 [3/4] mmc: renesas-sdhi: add support for R-Car Gen3 SDHI DMAC
> >> config: arm-allmodconfig (attached as .config)
> >> compiler: arm-linux-gnueabi-gcc (Debian 6.1.1-9) 6.1.1 20160705
> >> reproduce:
> >>         wget https://raw.githubusercontent.com/01org/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
> >>         chmod +x ~/bin/make.cross
> >>         git checkout 6e76773921ebc2c58d7878a8cb3cb26e57f5ed06
> >>         # save the attached .config to linux build tree
> >>         make.cross ARCH=arm
> >>
> >> All errors (new ones prefixed by >>):
> >
> > This should be resolved in topic/sdhi-gen3-dma-2017-v3
> 
> IC. I guess I should use that branch (or a newer one) for next renesas-drivers?

Yes, I guess so. v3 should be the latest. Let me know if you'd like me to
rebase it.
