Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:50510 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754061AbcKUPlp (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 21 Nov 2016 10:41:45 -0500
Date: Mon, 21 Nov 2016 16:41:38 +0100
From: Simon Horman <horms@verge.net.au>
To: kbuild test robot <fengguang.wu@intel.com>
Cc: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        kbuild-all@01.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [renesas:next-for-geert 92/122]
 arch/arm/boot/dts/r8a7745.dtsi:14:44: fatal error:
 dt-bindings/power/r8a7745-sysc.h: No such file or directory
Message-ID: <20161121154138.GA5083@verge.net.au>
References: <201611212218.JebxHT4N%fengguang.wu@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <201611212218.JebxHT4N%fengguang.wu@intel.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Please ignore this, it only existed in an experimental and now deleted
branch.

On Mon, Nov 21, 2016 at 10:25:24PM +0800, kbuild test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas.git next-for-geert
> head:   f34ef8c6e7bc713a4a0110f84b4dff4855f6be25
> commit: f8bc53dae2f6ceb9668f8e9db0b856146d4bdf38 [92/122] ARM: dts: sk-rzg1e: initial device tree
> config: arm-mv78xx0_defconfig (attached as .config)
> compiler: arm-linux-gnueabi-gcc (Debian 6.1.1-9) 6.1.1 20160705
> reproduce:
>         wget https://git.kernel.org/cgit/linux/kernel/git/wfg/lkp-tests.git/plain/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         git checkout f8bc53dae2f6ceb9668f8e9db0b856146d4bdf38
>         # save the attached .config to linux build tree
>         make.cross ARCH=arm 
> 
> Note: the renesas/next-for-geert HEAD f34ef8c6e7bc713a4a0110f84b4dff4855f6be25 builds fine.
>       It only hurts bisectibility.
> 
> All errors (new ones prefixed by >>):
> 
>    In file included from arch/arm/boot/dts/r8a7745-sk-rzg1e.dts:12:0:
> >> arch/arm/boot/dts/r8a7745.dtsi:14:44: fatal error: dt-bindings/power/r8a7745-sysc.h: No such file or directory
>     #include <dt-bindings/power/r8a7745-sysc.h>
>                                                ^
>    compilation terminated.
> 
> vim +14 arch/arm/boot/dts/r8a7745.dtsi
> 
> 89addbdbc Sergei Shtylyov 2016-11-05   1  /*
> 89addbdbc Sergei Shtylyov 2016-11-05   2   * Device Tree Source for the r8a7745 SoC
> 89addbdbc Sergei Shtylyov 2016-11-05   3   *
> 89addbdbc Sergei Shtylyov 2016-11-05   4   * Copyright (C) 2016 Cogent Embedded Inc.
> 89addbdbc Sergei Shtylyov 2016-11-05   5   *
> 89addbdbc Sergei Shtylyov 2016-11-05   6   * This file is licensed under the terms of the GNU General Public License
> 89addbdbc Sergei Shtylyov 2016-11-05   7   * version 2. This program is licensed "as is" without any warranty of any
> 89addbdbc Sergei Shtylyov 2016-11-05   8   * kind, whether express or implied.
> 89addbdbc Sergei Shtylyov 2016-11-05   9   */
> 89addbdbc Sergei Shtylyov 2016-11-05  10  
> 89addbdbc Sergei Shtylyov 2016-11-05  11  #include <dt-bindings/interrupt-controller/irq.h>
> 89addbdbc Sergei Shtylyov 2016-11-05  12  #include <dt-bindings/interrupt-controller/arm-gic.h>
> 89addbdbc Sergei Shtylyov 2016-11-05  13  #include <dt-bindings/clock/r8a7745-cpg-mssr.h>
> 89addbdbc Sergei Shtylyov 2016-11-05 @14  #include <dt-bindings/power/r8a7745-sysc.h>
> 89addbdbc Sergei Shtylyov 2016-11-05  15  
> 89addbdbc Sergei Shtylyov 2016-11-05  16  / {
> 89addbdbc Sergei Shtylyov 2016-11-05  17  	compatible = "renesas,r8a7745";
> 89addbdbc Sergei Shtylyov 2016-11-05  18  	#address-cells = <2>;
> 89addbdbc Sergei Shtylyov 2016-11-05  19  	#size-cells = <2>;
> 89addbdbc Sergei Shtylyov 2016-11-05  20  
> 89addbdbc Sergei Shtylyov 2016-11-05  21  	cpus {
> 89addbdbc Sergei Shtylyov 2016-11-05  22  		#address-cells = <1>;
> 
> :::::: The code at line 14 was first introduced by commit
> :::::: 89addbdbc93dc718293187bf1099460ce5bab07e ARM: dts: r8a7745: initial SoC device tree
> 
> :::::: TO: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> :::::: CC: Simon Horman <horms+renesas@verge.net.au>
> 
> ---
> 0-DAY kernel test infrastructure                Open Source Technology Center
> https://lists.01.org/pipermail/kbuild-all                   Intel Corporation
