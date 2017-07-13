Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:48913 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750846AbdGMHyT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 13 Jul 2017 03:54:19 -0400
Date: Thu, 13 Jul 2017 09:54:14 +0200
From: Simon Horman <horms@verge.net.au>
To: kbuild test robot <lkp@intel.com>
Cc: Chris Paterson <chris.paterson2@renesas.com>, kbuild-all@01.org,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Biju Das <biju.das@bp.renesas.com>, linux-mmc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 3/3] ARM: dts: iwg20m: Add MMCIF0 support
Message-ID: <20170713075414.GF5580@verge.net.au>
References: <1499853805-5915-4-git-send-email-chris.paterson2@renesas.com>
 <201707130850.0py1QazG%fengguang.wu@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <201707130850.0py1QazG%fengguang.wu@intel.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, Jul 13, 2017 at 08:25:56AM +0800, kbuild test robot wrote:
> Hi Chris,
> 
> [auto build test ERROR on renesas/next]
> [also build test ERROR on next-20170712]
> [cannot apply to v4.12]
> [if your patch is applied to the wrong git tree, please drop us a note to help improve the system]
> 
> url:    https://github.com/0day-ci/linux/commits/Chris-Paterson/Add-MMCIF0-support-for-r8a7743-iwg20m/20170713-042814
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas.git next
> config: arm-at91_dt_defconfig (attached as .config)
> compiler: arm-linux-gnueabi-gcc (Debian 6.1.1-9) 6.1.1 20160705
> reproduce:
>         wget https://raw.githubusercontent.com/01org/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # save the attached .config to linux build tree
>         make.cross ARCH=arm 
> 
> All errors (new ones prefixed by >>):
> 
> >> Error: arch/arm/boot/dts/r8a7743-iwg20m.dtsi:40.1-5 Label or path pfc not found
>    FATAL ERROR: Syntax error parsing input tree

This seems to be a false positive. The node in question is present in
the devel branch which is the base of these changes.
