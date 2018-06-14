Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:58491 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755068AbeFNLep (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 14 Jun 2018 07:34:45 -0400
Date: Thu, 14 Jun 2018 13:34:41 +0200
From: Simon Horman <horms@verge.net.au>
To: ltsi-dev@lists.linuxfoundation.org
Cc: Hisao Munakata <hisao.munakata.vt@renesas.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [GIT/RFC PULL LTSI-4.14] Renesas SoCs and Drivers to v4.16
Message-ID: <20180614113441.3mxvblrt2kaxiiyl@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi,

** This series is for informational purposes only! **

This series is comprised of backports to v4.14 of the following
components from their standard as of v4.15 to that of v4.16:

* at24
* cpg
* dw-hdmi
* gen3
* gpio-rcar
* i2c-rcar
* i2c-sh-mobile
* ipmmu-vmsa
* irq-renesas-irqc
* m25p80
* mach-shmobile
* pci-rcar-gen2
* pcie-rcar
* phy-micrel
* ravb
* rcar-can
* rcar-dmac
* rcar-du
* rcar-snd
* rcar-thermal
* rcar-vin
* renesas-sdhi
* renesas-soc-id
* sata-rcar
* sh-drivers
* sh-eth
* sh-flctl
* sh-mmcif
* sh-mobile-ceu-camera
* sh-msiof
* sh-pfc
* sh-sci
* smsc911x
* sysc
* usb3-peri
* usbhs
* vsp1
* watchdog
* xhci-plat
* xhci-rcar

This is intended as a dry-run for backporting components used by Renesas
SoCs from v4.15, v4.16, v4.17 and beyond to v4.14.

In posting this work I am not implying anything about
decisions on the base of the LTSI release will be.

There are 362 patches.

This is based on similar backports of components to their standard as of
v4.15, posted as "[GIT/RFC PULL LTSI-4.14] Renesas SoCs and Drivers to v4.15"
and tagged as backport/v4.14.48/snapshot-to-v4.15-flattened.

As this work is for informational purposes I do not expect these patches
to be imported to quilt by Greg at this time. However, if you would like to
do so and rebasing would help please feel free to ask me to do so.


The following changes since commit 8f9df27e572ed5aec5e75ae3b81674649b9c0168:

  arm64: renesas: Add Renesas R8A77970 Kconfig support (2018-06-14 10:19:53 +0200)

are available in the git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas-backport.git tags/backport/v4.14.48/snapshot-to-v4.16-flattened

for you to fetch changes up to 6485613bce7106b963ce9a9dd8b6d434c26b1bfd:

  tty: serial: sh-sci: Add default for number of ports for compile-testing (2018-06-14 10:31:17 +0200)

----------------------------------------------------------------
LTSI-v4.14 Preparation for Renesas SoCs (to v4.16)

Base:
* v4.14.48
* Similar backport of components for Renesas SoCs to v4.15

Backports of the following components to their standard as of v4.16:
* at24
* cpg
* dw-hdmi
* gen3
* gpio-rcar
* i2c-rcar
* i2c-sh-mobile
* ipmmu-vmsa
* irq-renesas-irqc
* m25p80
* mach-shmobile
* pci-rcar-gen2
* pcie-rcar
* phy-micrel
* ravb
* rcar-can
* rcar-dmac
* rcar-du
* rcar-snd
* rcar-thermal
* rcar-vin
* renesas-sdhi
* renesas-soc-id
* sata-rcar
* sh-drivers
* sh-eth
* sh-flctl
* sh-mmcif
* sh-mobile-ceu-camera
* sh-msiof
* sh-pfc
* sh-sci
* smsc911x
* sysc
* usb3-peri
* usbhs
* vsp1
* watchdog
* xhci-plat
* xhci-rcar

----------------------------------------------------------------
ABE Hiroshige (1):
      clk: renesas: r8a7796: Add FDP clock

Adam Wallis (1):
      usb: xhci: allow imod-interval to be configurable

Alex Elder (3):
      arm64: defconfig: remove CONFIG_USB_EHCI_MSM
      arm64: defconfig: remove CONFIG_USB_MSM_OTG
      arm64: defconfig: remove CONFIG_USB_QCOM_8X16_PHY

Amit Kucheria (1):
      arm64: defconfig: enable new trigger modes for leds

Arnd Bergmann (1):
      mmc: tmio: hide unused tmio_mmc_clk_disable/tmio_mmc_clk_enable functions

Bartosz Golaszewski (4):
      dt-bindings: at24: new optional property - wp-gpios
      dt-bindings: at24: consistently document the compatible property
      dt-bindings: at24: fix formatting and style
      dt-bindings: at24: extend the list of supported chips

Biju Das (31):
      ARM: dts: r8a7745: Add HS-USB device node
      ARM: dts: r8a7745: Add USB-DMAC device nodes
      ARM: dts: r8a7745: Enable DMA for HSUSB
      ARM: dts: iwg22d-sodimm: Enable HS-USB
      ARM: dts: r8a7743: Add default PCIe bus clock
      ARM: dts: r8a7743: Add PCIe Controller device node
      ARM: dts: iwg20d-q7: Enable PCIe Controller
      ARM: shmobile: defconfig: Enable SGTL5000 audio codec
      ARM: dts: r8a7743: Add audio clocks
      ARM: dts: r8a7743: Add audio DMAC support
      ARM: dts: r8a7743: Add sound support
      ARM: dts: r8a7743: Add thermal device to DT
      ARM: dts: iwg20d-q7-common: Enable SGTL5000 audio codec
      ARM: dts: iwg20d-q7-common: Sound PIO support
      ARM: dts: iwg20d-q7-common: Sound DMA support on DTS
      ARM: dts: iwg20d-q7-common: Sound DMA support via BUSIF on DTS
      ARM: dts: iwg20d-q7-common: Sound DMA support via SRC on DTS
      ARM: dts: iwg20d-q7-common: Sound DMA support via DVC on DTS
      ARM: dts: r8a7745: Add audio clocks
      ARM: dts: r8a7745: Add audio DMAC support
      ARM: dts: r8a7745: Add sound support
      ARM: dts: iwg22d-sodimm: Enable SGTL5000 audio codec
      ARM: dts: iwg22d-sodimm: Sound PIO support
      ARM: dts: iwg22d-sodimm: Sound DMA support on DTS
      ARM: dts: iwg22d-sodimm: Sound DMA support via BUSIF on DTS
      ARM: dts: iwg22d-sodimm: Sound DMA support via SRC on DTS
      ARM: dts: iwg22d-sodimm: Sound DMA support via DVC on DTS
      ARM: dts: r8a7745: Add missing clock for secondary CA7 CPU core
      dt-bindings: thermal: rcar: Add device tree support for r8a7743
      pinctrl: sh-pfc: r8a7794: Add i2c5 pin groups and function
      ASoC: rsnd: Add device tree support for r8a774[35]

Bjorn Helgaas (1):
      PCI: Remove PCI_REASSIGN_ALL_RSRC use on arm and arm64

Chris Brandt (2):
      usb: renesas_usbhs: Add support for RZ/A1
      dt-bindings: usb: renesas_usbhs: Add support for RZ/A1

Chris Paterson (3):
      ARM: dts: r8a7790: Correct critical CPU temperature
      ARM: dts: r8a7791: Correct critical CPU temperature
      ARM: dts: r8a7793: Correct critical CPU temperature

Claudio Foellmi (1):
      i2c: generic recovery: check SCL before SDA

Colin Ian King (1):
      mmc: sh_mmcif: remove redundant initialization of 'opc'

Corentin Labbe (4):
      usb: xhci: remove unused variable last_freed_endpoint
      usb: xhci: remove unused variable ep
      usb: xhci: remove unused variable urb_priv
      usb: xhci: remove unused variable ep_ring

Dan Carpenter (1):
      mmc: tmio, renesas_sdhi: Remove unneeded NULL check

Divagar Mohandass (1):
      dt-bindings: add eeprom "size" property

Dominik Brodowski (1):
      cpufreq: Add and use cpufreq_for_each_{valid_,}entry_idx()

Fabrizio Castro (34):
      ARM: dts: r8a7743: Add DU support
      ARM: dts: iwg22d: Use /dev/ttySC3 as debug console
      ARM: dts: iwg22d: Add /dev/ttySC5 support
      ARM: dts: iwg22d-sodimm-dbhd-ca: Add device tree for HDMI DB
      ARM: dts: iwg22d-sodimm: sort dt nodes
      ARM: dts: r8a7745: Add IIC cores to dtsi
      ARM: dts: iwg20d-q7: Add support for ttySC3
      ARM: dts: r8a7745: Add DU support
      ARM: dts: iwg22d-sodimm-dbhd-ca: Add HDMI video output
      ARM: dts: r8a7745: Add CAN[01] SoC support
      ARM: dts: iwg22d-sodimm: Add can0 support to carrier board
      ARM: dts: iwg22d-sodimm-dbhd-ca: Add can1 support to HDMI DB
      ARM: dts: r8a7743: Add CAN[01] SoC support
      ARM: dts: iwg20d-q7-common: Add can0 support to carrier board
      ARM: dts: r8a7743: add VIN dt support
      ARM: dts: r8a7745: add VIN dt support
      ARM: dts: r8a7745: Add APMU node and second CPU core
      ARM: shmobile: defconfig: Enable PWM
      ARM: dts: r8a7743: Add PWM SoC support
      ARM: dts: r8a7743: Add TPU support
      ARM: dts: r8a7745: Add PWM SoC support
      ARM: dts: r8a7745: Add TPU support
      ARM: dts: r8a7743: Add CMT SoC specific support
      ARM: dts: r8a7745: Add CMT SoC specific support
      dt-bindings: can: rcar_can: document r8a774[35] can support
      dt-bindings: display: rcar-du: Document R8A774[35] DU
      drm: rcar-du: Add R8A7743 support
      drm: rcar-du: Add R8A7745 support
      pinctrl: sh-pfc: r8a7745: Add CAN[01] support
      pinctrl: sh-pfc: r8a7794: Add can_clk function
      pinctrl: sh-pfc: r8a7794: Add PWM[0123456] support
      pinctrl: sh-pfc: r8a7794: Add tpu groups and function
      pinctrl: sh-pfc: r8a7791: Add tpu groups and function
      dt-bindings: usb-xhci: Document r8a7743 support

Florian Fainelli (1):
      net: phy: micrel: Use strlcpy() for ethtool::get_strings

Geert Uytterhoeven (36):
      clk: renesas: mstp: Keep wakeup sources active during system suspend
      clk: renesas: cpg-mssr: Keep wakeup sources active during system suspend
      dt-bindings: gpio: rcar: Correct SoC family name for R8A7778
      dt-bindings/irqchip/renesas-irqc: Document R-Car M3-N support
      ARM: shmobile: Document Renesas M3-W-based Salvator-XS board DT bindings
      ARM: dts: koelsch: Correct primary compatible value for eeprom
      ARM: dts: genmai: Correct primary compatible value for eeprom
      ARM: dts: armadillo800eva: Convert to named i2c-gpio bindings
      ARM: dts: lager: Convert to named i2c-gpio bindings
      ARM: dts: koelsch: Convert to named i2c-gpio bindings
      ARM: dts: alt: Convert to named i2c-gpio bindings
      ARM: dts: r8a7740: Correct TPU register block size
      ravb: Remove obsolete explicit clock handling for WoL
      dt-bindings: net: renesas-ravb: Make stream buffer optional
      dmaengine: rcar-dmac: Make DMAC reinit during system resume explicit
      soc: renesas: Identify R-Car M3-W ES1.1
      ata: sata_rcar: Remove unused variable in sata_rcar_init_controller()
      sh_eth: Remove obsolete explicit clock handling for WoL
      soc: renesas: rcar-sysc: Keep wakeup sources active during system suspend
      dt-bindings: watchdog: renesas-wdt: Add support for the r8a77970 wdt
      gpio: rcar: Use wakeup_path i.s.o. explicit clock handling
      arm64: dts: renesas: r8a77970: Add RWDT node
      arm64: dts: renesas: eagle: Move avb node to preserve sort order
      arm64: dts: renesas: eagle: Enable watchdog timer
      arm64: dts: renesas: Add support for Salvator-XS with R-Car M3-W
      arm64: dts: renesas: salvator-common: Add BD9571 PMIC
      arm64: dts: renesas: r8a7795-es1-salvator-x: Add SoC name to file header
      arm64: dts: renesas: r8a7795-salvator-x: Add SoC name to file header
      arm64: dts: renesas: r8a7796-salvator-x: Add SoC name to file header
      arm64: dts: renesas: r8a7795-salvator-xs: Add SoC name to file header
      arm64: dts: renesas: ulcb: Add EthernetAVB PHY reset
      tty: serial: sh-sci: Hide number of ports config question
      tty: serial: sh-sci: Hide serial console config question
      tty: serial: sh-sci: Hide earlycon config question
      tty: serial: sh-sci: Hide DMA config question
      tty: serial: sh-sci: Add default for number of ports for compile-testing

Gregory CLEMENT (1):
      arm64: defconfig: enable ARM_ARMADA_37XX_CPUFREQ

Himanshu Jha (1):
      USB: host: Use zeroing memory allocator rather than allocator/memset

Hou Zhiqiang (2):
      mtd: spi-nor: add an API to restore the status of SPI flash chip
      mtd: m25p80: restore the status of SPI flash when exiting

Jacopo Mondi (1):
      media: v4l: sh_mobile_ceu: Return buffers on streamoff()

Jagan Teki (1):
      arm64: defconfig: enable MUSB HDRC along with Allwinner glue

Jani Nikula (1):
      drm/drivers: drop redundant drm_edid_to_eld() calls

Jiada Wang (1):
      ASoC: rsnd: ssi: remove unnesessary period_pos

Joe Perches (1):
      treewide: Use DEVICE_ATTR_RW

Kamal Dasu (1):
      mtd: spi-nor: add spi_nor_init() function

Keiji Hayashibara (1):
      arm64: defconfig: enable CONFIG_UNIPHIER_EFUSE

Kevin Hao (2):
      net: phy: Add general dummy stubs for MMD register access
      net: phy: micrel: Use the general dummy stubs for MMD register access

Khiem Nguyen (1):
      sata_rcar: Reset SATA PHY when Salvator-X board resumes

Kieran Bingham (2):
      drm: rcar-du: Implement system suspend/resume support
      drm: rcar-du: Remove unused CRTC suspend/resume functions

Kuninori Morimoto (13):
      dmaengine: rcar-dmac: ensure CHCR DE bit is actually 0 after clearing
      dmaengine: rcar-dmac: use TCRB instead of TCR for residue
      ASoC: soc-core: add component lookup functions
      ASoC: add snd_soc_disconnect_sync()
      ASoC: soc-core: add missing EXPORT_SYMBOL_GPL() for snd_soc_disconnect_sync
      ASoC: rsnd: call snd_soc_disconnect_sync() when remove
      ASoC: rsnd: TDM 6ch needs 8ch clock for hw refine
      ASoC: rsnd: dma.c: spin lock is no longer needed in IRQ handler
      ASoC: rsnd: more clear rsnd_get_dalign() for DALIGN
      ASoC: rsnd: don't use runtime->sample_bits
      ASoC: rsnd: PIO related function cleanup
      ASoC: rsnd: remove unneeded "is_graph" from __rsnd_dai_probe()
      ASoC: rcar: tidyup simple-card example for CPU node

Laurent Pinchart (4):
      drm: rcar-du: Don't set connector DPMS property
      drm: rcar-du: Share plane atomic check code between Gen2 and Gen3
      v4l: vsp1: Start and stop DRM pipeline independently of planes
      drm: rcar-du: Clip planes to screen boundaries

Lu Baolu (4):
      usb: xhci: Make some static functions global
      usb: xhci: Add DbC support in xHCI driver
      usb: xhci: Cleanup printk debug message for registers
      usb: xhci: Cleanup printk debug message for ERST

Magnus Damm (31):
      iommu/ipmmu-vmsa: Add r8a7796 DT binding
      ARM: dts: r8a73a4: Update CMT compat string
      ARM: dts: r8a7790: Update CMT compat strings
      ARM: dts: r8a7791: Update CMT compat strings
      ARM: dts: r8a7793: Update CMT compat strings
      ARM: dts: r8a7794: Update CMT compat strings
      ARM: dts: r8a73a4: Remove CMT renesas,channels-mask
      ARM: dts: r8a7740: Remove CMT renesas,channels-mask
      ARM: dts: r8a7790: Remove CMT renesas,channels-mask
      ARM: dts: r8a7791: Remove CMT renesas,channels-mask
      ARM: dts: r8a7793: Remove CMT renesas,channels-mask
      ARM: dts: r8a7794: Remove CMT renesas,channels-mask
      ARM: dts: sh73a0: Remove CMT renesas,channels-mask
      arm64: dts: renesas: r8a7796: Add IPMMU device nodes
      arm64: dts: renesas: r8a7796: Tie SYS-DMAC to IPMMU-DS0/1
      arm64: dts: renesas: r8a7796: Enable IPMMU-DS0, DS1, MP, VI0, VC0 and MM
      arm64: dts: renesas: r8a7795: Add IPMMU device nodes
      arm64: dts: renesas: r8a7795-es1: Add IPMMU device nodes
      arm64: dts: renesas: r8a7795: Tie SYS-DMAC to IPMMU-DS0/1
      arm64: dts: renesas: r8a7795: Tie Audio-DMAC to IPMMU-MP0/1
      arm64: dts: renesas: r8a7795: Point DU/VSPD via FCPVD to IPMMU-VI0/1
      arm64: dts: renesas: r8a7795-es1: Point DU/VSPD via FCPVD to IPMMU-VI0
      arm64: dts: renesas: r8a7795: Point FDP1 via FCPF to IPMMU-VP0/1
      arm64: dts: renesas: r8a7795-es1: Point FDP1 via FCPF to IPMMU-VP0
      arm64: dts: renesas: r8a7795: Point VSPBC/VSPBD via FCPVB to IPMMU-VP0/1
      arm64: dts: renesas: r8a7795: Point VSPI via FCPVI to IPMMU-VP0/1
      arm64: dts: renesas: r8a7795-es1: Point VSPI via FCPVI to IPMMU-VP
      arm64: dts: renesas: r8a7795: Connect Ethernet-AVB to IPMMU-DS0
      arm64: dts: renesas: r8a7795: Connect SATA to IPMMU-HC
      arm64: dts: renesas: r8a7795-es1: Enable IPMMU-MP1
      arm64: dts: renesas: r8a7795: Enable IPMMU-VI0, VP1, DS0, DS1 and MM

Masahiro Yamada (19):
      mmc: renesas_sdhi: remove eprobe jump label
      mmc: tmio: set tmio_mmc_host to driver data
      mmc: tmio: use devm_ioremap_resource() instead of devm_ioremap()
      mmc: tmio: move mmc_host_ops to struct tmio_mmc_host from static data
      mmc: tmio, renesas_sdhi: set mmc_host_ops hooks directly
      mmc: tmio: move mmc_gpio_request_cd() before mmc_add_host()
      mmc: renesas_sdhi: remove always false condition
      mmc: tmio, renesas_sdhi: move struct tmio_mmc_dma to renesas_sdhi.h
      mmc: tmio, renesas_sdhi: move Renesas-specific DMA data to renesas_sdhi.h
      mmc: tmio,renesas_sdhi: move ssc_tappos to renesas_sdhi.h
      mmc: tmio: change bus_shift to unsigned int
      mfd: tmio: Move register macros to tmio_core.c
      mmc: tmio: use mmc_can_gpio_cd() instead of checking TMIO_MMC_USE_GPIO_CD
      mmc: tmio: ioremap memory resource in tmio_mmc_host_alloc()
      mmc: tmio: move clk_enable/disable out of tmio_mmc_host_probe()
      mmc: tmio: move {tmio_}mmc_of_parse() to tmio_mmc_host_alloc()
      mmc: tmio: remove dma_ops from tmio_mmc_host_probe() argument
      mmc: slot-gpio: add a helper to check capability of GPIO WP detection
      mmc: tmio: refactor .get_ro hook

Mathias Nyman (5):
      xhci: add helper to allocate command with input context
      xhci: remove unnecessary boolean parameter from xhci_alloc_command
      xhci: add port status tracing for Get Port Status hub requests
      xhci: add port status tracing for Get Hub Status requests
      xhci: Don't print a warning when setting link state for disabled ports

Miquel Raynal (1):
      mtd: nand: use reworked NAND controller driver with Marvell EBU SoCs

Niklas Söderlund (1):
      pinctrl: sh-pfc: r8a7795: remove duplicate of CLKOUT pin in pinmux_pins[]

Peter Rosin (1):
      dt-bindings: at24: sort manufacturers alphabetically

Phil Reid (2):
      i2c: Switch to using gpiod interface for gpio bus recovery
      i2c: core: fix compile issue related to incorrect gpio header

Ramesh Shanmugasundaram (2):
      pinctrl: sh-pfc: r8a7795: Add CAN support
      pinctrl: sh-pfc: r8a7795: Add CAN FD support

Robin Murphy (1):
      iommu/ipmmu-vmsa: Remove redundant of_iommu_init_fn hook

Sergei Shtylyov (16):
      clk: renesas: r8a77970: Add LVDS clock
      arm64: renesas: document V3MSK board bindings
      ARM: dts: r8a7794: Add SMP support
      ravb: kill redundant check in the probe() method
      DT: net: renesas,ravb: document R8A77980 bindings
      sh_eth: kill redundant check in the probe() method
      sh_eth: remove sh_eth_plat_data::edmac_endian
      sh_eth: gather all TSU init code in one place
      sh_eth: get Ether port # only when needed
      sh_eth: uninline TSU register accessors
      pinctrl: sh-pfc: Add PORT_GP_CFG_{6|22}() helper macros
      pinctrl: sh-pfc: Add R8A77970 PFC support
      arm64: dts: renesas: initial V3MSK board device tree
      arm64: dts: renesas: v3msk: add EtherAVB support
      arm64: dts: renesas: r8a77970: use CPG core clock macros
      arm64: dts: renesas: r8a77970: use SYSC power domain macros

Simon Horman (41):
      iommu/ipmmu-vmsa: Add r8a779(70|95) DT bindings
      ARM: dts: r8a7743: Use R-Car Gen2 Ether fallback compat string
      ARM: dts: r8a7745: Use R-Car Gen2 Ether fallback compat string
      ARM: dts: r8a7778: Use R-Car Gen1 Ether fallback compat string
      ARM: dts: r8a7790: Use R-Car Gen2 Ether fallback compat string
      ARM: dts: r8a7791: Use R-Car Gen2 Ether fallback compat string
      ARM: dts: r8a7793: Use R-Car Gen2 Ether fallback compat string
      ARM: dts: r8a7794: Use R-Car Gen2 Ether fallback compat string
      ARM: dts: r8a7743: Use R-Car SDHI Gen2 fallback compat string
      ARM: dts: r8a7745: Use R-Car SDHI Gen2 fallback compat string
      ARM: dts: r8a7778: Use R-Car SDHI Gen1 fallback compat string
      ARM: dts: r8a7779: Use R-Car SDHI Gen1 fallback compat string
      ARM: dts: r8a7790: Use R-Car SDHI Gen2 fallback compat string
      ARM: dts: r8a7791: Use R-Car SDHI Gen2 fallback compat string
      ARM: dts: r8a7792: Use R-Car SDHI Gen2 fallback compat string
      ARM: dts: r8a7793: Use R-Car SDHI Gen2 fallback compat string
      ARM: dts: r8a7794: Use R-Car SDHI Gen2 fallback compat string
      ARM: dts: r8a7745: sort root sub-nodes alphabetically
      ARM: dts: r8a7745: move timer node out of bus
      ARM: dts: r8a7792: sort root sub-nodes alphabetically
      ARM: dts: r8a7792: move timer node out of bus
      ARM: dts: r8a7743: sort root sub-nodes alphabetically
      ARM: dts: r8a7743: move timer and thermal-zones nodes out of bus
      arm64: dts: renesas: r8a7795: Use R-Car SDHI Gen3 fallback compat string
      arm64: dts: renesas: r8a7796: Use R-Car SDHI Gen3 fallback compat string
      arm64: dts: renesas: r8a7796: Tie Audio-DMAC to IPMMU-MP
      arm64: dts: renesas: r8a7796: Point FDP1 via FCPF to IPMMU-VI0
      arm64: dts: renesas: r8a7796: Point VSPI via FCPVI to IPMMU-VC0
      arm64: dts: renesas: r8a7796: Connect Ethernet-AVB to IPMMU-DS0
      arm64: dts: renesas: r8a77970: sort includes
      arm64: dts: renesas: r8a77970: Add IPMMU device nodes
      arm64: dts: renesas: r8a77970: Tie SYS-DMAC to IPMMU-DS1
      arm64: dts: renesas: r8a77970: Connect Ethernet-AVB to IPMMU-RT
      arm64: dts: renesas: r8a77970: Enable IPMMU-DS1, RT and MM
      arm64: dts: renesas: r8a77995: Add IPMMU device nodes
      arm64: dts: renesas: r8a77995: Connect Ethernet-AVB to IPMMU-RT
      arm64: dts: renesas: r8a7795: Move nodes which have no reg property out of bus
      arm64: dts: renesas: r8a7795: sort subnodes of root node alphabetically
      arm64: dts: renesas: r8a7796: sort subnodes of root node alphabetically
      arm64: dts: renesas: r8a7796: move nodes which have no reg property out of bus
      arm64: dts: renesas: r8a7796: add reg properties to pciec[01] nodes

Sven Van Asbroeck (1):
      dt-bindings: add eeprom "no-read-rollover" property

Takashi Iwai (1):
      ALSA: add snd_card_disconnect_sync()

Takeshi Kihara (6):
      pinctrl: sh-pfc: r8a7795: Add GP-1-28 port pin support
      pinctrl: sh-pfc: r8a7795: Fix to delete A20..A25 pins function definitions
      pinctrl: sh-pfc: r8a7796: Fix to delete A20..A25 pins function definitions
      pinctrl: sh-pfc: r8a7795: Rename RTS{0,1,3,4}# pin function definitions
      pinctrl: sh-pfc: r8a7796: Rename RTS{0,1,3,4}# pin function definitions
      arm64: dts: renesas: r8a7795: Increase the number of GPIO bank 1 ports to 29

Ulf Hansson (1):
      PM / wakeup: Add device_set_wakeup_path() helper to control wakeup path

Ulrich Hecht (11):
      dt-bindings: mmc: renesas_sdhi: Add r8a77995 support
      mmc: renesas_sdhi: enable R-Car D3 (r8a77995) support
      pinctrl: sh-pfc: r8a77995: Add missing pins SCL0 and SDA0 to pinmux data
      pinctrl: sh-pfc: r8a77995: Add CAN support
      pinctrl: sh-pfc: r8a77995: Add CAN FD support
      arm64: dts: renesas: r8a77995: add SYS-DMAC nodes
      arm64: dts: renesas: r8a77995: Add SDHI (MMC) support
      arm64: dts: renesas: r8a77995: Add CAN external clock support
      arm64: dts: renesas: r8a77995: Add CAN support
      arm64: dts: renesas: r8a77995: Add CAN FD support
      arm64: dts: renesas: r8a77995: add DMA for SCIF2

Ville Syrjälä (2):
      drm: Check crtc_state->enable rather than crtc->enabled in drm_plane_helper_check_state()
      drm: Move drm_plane_helper_check_state() into drm_atomic_helper.c

Vladimir Barinov (2):
      arm64: dts: renesas: ulcb-kf: enable USB2 PHY of channel 0
      arm64: dts: renesas: ulcb-kf: add dr_mode property for USB2.0 channel 0

Wolfram Sang (33):
      dt-bindings: eeprom: rename to at24.txt
      i2c: sh_mobile: remove redundant initialization
      i2c: sh_mobile: remove redundant deinitialization
      i2c: sh_mobile: manually "inline" two short functions
      i2c: sh_mobile: use direct writes when accessing ICE bit
      i2c: sh_mobile: shorten exit of xfer routine
      i2c: sh_mobile: let RuntimePM do the clock handling
      i2c: sh_mobile: avoid unnecessary register read
      i2c: sh_mobile: send STOP according to datasheet
      i2c: sh_mobile: make sure to not accidently trigger STOP
      mmc: tmio: use usleep_range consistently
      mmc: tmio: use ioread* for repeated access to a register
      mmc: tmio: use io* accessors consistently
      pinctrl: sh-pfc: r8a7795: Add SATA pins, groups, and functions
      i2c: add helpers to ease DMA handling
      i2c: add a message flag for DMA safe buffers
      i2c: sh_mobile: use core helper to decide when to use DMA
      i2c: sh_mobile: move type detection upwards
      i2c: sh_mobile: allow setup callback to return errno
      i2c: sh_mobile: require setup callback
      i2c: sh_mobile: let RuntimePM do the clock handling
      i2c: sh_mobile: add helper to check frequency calculations
      i2c: sh_mobile: add new frequency calculation for later SoC
      i2c: sh_mobile: let r8a7790 (R-Car H2) use the new formula
      i2c: make kerneldoc about bus recovery more precise
      i2c: add identifier in declarations for i2c_bus_recovery
      i2c: add 'set_sda' to bus_recovery_info
      i2c: ensure SDA is released in recovery if SDA is controllable
      i2c: send STOP after successful bus recovery
      i2c: rcar: skip DMA if buffer is not safe
      i2c: rcar: implement bus recovery
      i2c: rcar: fix some trivial typos in comments
      arm64: dts: renesas: salvator: set driver type for eMMC

Yoshihiro Shimoda (14):
      usb: gadget: udc: renesas_usb3: fix oops in renesas_usb3_remove()
      usb: gadget: udc: renesas_usb3: add binging for r8a77965
      usb: renesas_usbhs: remove redundant polling in usbhsf_fifo_barrier()
      usb: renesas_usbhs: add usbhs_pipe_clear_without_sequence() function
      usb: renesas_usbhs: use PIPEnCLR.ACLRM instead of {C,Dn}FIFOCTR.BCLR in usbhs_pkt_pop()
      usb: renesas_usbhs: Add a function to write the UGCTRL2 register
      usb: renesas_usbhs: add a new callback for extcon notifier
      usb: renesas_usbhs: set the mode by using extcon state for non-otg channel
      usb: renesas_usbhs: add extcon notifier to set mode for non-otg channel
      usb: renesas_usbhs: add binding for r8a77965
      arm64: dts: renesas: r8a7795: add usb3_phy node
      arm64: dts: renesas: r8a7796: add usb3_phy node
      arm64: dts: renesas: salvator-common: enable usb3_phy0 node
      arm64: dts: renesas: salvator-common: enable usb3_peri0

Zhengjun Xing (3):
      xhci: Fix xhci debugfs devices node disappearance after hibernation
      xhci: xhci debugfs device nodes weren't removed after device plugged out
      xhci: fix xhci debugfs errors in xhci_stop

shiju.jose@huawei.com (3):
      arm64: defconfig: enable CONFIG_ACPI_APEI_MEMORY_FAILURE
      arm64: defconfig: enable EDAC GHES option
      arm64: defconfig: enable CONFIG_ACPI_APEI_EINJ

 .../ABI/testing/sysfs-bus-pci-drivers-xhci_hcd     |   25 +
 Documentation/cpu-freq/cpu-drivers.txt             |    4 +
 Documentation/devicetree/bindings/arm/shmobile.txt |    4 +
 .../devicetree/bindings/display/renesas,du.txt     |   30 +-
 Documentation/devicetree/bindings/eeprom/at24.txt  |   78 +
 .../devicetree/bindings/eeprom/eeprom.txt          |   45 -
 .../devicetree/bindings/gpio/renesas,gpio-rcar.txt |    2 +-
 .../bindings/interrupt-controller/renesas,irqc.txt |    1 +
 .../bindings/iommu/renesas,ipmmu-vmsa.txt          |    3 +
 Documentation/devicetree/bindings/mmc/tmio_mmc.txt |    1 +
 .../devicetree/bindings/net/can/rcar_can.txt       |    7 +-
 .../devicetree/bindings/net/renesas,ravb.txt       |    7 +-
 .../bindings/pinctrl/renesas,pfc-pinctrl.txt       |    1 +
 .../devicetree/bindings/sound/renesas,rsnd.txt     |   15 +-
 .../devicetree/bindings/thermal/rcar-thermal.txt   |    1 +
 .../devicetree/bindings/usb/mediatek,mtk-xhci.txt  |    2 +
 .../devicetree/bindings/usb/renesas_usb3.txt       |    1 +
 .../devicetree/bindings/usb/renesas_usbhs.txt      |    3 +
 Documentation/devicetree/bindings/usb/usb-xhci.txt |    5 +-
 .../devicetree/bindings/watchdog/renesas-wdt.txt   |    3 +-
 Documentation/mtd/spi-nor.txt                      |    3 +
 arch/arm/boot/dts/Makefile                         |    1 +
 arch/arm/boot/dts/iwg20d-q7-common.dtsi            |  122 +
 arch/arm/boot/dts/r7s72100-genmai.dts              |    2 +-
 arch/arm/boot/dts/r8a73a4.dtsi                     |    5 +-
 arch/arm/boot/dts/r8a7740-armadillo800eva.dts      |    5 +-
 arch/arm/boot/dts/r8a7740.dtsi                     |    5 +-
 arch/arm/boot/dts/r8a7743.dtsi                     |  607 ++++-
 .../arm/boot/dts/r8a7745-iwg22d-sodimm-dbhd-ca.dts |  158 ++
 arch/arm/boot/dts/r8a7745-iwg22d-sodimm.dts        |  183 +-
 arch/arm/boot/dts/r8a7745.dtsi                     |  585 ++++-
 arch/arm/boot/dts/r8a7778.dtsi                     |   12 +-
 arch/arm/boot/dts/r8a7779.dtsi                     |   12 +-
 arch/arm/boot/dts/r8a7790-lager.dts                |    5 +-
 arch/arm/boot/dts/r8a7790.dtsi                     |   25 +-
 arch/arm/boot/dts/r8a7791-koelsch.dts              |    7 +-
 arch/arm/boot/dts/r8a7791.dtsi                     |   22 +-
 arch/arm/boot/dts/r8a7792.dtsi                     |   67 +-
 arch/arm/boot/dts/r8a7793.dtsi                     |   22 +-
 arch/arm/boot/dts/r8a7794-alt.dts                  |    5 +-
 arch/arm/boot/dts/r8a7794.dtsi                     |   27 +-
 arch/arm/boot/dts/sh73a0.dtsi                      |    3 -
 arch/arm/configs/mvebu_v7_defconfig                |    2 +-
 arch/arm/configs/shmobile_defconfig                |    2 +
 arch/arm/include/asm/pci.h                         |    5 +-
 arch/arm/kernel/bios32.c                           |    2 +-
 arch/arm64/boot/dts/renesas/Makefile               |    3 +-
 .../boot/dts/renesas/r8a7795-es1-salvator-x.dts    |    2 +-
 arch/arm64/boot/dts/renesas/r8a7795-es1.dtsi       |   85 +
 arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts |    2 +-
 .../arm64/boot/dts/renesas/r8a7795-salvator-xs.dts |    2 +-
 arch/arm64/boot/dts/renesas/r8a7795.dtsi           |  379 +++-
 arch/arm64/boot/dts/renesas/r8a7796-salvator-x.dts |    2 +-
 .../arm64/boot/dts/renesas/r8a7796-salvator-xs.dts |   58 +
 arch/arm64/boot/dts/renesas/r8a7796.dtsi           |  373 +++-
 arch/arm64/boot/dts/renesas/r8a77970-eagle.dts     |   23 +-
 arch/arm64/boot/dts/renesas/r8a77970-v3msk.dts     |   55 +
 arch/arm64/boot/dts/renesas/r8a77970.dtsi          |  115 +-
 arch/arm64/boot/dts/renesas/r8a77995.dtsi          |  234 ++
 arch/arm64/boot/dts/renesas/salvator-common.dtsi   |   49 +
 arch/arm64/boot/dts/renesas/ulcb-kf.dtsi           |   29 +
 arch/arm64/boot/dts/renesas/ulcb.dtsi              |    1 +
 arch/arm64/configs/defconfig                       |   15 +-
 arch/s390/kernel/topology.c                        |    3 +-
 arch/sh/boards/board-espt.c                        |    1 -
 arch/sh/boards/board-sh7757lcr.c                   |    4 -
 arch/sh/boards/mach-ecovec24/setup.c               |    1 -
 arch/sh/boards/mach-se/7724/setup.c                |    1 -
 arch/sh/boards/mach-sh7763rdp/setup.c              |    1 -
 arch/sh/kernel/cpu/sh2/setup-sh7619.c              |    1 -
 arch/tile/kernel/sysfs.c                           |    2 +-
 drivers/ata/sata_rcar.c                            |   62 +-
 drivers/clk/renesas/clk-mstp.c                     |    2 +-
 drivers/clk/renesas/r8a7796-cpg-mssr.c             |    1 +
 drivers/clk/renesas/r8a77970-cpg-mssr.c            |    1 +
 drivers/clk/renesas/renesas-cpg-mssr.c             |    2 +-
 drivers/cpufreq/exynos5440-cpufreq.c               |    7 +-
 drivers/cpufreq/freq_table.c                       |    8 +-
 drivers/cpufreq/longhaul.c                         |    4 +-
 drivers/cpufreq/pasemi-cpufreq.c                   |    6 +-
 drivers/dma/sh/rcar-dmac.c                         |   68 +-
 drivers/gpio/gpio-rcar.c                           |   38 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c     |    1 -
 drivers/gpu/drm/arm/hdlcd_crtc.c                   |    8 +-
 drivers/gpu/drm/arm/malidp_planes.c                |    3 +-
 drivers/gpu/drm/bridge/analogix-anx78xx.c          |    2 -
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c          |    2 -
 drivers/gpu/drm/drm_atomic_helper.c                |   94 +
 drivers/gpu/drm/drm_plane_helper.c                 |  111 +-
 drivers/gpu/drm/drm_simple_kms_helper.c            |    9 +-
 drivers/gpu/drm/i2c/tda998x_drv.c                  |    1 -
 drivers/gpu/drm/i915/i915_sysfs.c                  |    6 +-
 drivers/gpu/drm/i915/intel_display.c               |   20 +-
 drivers/gpu/drm/i915/intel_dp.c                    |    1 -
 drivers/gpu/drm/i915/intel_modes.c                 |    1 -
 drivers/gpu/drm/imx/ipuv3-plane.c                  |    8 +-
 drivers/gpu/drm/mediatek/mtk_drm_plane.c           |    8 +-
 drivers/gpu/drm/mediatek/mtk_hdmi.c                |    1 -
 drivers/gpu/drm/meson/meson_plane.c                |    8 +-
 drivers/gpu/drm/msm/mdp/mdp5/mdp5_plane.c          |    5 +-
 drivers/gpu/drm/nouveau/nv50_display.c             |   23 +-
 drivers/gpu/drm/radeon/radeon_connectors.c         |    1 -
 drivers/gpu/drm/radeon/radeon_dp_mst.c             |    1 -
 drivers/gpu/drm/rcar-du/rcar_du_crtc.c             |   38 +-
 drivers/gpu/drm/rcar-du/rcar_du_drv.c              |   62 +-
 drivers/gpu/drm/rcar-du/rcar_du_drv.h              |    1 +
 drivers/gpu/drm/rcar-du/rcar_du_lvdscon.c          |    4 -
 drivers/gpu/drm/rcar-du/rcar_du_plane.c            |   75 +-
 drivers/gpu/drm/rcar-du/rcar_du_plane.h            |    4 +
 drivers/gpu/drm/rcar-du/rcar_du_vsp.c              |   64 +-
 drivers/gpu/drm/rockchip/cdn-dp-core.c             |    4 +-
 drivers/gpu/drm/rockchip/rockchip_drm_vop.c        |    6 +-
 drivers/gpu/drm/sti/sti_hdmi.c                     |    1 -
 drivers/gpu/drm/tegra/dc.c                         |    4 +-
 drivers/gpu/drm/tegra/output.c                     |    1 -
 drivers/gpu/drm/vc4/vc4_hdmi.c                     |    1 -
 drivers/gpu/drm/zte/zx_plane.c                     |   15 +-
 drivers/i2c/busses/i2c-rcar.c                      |   62 +-
 drivers/i2c/busses/i2c-sh_mobile.c                 |  191 +-
 drivers/i2c/i2c-core-base.c                        |  101 +-
 drivers/iommu/ipmmu-vmsa.c                         |   14 +-
 .../platform/soc_camera/sh_mobile_ceu_camera.c     |    7 +-
 drivers/media/platform/vsp1/vsp1_drm.c             |   37 +-
 drivers/mfd/tmio_core.c                            |   20 +
 drivers/mmc/core/slot-gpio.c                       |    8 +
 drivers/mmc/host/renesas_sdhi.h                    |   22 +
 drivers/mmc/host/renesas_sdhi_core.c               |   49 +-
 drivers/mmc/host/renesas_sdhi_internal_dmac.c      |   15 +-
 drivers/mmc/host/renesas_sdhi_sys_dmac.c           |   37 +-
 drivers/mmc/host/sh_mmcif.c                        |    2 +-
 drivers/mmc/host/tmio_mmc.c                        |   23 +-
 drivers/mmc/host/tmio_mmc.h                        |   43 +-
 drivers/mmc/host/tmio_mmc_core.c                   |  152 +-
 drivers/mtd/devices/m25p80.c                       |    9 +
 drivers/mtd/spi-nor/spi-nor.c                      |   66 +-
 drivers/net/ethernet/renesas/ravb_main.c           |    9 +-
 drivers/net/ethernet/renesas/sh_eth.c              |   55 +-
 drivers/net/ethernet/renesas/sh_eth.h              |   11 -
 drivers/net/phy/micrel.c                           |   27 +-
 drivers/net/phy/phy_device.c                       |   17 +
 drivers/pci/host/pci-host-common.c                 |    2 +-
 drivers/pci/host/pci-tegra.c                       |    2 +-
 drivers/pci/host/pci-versatile.c                   |    2 +-
 drivers/pci/host/pcie-rcar.c                       |    2 +-
 drivers/pinctrl/sh-pfc/Kconfig                     |    5 +
 drivers/pinctrl/sh-pfc/Makefile                    |    1 +
 drivers/pinctrl/sh-pfc/core.c                      |    6 +
 drivers/pinctrl/sh-pfc/pfc-r8a7791.c               |   42 +-
 drivers/pinctrl/sh-pfc/pfc-r8a7794.c               |  473 ++++
 drivers/pinctrl/sh-pfc/pfc-r8a7795.c               |  194 +-
 drivers/pinctrl/sh-pfc/pfc-r8a7796.c               |   66 +-
 drivers/pinctrl/sh-pfc/pfc-r8a77970.c              | 2329 ++++++++++++++++++++
 drivers/pinctrl/sh-pfc/pfc-r8a77995.c              |   88 +
 drivers/pinctrl/sh-pfc/sh_pfc.h                    |   17 +-
 drivers/platform/x86/compal-laptop.c               |   18 +-
 drivers/s390/cio/device.c                          |    2 +-
 drivers/scsi/lpfc/lpfc_attr.c                      |   43 +-
 drivers/sh/clk/core.c                              |    5 +-
 drivers/soc/renesas/rcar-sysc.c                    |    2 +-
 drivers/soc/renesas/renesas-soc.c                  |    3 +
 drivers/staging/irda/drivers/sh_sir.c              |    4 +-
 drivers/thermal/thermal_sysfs.c                    |    9 +-
 drivers/tty/serial/Kconfig                         |   14 +-
 drivers/tty/serial/sh-sci.c                        |    2 +-
 drivers/usb/gadget/udc/renesas_usb3.c              |    2 +-
 drivers/usb/host/Kconfig                           |    8 +
 drivers/usb/host/Makefile                          |    5 +
 drivers/usb/host/uhci-hcd.c                        |    3 +-
 drivers/usb/host/xhci-dbg.c                        |  261 ---
 drivers/usb/host/xhci-dbgcap.c                     |  996 +++++++++
 drivers/usb/host/xhci-dbgcap.h                     |  229 ++
 drivers/usb/host/xhci-dbgtty.c                     |  497 +++++
 drivers/usb/host/xhci-hub.c                        |   26 +-
 drivers/usb/host/xhci-mem.c                        |  132 +-
 drivers/usb/host/xhci-mtk.c                        |    9 +
 drivers/usb/host/xhci-pci.c                        |    3 +
 drivers/usb/host/xhci-plat.c                       |    5 +
 drivers/usb/host/xhci-ring.c                       |   14 +-
 drivers/usb/host/xhci-trace.h                      |   69 +
 drivers/usb/host/xhci.c                            |   56 +-
 drivers/usb/host/xhci.h                            |   30 +-
 drivers/usb/phy/phy-tahvo.c                        |    2 +-
 drivers/usb/renesas_usbhs/Makefile                 |    2 +-
 drivers/usb/renesas_usbhs/common.c                 |   22 +
 drivers/usb/renesas_usbhs/common.h                 |    7 +
 drivers/usb/renesas_usbhs/fifo.c                   |   21 +-
 drivers/usb/renesas_usbhs/pipe.c                   |   19 +-
 drivers/usb/renesas_usbhs/pipe.h                   |    2 +
 drivers/usb/renesas_usbhs/rcar3.c                  |   35 +-
 drivers/usb/renesas_usbhs/rza.c                    |   52 +
 drivers/usb/renesas_usbhs/rza.h                    |    4 +
 drivers/video/fbdev/auo_k190x.c                    |    4 +-
 drivers/video/fbdev/w100fb.c                       |    4 +-
 include/drm/drm_atomic_helper.h                    |    7 +
 include/drm/drm_plane_helper.h                     |    5 -
 include/linux/cpufreq.h                            |  125 +-
 include/linux/i2c.h                                |   33 +-
 include/linux/mfd/tmio.h                           |   20 -
 include/linux/mmc/slot-gpio.h                      |    1 +
 include/linux/mtd/spi-nor.h                        |   16 +
 include/linux/phy.h                                |    4 +
 include/linux/pm_wakeup.h                          |    7 +
 include/linux/sh_eth.h                             |    3 -
 include/linux/usb/renesas_usbhs.h                  |    9 +
 include/sound/core.h                               |    2 +
 include/sound/soc.h                                |    4 +
 include/uapi/linux/i2c.h                           |    3 +
 lib/test_firmware.c                                |   14 +-
 lib/test_kmod.c                                    |   14 +-
 sound/core/init.c                                  |   32 +
 sound/soc/omap/mcbsp.c                             |    4 +-
 sound/soc/sh/rcar/core.c                           |  143 +-
 sound/soc/sh/rcar/dma.c                            |   18 -
 sound/soc/sh/rcar/rsnd.h                           |   15 +-
 sound/soc/sh/rcar/ssi.c                            |  163 +-
 sound/soc/soc-core.c                               |   37 +
 216 files changed, 9773 insertions(+), 2099 deletions(-)
 create mode 100644 Documentation/ABI/testing/sysfs-bus-pci-drivers-xhci_hcd
 create mode 100644 Documentation/devicetree/bindings/eeprom/at24.txt
 delete mode 100644 Documentation/devicetree/bindings/eeprom/eeprom.txt
 create mode 100644 arch/arm/boot/dts/r8a7745-iwg22d-sodimm-dbhd-ca.dts
 create mode 100644 arch/arm64/boot/dts/renesas/r8a7796-salvator-xs.dts
 create mode 100644 arch/arm64/boot/dts/renesas/r8a77970-v3msk.dts
 create mode 100644 drivers/pinctrl/sh-pfc/pfc-r8a77970.c
 create mode 100644 drivers/usb/host/xhci-dbgcap.c
 create mode 100644 drivers/usb/host/xhci-dbgcap.h
 create mode 100644 drivers/usb/host/xhci-dbgtty.c
 create mode 100644 drivers/usb/renesas_usbhs/rza.c
 create mode 100644 drivers/usb/renesas_usbhs/rza.h
