Return-Path: <SRS0=b7wF=YT=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97B5ACA9EBD
	for <linux-renesas-soc@archiver.kernel.org>; Sat, 26 Oct 2019 18:40:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6D0C12084C
	for <linux-renesas-soc@archiver.kernel.org>; Sat, 26 Oct 2019 18:40:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1572115237;
	bh=FqfZz/0yUsW/EvSLjVPvAF+u/2jTT992/T4QVJ46HXA=;
	h=Subject:From:Date:To:List-ID:From;
	b=Hj5SWrHXrvG+w9RcF9uGHGMBQNUClN1SAlMLopJKZEV1DNswq2S6ebEFOe0f3c0Q7
	 dc+mEWBzV2XY3ryXx1y+wlOG4hzN3hYzX3Jt0Po2eNaqdoRn2f8TaCgTB4s5cfHgfO
	 5gezcgJTvCmuOe+JUJQ5bPsGyMleYUCuLJF2d2Fw=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726107AbfJZSkh (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Sat, 26 Oct 2019 14:40:37 -0400
Received: from mail.kernel.org ([198.145.29.99]:36782 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726087AbfJZSkg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 26 Oct 2019 14:40:36 -0400
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1572115236;
        bh=FqfZz/0yUsW/EvSLjVPvAF+u/2jTT992/T4QVJ46HXA=;
        h=Subject:From:Date:To:From;
        b=z7NduPU1N7XaJuCf2BHMuFoNZZMSpyXM2UvkWSYoJw02UKApcJ5CtHHX6RmmTGllz
         HpmBj97TaZVg60ktWVA3zhLr+/A4ubmI9NuoUpudwi4pXkHNh2vUzQ5kSUb1hTHs2h
         JukLYGnp9qCZvtOOMDTRdVTJK3ZsM3740jMPQXek=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork housekeeping for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <157211523659.30544.6166540563929984881.git-patchwork-housekeeping@kernel.org>
Date:   Sat, 26 Oct 2019 18:40:36 +0000
To:     linux-renesas-soc@vger.kernel.org
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Latest series: [v4] PCI: rcar: Move the inbound index check (2019-10-26T18:26:58)
  Superseding: [v3] PCI: rcar: Move the inbound index check (2019-08-09T17:57:39):
    [V3,1/3] PCI: rcar: Move the inbound index check
    [V3,2/3] PCI: rcar: Do not abort on too many inbound dma-ranges
    [V3,3/3] PCI: rcar: Recalculate inbound range alignment for each controller entry


-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
