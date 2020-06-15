Return-Path: <SRS0=VuhC=74=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22021C433E0
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 15 Jun 2020 09:20:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F00A120663
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 15 Jun 2020 09:20:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1592212842;
	bh=BGL3AkwfAtLpnbSiA01SeLR1p1Vtso+NKg/J+pU7+AA=;
	h=Subject:From:Date:To:List-ID:From;
	b=qMrGhpDmXMnNqfI8p0jSVoC8/32Ca39gBvFwZ3m+faV6gtnoEz/V5COgRrrqlzvVd
	 6OLMql81HFpGgaIph8D2m0bgZru/qtMdDHZAUGFjoLvuHoBOv/zoQyTEJaHQiS9gRz
	 0O+psX6ZxZmIb9R7zT9ceNfpbecI/aDa7l/PNbH8=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729063AbgFOJUl (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 15 Jun 2020 05:20:41 -0400
Received: from mail.kernel.org ([198.145.29.99]:52906 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728865AbgFOJUl (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 15 Jun 2020 05:20:41 -0400
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1592212841;
        bh=BGL3AkwfAtLpnbSiA01SeLR1p1Vtso+NKg/J+pU7+AA=;
        h=Subject:From:Date:To:From;
        b=rKCJeWWWEw3WTV0ow4WhQUBVXTNyXXdGxePT9XQTKQTBXu40n4FMHVnCJr68wEKy5
         SEJLPg8uZoXxvl0R2kcrMScJE2lUdXBrkskQDyfmyPK4MQnsZoSYzU58KoPV1YMERJ
         mOP3zXlhe31In3VeRcyy6A91gLOsqgbirl1K+E2U=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork housekeeping for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <159221284139.17281.4821447854332624698.git-patchwork-housekeeping@kernel.org>
Date:   Mon, 15 Jun 2020 09:20:41 +0000
To:     linux-renesas-soc@vger.kernel.org
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Latest series: [v2] ARM: dts: r8a7742-iwg21d-q7-dbcm-ca: Add device tree for camera DB (2020-06-07T17:57:39)
  Superseding: [v1] ARM: dts: r8a7742-iwg21d-q7-dbcm-ca: Add device tree for camera DB (2020-05-27T13:29:01):
    ARM: dts: r8a7742-iwg21d-q7-dbcm-ca: Add device tree for camera DB


-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
