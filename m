Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mga06.intel.com ([134.134.136.31]:17355 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751719AbeCMRnk (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 13 Mar 2018 13:43:40 -0400
Date: Wed, 14 Mar 2018 01:42:53 +0800
From: kbuild test robot <fengguang.wu@intel.com>
To: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc: kbuild-all@01.org, linux-renesas-soc@vger.kernel.org
Subject: [renesas-drivers:master 4329/4669]
 drivers/media/platform/vsp1/vsp1_dl.c:378:3: sparse: symbol
 'vsp1_extended_commands' was not declared. Should it be static?
Message-ID: <201803140159.HHeMqOzI%fengguang.wu@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git master
head:   b67ea3b553661cb76397afbf73701c3ea14b19de
commit: 02dcefdd58c734623b9caf2513316380feb9f993 [4329/4669] media: vsp1: Provide support for extended command pools
reproduce:
        # apt-get install sparse
        git checkout 02dcefdd58c734623b9caf2513316380feb9f993
        make ARCH=x86_64 allmodconfig
        make C=1 CF=-D__CHECK_ENDIAN__


sparse warnings: (new ones prefixed by >>)

>> drivers/media/platform/vsp1/vsp1_dl.c:378:3: sparse: symbol 'vsp1_extended_commands' was not declared. Should it be static?
>> drivers/media/platform/vsp1/vsp1_dl.c:395:25: sparse: symbol 'vsp1_dl_cmd_pool_create' was not declared. Should it be static?
>> drivers/media/platform/vsp1/vsp1_dl.c:453:24: sparse: symbol 'vsp1_dl_ext_cmd_get' was not declared. Should it be static?
>> drivers/media/platform/vsp1/vsp1_dl.c:471:6: sparse: symbol 'vsp1_dl_ext_cmd_put' was not declared. Should it be static?
>> drivers/media/platform/vsp1/vsp1_dl.c:486:6: sparse: symbol 'vsp1_dl_ext_cmd_pool_destroy' was not declared. Should it be static?

Please review and possibly fold the followup patch.

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation
