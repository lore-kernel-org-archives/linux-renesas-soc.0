Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor3.renesas.com ([210.160.252.173]:65387 "EHLO
        relmlie2.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1752453AbdAZCIX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 25 Jan 2017 21:08:23 -0500
From: Chris Brandt <chris.brandt@renesas.com>
To: Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Cc: devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Chris Brandt <chris.brandt@renesas.com>
Subject: [PATCH v4 0/2] clocksource: Add renesas-ostm timer driver
Date: Wed, 25 Jan 2017 21:07:05 -0500
Message-Id: <20170126020707.4376-1-chris.brandt@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

This patch set adds a new clocksource driver that uses the OS Timer
(OSTM) that exists in the R7S72100 (RZ/A1) SoC.

The operation of the driver was tested with a simple user application
that does multiple calls to nanosleep() and gettimeofday().

The purpose of adding this driver is to get better time keeping
accuracy over the default MTU2 clocksource timer.

v4:
* Added more details to commit log
* Kconfig: SYS_SUPPORTS_RENESAS_OSTM to just RENESAS_OSTM
* removed all MODULE code (this driver is builtin only)
* removed items from 'struct ostm_device'
* changed ioread8 to readb
* explain endless while loop
* removed un-needed vars like 'ret'
* removed WARN_ON(!clockevent_state_oneshot(ced));
* removed "failed to allocate memory" message
* remove pm_runtime calls
* remove "earlytimer" register (only for sh, not arm)
* convert from platform driver to CLOCKSOURCE_OF_DECLARE
* ostm_probe code is now in ostm_init

v3:
* Changed ostm@fcfec000 to timer@fcfec000
* Added power-domains to nodes

v2:
* The biggest change was now the channels are independent of each
  other and have separate nodes in the DT. The first probed will
  be set up as a clock source, and any additional channels probed
  will become a clock event.


Chris Brandt (2):
  dt-bindings: document renesas-ostm timer
  clocksource: Add renesas-ostm timer driver

 .../devicetree/bindings/timer/renesas,ostm.txt     |  30 +++
 arch/arm/mach-shmobile/Kconfig                     |   1 +
 drivers/clocksource/Kconfig                        |   7 +
 drivers/clocksource/Makefile                       |   1 +
 drivers/clocksource/renesas-ostm.c                 | 262 +++++++++++++++++++++
 5 files changed, 301 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/timer/renesas,ostm.txt
 create mode 100644 drivers/clocksource/renesas-ostm.c

-- 
2.10.1
