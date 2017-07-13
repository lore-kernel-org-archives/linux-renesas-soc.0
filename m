Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mga09.intel.com ([134.134.136.24]:3530 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751037AbdGMIqi (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 13 Jul 2017 04:46:38 -0400
Date: Thu, 13 Jul 2017 16:46:00 +0800
From: Ye Xiaolong <xiaolong.ye@intel.com>
To: Simon Horman <horms@verge.net.au>
Cc: kbuild test robot <lkp@intel.com>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org,
        Chris Paterson <chris.paterson2@renesas.com>,
        linux-mmc@vger.kernel.org, Magnus Damm <magnus.damm@gmail.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Russell King <linux@armlinux.org.uk>,
        linux-renesas-soc@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>, kbuild-all@01.org,
        Biju Das <biju.das@bp.renesas.com>,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [kbuild-all] [PATCH 3/3] ARM: dts: iwg20m: Add MMCIF0 support
Message-ID: <20170713084600.GA1787@yexl-desktop>
References: <1499853805-5915-4-git-send-email-chris.paterson2@renesas.com>
 <201707130850.0py1QazG%fengguang.wu@intel.com>
 <20170713075414.GF5580@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170713075414.GF5580@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 07/13, Simon Horman wrote:
>On Thu, Jul 13, 2017 at 08:25:56AM +0800, kbuild test robot wrote:
>> Hi Chris,
>> 
>> [auto build test ERROR on renesas/next]
>> [also build test ERROR on next-20170712]
>> [cannot apply to v4.12]
>> [if your patch is applied to the wrong git tree, please drop us a note to help improve the system]
>> 
>> url:    https://github.com/0day-ci/linux/commits/Chris-Paterson/Add-MMCIF0-support-for-r8a7743-iwg20m/20170713-042814
>> base:   https://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas.git next
>> config: arm-at91_dt_defconfig (attached as .config)
>> compiler: arm-linux-gnueabi-gcc (Debian 6.1.1-9) 6.1.1 20160705
>> reproduce:
>>         wget https://raw.githubusercontent.com/01org/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>>         chmod +x ~/bin/make.cross
>>         # save the attached .config to linux build tree
>>         make.cross ARCH=arm 
>> 
>> All errors (new ones prefixed by >>):
>> 
>> >> Error: arch/arm/boot/dts/r8a7743-iwg20m.dtsi:40.1-5 Label or path pfc not found
>>    FATAL ERROR: Syntax error parsing input tree
>
>This seems to be a false positive. The node in question is present in
>the devel branch which is the base of these changes.

Thanks for the feedback, we'll update 0day's configuration accordingly.

Thanks,
Xiaolong
>
>
>_______________________________________________
>kbuild-all mailing list
>kbuild-all@lists.01.org
>https://lists.01.org/mailman/listinfo/kbuild-all
