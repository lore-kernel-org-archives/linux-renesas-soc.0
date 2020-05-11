Return-Path: <SRS0=JaFY=6Z=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D861C47255
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 11 May 2020 10:20:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6E8462080C
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 11 May 2020 10:20:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1589192439;
	bh=3CGf5VfZ0EDu+iN3tJPmy/WxWf6V7aEWkILZwXGIwY4=;
	h=Subject:From:Date:To:List-ID:From;
	b=SUtGfb+GCf/HFQc4O6S7CZin44FYmvhTdOAl+bHVC8e3Ru87/FMG9YxD6JZEmtUXB
	 j61kHtAR0boDVqpwcvuNn5qKYNuhSupkgi8aF3XGK+mvinrfyaBxVX48j8RJpwCW+P
	 EpBhiYu768SmLrJt0hVSiuu9aNTVsbp0TTjZJ4wo=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729470AbgEKKUj (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 11 May 2020 06:20:39 -0400
Received: from mail.kernel.org ([198.145.29.99]:55920 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729466AbgEKKUi (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 11 May 2020 06:20:38 -0400
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1589192438;
        bh=3CGf5VfZ0EDu+iN3tJPmy/WxWf6V7aEWkILZwXGIwY4=;
        h=Subject:From:Date:To:From;
        b=oD38ZDGGmTDyXS0i8R9Sx7EKHYntUYtQ2YuC5DxqRByO7g3hZzo1pmDHFIdMG3OCY
         DZJBoliruhNzwswU8KzDXm+W32V6a+btxnWXZ4020rShDbjw6HbuzxALZvqPEVo3Er
         Zmw6DlE0y+ulRZxle9/mRslsb2i2WdYjwxipJ1ig=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork housekeeping for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <158919243841.3887.6750762263515011862.git-patchwork-housekeeping@kernel.org>
Date:   Mon, 11 May 2020 10:20:38 +0000
To:     linux-renesas-soc@vger.kernel.org
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Latest series: [v1] ASoC: rsnd: add interrupt support for SSI BUSIF buffer (2020-05-11T10:04:15)
  Superseding: [v1] ASoC: rsnd: add interrupt support for SSI BUSIF buffer (2020-05-11T09:45:20):
    [v1] ASoC: rsnd: add interrupt support for SSI BUSIF buffer


-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
