Return-Path: <SRS0=jGGc=5P=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11D36C43331
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 30 Mar 2020 09:40:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D3EF520714
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 30 Mar 2020 09:40:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1585561234;
	bh=QHEM/LAqd7jBB+119qo4nn2U+37XUNOxY1FhEjMPIqA=;
	h=Subject:From:Date:To:List-ID:From;
	b=gnuKyG4R2RD8YvA29EPeYelc2VqIrgaQbpPy0oGi75SssSLLNiSE0kyZ1gXoqL2ci
	 snsQrQzY6alUcvzqFE0Te/390YiQ/DcT7ZvqDf2uvAKn01FmErNPNY80zl1eHRzi3z
	 hUpqx4B3FYYANsZ8+zZ+br3eErZAPtL8tdd52Izg=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728386AbgC3Jke (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 30 Mar 2020 05:40:34 -0400
Received: from mail.kernel.org ([198.145.29.99]:59976 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728152AbgC3Jke (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 30 Mar 2020 05:40:34 -0400
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1585561233;
        bh=QHEM/LAqd7jBB+119qo4nn2U+37XUNOxY1FhEjMPIqA=;
        h=Subject:From:Date:To:From;
        b=BJg5NRLF95p94aa9T9msRgPo0qVTHWpD7LaDTCFoQ0PkruhWzDHnOSTbLJlxdKQfQ
         z3G0vTBFysDbCyYNelt7UF8FWrSHqGTXA7Vyw6Hnc6kc6NLoLMutVxTOUtDbFqcnLI
         UV4V2tBEWQV3Sh6IBftHXgGiLuA9VCPPiIQLReZs=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <158556123388.415.5174973344539671041.git-patchwork-summary@kernel.org>
Date:   Mon, 30 Mar 2020 09:40:33 +0000
To:     linux-renesas-soc@vger.kernel.org
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
geert/renesas-devel (refs/heads/master):

Series: arm64: dts: renesas: add USB2.0/3.0 device nodes for r8a77961
  Submitter: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=261205
  Link: <1585117470-8625-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
    Patches: [PATCH/RFC,1/2] arm64: dts: renesas: add USB2.0 device nodes for r8a77961
             [PATCH/RFC,2/2] arm64: dts: renesas: add USB3.0 device nodes for r8a77961

Total patches: 2

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
