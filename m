Return-Path: <SRS0=94ze=AM=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03509C433E0
	for <linux-renesas-soc@archiver.kernel.org>; Wed,  1 Jul 2020 06:40:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D179120747
	for <linux-renesas-soc@archiver.kernel.org>; Wed,  1 Jul 2020 06:40:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1593585648;
	bh=N5vwdGSxd4Xtdp2TGAGI4zUEmmJF0jNotkvUktYNgLw=;
	h=Subject:From:Date:To:List-ID:From;
	b=nxJJbSgjwsP7oRFmsQT5VPyNZ8BlecLUHPj9swdHcOwqqdZqSvfVaCsWF5mEawBur
	 q0xGwHbeGu1dgnLENHE2xGCTGdYB8N1XJmKfeBq2u1L6/5ArAEe8yhOF0xFr1o0Shn
	 ShN4Vi43AecB7gzflGGj/YldQECD7h5YB4IVQDb0=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727769AbgGAGks (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 1 Jul 2020 02:40:48 -0400
Received: from mail.kernel.org ([198.145.29.99]:41710 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726144AbgGAGks (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 1 Jul 2020 02:40:48 -0400
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1593585648;
        bh=N5vwdGSxd4Xtdp2TGAGI4zUEmmJF0jNotkvUktYNgLw=;
        h=Subject:From:Date:To:From;
        b=rTcjuD0QxqTImyV6tJMPWY4BifByUMvN01TnBwKWMBEfLzjxe2951ttXHR7OFL0ZP
         /dezH1gwkRp/daGYIu8MEAmrFWZdwnZVeWa6F+zAuUjvctXQJmf3XlE92V3nXPDIFU
         u5gBoHefXAWWMDF0H8q9wmMcfJha6rRpJp6FCgf8=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork housekeeping for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <159358564828.9275.14657363323386710656.git-patchwork-housekeeping@kernel.org>
Date:   Wed, 01 Jul 2020 06:40:48 +0000
To:     linux-renesas-soc@vger.kernel.org
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Latest series: [v4] media: v4l2-async: Accept endpoints and devices for fwnode matching (2020-07-01T06:21:36)
  Superseding: [v3] media: v4l2-async: Accept endpoints and devices for fwnode matching (2020-06-21T00:00:25):
    [v3,1/3] media: v4l2-async: Accept endpoints and devices for fwnode matching
    [v3,2/3] media: v4l2-async: Pass notifier pointer to match functions
    [v3,3/3] media: v4l2-async: Log message in case of heterogeneous fwnode match


-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
