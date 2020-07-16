Return-Path: <SRS0=NDfh=A3=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BD6EC433EB
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 16 Jul 2020 09:20:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D410C2074B
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 16 Jul 2020 09:20:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1594891233;
	bh=H9IU3GE51OTI2q1fjGdQbSph8wyjbic7FeE2qxvnxsU=;
	h=Subject:From:Date:To:List-ID:From;
	b=z9C2l1Llb5GwuRv9aDGN6X+J2L4uAeypTdSXfJw0c5BEiVQUGmMOnjOpp/m2qNQav
	 NoV5m8pPLF75PawwuRYq3lGWPl1l4GMWMIuhDPIfvkFdmrp0EBtZkFbPHR7n7qcpr9
	 FpxQca8nkHqY2z8ZFnN6J8LZ1yRLHiMdZAvCrFHI=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726440AbgGPJUd (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 16 Jul 2020 05:20:33 -0400
Received: from mail.kernel.org ([198.145.29.99]:54978 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726201AbgGPJUd (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 16 Jul 2020 05:20:33 -0400
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1594891233;
        bh=H9IU3GE51OTI2q1fjGdQbSph8wyjbic7FeE2qxvnxsU=;
        h=Subject:From:Date:To:From;
        b=AOxwBeb0NulQyIOD7KIIpCU6cIPtm5kw9Oodw2qMo8Um/l9d1ulAkECBXPvz6ftfQ
         si8+Rtq2whyqFsdG5/jglH7DjAOGMDbeeLKGkIPM5xnMOMQg7ZvCnJkKeNw7QCWYvo
         LVjYDBBYQVQcp49u2gQjAOFeDv5vOiamwFCrunlM=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <159489123309.24932.6356597361384590313.git-patchwork-summary@kernel.org>
Date:   Thu, 16 Jul 2020 09:20:33 +0000
To:     linux-renesas-soc@vger.kernel.org
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
geert/renesas-devel (refs/heads/next):

Patch: ARM: dts: gose: Fix ports node name for adv7612
  Submitter: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=317221
  Link: <20200713111016.523189-1-niklas.soderlund+renesas@ragnatech.se>

Patch: [V3] arm64: dts: Introduce r8a774a1-beacon-rzg2m-kit
  Submitter: Adam Ford <aford173@gmail.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=318749
  Link: <20200715140622.1295370-1-aford173@gmail.com>

Series: ARM: dts: renesas: Cleanup ADV7180 bindings
  Submitter: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=312929
  Link: <20200704155856.3037010-1-niklas.soderlund+renesas@ragnatech.se>
    Patches: [1/2] ARM: dts: gose: Fix ports node name for adv7180
             [2/2] ARM: dts: renesas: Remove unused remote property from adv7180 nodes

Patch: arm64: dts: renesas: add full-pwr-cycle-in-suspend into eMMC nodes
  Submitter: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=316311
  Link: <1594382612-13664-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>

Patch: arm64: dts: renesas: Fix SD Card/eMMC interface device node names
  Submitter: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=316313
  Link: <1594382634-13714-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>

Patch: ARM: dts: shmobile: Fix SD Card/eMMC interface device node names
  Submitter: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=316319
  Link: <1594382936-14114-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>

Total patches: 7

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
