Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mga05.intel.com ([192.55.52.43]:55725 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751952AbdLNTlH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 14 Dec 2017 14:41:07 -0500
Date: Fri, 15 Dec 2017 03:40:03 +0800
From: kbuild test robot <fengguang.wu@intel.com>
To: Pantelis Antoniou <pantelis.antoniou@konsulko.com>
Cc: kbuild-all@01.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [renesas-drivers:topic/renesas-overlays 10/92]
 drivers/of/overlay.c:657:6: sparse: symbol 'overlay_changeset_release' was
 not declared. Should it be static?
Message-ID: <201712150350.kjmEdqgF%fengguang.wu@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git topic/renesas-overlays
head:   47d433a558bb60587eb9f86a4d010ef74e03fa0d
commit: 11de0d24be4742a41feceb95d9145b08843dc70a [10/92] of: overlay: kobjectify overlay objects
reproduce:
        # apt-get install sparse
        git checkout 11de0d24be4742a41feceb95d9145b08843dc70a
        make ARCH=x86_64 allmodconfig
        make C=1 CF=-D__CHECK_ENDIAN__


sparse warnings: (new ones prefixed by >>)


Please review and possibly fold the followup patch.

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation
