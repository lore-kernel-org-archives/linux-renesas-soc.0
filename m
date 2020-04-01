Return-Path: <SRS0=ZyEX=5R=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E971C43331
	for <linux-renesas-soc@archiver.kernel.org>; Wed,  1 Apr 2020 19:40:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E458820714
	for <linux-renesas-soc@archiver.kernel.org>; Wed,  1 Apr 2020 19:40:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1585770041;
	bh=tNeeay6iEO6mHFlGzD7dbX0/lQVIxfkgSCdeXuGjSZE=;
	h=Subject:From:Date:To:List-ID:From;
	b=oZiyJj94e0HNDKmDGRJXl44WaoicNJ9iQyq6y/RM9OWhoJKE719zCwJJCdddzzZGo
	 qFtTLEj6e+MsOAStKR7Uf7EXAjZIiaYNUQF0PUZzl+2LSThuMLxoYEbSA+GajDpKWS
	 LcKp6f7LYCKHib/Ezy/04+NUYB16KRxgB4S4sxBk=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732637AbgDATkk (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 1 Apr 2020 15:40:40 -0400
Received: from mail.kernel.org ([198.145.29.99]:42606 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732560AbgDATkk (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 1 Apr 2020 15:40:40 -0400
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1585770040;
        bh=tNeeay6iEO6mHFlGzD7dbX0/lQVIxfkgSCdeXuGjSZE=;
        h=Subject:From:Date:To:From;
        b=TPAc0k8yXiZssYokoyck/rN6csSHlYc9EP/YKlLS9Sm/6nEAuy4dua6u7TPPS+vC1
         iMTZcdOlaWckQzCqOdy53C7Kd+Tz3GNZdQ1WQy2Pxg0ew5+GBIixtS3GzexNflfRrh
         ymgtZ7DV+KxbD3uqAna0B2sKXq5VwcZ64kokETz8=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork housekeeping for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <158577003996.27021.8662479611276368107.git-patchwork-housekeeping@kernel.org>
Date:   Wed, 01 Apr 2020 19:40:39 +0000
To:     linux-renesas-soc@vger.kernel.org
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Latest series: [v1] i2c: refactor parsing of timings (2020-04-01T19:30:18)
  Superseding: [v1] i2c: refactor parsing of timings (2020-03-26T10:16:47):
    [RFC] i2c: refactor parsing of timings


-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
