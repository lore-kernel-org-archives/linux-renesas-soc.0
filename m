Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-pf0-f195.google.com ([209.85.192.195]:34342 "EHLO
        mail-pf0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752972AbeFGMMJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 7 Jun 2018 08:12:09 -0400
Received: by mail-pf0-f195.google.com with SMTP id a63-v6so4839325pfl.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 07 Jun 2018 05:12:09 -0700 (PDT)
From: Yoshihiro Kaneko <ykaneko0929@gmail.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH/RFT 0/2] Add PCIe support for r8a77965
Date: Thu,  7 Jun 2018 21:11:32 +0900
Message-Id: <1528373494-18503-1-git-send-email-ykaneko0929@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

This series adds PCIe support for r8a77965 (R-Car M3-N).
It is not necessary to update driver and PFC.

This series is based on the devel branch of Simon Horman's renesas tree.

Takeshi Kihara (1):
  arm64: dts: renesas: r8a77965: Add PCIe device nodes

Yoshihiro Kaneko (1):
  PCI: rcar: Add compatible string for r8a77965

 Documentation/devicetree/bindings/pci/rcar-pci.txt |  1 +
 arch/arm64/boot/dts/renesas/r8a77965.dtsi          | 48 +++++++++++++++++++++-
 2 files changed, 47 insertions(+), 2 deletions(-)

-- 
1.9.1
