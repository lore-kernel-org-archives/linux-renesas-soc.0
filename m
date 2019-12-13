Return-Path: <SRS0=ij62=2D=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0150C43603
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 13 Dec 2019 21:40:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9F62624671
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 13 Dec 2019 21:40:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1576273232;
	bh=w0FuY4GTcwE2jnuxLxWss4NsBJxugudtc0UK+fMT/hQ=;
	h=Subject:From:Date:References:To:List-ID:From;
	b=XSQogzub4vd2QMAd1Wcpx4/1+2O5b5/2SPbkeDoOawhjdml7xdYBzyqhjM9tK+uht
	 VPen0q3W9OtWeDD+yP0pZq7JU20efC167AtLFeM9g0V14RKlfZAHOuTZDrbL4eRil+
	 w6fOkDxKXIYMp1H6cBSpqW/slku72j7e10IELl4Q=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726551AbfLMVkc (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 13 Dec 2019 16:40:32 -0500
Received: from mail.kernel.org ([198.145.29.99]:46402 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726382AbfLMVkc (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 13 Dec 2019 16:40:32 -0500
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1576273231;
        bh=w0FuY4GTcwE2jnuxLxWss4NsBJxugudtc0UK+fMT/hQ=;
        h=Subject:From:Date:References:To:From;
        b=qtpGrFrWmEYx+DfFRFq1u+ncZ5ZNOJcTouTCB8GBV2lVQsCMqRptzN9IL2hDu6obg
         IZmMf/KIeXf3bZD6+ZuCX39wOEhQHV6BpvUNTO9vOkk4RSiEpQTAyr62Ab3S7ieBw9
         5UfzkpmomkWFp1gjvh2ExhyDlsALZD+Gdy8cRkHM=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <157627323152.19961.11380334663116958759.git-patchwork-summary@kernel.org>
Date:   Fri, 13 Dec 2019 21:40:31 +0000
References: <20191211100510.7182-1-geert+renesas@glider.be>,
 <20191211131311.23661-1-geert+renesas@glider.be>,
 <20191211100438.7094-1-geert+renesas@glider.be>,
 <20191209101327.26571-1-geert+renesas@glider.be>
To:     linux-renesas-soc@vger.kernel.org
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
geert/renesas-devel (refs/heads/next):

Patch: soc: renesas: Remove ARCH_R8A7796
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=214881

Patch: [PATCH/RFC] arm64: dts: renesas: Rename r8a7796* to r8a77960*
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=214985

Patch: arm64: dts: renesas: Remove use of ARCH_R8A7796
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=214877

Patch: ARM: shmobile: defconfig: Restore debugfs support
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=213533

Total patches: 4

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
