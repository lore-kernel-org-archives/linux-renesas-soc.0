Return-Path: <SRS0=ij62=2D=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53A8AC00454
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 13 Dec 2019 21:40:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 055622467B
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 13 Dec 2019 21:40:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1576273234;
	bh=lstluuS0LcHj3rIrOBngeeF+qKj6hzXParTMR68QAKs=;
	h=Subject:From:Date:References:To:List-ID:From;
	b=AcTihXyPx8FUZWJHE+tI/73kRliRbuy3INS4+QSirhZ8V4KXaXAA06dwiLVqDvF3y
	 c1Nlur/NRsl9IeNnrKTeukhZ2jjY92dZ1RBkrmlH6Unq0VxuHY0ebD74I88gCm9rFR
	 kPq4je3dNyiWbsuMQzpZ0q+zb+c5sH5gzhD+aZqA=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726798AbfLMVkd (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 13 Dec 2019 16:40:33 -0500
Received: from mail.kernel.org ([198.145.29.99]:46478 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726382AbfLMVkd (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 13 Dec 2019 16:40:33 -0500
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1576273233;
        bh=lstluuS0LcHj3rIrOBngeeF+qKj6hzXParTMR68QAKs=;
        h=Subject:From:Date:References:To:From;
        b=D3K/06GDslo0kTHtKLNpRXsZtHOVu6NVOLk7wFjLJGwU15tqh7SahxWi9a7ERadWI
         5ImtL2Leu9/XsEtCX1wWFiYKOeMg3w0rKSstsifi5DOiJR5Ati5HL/LnIM2pQQOYgd
         uU/KohKWhJybGHfXecjrqA+p7FHREUit6vdeqG2g=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <157627323306.19961.5564129872797080459.git-patchwork-summary@kernel.org>
Date:   Fri, 13 Dec 2019 21:40:33 +0000
References: <20191209101413.26686-1-geert+renesas@glider.be>,
 <20191211100633.7318-1-geert+renesas@glider.be>
To:     linux-renesas-soc@vger.kernel.org
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
geert/renesas-devel (refs/heads/master):

Patch: [LOCAL] arm64: renesas_defconfig: Refresh for v5.5-rc1
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=213537

Patch: [LOCAL] arm64: defconfig: Enable CONFIG_ARCH_R8A77960
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=214887

Total patches: 2

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
