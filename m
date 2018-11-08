Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:45021 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726359AbeKHV5k (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 8 Nov 2018 16:57:40 -0500
Date: Thu, 8 Nov 2018 13:22:22 +0100
From: Simon Horman <horms@verge.net.au>
To: Marek Vasut <marek.vasut@gmail.com>
Cc: kbuild test robot <lkp@intel.com>,
        Takeshi Kihara <takeshi.kihara.df@renesas.com>,
        kbuild-all@01.org, linux-renesas-soc@vger.kernel.org,
        Marek Vasut <marek.vasut+renesas@gmail.com>
Subject: Re: [renesas:arm64-dt-for-v4.21 25/25] Error:
 arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts:622.1-7 Label or path sdhi0
 not found
Message-ID: <20181108122222.7tth22rfzuzurgdv@verge.net.au>
References: <201811072142.QcQZQbQ2%fengguang.wu@intel.com>
 <e330f0dc-3d8a-477f-7197-31ebd30e415f@gmail.com>
 <20181108103352.fgbrw2tlqiumnncj@verge.net.au>
 <25777603-b6bd-4691-0485-c785cd8feed6@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <25777603-b6bd-4691-0485-c785cd8feed6@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, Nov 08, 2018 at 11:54:32AM +0100, Marek Vasut wrote:
> On 11/08/2018 11:33 AM, Simon Horman wrote:
> > On Wed, Nov 07, 2018 at 03:04:51PM +0100, Marek Vasut wrote:
> >> On 11/07/2018 02:57 PM, kbuild test robot wrote:
> >>> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas.git arm64-dt-for-v4.21
> >>> head:   3e8f76c61511f3c4f0c25c36172605d6aeaec37c
> >>> commit: 3e8f76c61511f3c4f0c25c36172605d6aeaec37c [25/25] arm64: dts: r8a77990: ebisu: Add and enable SDHI device nodes
> >>> config: arm64-defconfig (attached as .config)
> >>> compiler: aarch64-linux-gnu-gcc (Debian 7.2.0-11) 7.2.0
> >>> reproduce:
> >>>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
> >>>         chmod +x ~/bin/make.cross
> >>>         git checkout 3e8f76c61511f3c4f0c25c36172605d6aeaec37c
> >>>         # save the attached .config to linux build tree
> >>>         GCC_VERSION=7.2.0 make.cross ARCH=arm64 
> >>>
> >>> All errors (new ones prefixed by >>):
> >>>
> >>>>> Error: arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts:622.1-7 Label or path sdhi0 not found
> >>>>> Error: arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts:637.1-7 Label or path sdhi1 not found
> >>>>> Error: arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts:651.1-7 Label or path sdhi3 not found
> >>>>> FATAL ERROR: Syntax error parsing input tree
> >>
> >> Commit 3e8f76c61511f3c4f0c25c36172605d6aeaec37c seems to be missing the
> >>  arch/arm64/boot/dts/renesas/r8a77990.dtsi     |  36 +++++
> >> part from
> >> [PATCH V3] arm64: dts: r8a77990: ebisu: Add and enable SDHI device nodes
> >> thus the error.
> > 
> > Sorry about that, will fix ASAP.
> 
> No problem, thanks!

Should be fixed in renesas-next-20181108-v4.20-rc1.
