Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mga09.intel.com ([134.134.136.24]:2332 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1757219AbdLRBjh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 17 Dec 2017 20:39:37 -0500
Date: Mon, 18 Dec 2017 09:39:01 +0800
From: kbuild test robot <fengguang.wu@intel.com>
To: Pantelis Antoniou <pantelis.antoniou@konsulko.com>
Cc: kbuild-all@01.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [renesas-drivers:topic/renesas-overlays 23/108]
 drivers/of/dynamic.c:1076 of_changeset_add_property_stringf() error:
 potential null dereference 'str'.  (kvasprintf returns null)
Message-ID: <201712180957.uj3FyVBf%fengguang.wu@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git topic/renesas-overlays
head:   c991b7bbdc862ab5c1a7edf88d04105fa081e2fc
commit: e068b1eab7180587d15bbc55abdc5851b7f216dc [23/108] of: changesets: Introduce changeset helper methods

smatch warnings:
show-warning-context "warning-lines" files

vim +/str +1076 drivers/of/dynamic.c

  1050	
  1051	/**
  1052	 * of_changeset_add_property_stringf - Create a new formatted string property
  1053	 *
  1054	 * @ocs:	changeset pointer
  1055	 * @np:		device node pointer
  1056	 * @name:	name of the property
  1057	 * @fmt:	format of string property
  1058	 * ...		arguments of the format string
  1059	 *
  1060	 * Adds a string property to the changeset by making copies of the name
  1061	 * and the formatted value.
  1062	 *
  1063	 * Returns zero on success, a negative error value otherwise.
  1064	 */
  1065	int of_changeset_add_property_stringf(struct of_changeset *ocs,
  1066			struct device_node *np, const char *name, const char *fmt, ...)
  1067	{
  1068		va_list vargs;
  1069		char *str;
  1070		int ret;
  1071	
  1072		va_start(vargs, fmt);
  1073		str = kvasprintf(GFP_KERNEL, fmt, vargs);
  1074		va_end(vargs);
  1075	
> 1076		ret = of_changeset_add_property_string(ocs, np, name, str);
  1077	
  1078		kfree(str);
  1079		return ret;
  1080	}
  1081	

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation
