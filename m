Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lj1-f194.google.com ([209.85.208.194]:34835 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726455AbeGOQXu (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 15 Jul 2018 12:23:50 -0400
Received: by mail-lj1-f194.google.com with SMTP id p10-v6so22512014ljg.2
        for <linux-renesas-soc@vger.kernel.org>; Sun, 15 Jul 2018 09:00:25 -0700 (PDT)
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH 0/8] Fix PCI I/O space page leaks
To: Bjorn Helgaas <bhelgaas@google.com>, linux-pci@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Jingoo Han <jingoohan1@gmail.com>,
        Joao Pinto <Joao.Pinto@synopsys.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
        Rob Herring <robh@kernel.org>,
        Tanmay Inamdar <tinamdar@apm.com>,
        Ryder Lee <ryder.lee@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org
Message-ID: <3e862a05-084a-d732-3060-6e2b234e9718@cogentembedded.com>
Date: Sun, 15 Jul 2018 19:00:21 +0300
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello!

Here's a set of 8 patches against the 'pci/controller-fixes' branch of Lorenzo
Pieralisi's 'pci.git' repo. They are the fixes for the PCI I/O space page leaks
(and the kernel BUG caused by them on deferred probe); those were 1st found
testing the R-Car PCIe driver. The patches are in the chronological order
(considering the date/time of the commits specified in the Fixes: tag), patches
#2..#8 depend on the patch #1 in order to build/work as it introduces the managed
device API that they all use...

[1/8] PCI: xgene: Fix I/O space page leak
[2/8] PCI: of: Fix I/O space page leak
[3/8] PCI: versatile: Fix I/O space page leak
[4/8] PCI: designware: Fix I/O space page leak
[5/8] PCI: aardvark: Fix I/O space page leak
[6/8] PCI: faraday: Fix I/O space page leak
[7/8] PCI: mediatek: Fix I/O space page leak
[8/8] PCI: v3-semi: Fix I/O space page leak

MBR, Sergei
