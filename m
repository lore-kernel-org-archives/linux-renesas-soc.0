Return-Path: <SRS0=llTS=BR=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9ED9C433E0
	for <linux-renesas-soc@archiver.kernel.org>; Fri,  7 Aug 2020 09:40:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B559B20748
	for <linux-renesas-soc@archiver.kernel.org>; Fri,  7 Aug 2020 09:40:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1596793233;
	bh=AhbZhMszLQMVm/aXq5PDpnaRF5zCapAk29zAuNOzB9E=;
	h=Subject:From:Date:To:List-ID:From;
	b=y03/SKpSnn4UmbpN/5g2rSlSHAdvev4yrkc1WLyUqXyDC8H0MjPgI0SI8P6oO+elM
	 LnjZWZVz3BdiI2JRA5MPmUgcTFox30+t8POJa7Eo1nL1W/m3deKv3GkVvKpOX5/wqG
	 M+TF/+uVDyqW1Rte3dvA5t9KyNts6FiYhU7spgdg=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727053AbgHGJkd (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 7 Aug 2020 05:40:33 -0400
Received: from mail.kernel.org ([198.145.29.99]:49192 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726854AbgHGJkd (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 7 Aug 2020 05:40:33 -0400
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1596793233;
        bh=AhbZhMszLQMVm/aXq5PDpnaRF5zCapAk29zAuNOzB9E=;
        h=Subject:From:Date:To:From;
        b=iYWdkSahoLV3NImclJ9XOqALDR+v2Pj7eFpOSP94vRoOMVTg5BKN/t0shoIGc37Dh
         0R6qI36izhjVIEv6/KGTTsHN8ICJnbQiIjFLmI/sr2Gjg4FT2hVQLXiwbvvpb958Tf
         UBXVAe/CUHmxHOFGha1LS5dNLQks4DFN6aHSjnOM=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <159679323309.14023.15040405254856838312.git-patchwork-summary@kernel.org>
Date:   Fri, 07 Aug 2020 09:40:33 +0000
To:     linux-renesas-soc@vger.kernel.org
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
geert/renesas-devel (refs/heads/master):

Patch: ARM: shmobile: Enable TOUCHSCREEN_STMPE in shmobile_defconfig
  Submitter: Biju Das <biju.das.jz@bp.renesas.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=329809
  Link: <20200806121704.3192-1-biju.das.jz@bp.renesas.com>

Patch: [v2] ARM: dts: iwg22d-sodimm: Fix dt nodes sorting
  Submitter: Biju Das <biju.das.jz@bp.renesas.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=329299
  Link: <20200805142634.12252-1-biju.das.jz@bp.renesas.com>

Patch: arm64: dts: renesas: ulcb: add full-pwr-cycle-in-suspend into eMMC nodes
  Submitter: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=320125
  Link: <1594989201-24228-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>

Total patches: 3

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
