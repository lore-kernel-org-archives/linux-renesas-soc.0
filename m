Return-Path: <SRS0=lOJF=4G=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1F07C34026
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 18 Feb 2020 11:40:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7547C207FD
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 18 Feb 2020 11:40:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1582026037;
	bh=jhbBZ85i9n7k41Mf1SDcMRLUu6zTansHEChmQT0LmYI=;
	h=Subject:From:Date:To:List-ID:From;
	b=Ohtw/P+VbMQArh92f1VpeimUYYeReJVxQ+KtlX+1UZB7tfy0FAkOv7xOeErL3F9rR
	 pJQd/3i2yQqTcDQiNFqD3e3zcuudydu+Slnkd3208WFQHsGE76NfCV6VgwAU0FmW5M
	 mLKSqzcdibCWW6hK+wzH6ajQNW5/n2JbQkTqVhsU=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726086AbgBRLkh (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 18 Feb 2020 06:40:37 -0500
Received: from mail.kernel.org ([198.145.29.99]:44430 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726073AbgBRLkh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 18 Feb 2020 06:40:37 -0500
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1582026036;
        bh=jhbBZ85i9n7k41Mf1SDcMRLUu6zTansHEChmQT0LmYI=;
        h=Subject:From:Date:To:From;
        b=ZC+UO6nZQeUinaZ0hrMQHqsfzCALRuVN2R/5gPO1kHxmLct9buWSc5GxWxIDfzRGn
         jDBjsxsfsZOi0paEdthiXhULs4ELnRfZYRg4YY3EdWM8oyZ9O3iX/P06r5cSzEP5kt
         04Mwu7whL4XObf7q04EjzHv3/2pUNI1AGK73m9sk=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork housekeeping for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <158202603666.26468.17292952619806467290.git-patchwork-housekeeping@kernel.org>
Date:   Tue, 18 Feb 2020 11:40:36 +0000
To:     linux-renesas-soc@vger.kernel.org
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Latest series: [v1] pinctrl: sh-pfc: Remove use of ARCH_R8A7796 (2020-02-18T11:25:57)
  Superseding: [v1] pinctrl: sh-pfc: Remove use of ARCH_R8A7796 (2019-12-11T10:03:08):
    pinctrl: sh-pfc: Remove use of ARCH_R8A7796

Latest series: [v1] clk: renesas: Remove use of ARCH_R8A7796 (2020-02-18T11:25:25)
  Superseding: [v1] clk: renesas: Remove use of ARCH_R8A7796 (2019-12-11T10:02:20):
    clk: renesas: Remove use of ARCH_R8A7796


-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
