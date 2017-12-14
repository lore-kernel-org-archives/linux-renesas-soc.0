Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mga09.intel.com ([134.134.136.24]:4035 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752154AbdLNViH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 14 Dec 2017 16:38:07 -0500
Date: Fri, 15 Dec 2017 05:37:39 +0800
From: kbuild test robot <fengguang.wu@intel.com>
To: Pantelis Antoniou <pantelis.antoniou@konsulko.com>
Cc: kbuild-all@01.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [renesas-drivers:topic/renesas-overlays 23/92]
 drivers/of/dynamic.c:1141:13: sparse: incorrect type in assignment
 (different base types)
Message-ID: <201712150538.Sbcjg0Am%fengguang.wu@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git topic/renesas-overlays
head:   47d433a558bb60587eb9f86a4d010ef74e03fa0d
commit: e068b1eab7180587d15bbc55abdc5851b7f216dc [23/92] of: changesets: Introduce changeset helper methods
reproduce:
        # apt-get install sparse
        git checkout e068b1eab7180587d15bbc55abdc5851b7f216dc
        make ARCH=x86_64 allmodconfig
        make C=1 CF=-D__CHECK_ENDIAN__


sparse warnings: (new ones prefixed by >>)


vim +1141 drivers/of/dynamic.c

  1124	
  1125	/**
  1126	 * of_changeset_add_property_u32 - Create a new u32 property
  1127	 *
  1128	 * @ocs:	changeset pointer
  1129	 * @np:		device node pointer
  1130	 * @name:	name of the property
  1131	 * @val:	value in host endian format
  1132	 *
  1133	 * Adds a u32 property to the changeset.
  1134	 *
  1135	 * Returns zero on success, a negative error value otherwise.
  1136	 */
  1137	int of_changeset_add_property_u32(struct of_changeset *ocs,
  1138			struct device_node *np, const char *name, u32 val)
  1139	{
  1140		/* in place */
> 1141		val = cpu_to_be32(val);
  1142		return of_changeset_add_property_copy(ocs, np, name, &val, sizeof(val));
  1143	}
  1144	

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation
