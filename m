Return-Path: <SRS0=9jE+=EF=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F142BC00A89
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 30 Oct 2020 08:50:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8BD9220704
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 30 Oct 2020 08:50:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1604047806;
	bh=rn7tGnwzbV+EMHhqDgHqcu/oC+Q8YmeO9dcUCq7RsfQ=;
	h=Subject:From:Date:To:List-ID:From;
	b=qSXoE1qGKeNGO3xOStnCu4tJc7aOPGaOHg8oWuC0E8O3zOEysbyZNhCZ4B1JI4Maa
	 eOZUO+6vezTcmLtKNcLg5IDNpyNl4Y3trN4NQnYsC65xr0xgLT/QRrfFbH0mTaSOse
	 riSWIi+olwujshMobon3mlrXB28sl9VcgBLRocuI=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725808AbgJ3IuG (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 30 Oct 2020 04:50:06 -0400
Received: from mail.kernel.org ([198.145.29.99]:54860 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725784AbgJ3IuG (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 30 Oct 2020 04:50:06 -0400
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1604047805;
        bh=rn7tGnwzbV+EMHhqDgHqcu/oC+Q8YmeO9dcUCq7RsfQ=;
        h=Subject:From:Date:To:From;
        b=1xcuAlZHp1v2JAoZ7PTj/he6mD71GuUvGqNKugx1zKwpR8EiQu9bGWtjxVeiLHno+
         b1kGHOoYgROs3qmFV5WE+7zhsNQAmDjEqPaA+7jxmbziWSYWusWNKuvutiPB0w7UaD
         WjsHmFiWd92kBwgSkMfeXOjMecQZXgcOSQpt13Tg=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <160404780542.28147.12854293592701692849.git-patchwork-summary@kernel.org>
Date:   Fri, 30 Oct 2020 08:50:05 +0000
To:     linux-renesas-soc@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "mainlined", because they were applied to
geert/renesas-devel.git (refs/heads/master):

Series: [1/2] arm64: dts: renesas: r8a77961: Add CAN{0,1} placeholder nodes
  Submitter: Eugeniu Rosca <erosca@de.adit-jv.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=373143
  Lore link: https://lore.kernel.org/r/20201029133741.25721-1-erosca@de.adit-jv.com
    Patches: [1/2] arm64: dts: renesas: r8a77961: Add CAN{0,1} placeholder nodes
             [2/2] arm64: dts: renesas: r8a77961: ulcb-kf: Initial device tree

Total patches: 2

--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


