Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:60582 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753084AbeDXJEK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 24 Apr 2018 05:04:10 -0400
Date: Tue, 24 Apr 2018 11:04:06 +0200
From: Simon Horman <horms@verge.net.au>
To: kbuild test robot <lkp@intel.com>
Cc: Masaharu Hayakawa <masaharu.hayakawa.ry@renesas.com>,
        kbuild-all@01.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [renesas:topic/hs400-mmc-v4 3/4]
 drivers/mmc/host/tmio_mmc_core.c:1103:5: sparse: symbol
 'tmio_mmc_prepare_hs400_tuning' was not declared. Should it be static?
Message-ID: <20180424090406.o2qezaxei5kekqia@verge.net.au>
References: <201804182048.TydzQbRW%fengguang.wu@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <201804182048.TydzQbRW%fengguang.wu@intel.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, Apr 18, 2018 at 08:26:08PM +0800, kbuild test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas.git topic/hs400-mmc-v4
> head:   bad50f922dfffd9bc1a54e1512852e45d25b4ac7
> commit: 485c8281e412190ab902c62868cfebf7dc783189 [3/4] mmc: tmio: add eMMC HS400 mode support
> reproduce:
>         # apt-get install sparse
>         git checkout 485c8281e412190ab902c62868cfebf7dc783189
>         make ARCH=x86_64 allmodconfig
>         make C=1 CF=-D__CHECK_ENDIAN__
> 
> 
> sparse warnings: (new ones prefixed by >>)
> 
> >> drivers/mmc/host/tmio_mmc_core.c:1103:5: sparse: symbol 'tmio_mmc_prepare_hs400_tuning' was not declared. Should it be static?
> >> drivers/mmc/host/tmio_mmc_core.c:1113:6: sparse: symbol 'tmio_mmc_prepare_hs400_tuning_downgrade' was not declared. Should it be static?
> >> drivers/mmc/host/tmio_mmc_core.c:1122:6: sparse: symbol 'tmio_mmc_complete_hs400_tuning' was not declared. Should it be static?
> 
> Please review and possibly fold the followup patch.

Thanks. Yes, I agree that it looks like they should be static.
I'll address this when posting v5 of this patchset.
