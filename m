Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-pf0-f195.google.com ([209.85.192.195]:37841 "EHLO
        mail-pf0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751328AbeCTIUI (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 20 Mar 2018 04:20:08 -0400
Received: by mail-pf0-f195.google.com with SMTP id h11so360130pfn.4
        for <linux-renesas-soc@vger.kernel.org>; Tue, 20 Mar 2018 01:20:08 -0700 (PDT)
From: Magnus Damm <magnus.damm@gmail.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Magnus Damm <magnus.damm@gmail.com>
Date: Tue, 20 Mar 2018 17:20:22 +0900
Message-Id: <152153402203.8610.10666108438721508284.sendpatchset@little-apple>
Subject: [PATCH 0/2] arm: dts: Legacy board IRQ issues
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

arm: dts: Legacy board IRQ issues

[PATCH 1/2] arm: dts: r8a7778 Bock-W Ethernet has busted IRQs
[PATCH 2/2] arm: dts: sh73a0 KZM9 as unhandled IRQs on boot

These patches highlight two IRQ-related issues on the 32-bit ARM
legacy boards. I've managed to reproduce the issues but not solve
them. I'd be happy to see someone else fixing these if possible.

Not-Yet-Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
---

 Developed on top of renesas-drivers-2018-03-13-v4.16-rc5
 
 arch/arm/boot/dts/r8a7778-bockw.dts       |   12 ++++++++----
 arch/arm/boot/dts/r8a7778.dtsi            |    8 ++++----
 drivers/irqchip/irq-renesas-intc-irqpin.c |    4 ++--
 3 files changed, 14 insertions(+), 10 deletions(-)
