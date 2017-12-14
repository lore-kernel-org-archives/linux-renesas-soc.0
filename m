Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mga09.intel.com ([134.134.136.24]:11760 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1754325AbdLNXoa (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 14 Dec 2017 18:44:30 -0500
Date: Fri, 15 Dec 2017 07:44:21 +0800
From: kbuild test robot <fengguang.wu@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: kbuild-all@01.org, linux-renesas-soc@vger.kernel.org
Subject: [renesas-drivers:topic/renesas-overlays 30/92]
 drivers/of/base.c:1571:1: sparse: symbol 'dead_aliases_lookup' was not
 declared. Should it be static?
Message-ID: <201712150710.pTXUwb8r%fengguang.wu@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git topic/renesas-overlays
head:   47d433a558bb60587eb9f86a4d010ef74e03fa0d
commit: 19e0da502da117244914b018be929c1ba0761d14 [30/92] [RFC] of: Add of_alias_destroy()
reproduce:
        # apt-get install sparse
        git checkout 19e0da502da117244914b018be929c1ba0761d14
        make ARCH=x86_64 allmodconfig
        make C=1 CF=-D__CHECK_ENDIAN__


sparse warnings: (new ones prefixed by >>)


Please review and possibly fold the followup patch.

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation
