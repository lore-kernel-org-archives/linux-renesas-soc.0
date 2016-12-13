Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:58244 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752977AbcLMNS2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 13 Dec 2016 08:18:28 -0500
Date: Tue, 13 Dec 2016 14:18:20 +0100
From: Simon Horman <horms+renesas@verge.net.au>
To: ltsi-dev@lists.linuxfoundation.org
Cc: Hisao Munakata <hisao.munakata.vt@renesas.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [GIT/RFC PULL LTSI-4.9] Renesas SoCs and Drivers to next-20161205
Message-ID: <20161213131820.GA27407@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi,

** This series is for informational purposes only! **

This series is comprised of backports to v4.9-rc8 of the following
components to their standard as of next-20161205:

*  adv7511		(driver)
*  cpg			(driver)
*  gen3			(ARM64 SoC Integration)
*  gpio-keys		(driver)
*  gpio-regulator	(driver)
*  gpiolib		(driver infrastructure)
*  mach-shmobile	(ARM32 SoC Integration)
*  pinctrl		(driver)
*  ravb			(driver)
*  rcar-dmac		(driver)
*  rcar-du		(driver)
*  rcar-rst		(driver)
*  rcar-snd		(driver)
*  renesas-soc-id	(driver)
*  rspi			(driver)
*  sh-eth		(driver)
*  sh-mobile-sdhi	(driver)
*  sh-msiof		(driver)
*  sh-pfc		(driver)
*  sh-sci		(driver)
*  smsc911x		(driver)
*  sysc			(driver)
*  usbhs		(driver)
*  vsp1			(driver)
*  wm8978		(driver)
*  xhci-plat		(driver)
*  xhci-rcar		(driver)

Limited backport of the following to provide dependencies for the above:
*  soc-device-match

It is intended as a dry-run for backporting components used
by Renesas SoCs from v4.10 and beyond to v4.9, an activity that
I anticipate carrying out in the event that the next LTSI release
is to be based on v4.9.

In posting this work I am not implying anything about
decisions on the base of the LTSI release will be.

I have tested for build regressions on a wide range of defconfigs
on a wide range of architectures.

There are 168 patches.

This is based on a merge of v4.8-rc8 and the previous round of this work
"[GIT/RFC PULL LTSI-4.9] Renesas SoCs and Drivers to next-20161028" which
was comprised of 70 patches.

As this work is for informational purposes I do not expect these patches
to be imported to quilt by Greg or others. However, if you would like to
do so and rebasing would help please feel free to ask me to do so.


The following changes since commit e7e36988f4df1df11a4be4999b6caf4839851ade:

  Merge tag 'v4.9-rc8' into backport/v4.9-rc8/snapshot-flattened (2016-12-13 13:21:09 +0100)

are available in the git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas-backport.git tags/backport/v4.9-rc8/snapshot-to-next-20161205-flattened

for you to fetch changes up to 2257027e47aadc0e0ef78ab05da63de462e15e67:

  clk: renesas: rcar-gen2: Remove obsolete rcar_gen2_clocks_init() (2016-12-13 13:30:02 +0100)

----------------------------------------------------------------
Second Round of LTSI-v4.9 Early Preparation for Renesas SoCs

Base:
* v4.9-rc9
* "Renesas SoCs and Drivers to next-20161028"

Backports of the following components to their standard as of next-20161205:

*  adv7511              (driver)
*  cpg                  (driver)
*  gen3                 (ARM64 SoC Integration)
*  gpio-keys            (driver)
*  gpio-regulator       (driver)
*  gpiolib              (driver infrastructure)
*  mach-shmobile        (ARM32 SoC Integration)
*  pinctrl              (driver)
*  ravb                 (driver)
*  rcar-dmac            (driver)
*  rcar-du              (driver)
*  rcar-rst             (driver)
*  rcar-snd             (driver)
*  renesas-soc-id       (driver)
*  rspi                 (driver)
*  sh-eth               (driver)
*  sh-mobile-sdhi       (driver)
*  sh-msiof             (driver)
*  sh-pfc               (driver)
*  sh-sci               (driver)
*  smsc911x             (driver)
*  sysc                 (driver)
*  usbhs                (driver)
*  vsp1                 (driver)
*  wm8978               (driver)
*  xhci-plat            (driver)
*  xhci-rcar            (driver)

Limited backport of the following to provide dependencies for the above:
*  soc-device-match

----------------------------------------------------------------
Ai Kyuse (3):
      mmc: tmio: enhance illegal sequence handling
      mmc: tmio: Add hw reset support
      mmc: tmio: Add tuning support

Arnd Bergmann (2):
      spi: rspi: avoid uninitialized variable access
      base: soc: Introduce soc_device_match() interface

Chris Brandt (3):
      mmc: sh_mobile_sdhi: add ocr_mask option
      mmc: tmio-mmc: add support for 32bit data port
      mmc: sh_mobile_sdhi: Add r7s72100 support

Dmitry Torokhov (4):
      Input: gpio_keys_polled - keep button data constant
      Input: gpio_keys - annotate PM methods as __maybe_unused
      Input: gpio_keys - fix leaking DT node references
      Input: gpio_keys - switch to using generic device properties

Geert Uytterhoeven (48):
      pinctrl: sh-pfc: r8a7796: Fix GPSR definitions for SDHI2/3
      spi: sh-msiof: Add support for R-Car M3-W
      reset: Add renesas,rst DT bindings
      soc: renesas: Add R-Car RST driver
      base: soc: Early register bus when needed
      base: soc: Check for NULL SoC device attributes
      base: soc: Provide a dummy implementation of soc_device_match()
      ARM: shmobile: Document DT bindings for Product Register
      soc: renesas: Identify SoC and register with the SoC bus
      Input: gpio_keys - add support for GPIO descriptors
      arm64: renesas: r8a7795 dtsi: Add device node for RST module
      arm64: renesas: r8a7796 dtsi: Add device node for RST module
      arm64: defconfig: Do not lower CONFIG_LOG_BUF_SHIFT
      arm64: dts: r8a7795: Add device node for PRR
      arm64: dts: r8a7796: Add device node for PRR
      clk: renesas: cpg-mssr: Always use readl()/writel()
      clk: renesas: rcar-gen3-cpg: Always use readl()/writel()
      clk: renesas: cpg-mssr: Fix inverted debug check
      clk: renesas: cpg-mssr: Remove bogus commas from error messages
      clk: renesas: r8a7778: Obtain mode pin values using R-Car RST driver
      clk: renesas: r8a7779: Obtain mode pin values from R-Car RST driver
      clk: renesas: rcar-gen2: Obtain mode pin values using RST driver
      clk: renesas: r8a7795: Obtain mode pin values from R-Car RST driver
      clk: renesas: r8a7796: Obtain mode pin values from R-Car RST driver
      clk: renesas: rcar-gen3-cpg: Remove obsolete rcar_gen3_read_mode_pins()
      ARM: dts: r8a7778: Add device node for RESET/WDT module
      ARM: dts: r8a7779: Add device node for RESET/WDT module
      ARM: dts: r8a7790: Add device node for RST module
      ARM: dts: r8a7791: Add device node for RST module
      ARM: dts: r8a7792: Add device node for RST module
      ARM: dts: r8a7793: Add device node for RST module
      ARM: dts: r8a7794: Add device node for RST module
      ARM: shmobile: r8a7778: Stop passing mode pins state to clock driver
      ARM: shmobile: r8a7779: Stop passing mode pins state to clock driver
      ARM: shmobile: rcar-gen2: Stop passing mode pins state to clock driver
      ARM: shmobile: r8a7779/marzen: Add board part number to DT bindings
      ARM: dts: r8a7794: Correct hsusb parent clock
      ARM: dts: r8a7794: Use SYSC "always-on" PM Domain for sound
      ARM: dts: r8a73a4: Add device node for PRR
      ARM: dts: r8a7779: Add device node for PRR
      ARM: dts: r8a7790: Add device node for PRR
      ARM: dts: r8a7791: Add device node for PRR
      ARM: dts: r8a7792: Add device node for PRR
      ARM: dts: r8a7793: Add device node for PRR
      ARM: dts: r8a7794: Add device node for PRR
      clk: renesas: r8a7778: Remove obsolete r8a7778_clocks_init()
      clk: renesas: r8a7779: Remove obsolete r8a7779_clocks_init()
      clk: renesas: rcar-gen2: Remove obsolete rcar_gen2_clocks_init()

Hiep Cao Minh (1):
      spi: rspi: supports 32bytes buffer for DUAL and QUAD

Jacopo Mondi (1):
      ARM: dts: alt: Fix PFC names for DU

Javier Martinez Canillas (1):
      [media] v4l: vsp1: Fix module autoload for OF registration

Jisheng Zhang (1):
      regulator: gpio: properly check return value of of_get_named_gpio

John Stultz (1):
      drm/bridge: adv7511: Add Audio support

Koji Matsuoka (3):
      drm: rcar-du: Fix display timing controller parameter
      drm: rcar-du: Fix H/V sync signal polarity configuration
      drm: rcar-du: Fix LVDS start sequence on Gen3

Kuninori Morimoto (3):
      ASoC: rsnd: use BRGCKR instead of SSICKR
      ASoC: rsnd: Request/Release DMA channel each time
      ASoC: rsnd: use dma_sync_single_for_xxx() for IOMMU

Lars-Peter Clausen (1):
      gpio: chardev: Return error for seek operations

Laurent Pinchart (11):
      drm: rcar-du: Constify node argument to rcar_du_lvds_connector_init()
      drm: rcar-du: Bring HDMI encoder comments in line with the driver
      drm: rcar-du: Remove test for impossible error condition
      drm: rcar-du: Remove memory allocation error message
      drm: rcar-du: Fix crash in encoder failure error path
      drm: rcar-du: Simplify and fix probe error handling
      drm: rcar-du: Add R8A7796 support
      drm: rcar-du: Fix dot clock routing configuration
      clk: renesas: r8a7796: Add FCP clocks
      clk: renesas: r8a7796: Add VSP clocks
      clk: renesas: r8a7796: Add DU and LVDS clocks

Laxman Dewangan (1):
      pinctrl: generic: Parse pinmux init nodes if node status is okay

Linus Walleij (3):
      gpio: clamp values on gpio[d]_direction_output()
      gpio: tag line labels used for interrupts
      arm64: defconfig: drop GPIO_SYSFS on multiplatforms

Lu Baolu (4):
      usb: xhci: clean up error_bitmask usage
      usb: xhci: cleanup cmd_completion in xhci_virt_device
      usb: xhci: remove the use of xhci->addr_dev
      usb: xhci: move slot_id from xhci_hcd to xhci_command structure

Masahiro Yamada (1):
      usb: renesas_usbhs: cleanup with list_first_entry_or_null()

Mathias Nyman (3):
      xhci: cleanup error message if halting the host failed.
      xhci: don't try to reset the host if it is unaccessible
      xhci: add helper to get the endpoint state of a endpoint context

Maxime Ripard (1):
      ASoC: wm8978: Adjust clock indices so that simple card works

Niklas Söderlund (12):
      pinctrl: sh-pfc: r8a7796: Add DU support
      pinctrl: sh-pfc: Do not unconditionally support PIN_CONFIG_BIAS_DISABLE
      pinctrl: sh-pfc: Add helper to handle bias lookup table
      pinctrl: sh-pfc: r8a7795: Simplify get bias logic
      pinctrl: sh-pfc: r8a7795: Use lookup function for bias data
      pinctrl: sh-pfc: r8a7778: Use lookup function for bias data
      pinctrl: sh-pfc: Support named pins with custom configuration
      pinctrl: sh-pfc: r8a7795: Support none GPIO pins with configurable drive-strength
      pinctrl: sh-pfc: r8a7795: Add group for AVB MDIO and MII pins
      pinctrl: sh-pfc: r8a7795: Add group for QSPI0 and QSPI1 pins
      clk: renesas: r8a7796: Add CSI2 clocks
      clk: renesas: r8a7796: Add VIN clocks

Ramesh Shanmugasundaram (2):
      pinctrl: sh-pfc: r8a7796: Add DRIF support
      clk: renesas: r8a7796: Add DRIF clock

Sergei Shtylyov (11):
      drm: rcar-du: Add R8A7792 support
      ARM: shmobile: r8a7743: add power domain index macros
      soc: renesas: rcar-sysc: add R8A7743 support
      ARM: shmobile: r8a7745: add power domain index macros
      soc: renesas: rcar-sysc: add R8A7745 support
      ARM: dts: r8a7794: remove Z clock
      ARM: shmobile: r8a7745: basic SoC support
      ARM: shmobile: document SK-RZG1E board
      clk: renesas: cpg-mssr: Add common R-Car Gen2 support
      clk: renesas: cpg-mssr: Add R8A7743 support
      clk: renesas: cpg-mssr: Add R8A7745 support

Simon Horman (12):
      mmc: core: Add helper to see if a host can be retuned
      mmc: tmio: document mandatory and optional callbacks
      mmc: sh_mobile_sdhi: Add tuning support
      mmc: sh_mobile_sdhi: remove support for sh7372
      ARM: shmobile: only call rcar_gen2_clocks_init() if present
      ARM: dts: lager: rename and reindex i2cexio
      ARM: dts: lager: use demuxer for IIC1/I2C1
      ARM: dts: koelsch: use demuxer for I2C1
      ARM: dts: alt: use demuxer for I2C4
      ARM: dts: lager: Enable UHS-I SDR-104
      ARM: dts: koelsch: Enable UHS-I SDR-104
      ARM: dts: alt: Enable UHS-I SDR-104

Srinivas Kandagatla (1):
      drm/bridge: adv7511: Enable the audio data and clock pads on adv7533

Sudeep Holla (1):
      Input: gpio_keys - set input direction explicitly

Takatoshi Akiyama (1):
      serial: sh-sci: Fix deadlock caused by serial output request

Takeshi Kihara (2):
      pinctrl: sh-pfc: r8a7796: Add EtherAVB pins, groups and functions
      clk: renesas: r8a7795: Fix HDMI parent clock

Tony Lindgren (1):
      pinctrl: Introduce generic #pinctrl-cells and pinctrl_parse_index_with_args

Ulf Hansson (1):
      net: smsc911x: Synchronize the runtime PM status during system suspend

Ulrich Hecht (10):
      pinctrl: sh-pfc: r8a7796: Add I2C pin support
      dmaengine: rcar-dmac: Document R-Car M3-W bindings
      arm64: renesas: r8a7796: add SYS-DMAC controller nodes
      arm64: dts: r8a7796: add I2C support
      arm64: dts: r8a7796: Enable I2C DMA
      arm64: dts: r8a7796: salvator-x: enable I2C
      clk: renesas: r8a7796: Add SYS-DMAC clocks
      clk: renesas: r8a7796: Add SCIF clocks
      clk: renesas: r8a7796: Add HSCIF clocks
      clk: renesas: r8a7796: Add I2C clocks

Vladimir Barinov (13):
      arm64: dts: h3ulcb: update documentation with official board name
      arm64: dts: h3ulcb: update header
      arm64: dts: m3ulcb: add M3ULCB board DT bindings
      arm64: dts: m3ulcb: initial device tree
      arm64: dts: m3ulcb: enable SCIF clk and pins
      arm64: dts: m3ulcb: enable GPIO leds
      arm64: dts: m3ulcb: enable GPIO keys
      arm64: dts: m3ulcb: enable EXTALR clk
      arm64: dts: m3ulcb: enable WDT
      arm64: dts: m3ulcb: enable SDHI0
      arm64: dts: m3ulcb: enable SDHI2
      arm64: dts: h3ulcb: enable SDHI2
      arm64: dts: h3ulcb: rename SDHI0 pins

Wolfram Sang (2):
      mmc: tmio: fix wrong bitmask for SDIO irqs
      mmc: tmio: remove SDIO from TODO list

Yoshihiro Shimoda (3):
      arm64: dts: r8a7795: salvator-x: add bias setting for usb1_pins
      usb: host: xhci: rcar: add a new firmware version for r8a7796
      usb: host: xhci: plat: add support for Renesas r8a7796 SoC

 Documentation/devicetree/bindings/arm/shmobile.txt |  28 +-
 .../devicetree/bindings/clock/renesas,cpg-mssr.txt |   5 +-
 .../devicetree/bindings/display/renesas,du.txt     |  12 +-
 .../devicetree/bindings/dma/renesas,rcar-dmac.txt  |   1 +
 Documentation/devicetree/bindings/mmc/tmio_mmc.txt |   2 +-
 .../bindings/pinctrl/pinctrl-bindings.txt          |  44 +-
 .../bindings/power/renesas,rcar-sysc.txt           |   8 +-
 .../devicetree/bindings/reset/renesas,rst.txt      |  37 ++
 Documentation/devicetree/bindings/spi/sh-msiof.txt |   1 +
 Documentation/devicetree/bindings/usb/usb-xhci.txt |   1 +
 arch/arm/boot/dts/r8a73a4.dtsi                     |   5 +
 arch/arm/boot/dts/r8a7778.dtsi                     |   5 +
 arch/arm/boot/dts/r8a7779.dtsi                     |  10 +
 arch/arm/boot/dts/r8a7790-lager.dts                |  52 +-
 arch/arm/boot/dts/r8a7790.dtsi                     |  10 +
 arch/arm/boot/dts/r8a7791-koelsch.dts              |  36 ++
 arch/arm/boot/dts/r8a7791.dtsi                     |  10 +
 arch/arm/boot/dts/r8a7792.dtsi                     |  10 +
 arch/arm/boot/dts/r8a7793.dtsi                     |  10 +
 arch/arm/boot/dts/r8a7794-alt.dts                  |  40 +-
 arch/arm/boot/dts/r8a7794.dtsi                     |  19 +-
 arch/arm/mach-shmobile/Kconfig                     |   5 +
 arch/arm/mach-shmobile/setup-r8a7778.c             |  15 -
 arch/arm/mach-shmobile/setup-r8a7779.c             |  27 -
 arch/arm/mach-shmobile/setup-rcar-gen2.c           |   6 +-
 arch/arm64/Kconfig.platforms                       |   1 +
 arch/arm64/boot/dts/renesas/Makefile               |   2 +-
 arch/arm64/boot/dts/renesas/r8a7795-h3ulcb.dts     |  53 +-
 arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts |  16 +-
 arch/arm64/boot/dts/renesas/r8a7795.dtsi           |  10 +
 arch/arm64/boot/dts/renesas/r8a7796-m3ulcb.dts     | 189 +++++++
 arch/arm64/boot/dts/renesas/r8a7796-salvator-x.dts |  12 +
 arch/arm64/boot/dts/renesas/r8a7796.dtsi           | 220 ++++++++
 arch/arm64/configs/defconfig                       |   2 -
 drivers/base/Kconfig                               |   1 +
 drivers/base/soc.c                                 |  79 +++
 drivers/clk/renesas/Kconfig                        |   2 +
 drivers/clk/renesas/Makefile                       |   2 +
 drivers/clk/renesas/clk-r8a7778.c                  |  26 +-
 drivers/clk/renesas/clk-r8a7779.c                  |  18 +-
 drivers/clk/renesas/clk-rcar-gen2.c                |  32 +-
 drivers/clk/renesas/r8a7743-cpg-mssr.c             | 270 +++++++++
 drivers/clk/renesas/r8a7745-cpg-mssr.c             | 259 +++++++++
 drivers/clk/renesas/r8a7795-cpg-mssr.c             |  10 +-
 drivers/clk/renesas/r8a7796-cpg-mssr.c             |  65 ++-
 drivers/clk/renesas/rcar-gen2-cpg.c                | 371 +++++++++++++
 drivers/clk/renesas/rcar-gen2-cpg.h                |  43 ++
 drivers/clk/renesas/rcar-gen3-cpg.c                |  31 +-
 drivers/clk/renesas/rcar-gen3-cpg.h                |   1 -
 drivers/clk/renesas/renesas-cpg-mssr.c             |  29 +-
 drivers/clk/renesas/renesas-cpg-mssr.h             |   2 +
 drivers/gpio/gpiolib.c                             |  38 +-
 drivers/gpu/drm/bridge/adv7511/Kconfig             |   8 +
 drivers/gpu/drm/bridge/adv7511/Makefile            |   1 +
 drivers/gpu/drm/bridge/adv7511/adv7511.h           |  16 +
 drivers/gpu/drm/bridge/adv7511/adv7511_audio.c     | 213 +++++++
 drivers/gpu/drm/bridge/adv7511/adv7511_drv.c       |   4 +
 drivers/gpu/drm/bridge/adv7511/adv7533.c           |   1 +
 drivers/gpu/drm/rcar-du/rcar_du_crtc.c             |   6 +-
 drivers/gpu/drm/rcar-du/rcar_du_drv.c              |  83 ++-
 drivers/gpu/drm/rcar-du/rcar_du_group.c            |  22 +-
 drivers/gpu/drm/rcar-du/rcar_du_hdmienc.c          |   4 +-
 drivers/gpu/drm/rcar-du/rcar_du_kms.c              |  17 +-
 drivers/gpu/drm/rcar-du/rcar_du_lvdscon.c          |   2 +-
 drivers/gpu/drm/rcar-du/rcar_du_lvdscon.h          |   2 +-
 drivers/gpu/drm/rcar-du/rcar_du_lvdsenc.c          |  19 +-
 drivers/input/keyboard/gpio_keys.c                 | 190 ++++---
 drivers/input/keyboard/gpio_keys_polled.c          | 113 ++--
 drivers/media/platform/vsp1/vsp1_drv.c             |   1 +
 drivers/mmc/host/sh_mobile_sdhi.c                  | 274 ++++++++-
 drivers/mmc/host/tmio_mmc.h                        |  32 +-
 drivers/mmc/host/tmio_mmc_pio.c                    | 119 +++-
 drivers/net/ethernet/smsc/smsc911x.c               |   6 +
 drivers/pinctrl/devicetree.c                       | 144 +++++
 drivers/pinctrl/devicetree.h                       |  23 +
 drivers/pinctrl/pinconf-generic.c                  |   2 +-
 drivers/pinctrl/sh-pfc/core.c                      |  15 +
 drivers/pinctrl/sh-pfc/core.h                      |   4 +
 drivers/pinctrl/sh-pfc/pfc-r8a7778.c               | 342 ++++++------
 drivers/pinctrl/sh-pfc/pfc-r8a7795.c               | 616 ++++++++++++++-------
 drivers/pinctrl/sh-pfc/pfc-r8a7796.c               | 576 ++++++++++++++++++-
 drivers/pinctrl/sh-pfc/pinctrl.c                   |   3 +-
 drivers/pinctrl/sh-pfc/sh_pfc.h                    |  14 +
 drivers/regulator/gpio-regulator.c                 |   9 +-
 drivers/soc/renesas/Makefile                       |   9 +
 drivers/soc/renesas/r8a7743-sysc.c                 |  32 ++
 drivers/soc/renesas/r8a7745-sysc.c                 |  32 ++
 drivers/soc/renesas/rcar-rst.c                     |  92 +++
 drivers/soc/renesas/rcar-sysc.c                    |   6 +
 drivers/soc/renesas/rcar-sysc.h                    |   2 +
 drivers/soc/renesas/renesas-soc.c                  | 257 +++++++++
 drivers/spi/spi-rspi.c                             |  52 +-
 drivers/spi/spi-sh-msiof.c                         |   1 +
 drivers/tty/serial/sh-sci.c                        |  20 +-
 drivers/usb/host/xhci-mem.c                        |   2 -
 drivers/usb/host/xhci-plat.c                       |   9 +
 drivers/usb/host/xhci-rcar.c                       |   4 +
 drivers/usb/host/xhci-rcar.h                       |   1 +
 drivers/usb/host/xhci-ring.c                       |  72 ++-
 drivers/usb/host/xhci.c                            |  42 +-
 drivers/usb/host/xhci.h                            |   8 +-
 drivers/usb/renesas_usbhs/fifo.c                   |   5 +-
 include/dt-bindings/clock/r8a7794-clock.h          |   3 +-
 include/dt-bindings/power/r8a7743-sysc.h           |  25 +
 include/dt-bindings/power/r8a7745-sysc.h           |  25 +
 include/linux/clk/renesas.h                        |   4 -
 include/linux/gpio_keys.h                          |   5 +-
 include/linux/mfd/tmio.h                           |   5 +
 include/linux/mmc/host.h                           |   5 +
 include/linux/soc/renesas/rcar-rst.h               |   6 +
 include/linux/sys_soc.h                            |   9 +
 sound/soc/codecs/wm8978.h                          |   2 +-
 sound/soc/sh/rcar/adg.c                            |   6 +-
 sound/soc/sh/rcar/core.c                           |   4 +-
 sound/soc/sh/rcar/dma.c                            | 268 ++++++---
 sound/soc/sh/rcar/gen.c                            |   4 +-
 sound/soc/sh/rcar/rsnd.h                           |   2 +-
 117 files changed, 5157 insertions(+), 926 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/reset/renesas,rst.txt
 create mode 100644 arch/arm64/boot/dts/renesas/r8a7796-m3ulcb.dts
 create mode 100644 drivers/clk/renesas/r8a7743-cpg-mssr.c
 create mode 100644 drivers/clk/renesas/r8a7745-cpg-mssr.c
 create mode 100644 drivers/clk/renesas/rcar-gen2-cpg.c
 create mode 100644 drivers/clk/renesas/rcar-gen2-cpg.h
 create mode 100644 drivers/gpu/drm/bridge/adv7511/adv7511_audio.c
 create mode 100644 drivers/soc/renesas/r8a7743-sysc.c
 create mode 100644 drivers/soc/renesas/r8a7745-sysc.c
 create mode 100644 drivers/soc/renesas/rcar-rst.c
 create mode 100644 drivers/soc/renesas/renesas-soc.c
 create mode 100644 include/dt-bindings/power/r8a7743-sysc.h
 create mode 100644 include/dt-bindings/power/r8a7745-sysc.h
 create mode 100644 include/linux/soc/renesas/rcar-rst.h
