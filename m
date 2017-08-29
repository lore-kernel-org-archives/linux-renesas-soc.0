Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from smtp6-v.fe.bosch.de ([139.15.237.11]:42758 "EHLO
        smtp6-v.fe.bosch.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751223AbdH2Hvb (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 29 Aug 2017 03:51:31 -0400
Received: from vsmta13.fe.internet.bosch.com (unknown [10.4.98.53])
        by imta23.fe.bosch.de (Postfix) with ESMTP id 37B44158014F
        for <linux-renesas-soc@vger.kernel.org>; Tue, 29 Aug 2017 09:51:12 +0200 (CEST)
Received: from FE-HUB1000.de.bosch.com (vsgw23.fe.internet.bosch.com [10.4.98.23])
        by vsmta13.fe.internet.bosch.com (Postfix) with ESMTP id 7230E2E40A29
        for <linux-renesas-soc@vger.kernel.org>; Tue, 29 Aug 2017 09:51:29 +0200 (CEST)
To: <linux-renesas-soc@vger.kernel.org>
From: Dirk Behme <dirk.behme@de.bosch.com>
Subject: clk: renesas: rcar-gen3: Status of Z* clocks?
Message-ID: <705d6de1-a037-f1e1-8c61-7b5aa5e0f30a@de.bosch.com>
Date: Tue, 29 Aug 2017 09:51:28 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi,

as mentioned previously since ages I'm back looking at the RCar3 status 
in recent mainline (4.13-rc7). While doing so, it looks to me that some 
Z* clock patches from recent BSP

https://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas-bsp.git/log/?h=v4.9/rcar-3.5.8

are not in mainline clock configuration, yet. E.g.:

Takeshi Kihara | clk: renesas: r8a7795: Add ZG clock
Takeshi Kihara | clk: renesas: r8a7795: Add ZG clock
Takeshi Kihara | clk: renesas: r8a7795: Add Z2 clock
Takeshi Kihara | clk: renesas: r8a7795: Add Z clock
Takeshi Kihara | clk: renesas: rcar-gen3: Adjust output of PLL4 as 3DGE 
clock divider input
Takeshi Kihara | clk: renesas: rcar-gen3: Add ZG clock divider support
Dien Pham | clk: renesas: rcar-gen3: Add PLL0 clock errata workaround in 
PLL0 clk driver
Dien Pham | clk: renesas: rcar-gen3: Add PLL0 clk driver support
Dien Pham | clk: renesas: rcar-gen3: Adjust output of PLL0, PLL2 as 
SYSC-CPUs input
Takeshi Kihara | clk: renesas: rcar-gen3: Add Z2 clock divider support
Takeshi Kihara | clk: renesas: rcar-gen3: Add Z clock divider support

Are there any plans to pick these, already? Or, if not, would it be fine 
to pick them from the BSP and just submit them here? Or is some major 
rework needed?

Best regards

Dirk
