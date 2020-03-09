Return-Path: <SRS0=k1k+=42=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5F8AC10F27
	for <linux-renesas-soc@archiver.kernel.org>; Mon,  9 Mar 2020 09:20:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B4F6E20674
	for <linux-renesas-soc@archiver.kernel.org>; Mon,  9 Mar 2020 09:20:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1583745631;
	bh=CRCSImNEta993UrH5I+EMhlsew14j1Oh7EdpTWbstIw=;
	h=Subject:From:Date:References:To:List-ID:From;
	b=yua9z7IIffaa5cSqoSzFbG2f1u4GpR5KjG2hmg4lUXAZsrS8ocvJK89NKxtsHdjHz
	 tRI6JAeJ8+zuiQpIm/Odmqb0gSHfR46wuQDSsgSqh6AytL83s/fvYCwP1iZXWdJRrR
	 554LDQlClV52m0ewGCAnfzMs1ArhmPcgmmGVhyJ0=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725956AbgCIJUb (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 9 Mar 2020 05:20:31 -0400
Received: from mail.kernel.org ([198.145.29.99]:50702 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725796AbgCIJUb (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 9 Mar 2020 05:20:31 -0400
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1583745630;
        bh=CRCSImNEta993UrH5I+EMhlsew14j1Oh7EdpTWbstIw=;
        h=Subject:From:Date:References:To:From;
        b=L3WlnsNPuAX+oLmZzyApwjkrP0XwLinrtfel3otMZCADVYbblg4srPCqoM6u7brxw
         eTP7E++ipVQav4ZW6QbsLmRuvgmLVSj4fqAUxqZG+vWNqUv2JT5NQ5BT8pO8yzt8Rc
         5mupffN0tTgwIppUJI856s6jsk2NE6dETW00g+hM=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <158374563066.19788.5851545586601796068.git-patchwork-summary@kernel.org>
Date:   Mon, 09 Mar 2020 09:20:30 +0000
References: <1583336650-25848-1-git-send-email-marian-cristian.rotariu.rb@bp.renesas.com>
To:     linux-renesas-soc@vger.kernel.org
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
geert/renesas-devel (refs/heads/next):

Patch: [v2] ARM: dts: iwg22d-sodimm: Enable touchscreen
  Submitter: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=251331

Total patches: 1

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
