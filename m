Return-Path: <SRS0=JlV5=CU=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1792C2BC11
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 11 Sep 2020 10:00:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B013B221E3
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 11 Sep 2020 10:00:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1599818449;
	bh=aGNhQOAUuGKbHE1Lg3PUcZHKM6/oTxbJCtqm9TcSw10=;
	h=Subject:From:Date:To:List-ID:From;
	b=JQS02XRwuKjhW4+Bt0u3yoySyeSqtZEyJvjZ8JirygQt2o3mUd5vrSvyVKOELi9NM
	 ImKH2TSXR604gzOLkC++u6c3A2XOwPy7hNAPy5rhq85qSW6MqbfKXZkPrPCEROGdUI
	 9QO71DBnPAKrgnUjx3q04wlowdy6DfEdVDPFrFIM=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725849AbgIKKAs (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 11 Sep 2020 06:00:48 -0400
Received: from mail.kernel.org ([198.145.29.99]:56564 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725826AbgIKKAq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 11 Sep 2020 06:00:46 -0400
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1599818445;
        bh=aGNhQOAUuGKbHE1Lg3PUcZHKM6/oTxbJCtqm9TcSw10=;
        h=Subject:From:Date:To:From;
        b=Pcq3k6Nhg/M+sp6J/DETmsPySZv79Wjr23076y35rQzzRmaeecLCLJY1UrpnRWRp9
         2V7HbI/NKuS0piYfBNAAJLua5vSfqupDa06zd6AoVmnlzJ8jNcwzIleINROmRSAFHE
         VldgRNYuFT+BpgDpPE5MPUXKyWgYnILOsGYwp+tE=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork housekeeping for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <159981844560.6982.3444380430709278627.git-patchwork-housekeeping@kernel.org>
Date:   Fri, 11 Sep 2020 10:00:45 +0000
To:     linux-renesas-soc@vger.kernel.org
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Latest series: [v2] dmaengine: Kconfig: Update description for RCAR_DMAC config (2020-09-11T09:57:34)
  Superseding: [v1] dmaengine: Kconfig: Update description for RCAR_DMAC config (2020-09-08T11:06:40):
    dmaengine: Kconfig: Update description for RCAR_DMAC config


-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
