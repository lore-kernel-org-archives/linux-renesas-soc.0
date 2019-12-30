Return-Path: <SRS0=hvjm=2U=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17485C2D0CE
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 30 Dec 2019 08:40:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E1E6B207E0
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 30 Dec 2019 08:40:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1577695237;
	bh=Mhtj+3QujBGOTh2F4+ixffCyBpPZZYX/j34iJFbEgEQ=;
	h=Subject:From:Date:To:List-ID:From;
	b=ZPQ1dJv9yeYQ/rVhhKYN+3husnnG5UXOahw+OfSVsBoHpq5rvQ6Ls7RBS+3vm94LY
	 rnuIyOoDjV3mSaxli4RBfKxCxn5hd8ggS01/AggWr1/Chl6seJbrskjDIwTdgnvg9i
	 d5Lin8dGO1HYuuBlJ9lEA70B1bal7NUlPVfuTFmw=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727272AbfL3Ikg (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 30 Dec 2019 03:40:36 -0500
Received: from mail.kernel.org ([198.145.29.99]:59316 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727175AbfL3Ikg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 30 Dec 2019 03:40:36 -0500
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1577695235;
        bh=Mhtj+3QujBGOTh2F4+ixffCyBpPZZYX/j34iJFbEgEQ=;
        h=Subject:From:Date:To:From;
        b=fHLwoDkkNQdf1bE3gdZSQ9InGCMrZOF1GY4CJv5LCyTk/3dyxGujnf29Fnkdmy34o
         3B18Xm10XKFR5JBeMbJLj7ix2yBO1ZZ+g9J+ebifXgzECXFkLQ+LZa8FgwmNZmzNtR
         VdR7jx6qSLgI7RcDmKn3esfsq7axfB72U5W0wsvw=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork housekeeping for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <157769523593.28941.1819296326117263902.git-patchwork-housekeeping@kernel.org>
Date:   Mon, 30 Dec 2019 08:40:35 +0000
To:     linux-renesas-soc@vger.kernel.org
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Latest series: [v2] pinctrl: sh-pfc: Split R-Car H3 support in two independent drivers (2019-12-30T08:31:56)
  Superseding: [v1] pinctrl: sh-pfc: Split R-Car H3 support in two independent drivers (2019-12-17T18:42:42):
    pinctrl: sh-pfc: Split R-Car H3 support in two independent drivers


-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
