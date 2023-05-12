Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE7A2C7EE25
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 12 May 2023 07:53:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239969AbjELHxI (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 12 May 2023 03:53:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53900 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240121AbjELHxF (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 12 May 2023 03:53:05 -0400
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63500E72A
        for <linux-renesas-soc@vger.kernel.org>; Fri, 12 May 2023 00:52:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:mime-version
        :content-transfer-encoding; s=k1; bh=fGnndaVe2AbNaeC2Z7Qto0a0xJk
        pj2MxEnusymMsFk8=; b=MTCtzI7xqNSFdMYAvRQhZ9lbu6btiXW/qnfCwCe+h1L
        2xj0aUakPiSk4j3PXz3HhIP9inn/IuZtQomp5pRNENF5s6oftTknRbb9QnNmNeJ4
        svwtHjwCgaQVLoNsa3ZuBujanGOcP9YsWfV3IRZ6wKpI4Egq5LG0KCOW7uc/gOX4
        =
Received: (qmail 3101804 invoked from network); 12 May 2023 09:52:45 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 12 May 2023 09:52:45 +0200
X-UD-Smtp-Session: l3s3148p1@aV7zY3r79rUujnsI
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pci@vger.kernel.org,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH v3 0/2] KingFisher: support regulators for PCIe
Date:   Fri, 12 May 2023 09:52:39 +0200
Message-Id: <20230512075241.2770-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Here are the patches to make PCIe cards work in the slot CN15 on a
KingFisher board. Look at the patches for a changelog, please.


Wolfram Sang (2):
  dt-bindings: PCI: rcar-pci-host: add optional regulators
  PCI: rcar-host: add support for optional regulators

 .../devicetree/bindings/pci/rcar-pci-host.yaml   | 11 +++++++++++
 drivers/pci/controller/pcie-rcar-host.c          | 16 +++++++++++++++-
 2 files changed, 26 insertions(+), 1 deletion(-)

-- 
2.30.2

