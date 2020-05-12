Return-Path: <SRS0=HfrD=62=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B459C54E4B
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 12 May 2020 08:20:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4876B20674
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 12 May 2020 08:20:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1589271626;
	bh=V+20DPW+sNgN5gJDUGMNyyMdPpmVJTWdMq3ywTFNQCI=;
	h=Subject:From:Date:To:List-ID:From;
	b=gsAFAbowbAU/R1ciRS+Dns2yntm3Df0XRvgpc+VU9kDoFVYRnN6SemQ98yw9YnfTb
	 Qg2irAM+59rHw2JM/jaXvj5gtmEcZ68Nkqu0zRQM1X7NCGXHrpATOXQa+q6RUSzq6G
	 QN0osIPrRg1KSdeK4uQy+FaOaLd0JuU+gAZCpRSE=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725987AbgELIU0 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 12 May 2020 04:20:26 -0400
Received: from mail.kernel.org ([198.145.29.99]:51258 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725889AbgELIUZ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 12 May 2020 04:20:25 -0400
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1589271625;
        bh=V+20DPW+sNgN5gJDUGMNyyMdPpmVJTWdMq3ywTFNQCI=;
        h=Subject:From:Date:To:From;
        b=q7eCkys3FtwISY/SJ1PC3u33RQ7ir2QyW4phYGxkN6e2XXOkTr3QJO8M7IGqrL1oB
         EdLL8hrmtFjYiw49ZCTeDZhWB3SnSvhTGp6e+R1g4DlQqmDFC/i+Lof/hz4nJq44mQ
         EV9f4cDFLiy75PRbtDNlVMxsGtMYOsyqhgq3ZpK8=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <158927162570.11381.15818920578352559732.git-patchwork-summary@kernel.org>
Date:   Tue, 12 May 2020 08:20:25 +0000
To:     linux-renesas-soc@vger.kernel.org
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
geert/renesas-devel (refs/heads/next):

Patch: [v3] arm64: dts: renesas: r8a774c0-cat874: Add support for AISTARVISION MIPI Adapter V2.1
  Submitter: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=274135
  Link: <1587397794-11237-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>

Total patches: 1

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
