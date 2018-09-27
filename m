Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from andre.telenet-ops.be ([195.130.132.53]:56624 "EHLO
        andre.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727187AbeI0SM5 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 27 Sep 2018 14:12:57 -0400
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Peter Maydell <peter.maydell@linaro.org>,
        Alex Williamson <alex.williamson@redhat.com>
Cc: Eric Auger <eric.auger@redhat.com>,
        Magnus Damm <damm+renesas@opensource.se>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        qemu-arm@nongnu.org, qemu-devel@nongnu.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH qemu v5 0/3] vfio/sysbus-fdt: Prepare for Generic DT Pass-Through
Date: Thu, 27 Sep 2018 13:54:51 +0200
Message-Id: <20180927115454.31471-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

	Hi all,

This patch series prepares for exporting generic devices in DT using
vfio-platform, providing direct access from a QEMU+KVM guest to the
exported devices.

  - Patches 1-2 (submitted before by Eric Auger) make the vfio-platform
    device non-abstract, incl. matching using a compatible string.
  - Patch 3 allows dynamic vfio-platform devices again, without needing to
    create device-specific vfio types for each and every new device.

This will avoid having to write device-specific instantation methods for
each and every "simple" device using only a set of generic properties.
Devices that need more specialized handling will still be able provide
their own instantation methods.

Note that this series no longer contains "[PATCH 4/4] hw/arm/sysbus-fdt:
Add support for instantiating generic devices", following advice from Eric
Auger, as that patch needs more safeguards.  Hence this series now contains
only preparative work.

Changes compared to v4 ("vfio/sysbus-fdt: Prepare for Generic DT Pass-Through",
http://lists.nongnu.org/archive/html/qemu-devel/2018-09/msg01672.html):
  - Add Reviewed-by, Tested-by,
  - Fix path leak on error,
  - s/instantiatable/instantiable/,
  - Drop reference to commit 6f2062b9758ebc64 ("hw/arm/virt: Allow only
    supported dynamic sysbus devices").

Changes compared to v3 ("hw/arm/sysbus-fdt: Generic DT Pass-Through"),
http://lists.nongnu.org/archive/html/qemu-devel/2018-07/msg05006.html):
  - Propagate g_file_get_contents() errors through errp,
  - Add Tested-by (with amd-xgbe),
  - s/From now on/Soon/ in patch description,
  - s/sysbus/vfio-platform/ in patch description,
  - Postpone "[PATCH 4/4] hw/arm/sysbus-fdt: Add support for instantiating
    generic devices".

Changes compared to v2 (not submitted to the mailing list):
  - Use the compatible values from sysfs instead of user-supplied
    manufacturer and model options,
  - Replace "hw/arm/sysbus-fdt: Enable rcar-gen3-gpio dynamic
    instatiation" by generic "hw/arm/sysbus-fdt: Add support for
    instantiating generic devices",
  - Reword patch descriptions,
  - Drop RFC state,
  - Drop "vfio: No-IOMMU mode support".

Changes compared to v1 ("R-Car Gen3 GPIO Pass-Through Prototype (QEMU)",
https://lists.gnu.org/archive/html/qemu-devel/2018-02/msg02716.html):
  - Restrict dynamic sysbus devices to TYPE_VFIO_PLATFORM, as suggested
    by Eric Auger.

This (plus the postponed "hw/arm/sysbus-fdt: Add support for instantiating
generic devices") has been tested on a Renesas Salvator-XS board with R-Car
H3 ES2.0 with SATA:

    -device vfio-platform,host=ee300000.sata

and GPIO (needs VFIO No-IOMMU support):

    -device vfio-platform,host=e6055400.gpio

Thanks for applying!

Auger Eric (2):
  vfio/platform: Make the vfio-platform device non-abstract
  hw/arm/sysbus-fdt: Allow device matching with DT compatible value

Geert Uytterhoeven (1):
  hw/arm/virt: Allow dynamic vfio-platform devices again

 hw/arm/sysbus-fdt.c             | 61 +++++++++++++++++++++++++--------
 hw/arm/virt.c                   |  1 +
 hw/vfio/amd-xgbe.c              |  1 +
 hw/vfio/calxeda-xgmac.c         |  1 +
 hw/vfio/platform.c              | 25 +++++++++++++-
 include/hw/vfio/vfio-platform.h |  3 +-
 6 files changed, 76 insertions(+), 16 deletions(-)

-- 
2.17.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
