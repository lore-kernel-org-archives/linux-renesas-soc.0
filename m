Return-Path: <SRS0=MG+9=YZ=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21C6FCA9EC9
	for <linux-renesas-soc@archiver.kernel.org>; Fri,  1 Nov 2019 06:40:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id EA76A208E3
	for <linux-renesas-soc@archiver.kernel.org>; Fri,  1 Nov 2019 06:40:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1572590438;
	bh=XIMGQG3cEwUHP8nE+KNr9Y5N7qy0OZyPbMLV5f4frbM=;
	h=Subject:From:Date:To:List-ID:From;
	b=pmFtI8gfabcc7HRzAD+I7H8skKWLzcp7gfrx7SGE7ZMSJeswRCLzSPwaQoeoaW/4Y
	 JRa4IiFOGGtX7HElQg3xseVtIowPC1WKl9PsBx8kT6AnDHvNkQYi2/La4sKdkTrmQ1
	 Htx6xDu6+d2ION9R5Mn3NJ7cDmp+Dkv2EHBAxx54=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726457AbfKAGkh (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 1 Nov 2019 02:40:37 -0400
Received: from mail.kernel.org ([198.145.29.99]:47842 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725936AbfKAGkh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 1 Nov 2019 02:40:37 -0400
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1572590437;
        bh=XIMGQG3cEwUHP8nE+KNr9Y5N7qy0OZyPbMLV5f4frbM=;
        h=Subject:From:Date:To:From;
        b=t/zOSsbo/eSKsB5+7pBBM75rET8Ru7qYqaCSVONpe9ilb+8VUCPiOj0ZBSVaVMkeu
         UeLsAc71GIxPo4mackzg0OrT7RIw61sMvJIj/hQ1+DP2pq7f8ZgsYYVNOfyRyNU021
         cX8H5aInCP8mI+zlbIETaSJpjR0seilU2B3142y0=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork housekeeping for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <157259043718.9316.956653936339923793.git-patchwork-housekeeping@kernel.org>
Date:   Fri, 01 Nov 2019 06:40:37 +0000
To:     linux-renesas-soc@vger.kernel.org
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Latest series: [v2] PCI: rcar: Fix missing MACCTLR register setting (take2) (2019-11-01T06:31:29)
  Superseding: [v1] PCI: rcar: Fix missing MACCTLR register setting (take2) (2019-10-30T11:27:02):
    [1/2] Revert "PCI: rcar: Fix missing MACCTLR register setting in rcar_pcie_hw_init()"
    [2/2] PCI: rcar: Fix missing MACCTLR register setting in initialize sequence


-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
