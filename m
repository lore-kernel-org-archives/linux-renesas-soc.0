Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from 4.mo1.mail-out.ovh.net ([46.105.76.26]:42055 "EHLO
        4.mo1.mail-out.ovh.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751400AbcLBSOX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 2 Dec 2016 13:14:23 -0500
Received: from player726.ha.ovh.net (b7.ovh.net [213.186.33.57])
        by mo1.mail-out.ovh.net (Postfix) with ESMTP id 63EA52136C
        for <linux-renesas-soc@vger.kernel.org>; Fri,  2 Dec 2016 16:44:19 +0100 (CET)
From: Jacopo Mondi <jacopo@jmondi.org>
To: magnus.damm@gmail.com, geert+renesas@glider.be
Cc: linux-renesas-soc@vger.kernel.org, Jacopo Mondi <jacopo@jmondi.org>
Subject: [RFC 0/3] Enable and test MAXREFDES4# on Genmai board
Date: Fri,  2 Dec 2016 16:43:51 +0100
Message-Id: <1480693434-9415-1-git-send-email-jacopo@jmondi.org>
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
gpio based SPI master on CON2 pins.

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

Jacopo Mondi (3):
  gpio-rz: Port to v3.18
  dts: arm: genmai: Add MAXDESREF4x spidev
  spidev: Add back "linux,spidev" as compatible

 arch/arm/boot/dts/r7s72100-genmai.dts | 22 ++++++++++++++++++++++
 drivers/gpio/gpio-rz.c                |  3 ++-
 drivers/spi/spidev.c                  |  1 +
 3 files changed, 25 insertions(+), 1 deletion(-)

-- 
2.7.4
