Return-Path: <SRS0=9Cy4=AY=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C6CEC433E2
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 13 Jul 2020 23:20:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 35C3520DD4
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 13 Jul 2020 23:20:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1594682447;
	bh=a9QJT8SD8Yjdgjatu+QPdImXoJSqzlFgFwHrHlsVmKI=;
	h=Subject:From:Date:To:List-ID:From;
	b=2fZs1alIIXIbMXJghtlYkqI7cV3c4XROcnkYeaRZUFwsCEPhu/ywnuY5IBxIlGJ/Z
	 IeFKfB9frGWlObT0IeRT/XI/tdRPeHCmPlfNZ46w5mCPZ8FfgQ/asemHstF4oQhVM8
	 3q5tenRYbkwjzDvPIwPHDR7E0WQ4CWq7BhNngTQY=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726435AbgGMXUq (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 13 Jul 2020 19:20:46 -0400
Received: from mail.kernel.org ([198.145.29.99]:44888 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726432AbgGMXUq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 13 Jul 2020 19:20:46 -0400
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1594682446;
        bh=a9QJT8SD8Yjdgjatu+QPdImXoJSqzlFgFwHrHlsVmKI=;
        h=Subject:From:Date:To:From;
        b=ZjowUmS6y0gdWBGritOWUzijZmCMu8w2Uj/5lUGGdrVnNtP2tiUyMOMAncdiaaAN0
         0gErjpYa+x7nGKr5gNWPsZF6IXE6FYfR3/YYOKyaSyb7WAUNnI7O95lVNowxAvpuNJ
         ZF70MX/uN3JvJa8WIyZVAP6rdeSB/MS4FYvZe+f4=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork housekeeping for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <159468244648.31711.15910113468963219710.git-patchwork-housekeeping@kernel.org>
Date:   Mon, 13 Jul 2020 23:20:46 +0000
To:     linux-renesas-soc@vger.kernel.org
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Latest series: [v1] Add license and copyright information (2020-07-13T23:08:08)
  Superseding: [v1] Add license and copyright information (2020-07-13T23:04:38):
    [kms-test] Add license and copyright information


-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
