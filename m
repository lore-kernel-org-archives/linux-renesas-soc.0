Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mga05.intel.com ([192.55.52.43]:5548 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751818AbdBMSrh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 13 Feb 2017 13:47:37 -0500
Date: Tue, 14 Feb 2017 02:46:45 +0800
From: kbuild test robot <fengguang.wu@intel.com>
To: Simon Horman <horms+renesas@verge.net.au>
Cc: kbuild-all@01.org, linux-renesas-soc@vger.kernel.org
Subject: [renesas:topic/ravb-gigabit 45/45] net/mpls/af_mpls.c:207:35:
 sparse: not enough arguments for function mpls_multipath_hash
Message-ID: <201702140238.mKWRS7dr%fengguang.wu@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas.git topic/ravb-gigabit
head:   434fe0e99b1f7855e0b43ec7b90dd4566d9114c3
commit: 434fe0e99b1f7855e0b43ec7b90dd4566d9114c3 [45/45] Merge branches 'topic/ravb-gigabit-integration' and 'topic/ravb-gigabit-driver-v2' into topic/ravb-gigabit
reproduce:
        # apt-get install sparse
        git checkout 434fe0e99b1f7855e0b43ec7b90dd4566d9114c3
        make ARCH=x86_64 allmodconfig
        make C=1 CF=-D__CHECK_ENDIAN__


sparse warnings: (new ones prefixed by >>)

   include/linux/compiler.h:253:8: sparse: attribute 'no_sanitize_address': unknown attribute
>> net/mpls/af_mpls.c:207:35: sparse: not enough arguments for function mpls_multipath_hash
   net/mpls/af_mpls.c: In function 'mpls_select_multipath':
   net/mpls/af_mpls.c:207:9: error: too few arguments to function 'mpls_multipath_hash'
     hash = mpls_multipath_hash(rt, skb);
            ^~~~~~~~~~~~~~~~~~~
   net/mpls/af_mpls.c:122:12: note: declared here
    static u32 mpls_multipath_hash(struct mpls_route *rt,
               ^~~~~~~~~~~~~~~~~~~

vim +207 net/mpls/af_mpls.c

9f427a0e David Ahern  2017-01-20  191  					     struct sk_buff *skb)
c89359a4 Roopa Prabhu 2015-12-01  192  {
c89359a4 Roopa Prabhu 2015-12-01  193  	int alive = ACCESS_ONCE(rt->rt_nhn_alive);
c89359a4 Roopa Prabhu 2015-12-01  194  	u32 hash = 0;
c89359a4 Roopa Prabhu 2015-12-01  195  	int nh_index = 0;
c89359a4 Roopa Prabhu 2015-12-01  196  	int n = 0;
c89359a4 Roopa Prabhu 2015-12-01  197  
c89359a4 Roopa Prabhu 2015-12-01  198  	/* No need to look further into packet if there's only
c89359a4 Roopa Prabhu 2015-12-01  199  	 * one path
c89359a4 Roopa Prabhu 2015-12-01  200  	 */
c89359a4 Roopa Prabhu 2015-12-01  201  	if (rt->rt_nhn == 1)
c89359a4 Roopa Prabhu 2015-12-01  202  		goto out;
c89359a4 Roopa Prabhu 2015-12-01  203  
c89359a4 Roopa Prabhu 2015-12-01  204  	if (alive <= 0)
c89359a4 Roopa Prabhu 2015-12-01  205  		return NULL;
c89359a4 Roopa Prabhu 2015-12-01  206  
9f427a0e David Ahern  2017-01-20 @207  	hash = mpls_multipath_hash(rt, skb);
c89359a4 Roopa Prabhu 2015-12-01  208  	nh_index = hash % alive;
c89359a4 Roopa Prabhu 2015-12-01  209  	if (alive == rt->rt_nhn)
c89359a4 Roopa Prabhu 2015-12-01  210  		goto out;
c89359a4 Roopa Prabhu 2015-12-01  211  	for_nexthops(rt) {
c89359a4 Roopa Prabhu 2015-12-01  212  		if (nh->nh_flags & (RTNH_F_DEAD | RTNH_F_LINKDOWN))
c89359a4 Roopa Prabhu 2015-12-01  213  			continue;
c89359a4 Roopa Prabhu 2015-12-01  214  		if (n == nh_index)
c89359a4 Roopa Prabhu 2015-12-01  215  			return nh;

:::::: The code at line 207 was first introduced by commit
:::::: 9f427a0e474a67b454420c131709600d44850486 net: mpls: Fix multipath selection for LSR use case

:::::: TO: David Ahern <dsa@cumulusnetworks.com>
:::::: CC: David S. Miller <davem@davemloft.net>

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation
