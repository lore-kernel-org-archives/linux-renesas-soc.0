Return-Path: <SRS0=VuhC=74=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: *
X-Spam-Status: No, score=1.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	UNWANTED_LANGUAGE_BODY autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 883C6C433E0
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 15 Jun 2020 10:40:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6480620663
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 15 Jun 2020 10:40:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1592217641;
	bh=8C0pAoEoBph+rnj8TfrTDyfHU0LLTZGYH2oyC1LCT9A=;
	h=Subject:From:Date:To:List-ID:From;
	b=zr+01hKZzPBNjddESaFVZk0VrGm9wLq6eSnhik27OTCGxYoSBJ8/V+szCehIWhggR
	 8ooUh8YVca0fyq675xaNn0YYpITpmKukYOilDUmmJ0sre3itd9etb1G5eOz7w67CHB
	 qwoIG+tHSwn3Uor7RBYqk+DgWQGxnSumHaEX95vU=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729354AbgFOKkk (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 15 Jun 2020 06:40:40 -0400
Received: from mail.kernel.org ([198.145.29.99]:52640 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728368AbgFOKkj (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 15 Jun 2020 06:40:39 -0400
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1592217639;
        bh=8C0pAoEoBph+rnj8TfrTDyfHU0LLTZGYH2oyC1LCT9A=;
        h=Subject:From:Date:To:From;
        b=CqYc8bE5MZFcPxS+DC5xkWDupuChP/Y38ccyi5UqC/oXdnvQj/EFnv3aWuD9wBJ9F
         uxfOkqJQmtrdGrIPTJ+JYp9fxHVVR/nkUv2mfTTSQ2LXRlED727M5VT0Z6BwF3/w9w
         1m2ucyBVzpsvDtO9eU7FzBWy323b4efrjc50/yxY=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <159221763895.22898.6113835060037974789.git-patchwork-summary@kernel.org>
Date:   Mon, 15 Jun 2020 10:40:38 +0000
To:     linux-renesas-soc@vger.kernel.org
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
geert/renesas-devel (refs/heads/master):

Patch: [GIT,PULL] clk: renesas: Updates for v5.8 (take two)
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=290931
  Link: <20200520125336.16173-1-geert+renesas@glider.be>

Patch: [GIT,PULL] pinctrl: sh-pfc: Updates for v5.8 (take two)
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=290937
  Link: <20200520125357.16281-1-geert+renesas@glider.be>

Patch: [GIT,PULL] clk: renesas: Updates for v5.8
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=279977
  Link: <20200430084902.1540-1-geert+renesas@glider.be>

Patch: [GIT,PULL] pinctrl: sh-pfc: Updates for v5.8
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=279981
  Link: <20200430084909.1599-1-geert+renesas@glider.be>

Total patches: 4

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
