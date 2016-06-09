Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from smtp6-v.fe.bosch.de ([139.15.237.11]:46862 "EHLO
	smtp6-v.fe.bosch.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750881AbcFIG4f (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Thu, 9 Jun 2016 02:56:35 -0400
Received: from vsmta14.fe.internet.bosch.com (unknown [10.4.98.54])
	by imta23.fe.bosch.de (Postfix) with ESMTP id 89D011580214
	for <linux-renesas-soc@vger.kernel.org>; Thu,  9 Jun 2016 08:56:33 +0200 (CEST)
Received: from FE-HUB1001.de.bosch.com (vsgw23.fe.internet.bosch.com [10.4.98.23])
	by vsmta14.fe.internet.bosch.com (Postfix) with ESMTP id 0C308A40858
	for <linux-renesas-soc@vger.kernel.org>; Thu,  9 Jun 2016 08:56:33 +0200 (CEST)
To: <linux-renesas-soc@vger.kernel.org>
From: Dirk Behme <dirk.behme@de.bosch.com>
Subject: R-Car3: PFC: Where to do the pinmux/drvctrl?
CC: "Keshavarzi Pooya (CM/ESO1)" <Pooya.Keshavarzi@de.bosch.com>
Message-ID: <bc98025b-74dd-5b9d-0e0b-9672d4a38afd@de.bosch.com>
Date: Thu, 9 Jun 2016 08:56:32 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi,

with the R-Car3, the pinmux/drvctrl is done at 3 places:

1. ARM trusted firmware / IPL:

https://github.com/renesas-rcar/meta-renesas/blob/jethro/meta-rcar-gen3/recipes-bsp/arm-trusted-firmware/arm-trusted-firmware/0001-add-bl2-bl31-R-Car-support.patch#L8428


2. U-Boot:

https://github.com/renesas-rcar/u-boot/blob/v2015.04/rcar-3.2.x/board/renesas/salvator-x/salvator-x.c#L116


3. Linux kernel

https://git.kernel.org/cgit/linux/kernel/git/geert/renesas-drivers.git/tree/drivers/pinctrl/sh-pfc/pfc-r8a7795.c?h=topic/gen3-latest


Now, the issue we see is that (of course?) this is not necessarily 
consistent.

Therefore: What's supposed to be the correct place to do this (once)?


Any opinions?


The example is the RAVB ethernet: We found that on the Salvator-X the 
kernel's ethernet doesn't work without being initialized by U-Boot. I.e. 
without running U-Boot doing the drvctrl [1] ethernet fails in the Linux 
kernel.

Best regards

Dirk

[1] 
https://github.com/renesas-rcar/u-boot/blob/v2015.04/rcar-3.2.x/board/renesas/salvator-x/salvator-x.c#L152
