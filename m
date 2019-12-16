Return-Path: <SRS0=T57Y=2G=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 337D4C43603
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 16 Dec 2019 22:40:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 03AEB22464
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 16 Dec 2019 22:40:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1576536038;
	bh=gv4rMb5S5HUlmiYIZDP3yTt0IPpsvd1TROjri+KzHus=;
	h=Subject:From:Date:To:List-ID:From;
	b=WhxeLAZdOhXk1u74FqDYEaiUISs//aBpVGw3Rr4LeFOlHjnKtGkqdSprGNHdvX5sH
	 FGmr9Xhw/dNv+ZYGJjqny07MBcXSlydLzOr3F5pEuzisiVe4s+rJu/8c1+aiIuzdQY
	 YX6WscnMiuGlsKBqAza3377zHZclCeIdzjU2zQEE=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727516AbfLPWkh (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 16 Dec 2019 17:40:37 -0500
Received: from mail.kernel.org ([198.145.29.99]:54664 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727491AbfLPWkh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 16 Dec 2019 17:40:37 -0500
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1576536037;
        bh=gv4rMb5S5HUlmiYIZDP3yTt0IPpsvd1TROjri+KzHus=;
        h=Subject:From:Date:To:From;
        b=g4Q3SFjYtxnIuto4SM0HDc0ddU98Qi9HSpDh7yHMT1agzTsK/TxtFEakqLWoyTYWQ
         PX1I0+gr27MJljVuKyuIDyUnCcD5L746/gTxtlPreT0nZlqB3eIdoqbdTrOgLG/pQL
         D1AFEcvqwnPhiYbuThJEg6mNNyfhkcpgMcP7BUqI=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork housekeeping for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <157653603697.2784.132245533448990574.git-patchwork-housekeeping@kernel.org>
Date:   Mon, 16 Dec 2019 22:40:36 +0000
To:     linux-renesas-soc@vger.kernel.org
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Latest series: [v3] drm: rcar-du: lvds: Get mode from state (2019-12-16T22:30:42)
  Superseding: [v2] drm: rcar-du: lvds: Get mode from state (2019-12-13T18:27:42):
    [v2] drm: rcar-du: lvds: Get mode from state


-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
