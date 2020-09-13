Return-Path: <SRS0=ZD6s=CW=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54497C433E2
	for <linux-renesas-soc@archiver.kernel.org>; Sun, 13 Sep 2020 12:20:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 06ACC2158C
	for <linux-renesas-soc@archiver.kernel.org>; Sun, 13 Sep 2020 12:20:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1599999645;
	bh=mfo7GgrBiqBWn3P8dhmVhO1Ux4Yh60cBRDkM0hu5VK8=;
	h=Subject:From:Date:To:List-ID:From;
	b=O6ncRxMJSmRcwwAUMzwDZjrgqn0L5+3jmHDoMW/QGP9ZyXAhmywSoO/iGKmmZ9d57
	 fzk33JLcy2R4j1hJE/UBrGbsDnunSSo1PQ97o58Ac7Pw0R2LaCvyOhxgq2YtGTqm7A
	 1ZjsB9A8CXCKwGOyuZVI7KhekIWhpJr9t/RjcTuI=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725929AbgIMMUo (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Sun, 13 Sep 2020 08:20:44 -0400
Received: from mail.kernel.org ([198.145.29.99]:47606 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725928AbgIMMUn (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 13 Sep 2020 08:20:43 -0400
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1599999643;
        bh=mfo7GgrBiqBWn3P8dhmVhO1Ux4Yh60cBRDkM0hu5VK8=;
        h=Subject:From:Date:To:From;
        b=2D+LZCVGRv3aaEqewVXWKQZo5DwnBc2uNGCnHYHG3Pb920v0iOtrJ8D5fdcGMp7m0
         BStrVFfeH54yPt1fP9TG9jaDBS/21RGK86KmlpMFnqC5xs/iIqldatP/Y0c2h5yXFz
         GhUpGHr3eFRcKDhRWd/sEGOf/86fs3LqE+9QdkY4=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork housekeeping for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <159999964294.31639.11983522005533116778.git-patchwork-housekeeping@kernel.org>
Date:   Sun, 13 Sep 2020 12:20:42 +0000
To:     linux-renesas-soc@vger.kernel.org
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Latest series: [v2] rcar-vin: Remove redundant compatible values (2020-09-13T12:17:56)
  Superseding: [v1] rcar-vin: Remove redundant compatible values (2020-08-02T17:30:59):
    rcar-vin: Remove redundant compatible values


-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
