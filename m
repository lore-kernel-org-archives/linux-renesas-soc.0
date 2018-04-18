Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mga11.intel.com ([192.55.52.93]:59271 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752630AbeDRM0w (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 18 Apr 2018 08:26:52 -0400
Date: Wed, 18 Apr 2018 20:26:08 +0800
From: kbuild test robot <lkp@intel.com>
To: Masaharu Hayakawa <masaharu.hayakawa.ry@renesas.com>
Cc: kbuild-all@01.org, linux-renesas-soc@vger.kernel.org,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [renesas:topic/hs400-mmc-v4 3/4]
 drivers/mmc/host/tmio_mmc_core.c:1103:5: sparse: symbol
 'tmio_mmc_prepare_hs400_tuning' was not declared. Should it be static?
Message-ID: <201804182048.TydzQbRW%fengguang.wu@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas.git topic/hs400-mmc-v4
head:   bad50f922dfffd9bc1a54e1512852e45d25b4ac7
commit: 485c8281e412190ab902c62868cfebf7dc783189 [3/4] mmc: tmio: add eMMC HS400 mode support
reproduce:
        # apt-get install sparse
        git checkout 485c8281e412190ab902c62868cfebf7dc783189
        make ARCH=x86_64 allmodconfig
        make C=1 CF=-D__CHECK_ENDIAN__


sparse warnings: (new ones prefixed by >>)

>> drivers/mmc/host/tmio_mmc_core.c:1103:5: sparse: symbol 'tmio_mmc_prepare_hs400_tuning' was not declared. Should it be static?
>> drivers/mmc/host/tmio_mmc_core.c:1113:6: sparse: symbol 'tmio_mmc_prepare_hs400_tuning_downgrade' was not declared. Should it be static?
>> drivers/mmc/host/tmio_mmc_core.c:1122:6: sparse: symbol 'tmio_mmc_complete_hs400_tuning' was not declared. Should it be static?

Please review and possibly fold the followup patch.

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation
