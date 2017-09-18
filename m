Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:51716 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752332AbdIRJJs (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 18 Sep 2017 05:09:48 -0400
Date: Mon, 18 Sep 2017 11:09:20 +0200
From: Simon Horman <horms@verge.net.au>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: kbuild test robot <fengguang.wu@intel.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        "kbuild-all@01.org" <kbuild-all@01.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [renesas:arm64-dt-for-v4.15 47/48] Error:
 arch/arm64/boot/dts/renesas/r8a77995.dtsi:153.27-28 syntax error
Message-ID: <20170918090919.GG4644@verge.net.au>
References: <201709152238.zUqYhmzi%fengguang.wu@intel.com>
 <CAMuHMdVCShib1g+QU3yNKnR+30_ySYimmHJeOb=7F=pD-rdZqQ@mail.gmail.com>
 <20170918084207.GE4644@verge.net.au>
 <CAMuHMdXYS_3SL8FnsgeERNNomfQgDDMw0UyssCmnHNae2NP6MQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdXYS_3SL8FnsgeERNNomfQgDDMw0UyssCmnHNae2NP6MQ@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Mon, Sep 18, 2017 at 10:44:35AM +0200, Geert Uytterhoeven wrote:
> Hi Simon,
> 
> On Mon, Sep 18, 2017 at 10:42 AM, Simon Horman <horms@verge.net.au> wrote:
> > On Fri, Sep 15, 2017 at 07:35:56PM +0200, Geert Uytterhoeven wrote:
> >> On Fri, Sep 15, 2017 at 4:10 PM, kbuild test robot
> >> <fengguang.wu@intel.com> wrote:
> >> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas.git arm64-dt-for-v4.15
> >> > head:   815e3b5923c6a8c6614d0d4d3bcba532402b1de4
> >> > commit: ddd7da4b39f805a8050ee662cc72a2c7f53160f5 [47/48] arm64: dts: renesas: r8a77995: add GPIO device nodes
> >> > config: arm64-allmodconfig (attached as .config)
> >> > compiler: aarch64-linux-gnu-gcc (Debian 6.1.1-9) 6.1.1 20160705
> >> > reproduce:
> >> >         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
> >> >         chmod +x ~/bin/make.cross
> >> >         git checkout ddd7da4b39f805a8050ee662cc72a2c7f53160f5
> >> >         # save the attached .config to linux build tree
> >> >         make.cross ARCH=arm64
> >> >
> >> > All errors (new ones prefixed by >>):
> >> >
> >> >>> Error: arch/arm64/boot/dts/renesas/r8a77995.dtsi:153.27-28 syntax error
> >>
> >> The definition of R8A77995_PD_ALWAYS_ON doesn't exist yet in that branch.
> >> It will have to be rebased on top of v4.14-rc1 on Monday.
> >
> > During the rebasing I noticed that the following is needed.
> > Commit ids are in my local next branch which I plan to push later today.
> >
> > From: Simon Horman <horms+renesas@verge.net.au>
> > Subject: [PATCH] arm64: dts: renesas: r8a77995: include r8a77995-sysc.h
> >
> > r8a77995-sysc.h is needed by R8A77970_PD_ALWAYS_ON which
> > is used in the following commits. I plan to squash this patch
> > into the first of those commits.
> >
> > Fixes: a858b7bbae45 ("arm64: dts: renesas: r8a77995: add GPIO device nodes")
> > Fixes: 9aed640c65bc ("arm64: dts: renesas: r8a77995: Add EthernetAVB device node")
> > Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> > Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
> 
> Like https://patchwork.kernel.org/patch/9854907/ ?
> That one should be applied first.

Thanks, I had forgotten about that.
I will apply it.
