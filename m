Return-Path: <SRS0=PRPy=CV=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91785C433E2
	for <linux-renesas-soc@archiver.kernel.org>; Sat, 12 Sep 2020 10:40:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4A85420796
	for <linux-renesas-soc@archiver.kernel.org>; Sat, 12 Sep 2020 10:40:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1599907248;
	bh=Id2udq4wSztiUdEWO8a7M92pPGpo3byh/iRLfceJS/0=;
	h=Subject:From:Date:To:List-ID:From;
	b=ckMKFt64Do6D9KF92VD6DjE0/4BVHmPOpOmOk9Tg2kF00+vKRr+xRyrcOFBOnv3iU
	 75cbYEOtzwGQrrnnAn6scd1Qn8TpW9g2FYXJsiPUu3WMCvIP+cCji4tWLSxMwLWeSh
	 cHFToPuwsoojSxRjukEPNbZyoBlO9L2+94YecOvA=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725836AbgILKks (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Sat, 12 Sep 2020 06:40:48 -0400
Received: from mail.kernel.org ([198.145.29.99]:44616 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725825AbgILKkp (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 12 Sep 2020 06:40:45 -0400
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1599907245;
        bh=Id2udq4wSztiUdEWO8a7M92pPGpo3byh/iRLfceJS/0=;
        h=Subject:From:Date:To:From;
        b=lqAZ0cbuLveX03C7yFREfAzkDybK/Z0jM/mgC5P7+yDmgl0UgLY7l1K8fpPqTMhuH
         Lq36dJ5NR9d7Pdg3AvAgpmvPjqIyzfyI6fZJq80SymMgHGHUErJESMf9IN8/dBCdrX
         gZv7aESnFufOOXhKxhn67hZ0kyPalHdAZ7i9rpqo=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork housekeeping for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <159990724539.32404.14184112862355275460.git-patchwork-housekeeping@kernel.org>
Date:   Sat, 12 Sep 2020 10:40:45 +0000
To:     linux-renesas-soc@vger.kernel.org
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Latest series: [v6] dt-bindings: media: imx274: Convert to json-schema (2020-09-12T10:30:45)
  Superseding: [v5] dt-bindings: media: imx274: Convert to json-schema (2020-09-10T16:20:09):
    [v5] dt-bindings: media: imx274: Convert to json-schema


-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
