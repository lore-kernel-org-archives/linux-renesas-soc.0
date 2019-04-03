Return-Path: <SRS0=jJK9=SF=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.5 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79AA8C4360F
	for <linux-renesas-soc@archiver.kernel.org>; Wed,  3 Apr 2019 02:30:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 50CDD2146E
	for <linux-renesas-soc@archiver.kernel.org>; Wed,  3 Apr 2019 02:30:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726130AbfDCCai (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 2 Apr 2019 22:30:38 -0400
Received: from mga11.intel.com ([192.55.52.93]:57843 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726089AbfDCCai (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 2 Apr 2019 22:30:38 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 02 Apr 2019 19:30:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,302,1549958400"; 
   d="scan'208";a="128154185"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 02 Apr 2019 19:30:37 -0700
Received: from kbuild by lkp-server01 with local (Exim 4.89)
        (envelope-from <lkp@intel.com>)
        id 1hBVfg-000DBu-OX; Wed, 03 Apr 2019 10:30:36 +0800
Date:   Wed, 3 Apr 2019 10:30:03 +0800
From:   kbuild test robot <lkp@intel.com>
To:     Eric Anholt <eric@anholt.net>
Cc:     kbuild-all@01.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [renesas-drivers:master 22/37]
 drivers/gpu/drm/lima/lima_ctx.c:26:43: sparse: incorrect type in argument 3
 (different base types)
Message-ID: <201904031000.PjUY6jQW%lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git master
head:   d8c53de23eec2c010894c814ceac769700182cf8
commit: 6a01797c6de0fe44c98eb92c690d04ca2d226599 [22/37] Merge remote-tracking branch 'drm-misc/for-linux-next' into renesas-drivers
reproduce:
        # apt-get install sparse
        git checkout 6a01797c6de0fe44c98eb92c690d04ca2d226599
        make ARCH=x86_64 allmodconfig
        make C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__'


sparse warnings: (new ones prefixed by >>)

>> drivers/gpu/drm/lima/lima_ctx.c:26:43: sparse: incorrect type in argument 3 (different base types) @@    expected void *entry @@    got unsignvoid *entry @@
   drivers/gpu/drm/lima/lima_ctx.c:26:43:    expected void *entry
   drivers/gpu/drm/lima/lima_ctx.c:26:43:    got unsigned int
>> drivers/gpu/drm/lima/lima_ctx.c:26:53: sparse: incorrect type in argument 4 (invalid types) @@    expected struct xa_limit limit @@    got struct lima_struct xa_limit limit @@
   drivers/gpu/drm/lima/lima_ctx.c:26:53:    expected struct xa_limit limit
   drivers/gpu/drm/lima/lima_ctx.c:26:53:    got struct lima_ctx *[assigned] ctx

vim +26 drivers/gpu/drm/lima/lima_ctx.c

a1d2a633 Qiang Yu 2019-03-09   8  
a1d2a633 Qiang Yu 2019-03-09   9  int lima_ctx_create(struct lima_device *dev, struct lima_ctx_mgr *mgr, u32 *id)
a1d2a633 Qiang Yu 2019-03-09  10  {
a1d2a633 Qiang Yu 2019-03-09  11  	struct lima_ctx *ctx;
a1d2a633 Qiang Yu 2019-03-09  12  	int i, err;
a1d2a633 Qiang Yu 2019-03-09  13  
a1d2a633 Qiang Yu 2019-03-09  14  	ctx = kzalloc(sizeof(*ctx), GFP_KERNEL);
a1d2a633 Qiang Yu 2019-03-09  15  	if (!ctx)
a1d2a633 Qiang Yu 2019-03-09  16  		return -ENOMEM;
a1d2a633 Qiang Yu 2019-03-09  17  	ctx->dev = dev;
a1d2a633 Qiang Yu 2019-03-09  18  	kref_init(&ctx->refcnt);
a1d2a633 Qiang Yu 2019-03-09  19  
a1d2a633 Qiang Yu 2019-03-09  20  	for (i = 0; i < lima_pipe_num; i++) {
a1d2a633 Qiang Yu 2019-03-09  21  		err = lima_sched_context_init(dev->pipe + i, ctx->context + i, &ctx->guilty);
a1d2a633 Qiang Yu 2019-03-09  22  		if (err)
a1d2a633 Qiang Yu 2019-03-09  23  			goto err_out0;
a1d2a633 Qiang Yu 2019-03-09  24  	}
a1d2a633 Qiang Yu 2019-03-09  25  
a1d2a633 Qiang Yu 2019-03-09 @26  	err = xa_alloc(&mgr->handles, id, UINT_MAX, ctx, GFP_KERNEL);
a1d2a633 Qiang Yu 2019-03-09  27  	if (err < 0)
a1d2a633 Qiang Yu 2019-03-09  28  		goto err_out0;
a1d2a633 Qiang Yu 2019-03-09  29  
a1d2a633 Qiang Yu 2019-03-09  30  	return 0;
a1d2a633 Qiang Yu 2019-03-09  31  
a1d2a633 Qiang Yu 2019-03-09  32  err_out0:
a1d2a633 Qiang Yu 2019-03-09  33  	for (i--; i >= 0; i--)
a1d2a633 Qiang Yu 2019-03-09  34  		lima_sched_context_fini(dev->pipe + i, ctx->context + i);
a1d2a633 Qiang Yu 2019-03-09  35  	kfree(ctx);
a1d2a633 Qiang Yu 2019-03-09  36  	return err;
a1d2a633 Qiang Yu 2019-03-09  37  }
a1d2a633 Qiang Yu 2019-03-09  38  

:::::: The code at line 26 was first introduced by commit
:::::: a1d2a6339961efc078208dc3b2f006e9e9a8e119 drm/lima: driver for ARM Mali4xx GPUs

:::::: TO: Qiang Yu <yuq825@gmail.com>
:::::: CC: Eric Anholt <eric@anholt.net>

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation
