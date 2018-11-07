Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wm1-f67.google.com ([209.85.128.67]:39056 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726635AbeKGXf1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 7 Nov 2018 18:35:27 -0500
Received: by mail-wm1-f67.google.com with SMTP id u13-v6so15912198wmc.4
        for <linux-renesas-soc@vger.kernel.org>; Wed, 07 Nov 2018 06:04:54 -0800 (PST)
Subject: Re: [renesas:arm64-dt-for-v4.21 25/25] Error:
 arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts:622.1-7 Label or path sdhi0
 not found
To: kbuild test robot <lkp@intel.com>,
        Takeshi Kihara <takeshi.kihara.df@renesas.com>
Cc: kbuild-all@01.org, linux-renesas-soc@vger.kernel.org,
        Simon Horman <horms+renesas@verge.net.au>,
        Marek Vasut <marek.vasut+renesas@gmail.com>
References: <201811072142.QcQZQbQ2%fengguang.wu@intel.com>
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <e330f0dc-3d8a-477f-7197-31ebd30e415f@gmail.com>
Date: Wed, 7 Nov 2018 15:04:51 +0100
MIME-Version: 1.0
In-Reply-To: <201811072142.QcQZQbQ2%fengguang.wu@intel.com>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 11/07/2018 02:57 PM, kbuild test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas.git arm64-dt-for-v4.21
> head:   3e8f76c61511f3c4f0c25c36172605d6aeaec37c
> commit: 3e8f76c61511f3c4f0c25c36172605d6aeaec37c [25/25] arm64: dts: r8a77990: ebisu: Add and enable SDHI device nodes
> config: arm64-defconfig (attached as .config)
> compiler: aarch64-linux-gnu-gcc (Debian 7.2.0-11) 7.2.0
> reproduce:
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         git checkout 3e8f76c61511f3c4f0c25c36172605d6aeaec37c
>         # save the attached .config to linux build tree
>         GCC_VERSION=7.2.0 make.cross ARCH=arm64 
> 
> All errors (new ones prefixed by >>):
> 
>>> Error: arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts:622.1-7 Label or path sdhi0 not found
>>> Error: arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts:637.1-7 Label or path sdhi1 not found
>>> Error: arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts:651.1-7 Label or path sdhi3 not found
>>> FATAL ERROR: Syntax error parsing input tree

Commit 3e8f76c61511f3c4f0c25c36172605d6aeaec37c seems to be missing the
 arch/arm64/boot/dts/renesas/r8a77990.dtsi     |  36 +++++
part from
[PATCH V3] arm64: dts: r8a77990: ebisu: Add and enable SDHI device nodes
thus the error.
-- 
Best regards,
Marek Vasut
