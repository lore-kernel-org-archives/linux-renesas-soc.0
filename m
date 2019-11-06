Return-Path: <SRS0=ZRe+=Y6=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2E91C5DF60
	for <linux-renesas-soc@archiver.kernel.org>; Wed,  6 Nov 2019 02:40:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4EEC221A49
	for <linux-renesas-soc@archiver.kernel.org>; Wed,  6 Nov 2019 02:40:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1573008041;
	bh=WAhNZnxgRoi3wMVzqVdu0SDo8/3P9EQnDQgZlttzAss=;
	h=Subject:From:Date:To:List-ID:From;
	b=jEDAbn5AypWTbG0bW4iw0/vkk25qSemXFMdqnUl41rXQ/74TCU1XN3CCT2sDMqvI/
	 e/CHN9/nVFmBY/clo5AAY6Ibix9KhzhnEMg2vjxm0VW5YYIbpSY65l6GMwhlxqiVOZ
	 dvsrAn1FwJtP0omXrmxXbBTlTb7nhL7Iptoxp3GI=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730426AbfKFCkl (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 5 Nov 2019 21:40:41 -0500
Received: from mail.kernel.org ([198.145.29.99]:59088 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727252AbfKFCkk (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 5 Nov 2019 21:40:40 -0500
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1573008040;
        bh=WAhNZnxgRoi3wMVzqVdu0SDo8/3P9EQnDQgZlttzAss=;
        h=Subject:From:Date:To:From;
        b=W4bYKQvRCzzHJSbV5ieF6oi/yRhDwZIwdZIgLbiE2qXXsPiiRNK+KyQcYUYaCnn6+
         CEQ5CjLrzI5qztSEWuqg/rQmWDLqI+DcK/nc8j7VrENw842OeowWMIZFswubwr8uKQ
         9ao6rkqXYywfJS37FofvAAiCcuvpU/ukVhU8jO5c=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork housekeeping for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <157300804023.23567.15933443780872705992.git-patchwork-housekeeping@kernel.org>
Date:   Wed, 06 Nov 2019 02:40:40 +0000
To:     linux-renesas-soc@vger.kernel.org
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Latest series: [v3] iommu/ipmmu-vmsa: minor updates (2019-11-06T02:35:44)
  Superseding: [v2] iommu/ipmmu-vmsa: minor updates (2019-10-15T11:11:54):
    [v2,1/6] iommu/ipmmu-vmsa: Remove all unused register definitions
    [v2,2/6] iommu/ipmmu-vmsa: tidyup register definitions
    [v2,3/6] iommu/ipmmu-vmsa: Add helper functions for MMU "context" registers
    [v2,4/6] iommu/ipmmu-vmsa: Calculate context registers' offset instead of a macro
    [v2,5/6] iommu/ipmmu-vmsa: Add helper functions for "uTLB" registers
    [v2,6/6] iommu/ipmmu-vmsa: Add utlb_offset_base


-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
