Return-Path: <SRS0=mg4H=QH=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99192C169C4
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 31 Jan 2019 06:11:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7E03A20881
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 31 Jan 2019 06:11:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725961AbfAaGLf (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 31 Jan 2019 01:11:35 -0500
Received: from mail2-relais-roc.national.inria.fr ([192.134.164.83]:40813 "EHLO
        mail2-relais-roc.national.inria.fr" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725861AbfAaGLf (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 31 Jan 2019 01:11:35 -0500
X-IronPort-AV: E=Sophos;i="5.56,543,1539640800"; 
   d="scan'208";a="366531069"
Received: from abo-58-107-68.mrs.modulonet.fr (HELO hadrien) ([85.68.107.58])
  by mail2-relais-roc.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 31 Jan 2019 07:11:33 +0100
Date:   Thu, 31 Jan 2019 07:11:33 +0100 (CET)
From:   Julia Lawall <julia.lawall@lip6.fr>
X-X-Sender: jll@hadrien
To:     Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-renesas-soc@vger.kernel.org, kbuild-all@01.org
Subject: [renesas-drivers:clk-renesas-for-v5.1 6/7] drivers/clk/renesas/rcar-gen3-cpg.c:472:42-45:
 ERROR: reference preceded by free on line 470 (fwd)
Message-ID: <alpine.DEB.2.21.1901310710350.2693@hadrien>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello,

I guess that a return is missing after line 470.

julia

---------- Forwarded message ----------
Date: Thu, 31 Jan 2019 10:08:10 +0800
From: kbuild test robot <lkp@intel.com>
To: kbuild@01.org
Cc: Julia Lawall <julia.lawall@lip6.fr>
Subject: [renesas-drivers:clk-renesas-for-v5.1 6/7]
    drivers/clk/renesas/rcar-gen3-cpg.c:472:42-45: ERROR: reference preceded by
    free on line 470

CC: kbuild-all@01.org
CC: linux-renesas-soc@vger.kernel.org
TO: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
CC: Geert Uytterhoeven <geert+renesas@glider.be>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git clk-renesas-for-v5.1
head:   5f8c668738ae4bcfe0656e74127610aabd5d5141
commit: ac41e5750e7508c170b6a1d9d623c4caa4c0fbf6 [6/7] clk: renesas: rcar-gen3: Add RPC clocks
:::::: branch date: 6 days ago
:::::: commit date: 6 days ago

>> drivers/clk/renesas/rcar-gen3-cpg.c:472:42-45: ERROR: reference preceded by free on line 470

# https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git/commit/?id=ac41e5750e7508c170b6a1d9d623c4caa4c0fbf6
git remote add renesas-drivers https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git
git remote update renesas-drivers
git checkout ac41e5750e7508c170b6a1d9d623c4caa4c0fbf6
vim +472 drivers/clk/renesas/rcar-gen3-cpg.c

ac41e575 Sergei Shtylyov 2019-01-22  442
ac41e575 Sergei Shtylyov 2019-01-22  443  static struct clk * __init cpg_rpc_clk_register(const char *name,
ac41e575 Sergei Shtylyov 2019-01-22  444  	void __iomem *base, const char *parent_name,
ac41e575 Sergei Shtylyov 2019-01-22  445  	struct raw_notifier_head *notifiers)
ac41e575 Sergei Shtylyov 2019-01-22  446  {
ac41e575 Sergei Shtylyov 2019-01-22  447  	struct rpc_clock *rpc;
ac41e575 Sergei Shtylyov 2019-01-22  448  	struct clk *clk;
ac41e575 Sergei Shtylyov 2019-01-22  449
ac41e575 Sergei Shtylyov 2019-01-22  450  	rpc = kzalloc(sizeof(*rpc), GFP_KERNEL);
ac41e575 Sergei Shtylyov 2019-01-22  451  	if (!rpc)
ac41e575 Sergei Shtylyov 2019-01-22  452  		return ERR_PTR(-ENOMEM);
ac41e575 Sergei Shtylyov 2019-01-22  453
ac41e575 Sergei Shtylyov 2019-01-22  454  	rpc->div.reg = base + CPG_RPCCKCR;
ac41e575 Sergei Shtylyov 2019-01-22  455  	rpc->div.width = 3;
ac41e575 Sergei Shtylyov 2019-01-22  456  	rpc->div.table = cpg_rpc_div_table;
ac41e575 Sergei Shtylyov 2019-01-22  457  	rpc->div.lock = &cpg_lock;
ac41e575 Sergei Shtylyov 2019-01-22  458
ac41e575 Sergei Shtylyov 2019-01-22  459  	rpc->gate.reg = base + CPG_RPCCKCR;
ac41e575 Sergei Shtylyov 2019-01-22  460  	rpc->gate.bit_idx = 8;
ac41e575 Sergei Shtylyov 2019-01-22  461  	rpc->gate.flags = CLK_GATE_SET_TO_DISABLE;
ac41e575 Sergei Shtylyov 2019-01-22  462  	rpc->gate.lock = &cpg_lock;
ac41e575 Sergei Shtylyov 2019-01-22  463
ac41e575 Sergei Shtylyov 2019-01-22  464  	rpc->csn.reg = base + CPG_RPCCKCR;
ac41e575 Sergei Shtylyov 2019-01-22  465
ac41e575 Sergei Shtylyov 2019-01-22  466  	clk = clk_register_composite(NULL, name, &parent_name, 1, NULL, NULL,
ac41e575 Sergei Shtylyov 2019-01-22  467  				     &rpc->div.hw,  &clk_divider_ops,
ac41e575 Sergei Shtylyov 2019-01-22  468  				     &rpc->gate.hw, &clk_gate_ops, 0);
ac41e575 Sergei Shtylyov 2019-01-22  469  	if (IS_ERR(clk))
ac41e575 Sergei Shtylyov 2019-01-22 @470  		kfree(rpc);
ac41e575 Sergei Shtylyov 2019-01-22  471
ac41e575 Sergei Shtylyov 2019-01-22 @472  	cpg_simple_notifier_register(notifiers, &rpc->csn);
ac41e575 Sergei Shtylyov 2019-01-22  473  	return clk;
ac41e575 Sergei Shtylyov 2019-01-22  474  }
ac41e575 Sergei Shtylyov 2019-01-22  475

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation
