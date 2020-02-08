Return-Path: <SRS0=+9Fu=34=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B99FC35242
	for <linux-renesas-soc@archiver.kernel.org>; Sat,  8 Feb 2020 18:40:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5302220661
	for <linux-renesas-soc@archiver.kernel.org>; Sat,  8 Feb 2020 18:40:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1581187237;
	bh=9b1akVJX7mw8EVWnGwbOh8ec3oeoj3Epm6NpEBPIMvM=;
	h=Subject:From:Date:To:List-ID:From;
	b=FoZYjeeJ68zcg97hgYN1UKR4AUrgL1GNANjBmw1eifwu1EVc1Urw1BHqx5qreyNVe
	 c01MRgm9h5rLYC5d58PcE1bDQXEYhMKisTZO4sLslAEs+P7WTxLxeTuM1nT3cZoVEA
	 MKLyAforGWnQg5a5rIjgPa3EopYfKAlOMWKmWVFk=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727484AbgBHSkh (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Sat, 8 Feb 2020 13:40:37 -0500
Received: from mail.kernel.org ([198.145.29.99]:57104 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727471AbgBHSkg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 8 Feb 2020 13:40:36 -0500
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1581187236;
        bh=9b1akVJX7mw8EVWnGwbOh8ec3oeoj3Epm6NpEBPIMvM=;
        h=Subject:From:Date:To:From;
        b=FvUNkM8YDH2wuCXHUAsscNuFXMNm+ncsigWmocCDfwQuLgQRKTsSkMPYJCDuudniT
         7+1nenBxqFQbjSCzcJsVhh78nNuKghHZMVHp2YI4ZgRZL0WYEvZTjuuIdJZsmJ0MQa
         9QVEuwpMi2AejWXy2LgH7HwLaMQvf/wXzwShz26Q=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork housekeeping for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <158118723632.23048.10106589837381382428.git-patchwork-housekeeping@kernel.org>
Date:   Sat, 08 Feb 2020 18:40:36 +0000
To:     linux-renesas-soc@vger.kernel.org
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Latest series: [v4] Add support for PCIe controller to work in endpoint mode on R-Car SoCs (2020-02-08T18:36:35)
  Superseding: [v3] Add support for PCIe controller to work in endpoint mode on R-Car SoCs (2020-01-08T16:22:08):
    [v3,1/6] PCI: rcar: Preparation for adding endpoint support
    [v3,2/6] PCI: rcar: Fix calculating mask for PCIEPAMR register
    [v3,3/6] PCI: endpoint: Add support to handle multiple base for mapping outbound memory
    [v3,4/6] dt-bindings: PCI: rcar: Add bindings for R-Car PCIe endpoint controller
    [v3,5/6] PCI: rcar: Add support for rcar PCIe controller in endpoint mode
    [v3,6/6] misc: pci_endpoint_test: Add Device ID for RZ/G2E PCIe controller


-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
