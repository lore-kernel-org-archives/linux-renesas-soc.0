Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:33903 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751016AbdFOOUq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 15 Jun 2017 10:20:46 -0400
Date: Thu, 15 Jun 2017 16:20:41 +0200
From: Simon Horman <horms@verge.net.au>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
        "kbuild-all@01.org" <kbuild-all@01.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        kbuild test robot <fengguang.wu@intel.com>
Subject: Re: [renesas:drivers-for-v4.13 3/3]
 drivers/soc/renesas/rcar-sysc.c:209:19: error: 'GENPD_FLAG_ALWAYS_ON'
 undeclared
Message-ID: <20170615142040.GC22158@verge.net.au>
References: <201706141946.RByoFGXO%fengguang.wu@intel.com>
 <CAMuHMdUkhpGGJPNLKmWn1znNcLFL7e7nqp6QK59qCd0Y8i22-w@mail.gmail.com>
 <20170615134541.GA22158@verge.net.au>
 <CAMuHMdUmkU-e2wWAYgKZ48u8HYE1VO7jSP0NRAqJafAzdZbwPA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdUmkU-e2wWAYgKZ48u8HYE1VO7jSP0NRAqJafAzdZbwPA@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, Jun 15, 2017 at 04:08:56PM +0200, Geert Uytterhoeven wrote:
> Hi Simon,
> 
> On Thu, Jun 15, 2017 at 3:45 PM, Simon Horman <horms@verge.net.au> wrote:
> > On Wed, Jun 14, 2017 at 01:31:41PM +0200, Geert Uytterhoeven wrote:
> >> On Wed, Jun 14, 2017 at 1:04 PM, kbuild test robot
> >> <fengguang.wu@intel.com> wrote:
> >> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas.git drivers-for-v4.13
> >> > head:   895c7e91d84c0f0e207ad909482ed70b5f3c806f
> >> > commit: 895c7e91d84c0f0e207ad909482ed70b5f3c806f [3/3] soc: renesas: rcar-sysc: Use GENPD_FLAG_ALWAYS_ON
> >> > config: ia64-allmodconfig (attached as .config)
> >> > compiler: ia64-linux-gcc (GCC) 6.2.0
> >> > reproduce:
> >> >         wget https://raw.githubusercontent.com/01org/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
> >> >         chmod +x ~/bin/make.cross
> >> >         git checkout 895c7e91d84c0f0e207ad909482ed70b5f3c806f
> >> >         # save the attached .config to linux build tree
> >> >         make.cross ARCH=ia64
> >> >
> >> > All errors (new ones prefixed by >>):
> >> >
> >> >    drivers/soc/renesas/rcar-sysc.c: In function 'rcar_sysc_pd_setup':
> >> >>> drivers/soc/renesas/rcar-sysc.c:209:19: error: 'GENPD_FLAG_ALWAYS_ON' undeclared (first use in this function)
> >> >       genpd->flags |= GENPD_FLAG_ALWAYS_ON;
> >>
> >> Looks like your drivers-for-v4.13 is based on v4.11-rc1
> >> (renesas-fixes-for-v4.12) instead of v4.12-rc1.
> >> Can you please rebase it?
> >
> > It is based on renesas-fixes-for-v4.12 because I was under the impression
> > that the patch there is a dependency for (other) patches in renesas drivers.
> > Is that the case? If so I think the correct (new) base would be v4.12-rc2.
> 
> "soc: renesas: rcar-sysc: Use GENPD_FLAG_ALWAYS_ON" in drivers-for-v4.13
> depends on commit ffaa42e8a40b7f10 ("PM / Domains: Enable users of genpd
> to specify always on PM domains") in v4.12-rc1.
> 
> It does not depend on anything else that's only in fixes-for-v4.12.

Ok, that is clear. But for some reason I thought that

"soc: renesas: Rework Kconfig and Makefile logic" depends on
"soc: renesas: Provide dummy rcar_rst_read_mode_pins() for compile-testing"
