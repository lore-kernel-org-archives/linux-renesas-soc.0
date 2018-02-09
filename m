Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from michel.telenet-ops.be ([195.130.137.88]:42774 "EHLO
        michel.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752172AbeBIPRM (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 9 Feb 2018 10:17:12 -0500
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Baptiste Reynal <b.reynal@virtualopensystems.com>,
        Alex Williamson <alex.williamson@redhat.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Alexander Graf <agraf@suse.de>,
        Magnus Damm <magnus.damm@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        kvm@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        qemu-devel@nongnu.org, Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH/RFC 0/6] R-Car Gen3 GPIO Pass-Through Prototype (Linux)
Date: Fri,  9 Feb 2018 16:16:47 +0100
Message-Id: <1518189413-2761-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

	Hi all,

This RFC patch series is the Linux side of a GPIO Pass-Through prototype
for Renesas R-Car platforms using vfio-platform.  Together with its
counterpart for QEMU, it provides direct access from a QEMU+KVM guest to
a GPIO controller in an R-Car Gen3 SoC.  This allows the guest to
control the LEDs on a Renesas Salvator-X(S) board.

This patch series is not meant to be upstreamed as-is.  Indeed, for
various reasons (e.g. security, as the different GPIOs on the same GPIO
controller may control different parts of the system) access to GPIOs is
better not implemented using Device Pass-Through, but by
paravirtualization.  Yet, this is still a simple and valuable
proof-of-concept, which can serve as a basis for the future development
of Pass-Through support for more complex platform devices on R-Car Gen3
SoCs.

This patch series consists of two parts:

  1. Patches 1-4 are Linux host patches.

     They provide workarounds for missing virtualization platform
     support (vfio reset, IOMMU group, clock domain), and a defconfig
     update for testing.

     These allow a GPIO controller to be unbound from its host driver,
     and rebound to vfio-platform, for pass-through to a guest:

	echo e6055400.gpio > /sys/bus/platform/drivers/gpio_rcar/unbind
	echo vfio-platform > \
		/sys/bus/platform/devices/e6055400.gpio/driver_override
	echo e6055400.gpio > /sys/bus/platform/drivers/vfio-platform/bind

  2. Patches 5-6 are Linux guest patches.

     They provide workarounds for missing pass-through support (clock,
     interrupt), and a guest defconfig for testing.

     These allow the gpio-rcar driver to bind to a pass-through GPIO
     device, and thus control the LEDs from the guest.

Several questions and TODOs are appended to the individual patches.

Please see https://elinux.org/R-Car/Virtualization/VFIO for full usage
instructions of this prototype.

Thanks for your comments!

Geert Uytterhoeven (6):
  vfio: platform: Allow runtime override of reset_required
  vfio: Ignore real IOMMUs if CONFIG_VFIO_NOIOMMU=y
  clk: renesas: r8a7795: Mark the GPIO6 clock critical
  arm64: renesas_defconfig: Enable VFIO_PLATFORM and VFIO_NOIOMMU
  gpio: rcar: Add virtualization workarounds
  arm64: Add virt_defconfig

 arch/arm64/configs/renesas_defconfig   |   2 +
 arch/arm64/configs/virt_defconfig      | 722 +++++++++++++++++++++++++++++++++
 drivers/clk/renesas/r8a7795-cpg-mssr.c |   1 +
 drivers/gpio/Kconfig                   |   2 +-
 drivers/gpio/gpio-rcar.c               |  28 +-
 drivers/vfio/platform/vfio_platform.c  |   2 +-
 drivers/vfio/vfio.c                    |   6 +-
 7 files changed, 744 insertions(+), 19 deletions(-)
 create mode 100644 arch/arm64/configs/virt_defconfig

-- 
2.7.4

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
