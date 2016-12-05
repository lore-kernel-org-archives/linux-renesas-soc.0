Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from 7.mo68.mail-out.ovh.net ([46.105.63.230]:48566 "EHLO
        7.mo68.mail-out.ovh.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752669AbcLEJ3e (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 5 Dec 2016 04:29:34 -0500
Received: from player711.ha.ovh.net (b9.ovh.net [213.186.33.59])
        by mo68.mail-out.ovh.net (Postfix) with ESMTP id C37B314905
        for <linux-renesas-soc@vger.kernel.org>; Mon,  5 Dec 2016 10:20:13 +0100 (CET)
From: Jacopo Mondi <jacopo@jmondi.org>
To: magnus.damm@gmail.com, geert+renesas@glider.be
Cc: linux-renesas-soc@vger.kernel.org
Subject: [RFCv2 0/3] Enable and test MAXREFDES4# on Genmai board
Date: Mon,  5 Dec 2016 10:20:03 +0100
Message-Id: <1480929605-28564-1-git-send-email-jacopo@jmondi.org>
In-Reply-To: <1480693434-9415-1-git-send-email-jacopo@jmondi.org>
References: <1480693434-9415-1-git-send-email-jacopo@jmondi.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello Magnus and Geert, list,
   this patch series enable the creation of a spidev device though which
interface to a MAXREFDES4# MAX11100-ADC evaluation kit connected to Genmai
CON2 expansion header.

The series is not intended for inclusion but will probably serve as base
for future integration of MAX11100 ADC driver.

The series is based on branch "genmai-gpio-and-pfc" of Geert's tree at
git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git
and target Linux v3.18

The series fix a compilation error for RZ gpio driver and register a
spidev device on a gpio based SPI master.

The test bed is setup as:

P11_11 (CN2 pin 5) connected as CS
P11_10 (CN2 pin 6) connected as MISO
P11_9  (CN2 pin 7) connected as SCLK
P11_8  (CN2 pin 8) connected as AIN

The ADC input is connected to gpio port 11 pin 8 (gpio863) and ADC
functionalities have been tested reading the results of successive
analog-to-digital conversions and verifying they match the gpio863
output value.

Thanks
   j

v1 -> v2:
    * use "spidev" as compatible string in v1 [2/3] and drop [3/3]
      consequentially.
    * incorporate Geert's comments in [2/3] DTS file

Jacopo Mondi (2):
  gpio-rz: Port to v3.18
  dts: arm: genmai: Add MAXDESREF4x spidev

 arch/arm/boot/dts/r7s72100-genmai.dts | 21 +++++++++++++++++++++
 drivers/gpio/gpio-rz.c                |  3 ++-
 2 files changed, 23 insertions(+), 1 deletion(-)

-- 
2.7.4
