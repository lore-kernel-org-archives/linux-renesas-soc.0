Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5350EE7D0A2
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 21 Sep 2023 18:59:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230442AbjIUS7g (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 21 Sep 2023 14:59:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55580 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229449AbjIUS7X (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 21 Sep 2023 14:59:23 -0400
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD0AFB013F
        for <linux-renesas-soc@vger.kernel.org>; Thu, 21 Sep 2023 11:53:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        sang-engineering.com; h=from:to:cc:subject:date:message-id
        :mime-version:content-transfer-encoding; s=k1; bh=y8o79FHdabjEPn
        jWLjdB26M9KWz8RCPY9ifxMIEHMGc=; b=MVcd6bJnYWG6biK7bUv2RcxwvpGgWa
        YYqLMYU9XQ7X1Dy+E/1tb4lSNnJ3NL1gqoPUwp3CKcRPgAWYF8VvyJk0iWaT8Tq/
        F5Q5IiIyZA45b7DwNgG1lPmxaKCRkaZ/StSDIMgc2iNl7Nqkh4i6EO8zb6mnZN2y
        QjOGSeXqKRlbA5hQtgdaCRofeCTxKnEDdidYoKUBBmwVg7Jp548TY/PwVFktcq2m
        nXmwZmJC4ExGqWh4PH/cIxK7jNDDtS8FgVU5Bht2zWhssPKWFVOIENAOTnNL4utV
        NlWAoGjFQvZp80nIAhYj/e8YsgbmlUdiVClYh6JBIA18cF6RCYvlVIhg==
Received: (qmail 962533 invoked from network); 21 Sep 2023 15:26:41 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 21 Sep 2023 15:26:41 +0200
X-UD-Smtp-Session: l3s3148p1@ZYw+cd4FRgsuciJ+
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pci@vger.kernel.org,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH v5 0/2] PCI: rcar: support regulators for PCIe
Date:   Thu, 21 Sep 2023 15:26:22 +0200
Message-Id: <20230921132624.5664-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Here are the patches to make PCIe cards work in slot CN15 on a Renesas
KingFisher board. Please apply.

Changes since v4:
* rebased to 6.6-rc2
* added ack from Mani (Thanks!)

Wolfram Sang (2):
  dt-bindings: PCI: rcar-pci-host: add optional regulators
  PCI: rcar-host: add support for optional regulators

 .../devicetree/bindings/pci/rcar-pci-host.yaml   | 11 +++++++++++
 drivers/pci/controller/pcie-rcar-host.c          | 16 +++++++++++++++-
 2 files changed, 26 insertions(+), 1 deletion(-)

-- 
2.35.1

