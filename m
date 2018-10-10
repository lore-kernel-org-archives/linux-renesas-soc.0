Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mga01.intel.com ([192.55.52.88]:19440 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726479AbeJJX0U (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 10 Oct 2018 19:26:20 -0400
Date: Thu, 11 Oct 2018 00:02:52 +0800
From: kbuild test robot <lkp@intel.com>
To: Phil Edworthy <phil.edworthy@renesas.com>
Cc: kbuild-all@01.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>
Subject: [renesas-drivers:sh-pfc-for-v4.20 24/25]
 drivers/pinctrl/pinctrl-rzn1.c:935:3-8: No need to set .owner here. The core
 will do it.
Message-ID: <201810110049.r0RJkFTF%fengguang.wu@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git sh-pfc-for-v4.20
head:   ef26d96023a4c34b1bcc4294f570df2b63a1b952
commit: 4e53b5004745ef26a37bca4933b2d3ea71313f2a [24/25] pinctrl: renesas: Renesas RZ/N1 pinctrl driver


coccinelle warnings: (new ones prefixed by >>)

>> drivers/pinctrl/pinctrl-rzn1.c:935:3-8: No need to set .owner here. The core will do it.

Please review and possibly fold the followup patch.

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation
