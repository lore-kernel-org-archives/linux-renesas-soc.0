Return-Path: <SRS0=yEp9=AR=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9D62C433E0
	for <linux-renesas-soc@archiver.kernel.org>; Mon,  6 Jul 2020 15:20:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C7662206CD
	for <linux-renesas-soc@archiver.kernel.org>; Mon,  6 Jul 2020 15:20:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1594048847;
	bh=+HScLaWZL9t4G9gg8Msjt1zqJVu9FiuL/Y3IqLo7EnQ=;
	h=Subject:From:Date:To:List-ID:From;
	b=lpE9Nz2wWjc3OzTO6M/jSGjMJxr9ZLjDaJssXtuIvxc/Gp+qICCRqbi0LeS/KWcZ8
	 g4NIRPduQhR6IclqNycN7lr/PDxxwIap12G631ek++ionnQTnp05m2wNbFEdCktOn1
	 a+djpOnoaL9tFaQDikhF3Z7LOfYZlgkGSRS+CnzA=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729254AbgGFPUr (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 6 Jul 2020 11:20:47 -0400
Received: from mail.kernel.org ([198.145.29.99]:39434 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729248AbgGFPUr (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 6 Jul 2020 11:20:47 -0400
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1594048847;
        bh=+HScLaWZL9t4G9gg8Msjt1zqJVu9FiuL/Y3IqLo7EnQ=;
        h=Subject:From:Date:To:From;
        b=GVTd5qcCE52rNhHG6FmI1a30GkZ+l7iB0eAAOvt7cH2E1CAHkNgn/9Vv0+zvOPXGO
         RPQ3s7dh9WV0UMOWKAg0bLWVIPji2Y5vj++imFpzit4O829k/3thPXGgRZxFbubvBT
         6t33iSww6G+Xq2+kyYG7kZRUHVPycosZ9T0AB7E4=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork housekeeping for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <159404884716.20318.15326191028165213116.git-patchwork-housekeeping@kernel.org>
Date:   Mon, 06 Jul 2020 15:20:47 +0000
To:     linux-renesas-soc@vger.kernel.org
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Latest series: [v7] ARM: boot: Obtain start of physical memory from DTB (2020-07-06T15:02:05)
  Superseding: [v6] ARM: boot: Obtain start of physical memory from DTB (2020-04-29T08:21:20):
    [v6] ARM: boot: Obtain start of physical memory from DTB


-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
