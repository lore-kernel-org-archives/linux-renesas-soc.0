Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:59052 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726389AbeIFOLI (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 6 Sep 2018 10:11:08 -0400
Date: Thu, 6 Sep 2018 11:36:28 +0200
From: Simon Horman <horms@verge.net.au>
To: Phil Edworthy <phil.edworthy@renesas.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 3/3] ARM: dts: r9a06g032: Add pinctrl node
Message-ID: <20180906093628.e6v4pu3lpubf54e4@verge.net.au>
References: <1535634775-19365-4-git-send-email-phil.edworthy@renesas.com>
 <201808310827.o3GAs37i%fengguang.wu@intel.com>
 <TY1PR01MB1769AF7EB0152AF03B7B77C3F50F0@TY1PR01MB1769.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <TY1PR01MB1769AF7EB0152AF03B7B77C3F50F0@TY1PR01MB1769.jpnprd01.prod.outlook.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Fri, Aug 31, 2018 at 08:13:07AM +0000, Phil Edworthy wrote:
> 
> On 31 August 2018 01:51 kbuild test robot wrote:
> > Hi Phil,
> > 
> > Thank you for the patch! Yet something to improve:
> > 
> > [auto build test ERROR on pinctrl/devel] [also build test ERROR on v4.19-rc1
> > next-20180830] [if your patch is applied to the wrong git tree, please drop us
> > a note to help improve the system]
> > 
> > url:    https://github.com/0day-ci/linux/commits/Phil-Edworthy/Renesas-
> > R9A06G032-PINCTRL-Driver/20180831-050708
> > base:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-
> > pinctrl.git devel
> > config: arm-mvebu_v5_defconfig (attached as .config)
> > compiler: arm-linux-gnueabi-gcc (Debian 7.2.0-11) 7.2.0
> > reproduce:
> >         wget https://raw.githubusercontent.com/intel/lkp-
> > tests/master/sbin/make.cross -O ~/bin/make.cross
> >         chmod +x ~/bin/make.cross
> >         # save the attached .config to linux build tree
> >         GCC_VERSION=7.2.0 make.cross ARCH=arm
> > 
> > All errors (new ones prefixed by >>):
> > 
> > >> Error: arch/arm/boot/dts/r9a06g032.dtsi:93.23-24 syntax error
> >    FATAL ERROR: Unable to parse input tree
> 
> This error is because the patch depends on a patch from Geert:
> "ARM: dts: r9a06g032: Use r9a06g032-sysctrl binding definitions"
> https://patchwork.kernel.org/patch/10578707/

Thanks Phil,

got it. I would like to wait for the binding to be acked before
applying this patch.
