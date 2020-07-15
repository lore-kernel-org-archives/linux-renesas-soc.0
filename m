Return-Path: <SRS0=PQ6+=A2=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96001C433E4
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 15 Jul 2020 09:20:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 72F3E2064B
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 15 Jul 2020 09:20:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1594804846;
	bh=EUeksOcZoV7meryAkccbsL3Of8fCDbvx8IXBZNFrLA0=;
	h=Subject:From:Date:To:List-ID:From;
	b=tZS/fUtGvBIktSSTAJKloS0/wNZ3pfAZ+olE4yrZIiw+Gkqcxh3BXEnslEi7C8ipX
	 RpkwdyMTTb4GOVSq89hLQDp0DWgp89qhT0yaUMgyQn7Css8hg08H/D39d3MYNQaoH6
	 J8j32l2Iaxyv2pluzPVY15r6xvXln7lm/iY1asVw=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730390AbgGOJUq (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 15 Jul 2020 05:20:46 -0400
Received: from mail.kernel.org ([198.145.29.99]:38160 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730611AbgGOJUq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 15 Jul 2020 05:20:46 -0400
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1594804845;
        bh=EUeksOcZoV7meryAkccbsL3Of8fCDbvx8IXBZNFrLA0=;
        h=Subject:From:Date:To:From;
        b=K7XKryjxWmVZBJMf/zpT/RcHPWz2/eY6RuVK7sBoG7+A6DBwL7QTt2R2U+6SRFiSO
         diMsXQSjg13ITOVTskaS7tsyP3/zj9BugrlVjKlor+rUQ3Vz8XrBAye8Xgy6v9h5tF
         BPmOT42PDvhyBKuvfAsyADRrYiDMXewhuT97fZtg=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork housekeeping for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <159480484591.31571.10464876877519867680.git-patchwork-housekeeping@kernel.org>
Date:   Wed, 15 Jul 2020 09:20:45 +0000
To:     linux-renesas-soc@vger.kernel.org
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Latest series: [v2] dt-bindings: adv7604: Convert bindings to json-schema (2020-07-15T09:14:52)
  Superseding: [v1] dt-bindings: adv7604: Convert bindings to json-schema (2020-07-13T11:18:41):
    [1/3] dt-bindings: adv7604: Fix documentation for hpd-gpios
    [2/3] dt-bindings: adv7604: Convert bindings to json-schema
    [3/3] MAINTAINERS: Add ADV7604 bindings documentation


-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
