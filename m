Return-Path: <SRS0=cZdi=6E=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B03C5C3815B
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 20 Apr 2020 16:00:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8386E20775
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 20 Apr 2020 16:00:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1587398440;
	bh=DRpXWSgXI3CuPaRaoDPlBG0VrtsgcW2ZVdqLSpmCaoQ=;
	h=Subject:From:Date:To:List-ID:From;
	b=SlYVVXEqpXUVD3iBkDAacletWpv+M4wewqbBN30wdNNZ6wvWaHau8rQ9iYIsmClk0
	 bDdzVtGnWCeHNbXfU5wcpDbQ9tn9Sj8xYurKEAHFfE7sux7W/H/KQ/pmBBuQN8BoaF
	 LUmv/KYj0iMxHFXachUCAbttjw7Z3dW7/BE/ZkbA=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726061AbgDTQAk (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 20 Apr 2020 12:00:40 -0400
Received: from mail.kernel.org ([198.145.29.99]:44386 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726048AbgDTQAk (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 20 Apr 2020 12:00:40 -0400
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1587398439;
        bh=DRpXWSgXI3CuPaRaoDPlBG0VrtsgcW2ZVdqLSpmCaoQ=;
        h=Subject:From:Date:To:From;
        b=rXExzRbCLy8c/l+NMEVOq0kcEUHWHH6BCBt47oH7q4dW4azQhtulI8fXcIweKlodD
         JLqvfZCkYj3+R6KRIbnnuW1Sf69o0kCEiBp5ZNCG3lxTcNGv9w4nXPf35BdQTTF7Ci
         wQAhauYZZgDIWg4ag/ZE/VtKWM3egV4pqt7L11gQ=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork housekeeping for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <158739843989.32135.8524419407964202447.git-patchwork-housekeeping@kernel.org>
Date:   Mon, 20 Apr 2020 16:00:39 +0000
To:     linux-renesas-soc@vger.kernel.org
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Latest series: [v3] arm64: dts: renesas: r8a774c0-cat874: Add support for AISTARVISION MIPI Adapter V2.1 (2020-04-20T15:49:54)
  Superseding: [v2] arm64: dts: renesas: r8a774c0-cat874: Add support for AISTARVISION MIPI Adapter V2.1 (2020-03-22T14:12:32):
    [v2] arm64: dts: renesas: r8a774c0-cat874: Add support for AISTARVISION MIPI Adapter V2.1


-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
