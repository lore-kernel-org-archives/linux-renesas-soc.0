Return-Path: <SRS0=HWyP=AD=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42248C433E0
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 22 Jun 2020 02:40:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1F008206C3
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 22 Jun 2020 02:40:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1592793641;
	bh=2Ezv++cNrNZkh+e9jZW8Syl/hF2z9+bIzoYetAyLnwI=;
	h=Subject:From:Date:To:List-ID:From;
	b=fIrcIREd1IZBaRRXL7xiB4x5BnBuXA17JsEPTMPlZE8PBGZrVsTj8zDULNtya8ioV
	 vdwxO4GSdDHZ4HGWTn2f1YjbyNpv83J6ctkjXFVsMQdf+3gJFIQA/etpkZNewXw12R
	 jlG39aYlzEHQCaX37ms9bPHw42HGAL1zHf+fI8yU=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726696AbgFVCkk (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Sun, 21 Jun 2020 22:40:40 -0400
Received: from mail.kernel.org ([198.145.29.99]:42056 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726659AbgFVCkk (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 21 Jun 2020 22:40:40 -0400
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1592793639;
        bh=2Ezv++cNrNZkh+e9jZW8Syl/hF2z9+bIzoYetAyLnwI=;
        h=Subject:From:Date:To:From;
        b=PLIyBUf14L9dvPPc9VUkY+nKhDZTpfSuqNljMgCv5e40VrEbatTxV5uO+cszr0ghP
         4WtEKmwvDiQsM+fQc5nEnB6X/w05k8kk0ksaVPYijZ50d9+66nc3Z0o/MMQVPvV5QI
         aw9nZrsCBfJSOHN0TAUaqTckIjW7ZL0UQFl3YzeM=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork housekeeping for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <159279363992.29620.1792049771169134426.git-patchwork-housekeeping@kernel.org>
Date:   Mon, 22 Jun 2020 02:40:39 +0000
To:     linux-renesas-soc@vger.kernel.org
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Latest series: [v3] treewide: fix _mmc_suspend() on PSCI (2020-06-22T02:24:57)
  Superseding: [v2] treewide: fix _mmc_suspend() on PSCI (2020-06-19T11:29:01):
    [PATCH/RFC,v2,1/2] firmware: psci: call pm_set_suspend_via_firmware()
    [PATCH/RFC,v2,2/2] mmc: core: Call mmc_power_off_nofity() if pm_suspend_via_firmware()


-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
