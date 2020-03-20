Return-Path: <SRS0=uiuT=5F=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71EF4C4332E
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 20 Mar 2020 15:00:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4887E20714
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 20 Mar 2020 15:00:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1584716443;
	bh=Ezy2LAYjpP9QtdGMgZs2xY5rImICwKLewbql6zN/VYo=;
	h=Subject:From:Date:To:List-ID:From;
	b=PDdUHEI5ROUIx364nasezdhvWPD/YLdpe7wshJPsEqZPsB/13q0PwScpIogCHz5gO
	 hsJ/F1OgrsFv3sj//k75ewI2NJr+YvNn1ZKo1lV3niYvcI5DG4aE4s7Jn6XZ4+HS7H
	 PFMv0gdcNz9Bdg9DR99YdSCIyn1H3VOP8zcPtxDs=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727129AbgCTPAn (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 20 Mar 2020 11:00:43 -0400
Received: from mail.kernel.org ([198.145.29.99]:50144 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726778AbgCTPAm (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 20 Mar 2020 11:00:42 -0400
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1584716442;
        bh=Ezy2LAYjpP9QtdGMgZs2xY5rImICwKLewbql6zN/VYo=;
        h=Subject:From:Date:To:From;
        b=hcN1KTCbRUoIr/yyjLEgMsaLCS4kKEtmyg7CVy/eJFccvFm8e8tzVqsU7P3hz8XNd
         A07gZuVmBd+TqayjdiogW2QX3fsON3Xt3OBDnFkwJazLoc5yf2CQYKsx7LeaXS+Zzy
         TOxBiWj7Lw7VD3IMgJxtXRDjOi/ZPYjGWgYmTgG4=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork housekeeping for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <158471644258.1720.17381612121061041786.git-patchwork-housekeeping@kernel.org>
Date:   Fri, 20 Mar 2020 15:00:42 +0000
To:     linux-renesas-soc@vger.kernel.org
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Latest series: [v4] ARM: boot: Obtain start of physical memory from DTB (2020-03-20T14:43:48)
  Superseding: [v2] ARM: boot: Obtain start of physical memory from DTB (2020-01-27T14:07:16):
    [v2] ARM: boot: Obtain start of physical memory from DTB


-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
