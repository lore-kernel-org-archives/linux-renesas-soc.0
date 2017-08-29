Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from smtp6-v.fe.bosch.de ([139.15.237.11]:46086 "EHLO
        smtp6-v.fe.bosch.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751310AbdH2H71 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 29 Aug 2017 03:59:27 -0400
Received: from vsmta11.fe.internet.bosch.com (unknown [10.4.98.51])
        by imta23.fe.bosch.de (Postfix) with ESMTP id 788B81580219
        for <linux-renesas-soc@vger.kernel.org>; Tue, 29 Aug 2017 09:59:08 +0200 (CEST)
Received: from SI-HUB1001.de.bosch.com (vsgw22.fe.internet.bosch.com [10.4.98.11])
        by vsmta11.fe.internet.bosch.com (Postfix) with ESMTP id 8EB39238055F
        for <linux-renesas-soc@vger.kernel.org>; Tue, 29 Aug 2017 09:59:25 +0200 (CEST)
From: Dirk Behme <dirk.behme@de.bosch.com>
Subject: spi: sh-msiof: Status of fixes from BSP?
To: <linux-renesas-soc@vger.kernel.org>
Message-ID: <a7a97218-c0ba-eb05-37f2-dd8b21541bdd@de.bosch.com>
Date: Tue, 29 Aug 2017 09:59:23 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi,

as mentioned previously since ages I'm back looking at the RCar3 status 
in recent mainline (4.13-rc7). While doing so, it looks to me that some 
msiof fixes from recent BSP

https://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas-bsp.git/log/?h=v4.9/rcar-3.5.8

are not in mainline, yet. E.g.:

Hiromitsu Yamasaki | spi: sh-msiof: Add registers reset
Hiromitsu Yamasaki | spi: sh-msiof: Fix gpio function
Hiromitsu Yamasaki | spi: sh-msiof: Add MSIOF parent clock changing 
function for R-Car Gen3
Hiromitsu Yamasaki | spi: sh-msiof: Wait for Tx FIFO empty after DMA
Ryo Kataoka | spi: sh-msiof: Fix DMA completion
Ryo Kataoka | spi: sh-msiof: Fix MSIOF address for DMAC
Hiromitsu Yamasaki | spi: sh-msiof: Fix DMA transfer size check
Hiromitsu Yamasaki | spi: sh-msiof: Add sleep before master transfer for 
test

seem to be needed to make msiof in mainline work reliably on larger files.

Are there any plans to pick these, already? Or, if not, would it be fine 
to pick them from the BSP and just submit them here? Or is some major 
rework needed?

Best regards

Dirk
