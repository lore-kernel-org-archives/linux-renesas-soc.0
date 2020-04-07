Return-Path: <SRS0=/sC/=5X=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62B51C2BA1A
	for <linux-renesas-soc@archiver.kernel.org>; Tue,  7 Apr 2020 16:00:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2341720768
	for <linux-renesas-soc@archiver.kernel.org>; Tue,  7 Apr 2020 16:00:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1586275239;
	bh=EfDUve3TBmCpYrJv+aj5K1kkzlbF1NhTfF8YVQ+2N6k=;
	h=Subject:From:Date:To:List-ID:From;
	b=obiVXxtG5htf7TnJNm2nF3BT/eVeO5F9NFQm0IEs2gCViPrmeCZ4okPyOCw8HFjrU
	 bUQCZ+nbgCzC/LsUMk3zm/yyALdyCfdRAAaL03uRa8ScXkwrkqH/Ub/uxgCaL1AZz7
	 RqRKXGqD71U4F7R6M7QkohYA88H1p1yr8qO6JWjY=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726937AbgDGQAi (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 7 Apr 2020 12:00:38 -0400
Received: from mail.kernel.org ([198.145.29.99]:38944 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726930AbgDGQAi (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 7 Apr 2020 12:00:38 -0400
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1586275238;
        bh=EfDUve3TBmCpYrJv+aj5K1kkzlbF1NhTfF8YVQ+2N6k=;
        h=Subject:From:Date:To:From;
        b=QAGxDjfNMYpKmGXSYUDFs2R1KLqGMlJHNosJtatu5Pj7HkJEdI3+YlTIIfvx2Py7a
         PmbQ9czbhOqrWcdUwn34ZLvE8G22zV4tLe9HLfP4CwyWU6xfmCQQQHRL27cET9zswG
         yql287pGM5B4b1TQh/RjYBpNyuWny3oaKboMgNO8=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork housekeeping for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <158627523810.30991.4114217156921806490.git-patchwork-housekeeping@kernel.org>
Date:   Tue, 07 Apr 2020 16:00:38 +0000
To:     linux-renesas-soc@vger.kernel.org
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Latest series: [v2] media: platform: fcp: Set appropriate DMA parameters (2020-04-07T15:44:17)
  Superseding: [v1] media: platform: fcp: Set appropriate DMA parameters (2020-03-18T17:23:38):
    [RFC] media: platform: fcp: Set appropriate DMA parameters


-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
