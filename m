Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F726C7EE22
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 10 May 2023 19:03:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235954AbjEJTDC (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 10 May 2023 15:03:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50246 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229555AbjEJTDB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 10 May 2023 15:03:01 -0400
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E6162703
        for <linux-renesas-soc@vger.kernel.org>; Wed, 10 May 2023 12:02:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:mime-version
        :content-transfer-encoding; s=k1; bh=xsUZISaadJhlH92DFScw3hXVyek
        Q2glsCLYxrO5cYjg=; b=ayCP+xpK6yCEAiSMzXQd+v1J6/1NsSGtt+jhyTOqXZV
        Xal7YhhhnzNboDcWSpgTSOOI88K18S4JY8jmPL7zeHca2zt6XefovqTApfUeUxHa
        MBCYBQcv2UH4iH7krI2FHmzrO2qAUJyp7CongClr/+mosZ+4zJ1QOKoWOL01txEA
        =
Received: (qmail 2541411 invoked from network); 10 May 2023 21:02:55 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 10 May 2023 21:02:55 +0200
X-UD-Smtp-Session: l3s3148p1@fGT7hFv70O0ujnsI
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pci@vger.kernel.org,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH v2 0/2] KingFisher: support regulators for PCIe
Date:   Wed, 10 May 2023 21:02:50 +0200
Message-Id: <20230510190252.19030-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Here are the patches to make PCIe cards work in the slot CN15 on a
KingFisher board. Look at the patches for a changelog, please.

   Wolfram

Wolfram Sang (2):
  dt-bindings: PCI: rcar-pci-host: add optional regulators
  PCI: rcar-host: add support for optional regulators

 .../devicetree/bindings/pci/rcar-pci-host.yaml | 11 +++++++++++
 drivers/pci/controller/pcie-rcar-host.c        | 18 +++++++++++++++++-
 2 files changed, 28 insertions(+), 1 deletion(-)

-- 
2.30.2

