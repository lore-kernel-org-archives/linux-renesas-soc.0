Return-Path: <SRS0=bKbj=BW=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D003C433DF
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 12 Aug 2020 11:00:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 400D32076B
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 12 Aug 2020 11:00:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1597230034;
	bh=80Hv7ym8e+2PP+kJiCAnXCOu+RENNQuKYfJC0aO0L9w=;
	h=Subject:From:Date:To:List-ID:From;
	b=ieFdGQpMqQ+FnGFmJAegTIWa1Hfw5Sy17Rm0/V1aJtpSdGRP60cWyJ5KgMxfOjxZ8
	 ET9XsWO/ahWwmDdIPlVdzbcbXn9ujbG7bzsKl00dxR+sx+5a4JE1Zh+KgjymVZiR1j
	 KiKLnWL+wSp7O4E/lLCI4UOnWPJI5mXEICz6Yxfw=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727081AbgHLLAc (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 12 Aug 2020 07:00:32 -0400
Received: from mail.kernel.org ([198.145.29.99]:37894 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727025AbgHLLA0 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 12 Aug 2020 07:00:26 -0400
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1597230026;
        bh=80Hv7ym8e+2PP+kJiCAnXCOu+RENNQuKYfJC0aO0L9w=;
        h=Subject:From:Date:To:From;
        b=yvOyeFfAG1av03givBJfBfLp4PsD9e/Re/1a5qyDHiXpKQA5X856NdwiJ1VcsGJLh
         Twwpd2DhuWWVpyx085jDIkutP1H/pFvw/+14yvTJfTOE2fZVRHkAjMLRVBdGwxed6k
         q4kQL2ZeFaHN/ytEyTvqIO53wPUmAcCQasmibKYg=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <159723002615.7845.4366970536229031322.git-patchwork-summary@kernel.org>
Date:   Wed, 12 Aug 2020 11:00:26 +0000
To:     linux-renesas-soc@vger.kernel.org
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
geert/renesas-devel (refs/heads/master):

Patch: [v2] arm64: defconfig: Enable R-Car PCIe endpoint driver
  Submitter: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=331413
  Link: <20200811140357.564-1-prabhakar.mahadev-lad.rj@bp.renesas.com>

Patch: arm64: dts: renesas: r8a774b1-hihope-rzg2n-ex: Enable sata
  Submitter: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=330999
  Link: <20200810171239.30401-1-prabhakar.mahadev-lad.rj@bp.renesas.com>

Total patches: 2

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
