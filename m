Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:45489 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750728AbdFNKdb (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 14 Jun 2017 06:33:31 -0400
Date: Wed, 14 Jun 2017 12:32:49 +0200
From: Simon Horman <horms@verge.net.au>
To: ltsi-dev@lists.linuxfoundation.org
Cc: Hisao Munakata <hisao.munakata.vt@renesas.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [GIT/RFC PULL LTSI-4.9] Renesas SoCs and Drivers to v4.10
Message-ID: <20170614103249.GA12279@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi,

** This series is for informational purposes only! **

This series is comprised of backports to v4.9 of the following
components to their standard as of v4.10:

* adv7511
* cpg
* em-sti
* gen3
* gpio-keys
* gpio-regulator
* i2c-rcar
* i2c-sh-mobile
* intc
* irq-gic
* mach-shmobile
* pci-rcar-gen2
* pcie-rcar
* phy-micrel
* phy-rcar-gen3-usb2
* ravb
* rcar-can
* rcar-canfd
* rcar-dmac
* rcar-du
* rcar-fcp
* rcar-fdp1
* rcar-rst
* rcar-snd
* renesas-soc-id
* rspi
* sh-cmt
* sh-drivers
* sh-eth
* sh-mmcif
* sh-mobile-sdhi
* sh-msiof
* sh-pfc
* sh-sci
* sh-timers
* sh-tmu
* smsc911x
* sysc
* usbhs
* vsp1
* wm8978
* xhci-plat
* xhci-rcar

Limited backport of the following to provide dependencies for the above:
* drm
* fsi
* phy
* simple-scu-card
* soc-device-match
#
# Write a message for tag:
#   backport/v4.9.21/snapshot-to-v4.10-flattened
# Lines starting with '#' will be ignored.

It is intended as a preparation for backporting components used
by Renesas SoCs from v4.10, v4.11 and beyond to v4.9. I expect to
formally submit patches during the merge window.

I have tested for build regressions on a wide range of defconfigs
on a wide range of architectures.

There are 300 patches.

This is based on of v4.9.31.
An earlier revision of this work was based on v4.9.21.

As this work is for informational purposes I do not expect these patches
to be imported to quilt by Greg at this time. However, if you would like to
do so and rebasing would help please feel free to ask me to do so.


The following changes since commit f1aa865ae5d4608cbfbb02f42baa1ef5ed95fce2:

  Linux 4.9.31 (2017-06-07 12:08:04 +0200)

are available in the git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas-backport.git backport/v4.9.31/snapshot-to-v4.10-flattened

for you to fetch changes up to c98811ab4a13b793d187104586251b62076ced5b:

  arm64: dts: h3ulcb: Provide sd0_uhs node (2017-06-12 07:51:20 +0200)

----------------------------------------------------------------
LTSI-v4.9 Preparation for Renesas SoCs (to v4.10)

Base:
* v4.9.31

Backports of the following components to their standard as of v4.10:

* adv7511
* cpg
* em-sti
* gen3
* gpio-keys
* gpio-regulator
* i2c-rcar
* i2c-sh-mobile
* intc
* irq-gic
* mach-shmobile
* pci-rcar-gen2
* pcie-rcar
* phy-micrel
* phy-rcar-gen3-usb2
* ravb
* rcar-can
* rcar-canfd
* rcar-dmac
* rcar-du
* rcar-fcp
* rcar-fdp1
* rcar-rst
* rcar-snd
* renesas-soc-id
* rspi
* sh-cmt
* sh-drivers
* sh-eth
* sh-mmcif
* sh-mobile-sdhi
* sh-msiof
* sh-pfc
* sh-sci
* sh-timers
* sh-tmu
* smsc911x
* sysc
* usbhs
* vsp1
* wm8978
* xhci-plat
* xhci-rcar

Limited backport of the following to provide dependencies for the above:
* drm
* fsi
* phy
* simple-scu-card
* soc-device-match

----------------------------------------------------------------
Ai Kyuse (3):
      mmc: tmio: enhance illegal sequence handling
      mmc: tmio: Add hw reset support
      mmc: tmio: Add tuning support

Arnd Bergmann (3):
      base: soc: Introduce soc_device_match() interface
      [media] v4l: rcar_fdp1: mark PM functions as __maybe_unused
      spi: rspi: avoid uninitialized variable access

Catalin Marinas (1):
      arm64: Enable HIBERNATION in defconfig

Chris Brandt (8):
      mmc: sh_mobile_sdhi: add ocr_mask option
      mmc: tmio-mmc: add support for 32bit data port
      mmc: sh_mobile_sdhi: Add r7s72100 support
      ARM: dts: r7s72100: add mmcif clock to device tree
      ARM: dts: r7s72100: add mmcif to device tree
      ARM: dts: r7s72100: add sdhi clock to device tree
      ARM: dts: r7s72100: add sdhi to device tree
      ARM: dts: rskrza1: add sdhi1 DT support

Chris Paterson (2):
      can: rcar_can: Add r8a7796 support
      can: rcar_canfd: Add r8a7796 support

Chris Wilson (1):
      drm: Add reference counting to drm_atomic_state

Colin Ian King (1):
      ASoC: rsnd: don't double free kctrl

Dmitry Torokhov (4):
      Input: gpio_keys_polled - keep button data constant
      Input: gpio_keys - annotate PM methods as __maybe_unused
      Input: gpio_keys - fix leaking DT node references
      Input: gpio_keys - switch to using generic device properties

Felipe Balbi (4):
      usb: add helper to extract bits 12:11 of wMaxPacketSize
      usb: host: xhci: make use of new usb_endpoint_maxp_mult()
      usb: host: xhci: purge GET_MAX_PACKET()
      usb: host: xhci: handle COMP_STOP from SETUP phase too

Geert Uytterhoeven (59):
      base: soc: Early register bus when needed
      base: soc: Check for NULL SoC device attributes
      base: soc: Provide a dummy implementation of soc_device_match()
      ARM: shmobile: Document DT bindings for Product Register
      soc: renesas: Identify SoC and register with the SoC bus
      reset: Add renesas,rst DT bindings
      soc: renesas: Add R-Car RST driver
      clk: renesas: cpg-mssr: Always use readl()/writel()
      clk: renesas: rcar-gen3-cpg: Always use readl()/writel()
      clk: renesas: cpg-mssr: Remove bogus commas from error messages
      ARM: dts: r8a7778: Add device node for RESET/WDT module
      ARM: dts: r8a7779: Add device node for RESET/WDT module
      ARM: dts: r8a7790: Add device node for RST module
      ARM: dts: r8a7791: Add device node for RST module
      ARM: dts: r8a7792: Add device node for RST module
      ARM: dts: r8a7793: Add device node for RST module
      ARM: dts: r8a7794: Add device node for RST module
      arm64: renesas: r8a7795 dtsi: Add device node for RST module
      arm64: renesas: r8a7796 dtsi: Add device node for RST module
      clk: renesas: r8a7778: Obtain mode pin values using R-Car RST driver
      clk: renesas: r8a7779: Obtain mode pin values from R-Car RST driver
      clk: renesas: rcar-gen2: Obtain mode pin values using RST driver
      clk: renesas: r8a7795: Obtain mode pin values from R-Car RST driver
      clk: renesas: r8a7796: Obtain mode pin values from R-Car RST driver
      clk: renesas: rcar-gen3-cpg: Remove obsolete rcar_gen3_read_mode_pins()
      ARM: shmobile: r8a7778: Stop passing mode pins state to clock driver
      ARM: shmobile: r8a7779: Stop passing mode pins state to clock driver
      ARM: shmobile: rcar-gen2: Stop passing mode pins state to clock driver
      clk: renesas: r8a7778: Remove obsolete r8a7778_clocks_init()
      clk: renesas: r8a7779: Remove obsolete r8a7779_clocks_init()
      clk: renesas: rcar-gen2: Remove obsolete rcar_gen2_clocks_init()
      can: rcar_canfd: Correct order of interrupt specifiers
      spi: sh-msiof: Add support for R-Car M3-W
      pinctrl: sh-pfc: r8a7796: Fix GPSR definitions for SDHI2/3
      ARM: shmobile: Sort Kconfig selections
      ARM: shmobile: r8a7794/alt: Add board part number to DT bindings
      ARM: shmobile: r8a7793/gose: Add board part number to DT bindings
      ARM: shmobile: r8a7779/marzen: Add board part number to DT bindings
      ARM: dts: r8a7790: Correct SCIFB reg properties to cover all registers
      ARM: dts: r8a7791: Correct SCIFB reg properties to cover all registers
      ARM: dts: r8a7793: Correct SCIFB reg properties to cover all registers
      ARM: dts: r8a7794: Correct SCIFB reg properties to cover all registers
      ARM: dts: r8a7794: Fix W=1 dtc warnings
      ARM: dts: emev2: Remove skeleton.dtsi inclusion
      ARM: dts: r8a7778: Remove skeleton.dtsi inclusion
      ARM: dts: r8a7779: Remove skeleton.dtsi inclusion
      ARM: dts: r8a7740: Remove skeleton.dtsi inclusion
      ARM: dts: sh73a0: Remove skeleton.dtsi inclusion
      ARM: dts: r8a73a4: Add device node for PRR
      ARM: dts: r8a7779: Add device node for PRR
      ARM: dts: r8a7790: Add device node for PRR
      ARM: dts: r8a7791: Add device node for PRR
      ARM: dts: r8a7792: Add device node for PRR
      ARM: dts: r8a7793: Add device node for PRR
      ARM: dts: r8a7794: Add device node for PRR
      arm64: dts: r8a7796: salvator-x: Populate EXTALR
      arm64: dts: r8a7795: Add device node for PRR
      arm64: dts: r8a7796: Add device node for PRR
      arm64: defconfig: Do not lower CONFIG_LOG_BUF_SHIFT

Hans Verkuil (2):
      [media] cec: pass parent device in register(), not allocate()
      ARM: dts: koelsch: add HDMI input

Hiep Cao Minh (1):
      spi: rspi: supports 32bytes buffer for DUAL and QUAD

Jacopo Mondi (1):
      ARM: dts: alt: Fix PFC names for DU

Jani Nikula (1):
      drm: define drm_compat_ioctl NULL on CONFIG_COMPAT=n and reduce #ifdefs

Javier Martinez Canillas (2):
      [media] v4l: rcar-fcp: Fix module autoload for OF registration
      [media] v4l: vsp1: Fix module autoload for OF registration

Jisheng Zhang (1):
      regulator: gpio: properly check return value of of_get_named_gpio

John Stultz (1):
      drm/bridge: adv7511: Add Audio support

Julia Lawall (1):
      ASoC: constify snd_soc_ops structures

Kazuya Mizuguchi (2):
      ravb: Remove Rx overflow log messages
      ravb: unmap descriptors when freeing rings

Kieran Bingham (2):
      [media] dt-bindings: Add Renesas R-Car FDP1 bindings
      [media] v4l: Add Renesas R-Car FDP1 Driver

Koji Matsuoka (3):
      drm: rcar-du: Fix display timing controller parameter
      drm: rcar-du: Fix H/V sync signal polarity configuration
      drm: rcar-du: Fix LVDS start sequence on Gen3

Kuninori Morimoto (28):
      ASoC: rsnd: depends on OF
      ASoC: rsnd: enable COMPILE_TEST
      ASoC: rsnd: remove duplicate define of rsnd_dvc_of_node()
      ASoC: rsnd: amend .probe/.remove call for DPCM
      ASoC: rsnd: add rsnd_mod_next() for for_each_rsnd_mod_xxx()
      ASoC: rsnd: use for_each_rsnd_mod_xxx() on rsnd_dai_call()
      ASoC: rsnd: use for_each_rsnd_mod_xxx() on rsnd_rdai_continuance_probe()
      ASoC: rsnd: add rsnd_parse_of_node() and integrate rsnd_xxx_of_node
      ASoC: rsnd: remove non DT support for DMA
      ASoC: rsnd: don't use devm_request_irq() for SSI
      ASoC: rsnd: remove rsnd_dma_detach()
      ASoC: rsnd: don't call unneeded of_node_put() on dma.c
      ASoC: rsnd: add nolock_start/stop callback
      ASoC: rsnd: remove "Gen2 only" comment
      ASoC: rsnd: rsnd_reg cleanup for SSIU
      ASoC: rsnd: fixup SCU_SYS_STATUSx access
      ASoC: rsnd: clear SSI_SYS_STATUSx every time
      ASoC: rsnd: enable SRC sync even FIN = FOUT
      ASoC: rsnd: use BRGCKR instead of SSICKR
      ASoC: rsnd: Request/Release DMA channel each time
      ASoC: rsnd: use dma_sync_single_for_xxx() for IOMMU
      ASoC: rsnd: rsnd_get_dalign() needs to care SSIU, not SSI
      ASoC: rsnd: tidyup ssi->usrcnt counter check in hw_params
      ASoC: rsnd: enable/disable ADG when suspend/resume timing
      ASoC: rsnd: setup BRGCKR/BRRA/BRRB when starting
      ASoC: simple-scu-card: code sync: follow to simple family style
      ASoC: simple-scu-card: code sync: rename asoc_simple_card_priv
      ASoC: simple-scu-card: code sync: tidyup props/link naming

Laurent Pinchart (20):
      clk: renesas: r8a7796: Add FCP clocks
      clk: renesas: r8a7796: Add VSP clocks
      clk: renesas: r8a7796: Add DU and LVDS clocks
      drm: Make the connector .detect() callback optional
      drm: rcar-du: Constify node argument to rcar_du_lvds_connector_init()
      drm: rcar-du: Bring HDMI encoder comments in line with the driver
      drm: rcar-du: Remove test for impossible error condition
      drm: rcar-du: Remove memory allocation error message
      drm: rcar-du: Fix crash in encoder failure error path
      drm: rcar-du: Simplify and fix probe error handling
      drm: rcar-du: Add R8A7796 support
      drm: rcar-du: Fix dot clock routing configuration
      dt-bindings: media: renesas-fcp: Remove SoC-specific compatible strings
      [media] v4l: ctrls: Add deinterlacing mode control
      [media] v4l: vsp1: Add support for capture and output in HSV formats
      ARM: shmobile: Consolidate R8A7743 and R8A779[234] machine definitions
      ARM: dts: r8a7779: Fix DU reg property
      ARM: dts: r8a7779: marzen: Configure pinmuxing for the DU0 input clock
      arm64: dts: r8a7795: salvator-x: Add DU LVDS output endpoint
      arm64: dts: r8a7795: Remove FCP SoC-specific compatible strings

Linus Walleij (1):
      arm64: defconfig: drop GPIO_SYSFS on multiplatforms

Lu Baolu (4):
      usb: xhci: clean up error_bitmask usage
      usb: xhci: cleanup cmd_completion in xhci_virt_device
      usb: xhci: remove the use of xhci->addr_dev
      usb: xhci: move slot_id from xhci_hcd to xhci_command structure

Magnus Damm (1):
      arm64: defconfig: Enable DRM DU and V4L2 FCP + VSP modules

Masahiro Yamada (1):
      usb: renesas_usbhs: cleanup with list_first_entry_or_null()

Mathias Nyman (16):
      xhci: remove unnecessary xhci_quiesce call before xhci_halt
      xhci: cleanup error message if halting the host failed.
      xhci: don't try to reset the host if it is unaccessible
      xhci: use trb helper functions when possible
      xhci: add trb_is_noop() helper function
      xhci: remove extra URB_SHORT_NOT_OK checks in xhci, core handles most cases
      xhci: cleanup and refactor process_ctrl_td()
      xhci: cleanup and refactor process_bulk_intr_td()
      xhci: rename endpoint related trb variables
      xhci: refactor and cleanup process_isoc_td()
      xhci: cleanup and refactor td_to_noop()
      xhci: refactor handle_tx_event() urb giveback
      xhci: Giveback urb in finish_td directly
      xhci: Remove duplicate xhci urb giveback functions
      xhci: add helper to get the endpoint state of a endpoint context
      xhci: remove WARN_ON if dma mask is not set for platform devices

Maxime Ripard (1):
      ASoC: wm8978: Adjust clock indices so that simple card works

Niklas Söderlund (10):
      clk: renesas: r8a7796: Add CSI2 clocks
      clk: renesas: r8a7796: Add VIN clocks
      pinctrl: sh-pfc: r8a7796: Add DU support
      pinctrl: sh-pfc: r8a7795: Simplify get bias logic
      pinctrl: sh-pfc: r8a7778: Use lookup function for bias data
      pinctrl: sh-pfc: Support named pins with custom configuration
      pinctrl: sh-pfc: r8a7795: Support none GPIO pins with configurable drive-strength
      pinctrl: sh-pfc: r8a7795: Add group for AVB MDIO and MII pins
      pinctrl: sh-pfc: r8a7795: Add group for QSPI0 and QSPI1 pins
      ARM: shmobile: defconfig: Enable CONFIG_CGROUPS

OGAWA Hirofumi (1):
      xhci: Fix race related to abort operation

Ramesh Shanmugasundaram (2):
      clk: renesas: r8a7796: Add DRIF clock
      pinctrl: sh-pfc: r8a7796: Add DRIF support

Ricardo Ribalda Delgado (2):
      [media] videodev2.h Add HSV formats
      [media] videodev2.h Add HSV encoding

Sean Nyekjaer (2):
      net: phy: micrel: add support for KSZ8795
      net: phy: micrel: KSZ8795 do not set SUPPORTED_[Asym_]Pause

Sergei Shtylyov (35):
      ARM: shmobile: r8a7743: add power domain index macros
      soc: renesas: rcar-sysc: add R8A7743 support
      ARM: shmobile: r8a7745: add power domain index macros
      soc: renesas: rcar-sysc: add R8A7745 support
      clk: renesas: Add r8a7743 CPG Core Clock Definitions
      clk: renesas: Add r8a7745 CPG Core Clock Definitions
      clk: renesas: cpg-mssr: Add common R-Car Gen2 support
      clk: renesas: cpg-mssr: Add R8A7743 support
      clk: renesas: cpg-mssr: Add R8A7745 support
      drm: rcar-du: Add R8A7792 support
      sh_eth: fix branch prediction in sh_eth_interrupt()
      sh_eth: enable RX descriptor word 0 shift on SH7734
      sh_eth: fix EESIPR values for SH77{34|63}
      sh_eth: R8A7740 supports packet shecksumming
      ARM: shmobile: r8a7743: basic SoC support
      ARM: shmobile: document SK-RZG1M board
      ARM: dts: wheat: add DU support
      ARM: dts: r8a7792: add MSIOF clocks
      ARM: dts: r8a7792: add MSIOF support
      ARM: shmobile: r8a7745: basic SoC support
      ARM: shmobile: document SK-RZG1E board
      ARM: dts: r8a7743: initial SoC device tree
      ARM: dts: r8a7743: add SYS-DMAC support
      ARM: dts: r8a7743: add [H]SCIF{A|B} support
      ARM: dts: r8a7743: add Ether support
      ARM: dts: r8a7743: add IRQC support
      ARM: dts: sk-rzg1m: initial device tree
      ARM: dts: sk-rzg1m: add Ether support
      ARM: dts: r8a7745: initial SoC device tree
      ARM: dts: r8a7745: add SYS-DMAC support
      ARM: dts: r8a7745: add [H]SCIF{|A|B} support
      ARM: dts: r8a7745: add Ether support
      ARM: dts: r8a7745: add IRQC support
      ARM: dts: sk-rzg1e: initial device tree
      ARM: dts: sk-rzg1e: add Ether support

Simon Horman (29):
      i2c: rcar: Add per-Generation fallback bindings
      i2c: sh_mobile: Add per-Generation fallback bindings
      PCI: rcar-gen2: Use gen2 fallback compatibility last
      PCI: rcar: Use gen2 fallback compatibility last
      PCI: rcar: Add gen3 fallback compatibility string for pcie-rcar
      mmc: sh_mmcif: Document r8a73a4, r8a7778 and sh73a0 DT bindings
      mmc: core: Add helper to see if a host can be retuned
      mmc: tmio: document mandatory and optional callbacks
      mmc: sh_mobile_sdhi: Add tuning support
      mmc: sh_mobile_sdhi: remove support for sh7372
      spi: sh-msiof: Add R-Car Gen 2 and 3 fallback bindings
      spi: sh-msiof: Do not use C++ style comment
      ARM: dts: r8a7791: set maximum frequency for SDHI clocks
      ARM: shmobile: select errata 798181 for SoCs with CA15 cores
      ARM: dts: koelsch: enable UHS for SDHI 0, 1 & 3
      ARM: dts: r8a7794: set maximum frequency for SDHI clocks
      ARM: dts: alt: enable UHS for SDHI 0 & 1
      ARM: dts: gose: use generic pinctrl properties in SDHI nodes
      ARM: dts: lager: rename and reindex i2cexio
      ARM: dts: lager: use demuxer for IIC1/I2C1
      ARM: dts: koelsch: use demuxer for I2C1
      ARM: dts: alt: use demuxer for I2C4
      ARM: dts: lager: Enable UHS-I SDR-104
      ARM: dts: koelsch: Enable UHS-I SDR-104
      ARM: dts: alt: Enable UHS-I SDR-104
      arm64: dts: r8a7796: add SDHI nodes
      arm64: dts: r8a7796: salvator-x: enable SDHI0 & 3
      arm64: dts: r8a7796: salvator-x: enable UHS for SDHI 0 & 3
      arm64: dts: h3ulcb: Provide sd0_uhs node

Srinivas Kandagatla (1):
      drm/bridge: adv7511: Enable the audio data and clock pads on adv7533

Sudeep Holla (1):
      Input: gpio_keys - set input direction explicitly

Takatoshi Akiyama (1):
      serial: sh-sci: Fix deadlock caused by serial output request

Takeshi Kihara (2):
      clk: renesas: r8a7795: Fix HDMI parent clock
      pinctrl: sh-pfc: r8a7796: Add EtherAVB pins, groups and functions

Timur Tabi (1):
      net: phy: phy drivers should not set SUPPORTED_[Asym_]Pause

Ulf Hansson (1):
      net: smsc911x: Synchronize the runtime PM status during system suspend

Ulrich Hecht (11):
      clk: renesas: r8a7796: Add SYS-DMAC clocks
      clk: renesas: r8a7796: Add SCIF clocks
      clk: renesas: r8a7796: Add HSCIF clocks
      clk: renesas: r8a7796: Add I2C clocks
      dmaengine: rcar-dmac: Document R-Car M3-W bindings
      pinctrl: sh-pfc: r8a7796: Add I2C pin support
      ARM: dts: r8a7793: Enable VIN0-VIN2
      arm64: renesas: r8a7796: add SYS-DMAC controller nodes
      arm64: dts: r8a7796: add I2C support
      arm64: dts: r8a7796: Enable I2C DMA
      arm64: dts: r8a7796: salvator-x: enable I2C

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

Wei Yongjun (1):
      xhci: fix non static symbol warning

William Towle (1):
      ARM: dts: lager: Add entries for VIN HDMI input support

Wolfram Sang (5):
      mmc: tmio: fix wrong bitmask for SDIO irqs
      mmc: tmio: remove SDIO from TODO list
      arm64: dts: r8a7795: salvator-x: enable UHS for SDHI 0 & 3
      arm64: dts: r8a7795: salvator: enable on-board eMMC
      arm64: dts: r8a7796: salvator: enable on board eMMC

Yoshihiro Shimoda (4):
      phy: rcar-gen3-usb2: add sysfs for usb role swap
      usb: host: xhci: rcar: add a new firmware version for r8a7796
      usb: host: xhci: plat: add support for Renesas r8a7796 SoC
      arm64: dts: r8a7795: salvator-x: add bias setting for usb1_pins

jbrunet (2):
      net: phy: add an option to disable EEE advertisement
      net: phy: use boolean dt properties for eee broken modes

 .../ABI/testing/sysfs-platform-phy-rcar-gen3-usb2  |   15 +
 Documentation/devicetree/bindings/arm/shmobile.txt |   36 +-
 .../devicetree/bindings/clock/renesas,cpg-mssr.txt |    5 +-
 .../devicetree/bindings/display/renesas,du.txt     |   12 +-
 .../devicetree/bindings/dma/renesas,rcar-dmac.txt  |    1 +
 Documentation/devicetree/bindings/i2c/i2c-rcar.txt |   32 +-
 .../devicetree/bindings/i2c/i2c-sh_mobile.txt      |   17 +-
 .../devicetree/bindings/media/renesas,fcp.txt      |    8 +-
 .../devicetree/bindings/media/renesas,fdp1.txt     |   37 +
 .../devicetree/bindings/mmc/renesas,mmcif.txt      |    3 +
 Documentation/devicetree/bindings/mmc/tmio_mmc.txt |    2 +-
 .../devicetree/bindings/net/can/rcar_can.txt       |   12 +-
 .../devicetree/bindings/net/can/rcar_canfd.txt     |   14 +-
 Documentation/devicetree/bindings/pci/rcar-pci.txt |    1 +
 .../bindings/power/renesas,rcar-sysc.txt           |    8 +-
 .../devicetree/bindings/reset/renesas,rst.txt      |   37 +
 Documentation/devicetree/bindings/spi/sh-msiof.txt |   20 +-
 Documentation/devicetree/bindings/usb/usb-xhci.txt |    1 +
 Documentation/media/kapi/cec-core.rst              |   14 +-
 Documentation/media/uapi/v4l/extended-controls.rst |    4 +
 Documentation/media/v4l-drivers/index.rst          |    3 +
 Documentation/media/v4l-drivers/rcar-fdp1.rst      |   37 +
 MAINTAINERS                                        |    9 +
 arch/arm/boot/dts/Makefile                         |    2 +
 arch/arm/boot/dts/emev2.dtsi                       |    3 +-
 arch/arm/boot/dts/r7s72100-rskrza1.dts             |    5 +
 arch/arm/boot/dts/r7s72100.dtsi                    |   55 +
 arch/arm/boot/dts/r8a73a4.dtsi                     |    5 +
 arch/arm/boot/dts/r8a7740.dtsi                     |    4 +-
 arch/arm/boot/dts/r8a7743-sk-rzg1m.dts             |   57 +
 arch/arm/boot/dts/r8a7743.dtsi                     |  476 ++++
 arch/arm/boot/dts/r8a7745-sk-rzg1e.dts             |   52 +
 arch/arm/boot/dts/r8a7745.dtsi                     |  476 ++++
 arch/arm/boot/dts/r8a7778.dtsi                     |    9 +-
 arch/arm/boot/dts/r8a7779-marzen.dts               |    2 +-
 arch/arm/boot/dts/r8a7779.dtsi                     |   16 +-
 arch/arm/boot/dts/r8a7790-lager.dts                |  118 +-
 arch/arm/boot/dts/r8a7790.dtsi                     |   16 +-
 arch/arm/boot/dts/r8a7791-koelsch.dts              |  137 +-
 arch/arm/boot/dts/r8a7791.dtsi                     |   19 +-
 arch/arm/boot/dts/r8a7792-wheat.dts                |  126 +
 arch/arm/boot/dts/r8a7792.dtsi                     |   61 +-
 arch/arm/boot/dts/r8a7793-gose.dts                 |   12 +-
 arch/arm/boot/dts/r8a7793.dtsi                     |   43 +-
 arch/arm/boot/dts/r8a7794-alt.dts                  |   62 +-
 arch/arm/boot/dts/r8a7794.dtsi                     |   77 +-
 arch/arm/boot/dts/sh73a0.dtsi                      |    4 +-
 arch/arm/configs/shmobile_defconfig                |    1 +
 arch/arm/mach-shmobile/Kconfig                     |   21 +-
 arch/arm/mach-shmobile/Makefile                    |    3 -
 arch/arm/mach-shmobile/setup-r8a7778.c             |   15 -
 arch/arm/mach-shmobile/setup-r8a7779.c             |   27 -
 arch/arm/mach-shmobile/setup-r8a7792.c             |   35 -
 arch/arm/mach-shmobile/setup-r8a7793.c             |   33 -
 arch/arm/mach-shmobile/setup-r8a7794.c             |   33 -
 arch/arm/mach-shmobile/setup-rcar-gen2.c           |   39 +-
 arch/arm64/Kconfig.platforms                       |    1 +
 arch/arm64/boot/dts/renesas/Makefile               |    2 +-
 arch/arm64/boot/dts/renesas/r8a7795-h3ulcb.dts     |   53 +-
 arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts |   85 +-
 arch/arm64/boot/dts/renesas/r8a7795.dtsi           |   34 +-
 arch/arm64/boot/dts/renesas/r8a7796-m3ulcb.dts     |  189 ++
 arch/arm64/boot/dts/renesas/r8a7796-salvator-x.dts |  160 ++
 arch/arm64/boot/dts/renesas/r8a7796.dtsi           |  260 +++
 arch/arm64/configs/defconfig                       |   17 +-
 drivers/base/Kconfig                               |    1 +
 drivers/base/soc.c                                 |   79 +
 drivers/clk/renesas/Kconfig                        |    2 +
 drivers/clk/renesas/Makefile                       |    2 +
 drivers/clk/renesas/clk-r8a7778.c                  |   26 +-
 drivers/clk/renesas/clk-r8a7779.c                  |   18 +-
 drivers/clk/renesas/clk-rcar-gen2.c                |   32 +-
 drivers/clk/renesas/r8a7743-cpg-mssr.c             |  270 +++
 drivers/clk/renesas/r8a7745-cpg-mssr.c             |  259 +++
 drivers/clk/renesas/r8a7795-cpg-mssr.c             |   10 +-
 drivers/clk/renesas/r8a7796-cpg-mssr.c             |   65 +-
 drivers/clk/renesas/rcar-gen2-cpg.c                |  371 +++
 drivers/clk/renesas/rcar-gen2-cpg.h                |   43 +
 drivers/clk/renesas/rcar-gen3-cpg.c                |   31 +-
 drivers/clk/renesas/rcar-gen3-cpg.h                |    1 -
 drivers/clk/renesas/renesas-cpg-mssr.c             |   25 +-
 drivers/clk/renesas/renesas-cpg-mssr.h             |    2 +
 drivers/gpu/drm/arc/arcpgu_drv.c                   |    2 -
 drivers/gpu/drm/arc/arcpgu_sim.c                   |    7 -
 drivers/gpu/drm/arm/hdlcd_drv.c                    |    2 -
 drivers/gpu/drm/arm/malidp_drv.c                   |    2 -
 drivers/gpu/drm/ast/ast_drv.c                      |    2 -
 drivers/gpu/drm/ast/ast_mode.c                     |    7 -
 drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c       |    5 +-
 drivers/gpu/drm/bochs/bochs_drv.c                  |    2 -
 drivers/gpu/drm/bochs/bochs_kms.c                  |    7 -
 drivers/gpu/drm/bridge/adv7511/Kconfig             |    8 +
 drivers/gpu/drm/bridge/adv7511/Makefile            |    1 +
 drivers/gpu/drm/bridge/adv7511/adv7511.h           |   16 +
 drivers/gpu/drm/bridge/adv7511/adv7511_audio.c     |  213 ++
 drivers/gpu/drm/bridge/adv7511/adv7511_drv.c       |    4 +
 drivers/gpu/drm/bridge/adv7511/adv7533.c           |    1 +
 drivers/gpu/drm/bridge/nxp-ptn3460.c               |    7 -
 drivers/gpu/drm/bridge/parade-ps8622.c             |    7 -
 drivers/gpu/drm/bridge/tc358767.c                  |    7 -
 drivers/gpu/drm/cirrus/cirrus_drv.c                |    2 -
 drivers/gpu/drm/cirrus/cirrus_mode.c               |    7 -
 drivers/gpu/drm/drm_atomic.c                       |   25 +-
 drivers/gpu/drm/drm_atomic_helper.c                |   98 +-
 drivers/gpu/drm/drm_fb_helper.c                    |    9 +-
 drivers/gpu/drm/drm_fops.c                         |   13 +-
 drivers/gpu/drm/drm_probe_helper.c                 |   14 +-
 drivers/gpu/drm/etnaviv/etnaviv_drv.c              |    2 -
 drivers/gpu/drm/exynos/exynos_drm_drv.c            |    5 +-
 drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c          |    2 -
 drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_rgb.c          |    7 -
 drivers/gpu/drm/gma500/cdv_intel_lvds.c            |   14 -
 drivers/gpu/drm/gma500/psb_drv.c                   |    2 -
 drivers/gpu/drm/gma500/psb_intel_lvds.c            |   14 -
 drivers/gpu/drm/hisilicon/kirin/kirin_drm_drv.c    |    2 -
 drivers/gpu/drm/i810/i810_dma.c                    |    2 -
 drivers/gpu/drm/i810/i810_drv.c                    |    2 -
 drivers/gpu/drm/i915/i915_debugfs.c                |    5 +-
 drivers/gpu/drm/i915/i915_drv.c                    |    2 -
 drivers/gpu/drm/i915/i915_drv.h                    |    2 +
 drivers/gpu/drm/i915/intel_display.c               |   31 +-
 drivers/gpu/drm/i915/intel_dsi.c                   |    7 -
 drivers/gpu/drm/i915/intel_sprite.c                |    4 +-
 drivers/gpu/drm/imx/imx-ldb.c                      |    7 -
 drivers/gpu/drm/imx/imx-tve.c                      |    7 -
 drivers/gpu/drm/imx/parallel-display.c             |    7 -
 drivers/gpu/drm/mediatek/mtk_drm_drv.c             |    5 +-
 drivers/gpu/drm/mediatek/mtk_dsi.c                 |    7 -
 drivers/gpu/drm/mgag200/mgag200_drv.c              |    2 -
 drivers/gpu/drm/mgag200/mgag200_mode.c             |    7 -
 drivers/gpu/drm/msm/msm_atomic.c                   |    3 +-
 drivers/gpu/drm/msm/msm_drv.c                      |    2 -
 drivers/gpu/drm/omapdrm/omap_drv.c                 |    3 +-
 drivers/gpu/drm/rcar-du/rcar_du_crtc.c             |    6 +-
 drivers/gpu/drm/rcar-du/rcar_du_drv.c              |   85 +-
 drivers/gpu/drm/rcar-du/rcar_du_group.c            |   22 +-
 drivers/gpu/drm/rcar-du/rcar_du_hdmienc.c          |    4 +-
 drivers/gpu/drm/rcar-du/rcar_du_kms.c              |   20 +-
 drivers/gpu/drm/rcar-du/rcar_du_lvdscon.c          |    9 +-
 drivers/gpu/drm/rcar-du/rcar_du_lvdscon.h          |    2 +-
 drivers/gpu/drm/rcar-du/rcar_du_lvdsenc.c          |   19 +-
 drivers/gpu/drm/rockchip/dw-mipi-dsi.c             |    7 -
 drivers/gpu/drm/rockchip/rockchip_drm_drv.c        |    2 -
 drivers/gpu/drm/savage/savage_drv.c                |    2 -
 drivers/gpu/drm/shmobile/shmob_drm_crtc.c          |    7 -
 drivers/gpu/drm/shmobile/shmob_drm_drv.c           |    2 -
 drivers/gpu/drm/sis/sis_drv.c                      |    2 -
 drivers/gpu/drm/sti/sti_drv.c                      |    5 +-
 drivers/gpu/drm/sti/sti_hda.c                      |    7 -
 drivers/gpu/drm/sun4i/sun4i_drv.c                  |    2 -
 drivers/gpu/drm/sun4i/sun4i_rgb.c                  |    7 -
 drivers/gpu/drm/sun4i/sun4i_tv.c                   |    7 -
 drivers/gpu/drm/tdfx/tdfx_drv.c                    |    2 -
 drivers/gpu/drm/tegra/drm.c                        |    5 +-
 drivers/gpu/drm/tilcdc/tilcdc_drv.c                |    4 -
 drivers/gpu/drm/tilcdc/tilcdc_panel.c              |    8 -
 drivers/gpu/drm/udl/udl_drv.c                      |    2 -
 drivers/gpu/drm/vc4/vc4_drv.c                      |    2 -
 drivers/gpu/drm/vc4/vc4_kms.c                      |    3 +-
 drivers/gpu/drm/via/via_drv.c                      |    2 -
 drivers/gpu/drm/virtio/virtgpu_drv.c               |    2 -
 drivers/i2c/busses/i2c-rcar.c                      |    5 +-
 drivers/i2c/busses/i2c-sh_mobile.c                 |    4 +-
 drivers/input/keyboard/gpio_keys.c                 |  161 +-
 drivers/input/keyboard/gpio_keys_polled.c          |  113 +-
 drivers/media/i2c/adv7511.c                        |    5 +-
 drivers/media/i2c/adv7604.c                        |    6 +-
 drivers/media/i2c/adv7842.c                        |    6 +-
 drivers/media/platform/Kconfig                     |   13 +
 drivers/media/platform/Makefile                    |    1 +
 drivers/media/platform/rcar-fcp.c                  |    1 +
 drivers/media/platform/rcar_fdp1.c                 | 2445 ++++++++++++++++++++
 drivers/media/platform/vivid/vivid-cec.c           |    3 +-
 drivers/media/platform/vivid/vivid-cec.h           |    1 -
 drivers/media/platform/vivid/vivid-core.c          |    9 +-
 drivers/media/platform/vsp1/vsp1_drv.c             |    1 +
 drivers/media/platform/vsp1/vsp1_pipe.c            |    8 +
 drivers/media/platform/vsp1/vsp1_rwpf.c            |    2 +
 drivers/media/platform/vsp1/vsp1_video.c           |    5 +
 drivers/media/v4l2-core/v4l2-ctrls.c               |    2 +
 drivers/media/v4l2-core/v4l2-ioctl.c               |    2 +
 drivers/mmc/host/sh_mobile_sdhi.c                  |  274 ++-
 drivers/mmc/host/tmio_mmc.h                        |   32 +-
 drivers/mmc/host/tmio_mmc_pio.c                    |  119 +-
 drivers/net/ethernet/renesas/ravb_main.c           |  120 +-
 drivers/net/ethernet/renesas/sh_eth.c              |    8 +-
 drivers/net/ethernet/smsc/smsc911x.c               |    6 +
 drivers/net/phy/bcm-cygnus.c                       |    3 +-
 drivers/net/phy/bcm7xxx.c                          |    6 +-
 drivers/net/phy/broadcom.c                         |   36 +-
 drivers/net/phy/icplus.c                           |    6 +-
 drivers/net/phy/intel-xway.c                       |   24 +-
 drivers/net/phy/micrel.c                           |   44 +-
 drivers/net/phy/microchip.c                        |    3 +-
 drivers/net/phy/national.c                         |    2 +-
 drivers/net/phy/phy.c                              |    3 +
 drivers/net/phy/phy_device.c                       |  111 +-
 drivers/net/phy/smsc.c                             |   18 +-
 drivers/pci/host/pci-rcar-gen2.c                   |    2 +-
 drivers/pci/host/pcie-rcar.c                       |    5 +-
 drivers/phy/phy-rcar-gen3-usb2.c                   |  118 +-
 drivers/pinctrl/sh-pfc/pfc-r8a7778.c               |  342 +--
 drivers/pinctrl/sh-pfc/pfc-r8a7795.c               |  273 ++-
 drivers/pinctrl/sh-pfc/pfc-r8a7796.c               |  576 ++++-
 drivers/pinctrl/sh-pfc/sh_pfc.h                    |    8 +
 drivers/regulator/gpio-regulator.c                 |    9 +-
 drivers/soc/renesas/Makefile                       |    9 +
 drivers/soc/renesas/r8a7743-sysc.c                 |   32 +
 drivers/soc/renesas/r8a7745-sysc.c                 |   32 +
 drivers/soc/renesas/rcar-rst.c                     |   92 +
 drivers/soc/renesas/rcar-sysc.c                    |    6 +
 drivers/soc/renesas/rcar-sysc.h                    |    2 +
 drivers/soc/renesas/renesas-soc.c                  |  257 ++
 drivers/spi/spi-rspi.c                             |   52 +-
 drivers/spi/spi-sh-msiof.c                         |    5 +-
 drivers/staging/media/cec/cec-api.c                |    2 +-
 drivers/staging/media/cec/cec-core.c               |   18 +-
 drivers/staging/media/pulse8-cec/pulse8-cec.c      |    4 +-
 drivers/staging/media/s5p-cec/s5p_cec.c            |    5 +-
 drivers/staging/media/st-cec/stih-cec.c            |    5 +-
 drivers/tty/serial/sh-sci.c                        |   20 +-
 drivers/usb/host/xhci-mem.c                        |   12 +-
 drivers/usb/host/xhci-mtk-sch.c                    |    4 +-
 drivers/usb/host/xhci-plat.c                       |   11 +-
 drivers/usb/host/xhci-rcar.c                       |    4 +
 drivers/usb/host/xhci-rcar.h                       |    1 +
 drivers/usb/host/xhci-ring.c                       |  696 +++---
 drivers/usb/host/xhci.c                            |   44 +-
 drivers/usb/host/xhci.h                            |   13 +-
 drivers/usb/renesas_usbhs/fifo.c                   |    5 +-
 include/drm/drmP.h                                 |    5 +
 include/drm/drm_atomic.h                           |   31 +-
 include/drm/drm_connector.h                        |    3 +
 include/drm/drm_plane.h                            |    1 -
 include/dt-bindings/clock/r7s72100-clock.h         |    7 +
 include/dt-bindings/clock/r8a7743-cpg-mssr.h       |   43 +
 include/dt-bindings/clock/r8a7745-cpg-mssr.h       |   44 +
 include/dt-bindings/power/r8a7743-sysc.h           |   25 +
 include/dt-bindings/power/r8a7745-sysc.h           |   25 +
 include/linux/clk/renesas.h                        |    4 -
 include/linux/gpio_keys.h                          |    5 +-
 include/linux/mfd/tmio.h                           |    5 +
 include/linux/micrel_phy.h                         |    2 +
 include/linux/mmc/host.h                           |    5 +
 include/linux/phy.h                                |    3 +
 include/linux/soc/renesas/rcar-rst.h               |    6 +
 include/linux/sys_soc.h                            |    9 +
 include/media/cec.h                                |   10 +-
 include/uapi/linux/usb/ch9.h                       |   19 +
 include/uapi/linux/v4l2-controls.h                 |    1 +
 include/uapi/linux/videodev2.h                     |   36 +-
 sound/soc/codecs/wm8978.h                          |    2 +-
 sound/soc/generic/simple-card.c                    |    2 +-
 sound/soc/generic/simple-scu-card.c                |  115 +-
 sound/soc/intel/boards/bdw-rt5677.c                |    2 +-
 sound/soc/intel/boards/bxt_da7219_max98357a.c      |    4 +-
 sound/soc/intel/boards/bxt_rt298.c                 |    4 +-
 sound/soc/intel/boards/bytcr_rt5640.c              |    4 +-
 sound/soc/intel/boards/bytcr_rt5651.c              |    4 +-
 sound/soc/intel/boards/cht_bsw_max98090_ti.c       |    4 +-
 sound/soc/intel/boards/cht_bsw_rt5645.c            |    4 +-
 sound/soc/intel/boards/cht_bsw_rt5672.c            |    4 +-
 sound/soc/intel/boards/haswell.c                   |    2 +-
 sound/soc/intel/boards/skl_nau88l25_max98357a.c    |    6 +-
 sound/soc/intel/boards/skl_nau88l25_ssm4567.c      |    6 +-
 sound/soc/intel/boards/skl_rt286.c                 |    4 +-
 sound/soc/kirkwood/armada-370-db.c                 |    2 +-
 sound/soc/mxs/mxs-sgtl5000.c                       |    2 +-
 sound/soc/sh/Kconfig                               |    3 +-
 sound/soc/sh/rcar/adg.c                            |   61 +-
 sound/soc/sh/rcar/core.c                           |  179 +-
 sound/soc/sh/rcar/dma.c                            |  295 ++-
 sound/soc/sh/rcar/dvc.c                            |    2 -
 sound/soc/sh/rcar/gen.c                            |   12 +-
 sound/soc/sh/rcar/rsnd.h                           |  156 +-
 sound/soc/sh/rcar/src.c                            |   13 +-
 sound/soc/sh/rcar/ssi.c                            |   28 +-
 sound/soc/sh/rcar/ssiu.c                           |   20 +
 278 files changed, 10595 insertions(+), 2184 deletions(-)
 create mode 100644 Documentation/ABI/testing/sysfs-platform-phy-rcar-gen3-usb2
 create mode 100644 Documentation/devicetree/bindings/media/renesas,fdp1.txt
 create mode 100644 Documentation/devicetree/bindings/reset/renesas,rst.txt
 create mode 100644 Documentation/media/v4l-drivers/rcar-fdp1.rst
 create mode 100644 arch/arm/boot/dts/r8a7743-sk-rzg1m.dts
 create mode 100644 arch/arm/boot/dts/r8a7743.dtsi
 create mode 100644 arch/arm/boot/dts/r8a7745-sk-rzg1e.dts
 create mode 100644 arch/arm/boot/dts/r8a7745.dtsi
 delete mode 100644 arch/arm/mach-shmobile/setup-r8a7792.c
 delete mode 100644 arch/arm/mach-shmobile/setup-r8a7793.c
 delete mode 100644 arch/arm/mach-shmobile/setup-r8a7794.c
 create mode 100644 arch/arm64/boot/dts/renesas/r8a7796-m3ulcb.dts
 create mode 100644 drivers/clk/renesas/r8a7743-cpg-mssr.c
 create mode 100644 drivers/clk/renesas/r8a7745-cpg-mssr.c
 create mode 100644 drivers/clk/renesas/rcar-gen2-cpg.c
 create mode 100644 drivers/clk/renesas/rcar-gen2-cpg.h
 create mode 100644 drivers/gpu/drm/bridge/adv7511/adv7511_audio.c
 create mode 100644 drivers/media/platform/rcar_fdp1.c
 create mode 100644 drivers/soc/renesas/r8a7743-sysc.c
 create mode 100644 drivers/soc/renesas/r8a7745-sysc.c
 create mode 100644 drivers/soc/renesas/rcar-rst.c
 create mode 100644 drivers/soc/renesas/renesas-soc.c
 create mode 100644 include/dt-bindings/clock/r8a7743-cpg-mssr.h
 create mode 100644 include/dt-bindings/clock/r8a7745-cpg-mssr.h
 create mode 100644 include/dt-bindings/power/r8a7743-sysc.h
 create mode 100644 include/dt-bindings/power/r8a7745-sysc.h
 create mode 100644 include/linux/soc/renesas/rcar-rst.h
