Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:45556 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751880AbdFNKj4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 14 Jun 2017 06:39:56 -0400
Date: Wed, 14 Jun 2017 12:39:35 +0200
From: Simon Horman <horms@verge.net.au>
To: ltsi-dev@lists.linuxfoundation.org
Cc: Hisao Munakata <hisao.munakata.vt@renesas.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [GIT/RFC PULL LTSI-4.9] Renesas SoCs and Drivers to v4.11
Message-ID: <20170614103934.GB12279@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi,

** This series is for informational purposes only! **

This series is comprised of backports to v4.9 of the following
components to their from standard as of v4.10 to that of v4.11:

    * adv7511
    * ak4642
    * clk
    * cpg
    * gen3
    * gpio-keys
    * gpio-rcar
    * gpio-regulator
    * i2c-emev2
    * i2c-riic
    * i2c-rcar
    * i2c-sh-mobile
    * ipmu-vmsa
    * m25p80
    * mach-shmobile
    * otsm
    * pci-rcar-gen2
    * pcie-rcar
    * phy-micrel
    * phy-rcar-gen3-usb2
    * ravb
    * rcar-can
    * rcar-canfd
    * rcar-dmac
    * rcar-du
    * rcar-fdp1
    * rcar-gyroadc
    * rcar-snd
    * rspi
    * sata-rcar
    * sh-eth
    * sh-mmcif
    * sh-mobile-sdhi
    * sh-msiof
    * sh-pfc
    * sh-sci
    * simple-scu-card
    * st1232
    * usb3-peri
    * usbhs
    * vsp1
    * xhci-plat

I expect to formally submit patches during the merge window.

I have tested for build regressions on a wide range of defconfigs
on a wide range of architectures.

There are 234 patches.

This is based on a similar backport of components for Renesas SoCs to v4.10
which is in turn based on v4.9.31. It has been posted separately as:

    Subject: [GIT/RFC PULL LTSI-4.9] Renesas SoCs and Drivers to v4.10
    Message-ID: <20170614103249.GA12279@verge.net.au>

As this work is for informational purposes I do not expect these patches to
be imported to quilt by Greg at this time. However, if you would like to do
so and rebasing would help please feel free to ask me to do so.


The following changes since commit c98811ab4a13b793d187104586251b62076ced5b:

  arm64: dts: h3ulcb: Provide sd0_uhs node (2017-06-12 07:51:20 +0200)

are available in the git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas-backport.git backport/v4.9.31/snapshot-to-v4.11-flattened

for you to fetch changes up to f412ac2726d4ed4940f402c8e0b0de65499b9412:

  serial: sh-sci: fix hardware RX trigger level setting (2017-06-12 09:20:30 +0200)

----------------------------------------------------------------
LTSI-v4.9 Preparation for Renesas SoCs (to v4.11)

Base:
* v4.9.31
* Similar backport of components for Renesas SoCs to v4.10

Backports of the following components to their standard as of v4.11:

* adv7511
* ak4642
* clk
* cpg
* gen3
* gpio-keys
* gpio-rcar
* gpio-regulator
* i2c-emev2
* i2c-riic
* i2c-rcar
* i2c-sh-mobile
* ipmu-vmsa
* m25p80
* mach-shmobile
* otsm
* pci-rcar-gen2
* pcie-rcar
* phy-micrel
* phy-rcar-gen3-usb2
* ravb
* rcar-can
* rcar-canfd
* rcar-dmac
* rcar-du
* rcar-fdp1
* rcar-gyroadc
* rcar-snd
* rspi
* sata-rcar
* sh-eth
* sh-mmcif
* sh-mobile-sdhi
* sh-msiof
* sh-pfc
* sh-sci
* simple-scu-card
* st1232
* usb3-peri
* usbhs
* vsp1
* xhci-plat

----------------------------------------------------------------
Adam Wallis (1):
      xhci: plat: Register shutdown for xhci_plat

Alexander Stein (1):
      xhci: Put warning message on a single line

Archit Taneja (2):
      drm/bridge: adv7511: Initialize regulators
      drm/bridge: adv7511: Enable HPD interrupts to support hotplug and improve monitor detection

Arnd Bergmann (1):
      iio: adc: handle unknow of_device_id data

Baolin Wang (1):
      usb: host: xhci: Remove unused 'addr_64' variable in xhci_hcd structure

Bartlomiej Zolnierkiewicz (1):
      ata: pass queued command to ->sff_data_xfer method

Bjorn Helgaas (1):
      PCI: rcar: Use of_device_get_match_data() to simplify probe

Chanwoo Choi (2):
      phy: rcar-gen3-usb2: Replace the deprecated extcon API
      usb: renesas_usbhs: Replace the deprecated extcon API

Chris Brandt (11):
      ARM: dts: r7s72100: add ostm clock to device tree
      clk: renesas: mstp: ensure register writes complete
      i2c: riic: correctly finish transfers
      i2c: riic: fix restart condition
      ARM: dts: r7s72100: add ostm to device tree
      ARM: dts: rskrza1: add ostm DT support
      ARM: dts: r7s72100: add power-domains to mmcif
      clocksource/drivers/ostm: Document renesas-ostm timer DT bindings
      clocksource/drivers/ostm: Add renesas-ostm timer driver
      mmc: sh_mobile_sdhi: add support for 2 clocks
      mmc: sh_mobile_sdhi: explain clock bindings

Chris Paterson (8):
      clk: renesas: r8a7796: Add CAN peripheral clock
      clk: renesas: r8a7796: Add CANFD clock
      clk: renesas: r8a7796: Add CAN FD peripheral clock
      arm64: dts: r8a7796: Add CAN external clock support
      arm64: dts: r8a7796: Add CAN support
      arm64: dts: r8a7796: Add CAN FD support
      pinctrl: sh-pfc: r8a7796: Add CAN support
      pinctrl: sh-pfc: r8a7796: Add CAN FD support

Colin Ian King (1):
      usb: renesas_usbhs: mod_host: fix typo: "connecte" -> "connected"

Dan Carpenter (1):
      ravb: Double free on error in ravb_start_xmit()

David S. Miller (1):
      Revert "phy: micrel: Disable auto negotiation on startup"

DongCV (2):
      spi: rspi: Fixes bogus received byte in qspi_transfer_in()
      spi: rspi: Replaces "n" by "len" in qspi_transfer_*()

Felipe Balbi (16):
      usb: host: xhci: change pre-increments to post-increments
      usb: host: xhci: print HCIVERSION on debug
      usb: host: xhci: rename completion codes to match spec
      usb: host: xhci: simplify irq handler return
      usb: host: xhci: use slightly better list helpers
      usb: host: xhci: reorder variable definitions
      usb: host: xhci: introduce xhci_td_cleanup()
      usb: host: xhci: remove bogus __releases()/__acquires() annotation
      usb: host: xhci: check for a valid ring when unmapping bounce buffer
      usb: host: xhci: unconditionally call xhci_unmap_td_bounce_buffer()
      usb: host: xhci: convert to list_for_each_entry_safe()
      usb: host: xhci: combine event TRB completion debugging messages
      usb: host: xhci: make a generic TRB tracer
      usb: host: xhci: add urb_enqueue/dequeue/giveback tracers
      usb: host: xhci: convert several if() to a single switch statement
      usb: host: xhci: add xhci_virt_device tracer

Geert Uytterhoeven (35):
      clk: renesas: cpg-mssr: Migrate to CLK_IS_CRITICAL
      clk: renesas: mstp: Make INTC-SYS a critical clock
      clk: renesas: mstp: Reformat cpg_mstp_clock_register() for git diff
      dt-bindings: clock: renesas: cpg-mssr: Document reset control support
      clk: renesas: cpg-mssr: Document suitability for RZ/G1
      clk: renesas: cpg-mssr: Rename cpg_mssr_priv.mstp_lock
      clk: renesas: cpg-mssr: Add support for reset control
      arm64: dts: r8a7796: Add all MSIOF nodes
      arm64: renesas: r8a7796/salvator-x: Add board part number to DT bindings
      arm64: dts: r8a7795: Add missing power-domains property for sata
      arm64: dts: r8a7795: Link ARM GIC to clock and clock domain
      arm64: dts: r8a7796: Link ARM GIC to clock and clock domain
      arm64: dts: r8a7796: Mark EthernetAVB device node disabled
      gpio: rcar: Fine-grained Runtime PM support
      iommu/ipmmu-vmsa: Restrict IOMMU Domain Geometry to 32-bit address space
      ARM: dts: r8a7743: Move RST node before SYSC node
      ARM: dts: r8a7745: Move RST node before SYSC node
      ARM: dts: r8a7743: Add device node for PRR
      ARM: dts: r8a7745: Add device node for PRR
      ARM: dts: gose: Add da9063 PMIC device node for system restart
      ARM: shmobile: apmu: Add more register documentation
      ARM: shmobile: apmu: Add debug resource reset for secondary CPU boot
      ARM: shmobile: apmu: Allow booting secondary CPU cores in debug mode
      ARM: shmobile: r8a7791: Allow booting secondary CPU cores in debug mode
      ARM: shmobile: rcar-gen2: Remove unused rcar_gen2_read_mode_pins()
      ARM: dts: r8a7779, marzen: Fix sata device status
      ARM: dts: r8a7743: Link ARM GIC to clock and clock domain
      ARM: dts: r8a7745: Link ARM GIC to clock and clock domain
      ARM: shmobile: rcar-gen2: Add more register documentation
      can: rcar_can: Do not print virtual addresses
      dmaengine: rcar-dmac: Widen DMA mask to 40 bits
      spi: rspi: Remove useless memory allocation failure message
      spi: sh-msiof: Remove useless memory allocation failure message
      ravb: Support 1Gbps on R-Car H3 ES1.1+ and R-Car M3-W
      serial: sh-sci: Reformat sci_parse_dt() for git diff

Grygorii Strashko (1):
      net: phy: micrel: fix crash when statistic requested for KSZ9031 phy

Guenter Roeck (1):
      Input: touchscreen - drop unnecessary calls to device_init_wakeup

Hans Holmberg (1):
      regulator: gpio: correct default type

Hans de Goede (1):
      Input: gpio-keys - add support for setkeycode

Harunobu Kurokawa (3):
      ASoC: ak4642: Replace mdelay function to msleep
      PCI: rcar: Return -ENODEV from host bridge probe when no card present
      PCI: rcar: Add compatible string for r8a7796

Heiner Kallweit (1):
      mtd: m25p80: consider max message size in m25p80_read

Hiromitsu Yamasaki (1):
      clk: renesas: r8a7796: Add MSIOF controller clocks

Hiroyuki Yokoyama (1):
      ASoC: rsnd: fix sound route path when using SRC6/SRC9

Jacopo Mondi (1):
      pinctrl: sh-pfc: r8a7791: Add ADI pinconf support

John Stultz (5):
      drm/bridge: adv7511: Use work_struct to defer hotplug handing to out of irq context
      drm/bridge: adv7511: Switch to using drm_kms_helper_hotplug_event()
      drm/bridge: adv7511: Rework adv7511_power_on/off() so they can be reused internally
      drm/bridge: adv7511: Reuse __adv7511_power_on/off() when probing EDID
      drm/bridge: adv7511: Re-write the i2c address before EDID probing

Kazuya Mizuguchi (1):
      ravb: Add tx and rx clock internal delays mode of APSR

Keita Kobayashi (1):
      clk: renesas: r8a7795: Add IIC-DVFS clock

Khiem Nguyen (1):
      clk: renesas: r8a7796: Add IIC-DVFS clock

Kieran Bingham (1):
      [media] v4l: vsp1: Adapt vsp1_du_setup_lif() interface to use a structure

Kuninori Morimoto (11):
      arm64: dts: r8a7795: add sound CTU support
      arm64: dts: r8a7795: add sound MIX support
      arm64: dts: h3ulcb: follow sound CTU/MIX supports
      arm64: dts: r8a7795: tidyup audma definition order
      ASoC: rsnd: fixup for_each_rsnd_mod_array{s} iterator increment
      ASoC: rsnd: fixup reset timing of sync convert_rate
      ASoC: rcar: avoid SSI_MODEx settings for SSI8
      ASoC: rcar: clear DE bit only in PDMACHCR when it stops
      ASoC: rcar: dma: remove unnecessary "volatile"
      clk: add devm_get_clk_from_child() API
      ASoC: simple-card: use devm_get_clk_from_child()

Laurent Pinchart (16):
      arm64: dts: renesas: r8a7796: Add EthernetAVB instance
      arm64: dts: r8a7796: salvator-x: Enable EthernetAVB
      arm64: dts: r8a7795: Add PWM support
      serial: sh-sci: Set the SCSCR TE and RE bits in the driver
      serial: sh-sci: Don't rely on platform data flags when not needed
      serial: sh-sci: Fix register offsets for the IRDA serial port
      serial: sh-sci: Remove initialization of zero fields in sci_port_params
      serial: sh-sci: Replace regmap array with port parameters
      serial: sh-sci: Constify platform data
      serial: sh-sci: Extend sci_port_params with more port parameters
      serial: sh-sci: Remove the platform data dma slave rx/tx channel IDs
      [media] v4l: vsp1: Add VIDIOC_EXPBUF support
      sh: Don't set sh-sci port_reg
      serial: sh-sci: Remove manual break debouncing
      serial: sh-sci: Remove unused platform data capabilities field
      serial: sh-sci: Compute the regshift value for SCI ports

Lu Baolu (4):
      usb: xhci: remove unnecessary second abort try
      usb: xhci: remove unnecessary assignment
      usb: xhci: avoid unnecessary calculation
      usb: xhci: use list_is_singular for cmd_list

Marc Zyngier (1):
      ARM: DTS: Fix register map for virt-capable GIC

Marek Vasut (2):
      iio: adc: Add Renesas GyroADC bindings
      iio: adc: Add Renesas GyroADC driver

Mathias Nyman (12):
      xhci: simplify if statement to make it more readable
      xhci: rename EP_HALT_PENDING to EP_STOP_CMD_PENDING
      xhci: detect stop endpoint race using pending timer instead of counter.
      xhci: remove unnecessary check for pending timer
      xhci: Introduce helper to turn one TRB into a no-op
      xhci: use the trb_to_noop() helper for command trbs
      xhci: rename size variable to num_tds
      xhci: Rename variables related to transfer descritpors
      xhci: simplify how we store TDs in urb private data
      xhci: refactor xhci_urb_enqueue
      xhci: Set URB actual length for stopped control transfers
      xhci: Manually give back cancelled URB if we can't queue it for cancel

Nicolas Iooss (1):
      [media] v4l: rcar_fdp1: use %4.4s to format a 4-byte string

Niklas Söderlund (14):
      gpio: rcar: set IRQ chip parent_device
      ARM: shmobile: defconfig: Enable CONFIG_VIDEO_ADV7604
      ARM: shmobile: defconfig: Enable CMA for DMA
      sh_eth: use correct name for ECMR_MPDE bit
      sh_eth: add generic wake-on-lan support via magic packet
      sh_eth: enable wake-on-lan for R-Car Gen2 devices
      sh_eth: enable wake-on-lan for r8a7740/armadillo
      sh_eth: enable wake-on-lan for sh7734
      sh_eth: enable wake-on-lan for sh7763
      sh_eth: align usage of sh_eth_modify() with rest of driver
      sh_eth: fix wakeup event reporting from MagicPacket
      pinctrl: sh-pfc: r8a7796: Add drive strength support
      pinctrl: sh-pfc: r8a7796: Add bias pinconf support
      pinctrl: sh-pfc: r8a7795: Support none GPIO pins bias setting

Pan Bian (1):
      tty: serial: sh-sci: set error code when kasprintf fails

Sergei Shtylyov (8):
      sh_eth: handle only enabled E-MAC interrupts
      sh_eth: no need for *else* after *goto*
      sh_eth: factor out sh_eth_emac_interrupt()
      sh_eth: get rid of 'sh_eth_cpu_data::shift_rd0'
      sh_eth: rename 'sh_eth_cpu_data::hw_crc'
      sh_eth: rename EESIPR bits
      sh_eth: add missing EESIPR bits
      sh_eth: stop using bare numbers for EESIPR values

Simon Horman (28):
      arm64: dts: r8a7795: Use renesas,rcar-gen3-usb2-phy fallback binding
      arm64: dts: r8a7795: Use Gen 3 fallback compat string for PCIE
      arm64: dts: r8a7795: Use R-Car Gen 3 fallback binding for i2c nodes
      arm64: dts: r8a7796: Use R-Car Gen 3 fallback binding for i2c nodes
      arm64: dts: r8a7796: Use R-Car Gen 3 fallback binding for msiof nodes
      i2c: sh_mobile: document support for r8a7796 (R-Car M3-W)
      ARM: shmobile: defconfig: Enable r8a774[35] SoCs
      ARM: dts: r8a73a4: Use SoC-specific compat string for mmcif
      ARM: dts: r8a7778: Use SoC-specific compat string for mmcif
      ARM: dts: sh73a0: Use SoC-specific compat string for mmcif
      ARM: dts: r8a7790: Use renesas,rcar-gen2-usb-phy fallback binding
      ARM: dts: r8a7791: Use renesas,rcar-gen2-usb-phy fallback binding
      ARM: dts: r8a7794: Use renesas,rcar-gen2-usb-phy fallback binding
      ARM: dts: r8a7779: Use R-Car Gen 1 fallback binding for i2c nodes
      ARM: dts: r8a7778: Use R-Car Gen 1 fallback binding for i2c nodes
      ARM: dts: r8a7790: Use R-Car Gen 2 fallback binding for i2c nodes
      ARM: dts: r8a7791: Use R-Car Gen 2 fallback binding for i2c nodes
      ARM: dts: r8a7792: Use R-Car Gen 2 fallback binding for i2c nodes
      ARM: dts: r8a7793: Use R-Car Gen 2 fallback binding for i2c nodes
      ARM: dts: r8a7794: Use R-Car Gen 2 fallback binding for i2c nodes
      ARM: dts: r8a7790: Use R-Car Gen 2 fallback binding for iic nodes
      ARM: dts: r8a7791: Use R-Car Gen 2 fallback binding for iic nodes
      ARM: dts: r8a7793: Use R-Car Gen 2 fallback binding for iic nodes
      ARM: dts: r8a7794: Use R-Car Gen 2 fallback binding for iic nodes
      ARM: dts: r8a7791: Use R-Car Gen 2 fallback binding for msiof nodes
      ARM: dts: r8a7792: Use R-Car Gen 2 fallback binding for msiof nodes
      ARM: dts: r8a7790: Use R-Car Gen 2 fallback binding for msiof nodes
      pinctrl: sh-pfc: r8a7793: Implement voltage switching for SDHI

Takeshi Kihara (2):
      arm64: dts: r8a7796: salvator-x: Update memory node to 4 GiB map
      pinctrl: sh-pfc: r8a7796: Add MSIOF pins, groups and functions

Ulf Hansson (5):
      mmc: sh_mmcif: Remove unused use_cd_gpio/cd_gpio from platform data
      mmc: sh_mmcif: Remove unused ->get_cd() platform callback
      mmc: sh_mmcif: Remove unused ccs_unsupported from the platform data
      mmc: sh_mmcif: Remove unused clk_ctrl2_present from the platform data
      mmc: tmio: Remove redundant check of mmc->slot.cd_irq

Ulrich Hecht (8):
      pinctrl: sh-pfc: r8a7796: Add HSCIF pins, groups, and functions
      serial: sh-sci: add FIFO trigger bits
      serial: sh-sci: consider DR (data ready) bit adequately
      serial: sh-sci: implement FIFO threshold register setting
      serial: sh-sci: increase RX FIFO trigger defaults for (H)SCIF
      serial: sh-sci: SCIFA/B RX FIFO software timeout
      serial: sh-sci: make RX FIFO parameters tunable via sysfs
      serial: sh-sci: fix hardware RX trigger level setting

Uwe Kleine-König (1):
      mtd: spi-nor: add dt support for Everspin MRAMs

Wolfram Sang (15):
      arm64: dts: r8a7795: Add R-Car Gen3 thermal support
      arm64: dts: r8a7796: Add R-Car Gen3 thermal support
      mmc: tmio: use SDIO master interrupt bit only when allowed
      mmc: sh_mobile_sdhi: simplify accessing DT data
      mmc: sh_mobile_sdhi: improve prerequisite for hw_reset
      mmc: sh_mobile_sdhi: improve prerequisites for tuning
      mmc: sh_mobile_sdhi: remove superfluous check in hw_reset
      mmc: sh_mobile_sdhi: remove superfluous check in init_tuning
      mmc: sh_mobile_sdhi: remove superfluous check in SCC error check
      mmc: sh_mobile_sdhi: enable HS200
      mmc: host: tmio: drop superfluous exit path
      mmc: host: tmio: disable clocks when unbinding
      mmc: host: tmio: refactor calls to sdio irq
      mmc: host: tmio: SDIO_STATUS_QUIRK is rather SDIO_STATUS_SETBITS
      mmc: tmio: discard obsolete SDIO irqs before enabling irqs

 Documentation/devicetree/bindings/arm/shmobile.txt |    2 +-
 .../devicetree/bindings/clock/renesas,cpg-mssr.txt |    6 +
 .../devicetree/bindings/i2c/i2c-sh_mobile.txt      |    1 +
 .../bindings/iio/adc/renesas,gyroadc.txt           |   99 +
 Documentation/devicetree/bindings/mmc/tmio_mmc.txt |   13 +
 .../devicetree/bindings/mtd/jedec,spi-nor.txt      |    2 +
 Documentation/devicetree/bindings/pci/rcar-pci.txt |    1 +
 .../bindings/regulator/gpio-regulator.txt          |    2 +-
 .../devicetree/bindings/timer/renesas,ostm.txt     |   30 +
 MAINTAINERS                                        |    6 +
 arch/arm/boot/dts/alpine.dtsi                      |    2 +-
 arch/arm/boot/dts/axm55xx.dtsi                     |    2 +-
 arch/arm/boot/dts/dra7.dtsi                        |    2 +-
 arch/arm/boot/dts/ecx-2000.dts                     |    2 +-
 arch/arm/boot/dts/exynos3250.dtsi                  |    2 +-
 arch/arm/boot/dts/exynos5.dtsi                     |    4 +-
 arch/arm/boot/dts/exynos5260.dtsi                  |    2 +-
 arch/arm/boot/dts/exynos5440.dtsi                  |    2 +-
 arch/arm/boot/dts/imx6ul.dtsi                      |    4 +-
 arch/arm/boot/dts/keystone-k2g.dtsi                |    4 +-
 arch/arm/boot/dts/keystone.dtsi                    |    4 +-
 arch/arm/boot/dts/ls1021a.dtsi                     |    4 +-
 arch/arm/boot/dts/mt2701.dtsi                      |    2 +-
 arch/arm/boot/dts/mt6580.dtsi                      |    2 +-
 arch/arm/boot/dts/mt6589.dtsi                      |    2 +-
 arch/arm/boot/dts/mt7623.dtsi                      |    2 +-
 arch/arm/boot/dts/mt8127.dtsi                      |    2 +-
 arch/arm/boot/dts/mt8135.dtsi                      |    2 +-
 arch/arm/boot/dts/omap5.dtsi                       |    2 +-
 arch/arm/boot/dts/r7s72100-rskrza1.dts             |    8 +
 arch/arm/boot/dts/r7s72100.dtsi                    |   28 +
 arch/arm/boot/dts/r8a73a4.dtsi                     |    6 +-
 arch/arm/boot/dts/r8a7743.dtsi                     |   18 +-
 arch/arm/boot/dts/r8a7745.dtsi                     |   18 +-
 arch/arm/boot/dts/r8a7778.dtsi                     |   10 +-
 arch/arm/boot/dts/r8a7779-marzen.dts               |    4 +
 arch/arm/boot/dts/r8a7779.dtsi                     |    9 +-
 arch/arm/boot/dts/r8a7790.dtsi                     |   37 +-
 arch/arm/boot/dts/r8a7791.dtsi                     |   35 +-
 arch/arm/boot/dts/r8a7792.dtsi                     |   26 +-
 arch/arm/boot/dts/r8a7793-gose.dts                 |   21 +
 arch/arm/boot/dts/r8a7793.dtsi                     |   23 +-
 arch/arm/boot/dts/r8a7794.dtsi                     |   23 +-
 arch/arm/boot/dts/rk3036.dtsi                      |    2 +-
 arch/arm/boot/dts/rk322x.dtsi                      |    2 +-
 arch/arm/boot/dts/rk3288.dtsi                      |    2 +-
 arch/arm/boot/dts/sh73a0.dtsi                      |    2 +-
 arch/arm/boot/dts/sun6i-a31.dtsi                   |    2 +-
 arch/arm/boot/dts/sun7i-a20.dtsi                   |    4 +-
 arch/arm/boot/dts/sun8i-a23-a33.dtsi               |    2 +-
 arch/arm/boot/dts/sun8i-a83t.dtsi                  |    2 +-
 arch/arm/boot/dts/sun8i-h3.dtsi                    |    2 +-
 arch/arm/boot/dts/sun9i-a80.dtsi                   |    2 +-
 arch/arm/configs/shmobile_defconfig                |    6 +
 arch/arm/mach-shmobile/Kconfig                     |    1 +
 arch/arm/mach-shmobile/platsmp-apmu.c              |   41 +-
 arch/arm/mach-shmobile/pm-rcar-gen2.c              |   40 +-
 arch/arm/mach-shmobile/rcar-gen2.h                 |    2 -
 arch/arm/mach-shmobile/setup-rcar-gen2.c           |   18 -
 arch/arm/mach-shmobile/smp-r8a7791.c               |   14 +-
 arch/arm64/boot/dts/renesas/r8a7795-h3ulcb.dts     |    2 +
 arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts |    2 +
 arch/arm64/boot/dts/renesas/r8a7795.dtsi           |  313 +++-
 arch/arm64/boot/dts/renesas/r8a7796-salvator-x.dts |   37 +
 arch/arm64/boot/dts/renesas/r8a7796.dtsi           |  245 ++-
 arch/sh/kernel/cpu/sh3/setup-sh770x.c              |    4 -
 arch/sh/kernel/cpu/sh4/setup-sh7750.c              |    4 +-
 arch/sh/kernel/cpu/sh4/setup-sh7760.c              |   10 +-
 arch/sh/kernel/cpu/sh4a/setup-sh7366.c             |    1 -
 arch/sh/kernel/cpu/sh4a/setup-sh7723.c             |    6 -
 arch/sh/kernel/cpu/sh4a/setup-sh7724.c             |    9 -
 drivers/ata/libata-sff.c                           |   29 +-
 drivers/ata/pata_at91.c                            |    6 +-
 drivers/ata/pata_bf54x.c                           |    7 +-
 drivers/ata/pata_ep93xx.c                          |    4 +-
 drivers/ata/pata_ixp4xx_cf.c                       |    4 +-
 drivers/ata/pata_legacy.c                          |   15 +-
 drivers/ata/pata_octeon_cf.c                       |   12 +-
 drivers/ata/pata_pcmcia.c                          |    6 +-
 drivers/ata/pata_samsung_cf.c                      |    4 +-
 drivers/ata/sata_rcar.c                            |    4 +-
 drivers/clk/clk-devres.c                           |   21 +
 drivers/clk/renesas/clk-mstp.c                     |   17 +-
 drivers/clk/renesas/r8a7795-cpg-mssr.c             |    1 +
 drivers/clk/renesas/r8a7796-cpg-mssr.c             |   10 +
 drivers/clk/renesas/renesas-cpg-mssr.c             |  149 +-
 drivers/clocksource/Kconfig                        |    7 +
 drivers/clocksource/Makefile                       |    1 +
 drivers/clocksource/renesas-ostm.c                 |  265 +++
 drivers/dma/sh/rcar-dmac.c                         |    1 +
 drivers/gpio/gpio-rcar.c                           |   21 +-
 drivers/gpu/drm/bridge/adv7511/adv7511.h           |    6 +
 drivers/gpu/drm/bridge/adv7511/adv7511_drv.c       |  153 +-
 drivers/gpu/drm/rcar-du/rcar_du_vsp.c              |    8 +-
 drivers/i2c/busses/i2c-riic.c                      |   34 +-
 drivers/iio/adc/Kconfig                            |   13 +
 drivers/iio/adc/Makefile                           |    1 +
 drivers/iio/adc/rcar-gyroadc.c                     |  633 +++++++
 drivers/input/keyboard/gpio_keys.c                 |   40 +-
 drivers/input/touchscreen/ads7846.c                |    2 -
 drivers/input/touchscreen/bu21013_ts.c             |    2 -
 drivers/input/touchscreen/eeti_ts.c                |    1 -
 drivers/input/touchscreen/lpc32xx_ts.c             |    1 -
 drivers/input/touchscreen/st1232.c                 |    1 -
 drivers/iommu/ipmmu-vmsa.c                         |    2 +
 drivers/media/platform/rcar_fdp1.c                 |    4 +-
 drivers/media/platform/vsp1/vsp1_drm.c             |   33 +-
 drivers/media/platform/vsp1/vsp1_video.c           |    1 +
 drivers/mmc/host/sh_mmcif.c                        |   28 +-
 drivers/mmc/host/sh_mobile_sdhi.c                  |   95 +-
 drivers/mmc/host/tmio_mmc.h                        |    2 +
 drivers/mmc/host/tmio_mmc_pio.c                    |   61 +-
 drivers/mtd/devices/m25p80.c                       |    9 +-
 drivers/net/can/rcar/rcar_can.c                    |    3 +-
 drivers/net/ethernet/renesas/ravb.h                |   10 +
 drivers/net/ethernet/renesas/ravb_main.c           |   40 +-
 drivers/net/ethernet/renesas/sh_eth.c              |  334 +++-
 drivers/net/ethernet/renesas/sh_eth.h              |   52 +-
 drivers/net/phy/micrel.c                           |   28 +-
 drivers/pci/host/pcie-rcar.c                       |    9 +-
 drivers/phy/phy-rcar-gen3-usb2.c                   |    8 +-
 drivers/pinctrl/sh-pfc/pfc-r8a7791.c               |   87 +
 drivers/pinctrl/sh-pfc/pfc-r8a7795.c               |  450 +++--
 drivers/pinctrl/sh-pfc/pfc-r8a7796.c               | 1920 +++++++++++++++++++-
 drivers/spi/spi-rspi.c                             |    9 +-
 drivers/spi/spi-sh-msiof.c                         |    4 +-
 drivers/tty/serial/sh-sci.c                        | 1092 +++++------
 drivers/tty/serial/sh-sci.h                        |   12 +-
 drivers/usb/host/xhci-dbg.c                        |   22 +-
 drivers/usb/host/xhci-hub.c                        |    8 +-
 drivers/usb/host/xhci-mem.c                        |   30 +-
 drivers/usb/host/xhci-plat.c                       |    1 +
 drivers/usb/host/xhci-ring.c                       |  466 ++---
 drivers/usb/host/xhci-trace.h                      |  182 +-
 drivers/usb/host/xhci.c                            |  253 ++-
 drivers/usb/host/xhci.h                            |  525 +++++-
 drivers/usb/renesas_usbhs/common.c                 |    2 +-
 drivers/usb/renesas_usbhs/mod_host.c               |    2 +-
 include/dt-bindings/clock/r7s72100-clock.h         |    4 +
 include/linux/clk.h                                |   29 +-
 include/linux/libata.h                             |    8 +-
 include/linux/mfd/tmio.h                           |    6 +-
 include/linux/mmc/sh_mmcif.h                       |    5 -
 include/linux/serial_sci.h                         |   15 -
 include/media/vsp1.h                               |   13 +-
 include/sound/simple_card_utils.h                  |   11 +-
 sound/soc/codecs/ak4642.c                          |    2 +-
 sound/soc/generic/simple-card-utils.c              |    8 +-
 sound/soc/generic/simple-card.c                    |    4 +-
 sound/soc/generic/simple-scu-card.c                |    4 +-
 sound/soc/sh/rcar/cmd.c                            |   36 +-
 sound/soc/sh/rcar/core.c                           |    2 -
 sound/soc/sh/rcar/dma.c                            |   18 +-
 sound/soc/sh/rcar/rsnd.h                           |    4 +-
 sound/soc/sh/rcar/src.c                            |    6 +-
 sound/soc/sh/rcar/ssiu.c                           |    6 +-
 156 files changed, 6721 insertions(+), 1976 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/iio/adc/renesas,gyroadc.txt
 create mode 100644 Documentation/devicetree/bindings/timer/renesas,ostm.txt
 create mode 100644 drivers/clocksource/renesas-ostm.c
 create mode 100644 drivers/iio/adc/rcar-gyroadc.c
