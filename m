Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:58523 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755002AbeFNLfz (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 14 Jun 2018 07:35:55 -0400
Date: Thu, 14 Jun 2018 13:35:50 +0200
From: Simon Horman <horms@verge.net.au>
To: ltsi-dev@lists.linuxfoundation.org
Cc: Hisao Munakata <hisao.munakata.vt@renesas.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [GIT/RFC PULL LTSI-4.14] Renesas SoCs and Drivers to v4.17
Message-ID: <20180614113550.g7fwz3klcwvxfdlv@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi,

** This series is for informational purposes only! **

This series is comprised of backports to v4.14 of the following
components from their standard as of v4.16 to that of v4.17:
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

And limited backport of the following to provide dependencies for the above:
* drm-tilcdc-compat
* of-overlay

This is intended as part of a dry-run for backporting components used by
Renesas SoCs from v4.15, v4.16, v4.17 and beyond to v4.14.

In posting this work I am not implying anything about
decisions on the base of the LTSI release will be.

There are 381 patches.

This is based on similar backports of components to their standard as of
v4.16, posted as "[GIT/RFC PULL LTSI-4.14] Renesas SoCs and Drivers to v4.16"
and tagged as backport/v4.14.48/snapshot-to-v4.16-flattened.

As this work is for informational purposes I do not expect these patches
to be imported to quilt by Greg at this time. However, if you would like to
do so and rebasing would help please feel free to ask me to do so.


The following changes since commit 6485613bce7106b963ce9a9dd8b6d434c26b1bfd:

  tty: serial: sh-sci: Add default for number of ports for compile-testing (2018-06-14 10:31:17 +0200)

are available in the git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas-backport.git tags/backport/v4.14.48/snapshot-to-v4.17-flattened

for you to fetch changes up to 3e69ed4311e31be8084d65159d65a6973616c18f:

  serial: sh-sci: Document r8a77470 bindings (2018-06-14 10:58:52 +0200)

----------------------------------------------------------------
LTSI-v4.14 Preparation for Renesas SoCs (to v4.17)

Base:
* v4.14.48
* Similar backport of components for Renesas SoCs to v4.16

Backports of the following components to their standard as of v4.17:
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

Limited backport of the following to provide dependencies for the above:
* drm-tilcdc-compat
* of-overlay

----------------------------------------------------------------
Amit Kucheria (3):
      arm64: defconfig: Enable the APCS IPC driver on Qualcomm platforms
      arm64: defconfig: enable thermal sensor on QCOM platforms
      arm64: defconfig: enable more cpufreq governors

Ard Biesheuvel (2):
      arm64: defconfig: add newly added accelerated crypto modules
      arm64: defconfig: add support for Socionext SynQuacer based platforms

Arnd Bergmann (2):
      ASoC: rsnd: mark PM functions __maybe_unused
      media: renesas-ceu: mark PM functions as __maybe_unused

Biju Das (9):
      dt-bindings: iommu: ipmmu-vmsa: Add device tree support for r8a774[35]
      ARM: dts: r8a7743: Add IPMMU DT nodes
      ARM: dts: r8a7745: Add IPMMU DT nodes
      ARM: dts: r8a7743: Add VSP support
      ARM: dts: r8a7745: Add VSP support
      dt-bindings: PCI: rcar: Add device tree support for r8a7743
      dt-bindings: net: renesas-ravb: Add support for r8a77470 SoC
      dt-bindings: rcar-dmac: Document r8a77470 support
      serial: sh-sci: Document r8a77470 bindings

Colin Ian King (1):
      PCI: rcar-gen2: Remove duplicated bit-wise or of RCAR_PCI_INT_SIGRETABORT

Davidlohr Bueso (1):
      irqchip/gic: Update supports_deactivate static key to modern api

Dien Pham (4):
      arm64: dts: renesas: r8a7795: Add OPPs table for cpu devices
      arm64: dts: renesas: r8a7796: Add OPPs table for cpu devices
      arm64: dts: renesas: r8a7796: Update OPPs to support CA53 dfs
      arm64: dts: renesas: r8a7795: Update OPPs to support CA53 dfs

Dinh Nguyen (1):
      arm64: defconfig: enable stmmac ethernet to defconfig

Fabrizio Castro (15):
      clk: renesas: r8a7743: Add rwdt clock
      clk: renesas: r8a7745: Add rwdt clock
      clk: renesas: r8a7790: Add rwdt clock
      clk: renesas: r8a7791/r8a7793: Add rwdt clock
      clk: renesas: r8a7794: Add rwdt clock
      ARM: dts: iwg20m: Enable cmt0
      ARM: dts: iwg22m: Enable cmt0
      ARM: shmobile: Add watchdog support
      ARM: shmobile: rcar-gen2: Add watchdog support
      dt-bindings: pwm: rcar: Document r8a774[35] PWM bindings
      dt-bindings: pwm: renesas-tpu: Document r8a774[35] support
      soc: renesas: rcar-rst: Enable watchdog as reset trigger for Gen2
      watchdog: renesas_wdt: Add suspend/resume support
      watchdog: renesas_wdt: Add R-Car Gen2 support
      watchdog: renesas_wdt: Add restart handler

Fengguang Wu (1):
      PCI: rcar: Remove unnecessary semicolon

Frank Rowand (16):
      of: overlay.c: Remove comments that state the obvious, to reduce clutter
      of: overlay.c: Convert comparisons to zero or NULL to logical expressions
      of: overlay: rename identifiers to more reflect what they do
      of: overlay: rename identifiers in dup_and_fixup_symbol_prop()
      of: overlay: minor restructuring
      of: overlay: detect cases where device tree may become corrupt
      of: overlay: expand check of whether overlay changeset can be removed
      of: overlay: loosen overly strict phandle clash check
      of: overlay: avoid race condition between applying multiple overlays
      of: overlay: simplify applying symbols from an overlay
      of: overlay: remove a dependency on device node full_name
      of: overlay: remove unneeded check for NULL kbasename()
      of: overlay: pr_err from return NOTIFY_OK to overlay apply/remove
      of: overlay: make pr_err() string unique
      of: change overlay apply input data from unflattened to FDT
      of: improve reporting invalid overlay target path

Geert Uytterhoeven (56):
      dt-bindings: at24: add Renesas R1EX24128
      clk: renesas: Stop enabling legacy DT clock support by default
      clk: renesas: r8a7792: Add rwdt clock
      clk: renesas: div6: Always use readl()/writel()
      clk: renesas: mstp: Always use readl()/writel()
      clk: renesas: r8a73a4: Always use readl()/writel()
      clk: renesas: r8a7740: Always use readl()/writel()
      clk: renesas: rcar-gen2: Always use readl()/writel()
      clk: renesas: rza1: Always use readl()/writel()
      clk: renesas: sh73a0: Always use readl()/writel()
      clk: renesas: rcar-gen3: Always use readl()/writel()
      dt-bindings: i2c: sh_mobile: Document R-Car M3-N support
      irqchip/renesas-intc-irqpin: Use wakeup_path i.s.o. explicit clock handling
      irqchip/renesas-irqc: Use wakeup_path i.s.o. explicit clock handling
      dt-bindings: arm: Document SoC compatible value for Armadillo-800 EVA
      dt-bindings: arm: Document Renesas V3MSK and Wheat board part numbers
      dt-bindings: arm: Document Renesas R-Car M3-N-based Salvator-XS board
      dt-bindings: arm: Document Renesas R-Car M3-N-based Salvator-X board
      ARM: shmobile: rcar-gen2: Fix error check in regulator quirk
      ARM: shmobile: defconfig: Refresh
      ARM: shmobile: defconfig: Disable CONFIG_EMBEDDED
      ARM: dts: kzm9d: Fix "debounce-interval" property misspelling
      ARM: dts: lager: Move cec_clock to root node
      dt-bindings: pwm: renesas-tpu: Correct example TPU register block size
      dt-bindings: pwm: renesas-tpu: Correct SoC part numbers and family names
      dt-bindings: can: rcar_can: Fix R8A7796 SoC name
      dmaengine: rcar-dmac: Fix too early/late system suspend/resume callbacks
      media: dt-bindings: media: rcar_vin: Use status "okay"
      sh_eth: Change platform check to CONFIG_ARCH_RENESAS
      spi: sh-msiof: Use correct enum for DMA transfer direction
      spi: sh-msiof: Document R-Car M3-N support
      dt-bindings: pinctrl: sh-pfc: Correct SoC family name for R8A7778
      pinctrl: sh-pfc: r8a7790: Add missing TX_ER pin to avb_mii group
      pinctrl: sh-pfc: Add SH_PFC_PIN_GROUP_ALIAS()
      pinctrl: sh-pfc: r8a7795: Rename EtherAVB "mdc" pin group to "mdio"
      pinctrl: sh-pfc: r8a7795-es1: Rename EtherAVB "mdc" pin group to "mdio"
      pinctrl: sh-pfc: r8a7796: Rename EtherAVB "mdc" pin group to "mdio"
      pinctrl: sh-pfc: r8a77965: Rename EtherAVB "mdc" pin group to "mdio"
      pinctrl: sh-pfc: r8a77995: Rename EtherAVB "mdc" pin group to "mdio"
      soc: renesas: rcar-sysc: Mark rcar_sysc_matches[] __initconst
      of: Spelling s/changset/changeset/
      of: overlay: Remove else after goto
      of: overlay: Fix memory leak in of_overlay_apply() error path
      of: overlay: Fix (un)locking in of_overlay_apply()
      of: overlay: Fix out-of-bounds write in init_overlay_changeset()
      of: overlay: Make node skipping in init_overlay_changeset() clearer
      ASoC: rsnd: Document R-Car M3-W support
      arm64: dts: renesas: r8a77970: Remove non-existing STBE region
      arm64: dts: renesas: r8a77995: Remove non-existing STBE region
      arm64: dts: renesas: r8a77965: Add IIC-DVFS device node
      arm64: dts: renesas: r8a77965: Add INTC-EX device node
      arm64: dts: renesas: r8a77965-salvator-xs: Add SoC name to file header
      arm64: dts: renesas: r8a77970: sort subnodes of root node alphabetically
      arm64: dts: renesas: r8a7795: Add missing SYS-DMAC2 dmas
      of/fdt: Fix #ifdef dependency of early flattree declarations
      of: overlay: Fix forgotten reference to of_overlay_apply()

Gregory CLEMENT (2):
      usb: host: xhci-plat: Remove useless test before clk_disable_unprepare
      usb: host: xhci-plat: Fix clock resource by adding a register clock

Hans Verkuil (1):
      media: v4l2-common: create v4l2_g/s_parm_cap helpers

Hans de Goede (1):
      xhci: Add Intel extended cap / otg phy mux handling

Harald Geyer (1):
      regulator: dt: regulator-name is required property

Hien Dang (2):
      pwm: rcar: Use PM Runtime to control module clock
      gpio: gpio-rcar: Support S2RAM

Hiromitsu Yamasaki (1):
      i2c: rcar: fix mask value of prohibited bit

Jacopo Mondi (40):
      clk: renesas: cpg-mssr: Add support for R-Car M3-N
      clk: renesas: r8a77965: Replace DU2 clock
      ARM: shmobile: Enable RZA1 pin controller
      dt-bindings: arm: Document R-Car M3-N SoC DT bindings
      dt-bindings: net: ravb: Add support for r8a77965 SoC
      dt-bindings: dmaengine: rcar-dmac: document R8A77965 support
      soc: renesas: rcar-rst: Add support for R-Car M3-N
      soc: renesas: Identify R-Car M3-N
      pinctrl: sh-pfc: Initial R-Car M3-N support
      pinctrl: sh-pfc: r8a77965: Add SCIFs groups/functions
      pinctrl: sh-pfc: r8a77965: Add EtherAVB groups/functions
      soc: renesas: rcar-sysc: Add R-Car M3-N support
      media: dt-bindings: media: Add Renesas CEU bindings
      media: include: media: Add Renesas CEU driver interface
      media: platform: Add Renesas CEU driver
      media: platform: renesas-ceu: Fix CSTRST_CPON mask
      arm64: dts: renesas: initial R8A77965 SoC device tree
      arm64: dts: renesas: Add R-Car Salvator-x M3-N support
      arm64: dts: renesas: r8a77965: Add dmac device nods
      arm64: dts: renesas: r8a77965: Add SCIF device nodes
      arm64: dts: renesas: r8a77965: Add GPIO nodes
      arm64: dts: renesas: r8a77965: Add "reg" properties
      arm64: dts: renesas: r8a77965: Add #address-cells and #size-cells
      arm64: dts: renesas: r8a77965: Remove stale reg property
      arm64: dts: renesas: r8a77965: Add #phy-cells property
      arm64: dts: renesas: r8a77965: Add #pwm-cells property
      arm64: dts: renesas: r8a77965: Add #interrupt-cells property
      arm64: dts: renesas: r8a77965: Move usb2_phy1 up
      arm64: dts: renesas: salvator-common: Override EtherAVB phy-mode
      arm64: dts: renesas: ulcb: Override EtherAVB phy-mode
      arm64: dts: renesas: draak: Override EtherAVB phy-mode
      arm64: dts: renesas: eagle: Override EtherAVB phy-mode
      arm64: dts: renesas: v3msk: Override EtherAVB phy-mode
      arm64: dts: renesas: r8a7796: Set EtherAVB phy mode to "rgmii"
      arm64: dts: renesas: r8a7795: Set EtherAVB phy mode to "rgmii"
      arm64: dts: renesas: r8a77995: Set EtherAVB phy mode to "rgmii"
      arm64: dts: renesas: r8a77970: Set EtherAVB phy mode to "rgmii"
      arm64: dts: renesas: r8a77965: Add EtherAVB device node
      arm64: add Renesas R8A77965 support
      dt-bindings: serial: sh-sci: Add support for r8a77965 (H)SCIF

Jan Kiszka (1):
      of: overlay: Stop leaking resources on overlay removal

Jeffy Chen (1):
      Input: gpio-keys - add support for wakeup event action

Jernej Skrabec (2):
      drm/bridge/synopsys: dw-hdmi: Export some PHY related functions
      drm/bridge/synopsys: dw-hdmi: don't clobber drvdata

Jerome Brunet (1):
      arm64: defconfig: enable MESON EFUSE

John Garry (1):
      arm64: defconfig: enable IOSCHED_DEADLINE

Jyri Sarha (1):
      drm/tilcdc: Remove obsolete "ti,tilcdc,slave" dts binding support

Kees Cook (1):
      treewide: setup_timer() -> timer_setup()

Kieran Bingham (9):
      arm64: dts: renesas: r8a77995: add FCPV nodes
      arm64: dts: renesas: r8a77995: add VSP instances
      arm64: dts: renesas: r8a77995: add DU support
      arm64: dts: renesas: r8a7795-es1: Fix register mappings on VSPs
      arm64: dts: renesas: r8a7795: Fix register mappings on VSPs
      arm64: dts: renesas: r8a7796: Fix register mappings on VSPs
      arm64: dts: renesas: draak: Enable DU
      dt-bindings: display: renesas: du: Document r8a77995 bindings
      dt-bindings: display: renesas: lvds: Document r8a77995 bindings

Kunihiko Hayashi (1):
      arm64: defconfig: add CONFIG_UNIPHIER_THERMAL and CONFIG_SNI_AVE

Kuninori Morimoto (4):
      ASoC: rsnd: indicate IRQ error status for debug
      ASoC: rsnd: suppress rsnd_dai_call() debug message
      drm: rcar-du: Use 1000 to avoid misunderstanding in rcar_du_dpll_divider()
      drm: rcar-du: Calculate DPLLCR to be more small jitter

Laurent Pinchart (12):
      ARM: dts: r8a7790: Convert to new LVDS DT bindings
      ARM: dts: r8a7791: Convert to new LVDS DT bindings
      ARM: dts: r8a7793: Convert to new LVDS DT bindings
      media: v4l: vsp1: Print the correct blending unit name in debug messages
      drm: rcar-du: Remove zpos field from rcar_du_vsp_plane_state structure
      drm: rcar-du: Enable VSP compositor by default on Gen3
      drm: rcar-du: lvds: Fix LVDS clock frequency range
      dt-bindings: display: renesas: Add R-Car LVDS encoder DT bindings
      dt-bindings: display: renesas: Deprecate LVDS support in the DU bindings
      drm: rcar-du: Fix legacy DT to create LVDS encoder nodes
      drm: rcar-du: Convert LVDS encoder code to bridge driver
      drm: rcar-du: lvds: Fix crash in .atomic_check when disabling connector

Linus Walleij (1):
      gpio: em: Use the right include

Lixin Wang (1):
      of: overlay: fix memory leak related to duplicated property

Lu Baolu (2):
      usb: xhci: Remove ep_trb from xhci_cleanup_halted_endpoint()
      usb: xhci: Remove ep_trb from finish_td()

Magnus Damm (4):
      clk: renesas: cpg-mssr: Adjust r8a77980 ifdef
      ARM: dts: marzen: Add SDHI0 VCCQ Regulator
      ARM: dts: silk: Add r1ex24002 EEPROM to DT
      ARM: dts: silk: Add GPIO keys to DT

Marc Zyngier (2):
      irqchip/gic-v2: Reset APRn registers at boot time
      irqchip/gic: Loudly complain about the use of IRQ_TYPE_NONE

Marek Vasut (3):
      dt-bindings: arm: Document Renesas H2-based Stout DT bindings
      ARM: shmobile: stout: enable R-Car Gen2 regulator quirk
      ARM: dts: stout: Initial r8a7790 Stout board support

Markus Elfring (1):
      pinctrl: sh-pfc: Use seq_puts() in sh_pfc_pin_dbg_show()

Markus Niebel (1):
      net: phy: micrel: add 125MHz reference clock workaround

Martin Blumenstingl (1):
      usb: add a flag to skip PHY initialization to struct usb_hcd

Masaharu Hayakawa (1):
      mmc: renesas_sdhi: replace EXT_ACC with HOST_MODE

Masahiro Yamada (10):
      mmc: renesas_sdhi: use MMC_CAP2_NO_WRITE_PROTECT instead of TMIO own flag
      mmc: tmio: use MMC_CAP2_NO_WRITE_PROTECT instead of TMIO own flag
      mmc: tmio: remove TMIO_MMC_WRPROTECT_DISABLE
      mmc: tmio: deprecate "toshiba, mmc-wrprotect-disable" DT property
      mmc: tmio: support IP-builtin card detection logic
      mmc: tmio: fix never-detected card insertion bug
      mmc: tmio: move TMIO_MASK_{READOP, WRITEOP} handling to correct place
      mmc: tmio: clear force_pio flag before starting data transfer
      mmc: tmio: remove useless TMIO_MASK_CMD handling in tmio_mmc_host_probe()
      of: unittest: refactor Makefile

Mathias Nyman (5):
      xhci: Don't always run the default stop endpoint command completion handler
      xhci: refactor xhci_urb_enqueue a bit with minor changes
      xhci: Clear the host side toggle manually when endpoint is soft reset
      xhci: Fix use-after-free in xhci_free_virt_device
      xhci: Fix USB3 NULL pointer dereference at logical disconnect.

Maxime Ripard (1):
      drm/rcar-du: dw-hdmi: Fix compilation

Mikko Perttunen (3):
      arm64: defconfig: Enable NVIDIA Tegra194 support
      arm64: defconfig: Enable CONFIG_ARM_TEGRA186_CPUFREQ
      arm64: defconfig: Enable CONFIG_TEGRA_BPMP_THERMAL

Neil Armstrong (1):
      drm/bridge/synopsys: dw-hdmi: fix dw_hdmi_setup_rx_sense

Nicholas Lowell (1):
      regulator: giving regulator controlling gpios a non-empty label when used through the devicetree.

Nikita Yushchenko (1):
      ASoC: rsnd: set pm_ops in hibernate-compatible way

Niklas SÃ¶derlund (9):
      ARM: dts: lager: Add CEC clock for HDMI transmitter
      ravb: add support for changing MTU
      ravb: remove erroneous comment
      media: rcar-vin: allocate a scratch buffer at stream start
      media: rcar-vin: use scratch buffer and always run in continuous mode
      arm64: dts: renesas: r8a7796: add thermal cooling management
      arm64: dts: renesas: r8a7795: add thermal cooling management
      arm64: dts: renesas: r8a7795: update register size for thermal
      arm64: dts: renesas: r8a7796: update register size for thermal

Peter Rosin (1):
      dt-bindings: at24: add compatible for nxp,se97b

Rob Herring (1):
      of/fdt: use memblock_virt_alloc for early alloc

Sergei Shtylyov (46):
      dt-bindings: clock: add R8A77980 CPG core clock definitions
      clk: renesas: cpg-mssr: add R8A77980 support
      dt-bindings: arm: document R8A77980 SoC bindings
      dt-bindings: arm: document Condor board bindings
      DT: net: can: rcar_canfd: document R8A77970 bindings
      DT: net: can: rcar_canfd: document R8A77980 bindings
      DT: dmaengine: renesas,rcar-dmac: document R8A77980 support
      soc: renesas: rcar-rst: add R8A77980 support
      soc: renesas: identify R-Car V3H
      sh_eth: simplify sh_eth_check_reset()
      sh_eth: TSU_QTAG0/1 registers the same as TSU_QTAGM0/1
      sh_eth: add sh_eth_cpu_data::soft_reset() method
      sh_eth: add sh_eth_cpu_data::edtrr_trns value
      sh_eth: add sh_eth_cpu_data::xdfar_rw flag
      sh_eth: add sh_eth_cpu_data::no_tx_cntrs flag
      sh_eth: add sh_eth_cpu_data::cexcr flag
      sh_eth: add sh_eth_cpu_data::no_xdfar flag
      sh_eth: kill useless check in __sh_eth_get_regs()
      pinctrl: sh-pfc: Add PORT_GP_CFG_25() helper macro
      pinctrl: sh-pfc: Add R8A77980 PFC support
      pinctrl: sh-pfc: r8a77970: Add EtherAVB pin groups
      soc: renesas: r8a77970-sysc: fix power area parents
      dt-bindings: power: add R8A77980 SYSC power domain definitions
      soc: renesas: rcar-sysc: add R8A77980 support
      media: v4l: vsp1: Fix video output on R8A77970
      arm64: dts: renesas: initial R8A77980 SoC device tree
      arm64: dts: renesas: r8a77980: add SYS-DMAC support
      arm64: dts: renesas: r8a77970: add PFC support
      arm64: dts: renesas: eagle: add SCIF0 pins
      arm64: dts: renesas: r8a77970: add GPIO support
      arm64: dts: renesas: eagle: specify EtherAVB PHY IRQ
      arm64: dts: renesas: r8a77980: add [H]SCIF support
      arm64: dts: renesas: r8a77980: add EtherAVB support
      arm64: dts: renesas: initial Condor board device tree
      arm64: dts: renesas: condor: add EtherAVB support
      arm64: dts: renesas: r8a77970: add I2C support
      arm64: dts: renesas: eagle: add I2C0 support
      arm64: dts: renesas: v3msk: add SCIF0 pins
      arm64: add Renesas R8A77980 support
      drm: rcar-du: lvds: Fix LVDCR1 for R-Car gen3
      drm: rcar-du: lvds: Refactor LVDS startup
      dt-bindings: display: renesas: du: Document R8A77970 bindings
      dt-bindings: display: renesas: lvds: Document R8A77970 bindings
      drm: rcar-du: Add R8A77970 support
      drm: rcar-du: lvds: Add R8A77970 support
      DT: serial: renesas,sci-serial: document R8A77980 bindings

Simon Horman (30):
      ARM: dts: r8a7790: Reduce size of thermal registers
      ARM: dts: r8a7791: Reduce size of thermal registers
      ARM: dts: r8a7793: Reduce size of thermal registers
      ARM: dts: r8a7790: consistently use single space after =
      ARM: dts: r8a7790: add soc node
      ARM: dts: r8a7790: sort subnodes of soc node
      ARM: dts: r8a7790: sort subnodes of root node
      ARM: dts: r8a7791: consistently use single space after =
      ARM: dts: r8a7791: add soc node
      ARM: dts: r8a7791: sort subnodes of root node
      ARM: dts: r8a7792: sort subnodes of soc node
      ARM: dts: r8a7793: consistently use single space after =
      ARM: dts: r8a7793: add soc node
      ARM: dts: r8a7793: sort subnodes of soc node
      ARM: dts: r8a7793: sort subnodes of root node
      ARM: dts: r8a7794: consistently use single space after =
      ARM: dts: r8a7794: add soc node
      ARM: dts: r8a7794: sort subnodes of soc node
      ARM: dts: r8a7794: sort subnodes of root node
      ARM: dts: r8a7790: consistently use single space before =
      ARM: dts: r8a7791: consistently use single space before =
      ARM: dts: r8a7793: consistently use single space before =
      ARM: dts: r8a7743: sort subnodes of soc node
      ARM: dts: r8a7745: sort subnodes of soc node
      arm64: defconfig: enable R8A77980 SoC
      arm64: dts: renesas: r8a7795: move scif node into alphabetical order
      arm64: dts: renesas: r8a77970: move node which has no reg property out of bus
      arm64: dts: renesas: r8a77995: move nodes which have no reg property out of bus
      arm64: defconfig: enable R8A77965 SoC
      arm64: dts: renesas: r8a7795: Add IPMMU-PV1 device node

Stefan Agner (1):
      spi: rspi: use correct enum for DMA transfer direction

Stephen Boyd (2):
      of: unittest: Remove redundant OF_DETACHED flag setting
      drm/tilcdc: Remove redundant OF_DETACHED flag setting

Takeshi Kihara (18):
      clk: renesas: rcar-gen3: Add Z clock divider support
      clk: renesas: rcar-gen3: Add Z2 clock divider support
      clk: renesas: r8a7795: Add Z clock
      clk: renesas: r8a7795: Add Z2 clock
      clk: renesas: r8a7796: Add Z clock
      clk: renesas: r8a7796: Add Z2 clock
      pinctrl: sh-pfc: r8a7795: Fix MOD_SEL register pin assignment for SSI pins group
      pinctrl: sh-pfc: r8a7796: Fix IPSR and MOD_SEL register pin assignment for NDFC pins group
      pinctrl: sh-pfc: r8a7795: Add HDMI pins, groups and functions
      pinctrl: sh-pfc: r8a7795-es1: Add HDMI pins, groups and functions
      pinctrl: sh-pfc: r8a7796: Add HDMI pins, groups and functions
      pinctrl: sh-pfc: r8a7795: Add TMU pins, groups and functions
      pinctrl: sh-pfc: r8a7795-es1: Add TMU pins, groups and functions
      pinctrl: sh-pfc: r8a7796: Add TMU pins, groups and functions
      pinctrl: sh-pfc: r8a77965: Add support for INTC-EX IRQ pins
      pinctrl: sh-pfc: r8a77965: Add USB2.0 host pins, groups and functions
      pinctrl: sh-pfc: r8a77965: Add USB3.0 host pins, groups and functions
      arm64: dts: renesas: Add support for Salvator-XS with R-Car M3-N

Thierry Reding (1):
      arm64: defconfig: Enable the Tegra SMMU by default

Ulrich Hecht (17):
      dt-bindings: at24: add bindings for Rohm BR24T01
      dt-bindings: i2c: document R8A77995 bindings
      pinctrl: sh-pfc: r8a77995: Add DU pins, groups and function
      pinctrl: sh-pfc: r8a7796: Add VIN4, VIN5 pins, groups and functions
      pinctrl: sh-pfc: r8a7795: Add VIN4, VIN5 pins, groups and functions
      pinctrl: sh-pfc: r8a77995: Add VIN4 pins, groups and function
      pinctrl: sh-pfc: r8a7795: Correct VIN4 18-bit pins
      pinctrl: sh-pfc: r8a7796: Correct VIN4 18-bit pins
      pinctrl: sh-pfc: r8a77995: Correct VIN4 18-bit pins
      pinctrl: sh-pfc: r8a7795: Deduplicate VIN4 pin definitions
      pinctrl: sh-pfc: r8a7796: Deduplicate VIN4 pin definitions
      pinctrl: sh-pfc: r8a77995: Deduplicate VIN4 pin definitions
      arm64: dts: renesas: r8a77995: add I2C support
      arm64: dts: renesas: draak: enable I2C controller 0 and EEPROM
      arm64: dts: renesas: draak: enable I2C controller 1
      arm64: dts: renesas: draak: enable SDHI2
      serial: sh-sci: use hrtimer for receive timeout

Veeraiyan Chidambaram (1):
      watchdog: renesas-wdt: Add support for WDIOF_CARDRESET

Ville SyrjÃ¤lÃ¤ (1):
      drm/rcar-du: Use drm_mode_get_hv_timing() to populate plane clip rectangle

Vladimir Zapolskiy (1):
      spi: sh-msiof: Fix bit field overflow writes to TSCR/RSCR

Wolfram Sang (15):
      dt-bindings: i2c: document R8A77965 bindings
      ARM: dts: lager: use demuxer for IIC2/I2C2
      ARM: dts: lager: use demuxer for IIC3/I2C3
      ARM: dts: koelsch: use demuxer for I2C2
      ARM: dts: koelsch: use demuxer for I2C4
      ARM: dts: porter: use demuxer for I2C2
      ARM: dts: alt: use demuxer for I2C1
      ARM: dts: silk: use demuxer for I2C1
      ARM: dts: gose: use demuxer for I2C2
      ARM: dts: gose: use demuxer for I2C4
      mmc: renesas_sdhi: fix WP detection
      mmc: renesas_sdhi_internal_dmac: limit DMA RX for old SoCs
      mmc: sh_mmcif: remove some cruft
      media: v4l: vsp1: Fix mask creation for MULT_ALPHA_RATIO
      arm64: dts: renesas: salvator-common: add GPIO extender

Yoshihiro Shimoda (5):
      dt-bindings: rcar-gen3-phy-usb2: Add bindings for r8a77965
      phy: rcar-gen3-usb2: Add support for r8a77965
      dt-bindings: pwm: rcar: Add bindings for R-Car M3N support
      pwm: rcar: Add suspend/resume support
      arm64: defconfig: Enable PWM and USB for R-Car

 Documentation/devicetree/bindings/arm/shmobile.txt |   18 +-
 .../devicetree/bindings/clock/renesas,cpg-mssr.txt |    6 +-
 .../bindings/display/bridge/renesas,lvds.txt       |   58 +
 .../devicetree/bindings/display/renesas,du.txt     |   35 +-
 .../devicetree/bindings/dma/renesas,rcar-dmac.txt  |    3 +
 Documentation/devicetree/bindings/eeprom/at24.txt  |    4 +
 Documentation/devicetree/bindings/i2c/i2c-rcar.txt |    2 +
 .../devicetree/bindings/i2c/i2c-sh_mobile.txt      |    1 +
 .../devicetree/bindings/input/gpio-keys.txt        |    8 +
 .../bindings/iommu/renesas,ipmmu-vmsa.txt          |    5 +-
 .../devicetree/bindings/media/rcar_vin.txt         |    4 +-
 .../devicetree/bindings/media/renesas,ceu.txt      |   81 +
 Documentation/devicetree/bindings/mmc/tmio_mmc.txt |    1 -
 .../devicetree/bindings/net/can/rcar_canfd.txt     |    4 +-
 .../devicetree/bindings/net/micrel-ksz90x1.txt     |    7 +
 .../devicetree/bindings/net/renesas,ravb.txt       |    2 +
 Documentation/devicetree/bindings/pci/rcar-pci.txt |    6 +-
 .../devicetree/bindings/phy/rcar-gen3-phy-usb2.txt |    2 +
 .../bindings/pinctrl/renesas,pfc-pinctrl.txt       |    4 +-
 .../bindings/power/renesas,rcar-sysc.txt           |    2 +
 .../devicetree/bindings/pwm/renesas,pwm-rcar.txt   |   11 +-
 .../devicetree/bindings/pwm/renesas,tpu-pwm.txt    |   10 +-
 .../bindings/regulator/fixed-regulator.txt         |    1 +
 .../bindings/regulator/gpio-regulator.txt          |    2 +
 .../devicetree/bindings/reset/renesas,rst.txt      |    2 +
 .../bindings/serial/renesas,sci-serial.txt         |    6 +
 .../devicetree/bindings/sound/renesas,rsnd.txt     |    1 +
 Documentation/devicetree/bindings/spi/sh-msiof.txt |    1 +
 Documentation/devicetree/bindings/usb/usb-xhci.txt |    5 +-
 Documentation/devicetree/overlay-notes.txt         |   20 +-
 MAINTAINERS                                        |    1 +
 arch/arm/boot/dts/Makefile                         |    1 +
 arch/arm/boot/dts/emev2-kzm9d.dts                  |    8 +-
 arch/arm/boot/dts/r8a7743-iwg20m.dtsi              |    4 +
 arch/arm/boot/dts/r8a7743.dtsi                     | 1324 ++++----
 arch/arm/boot/dts/r8a7745-iwg22m.dtsi              |    4 +
 arch/arm/boot/dts/r8a7745.dtsi                     | 1778 ++++++-----
 arch/arm/boot/dts/r8a7779-marzen.dts               |   14 +
 arch/arm/boot/dts/r8a7790-lager.dts                |  307 +-
 arch/arm/boot/dts/r8a7790-stout.dts                |  363 +++
 arch/arm/boot/dts/r8a7790.dtsi                     | 2880 ++++++++---------
 arch/arm/boot/dts/r8a7791-koelsch.dts              |  244 +-
 arch/arm/boot/dts/r8a7791-porter.dts               |  144 +-
 arch/arm/boot/dts/r8a7791.dtsi                     | 3008 +++++++++---------
 arch/arm/boot/dts/r8a7792.dtsi                     |  498 +--
 arch/arm/boot/dts/r8a7793-gose.dts                 |  262 +-
 arch/arm/boot/dts/r8a7793.dtsi                     | 2409 ++++++++-------
 arch/arm/boot/dts/r8a7794-alt.dts                  |   53 +-
 arch/arm/boot/dts/r8a7794-silk.dts                 |  189 +-
 arch/arm/boot/dts/r8a7794.dtsi                     | 2421 ++++++++-------
 arch/arm/configs/shmobile_defconfig                |    9 +-
 arch/arm/mach-shmobile/common.h                    |    4 +
 arch/arm/mach-shmobile/headsmp.S                   |   55 +
 arch/arm/mach-shmobile/platsmp-apmu.c              |    1 +
 arch/arm/mach-shmobile/pm-rcar-gen2.c              |   15 +-
 arch/arm/mach-shmobile/regulator-quirk-rcar-gen2.c |   25 +-
 arch/arm64/Kconfig.platforms                       |   12 +
 arch/arm64/boot/dts/renesas/Makefile               |    2 +
 arch/arm64/boot/dts/renesas/r8a7795-es1.dtsi       |    3 +-
 arch/arm64/boot/dts/renesas/r8a7795.dtsi           |  194 +-
 arch/arm64/boot/dts/renesas/r8a7796.dtsi           |  130 +-
 .../arm64/boot/dts/renesas/r8a77965-salvator-x.dts |   21 +
 .../boot/dts/renesas/r8a77965-salvator-xs.dts      |   21 +
 arch/arm64/boot/dts/renesas/r8a77965.dtsi          |  878 ++++++
 arch/arm64/boot/dts/renesas/r8a77970-eagle.dts     |   33 +
 arch/arm64/boot/dts/renesas/r8a77970-v3msk.dts     |   11 +
 arch/arm64/boot/dts/renesas/r8a77970.dtsi          |  218 +-
 arch/arm64/boot/dts/renesas/r8a77980-condor.dts    |   58 +
 arch/arm64/boot/dts/renesas/r8a77980.dtsi          |  385 +++
 arch/arm64/boot/dts/renesas/r8a77995-draak.dts     |  124 +
 arch/arm64/boot/dts/renesas/r8a77995.dtsi          |  193 +-
 arch/arm64/boot/dts/renesas/salvator-common.dtsi   |    8 +
 arch/arm64/boot/dts/renesas/ulcb.dtsi              |    1 +
 arch/arm64/configs/defconfig                       |   41 +-
 drivers/clk/renesas/Kconfig                        |   13 +-
 drivers/clk/renesas/Makefile                       |    2 +
 drivers/clk/renesas/clk-div6.c                     |   22 +-
 drivers/clk/renesas/clk-mstp.c                     |    4 +-
 drivers/clk/renesas/clk-r8a73a4.c                  |   11 +-
 drivers/clk/renesas/clk-r8a7740.c                  |    8 +-
 drivers/clk/renesas/clk-rcar-gen2.c                |   17 +-
 drivers/clk/renesas/clk-rz.c                       |    4 +-
 drivers/clk/renesas/clk-sh73a0.c                   |   14 +-
 drivers/clk/renesas/r8a7743-cpg-mssr.c             |    2 +
 drivers/clk/renesas/r8a7745-cpg-mssr.c             |    2 +
 drivers/clk/renesas/r8a7790-cpg-mssr.c             |    2 +
 drivers/clk/renesas/r8a7791-cpg-mssr.c             |    2 +
 drivers/clk/renesas/r8a7792-cpg-mssr.c             |    2 +
 drivers/clk/renesas/r8a7794-cpg-mssr.c             |    2 +
 drivers/clk/renesas/r8a7795-cpg-mssr.c             |    2 +
 drivers/clk/renesas/r8a7796-cpg-mssr.c             |    2 +
 drivers/clk/renesas/r8a77965-cpg-mssr.c            |  334 ++
 drivers/clk/renesas/r8a77980-cpg-mssr.c            |  227 ++
 drivers/clk/renesas/rcar-gen3-cpg.c                |  143 +
 drivers/clk/renesas/rcar-gen3-cpg.h                |    2 +
 drivers/clk/renesas/renesas-cpg-mssr.c             |   12 +
 drivers/clk/renesas/renesas-cpg-mssr.h             |    2 +
 drivers/dma/sh/rcar-dmac.c                         |    4 +-
 drivers/gpio/gpio-em.c                             |    2 +-
 drivers/gpio/gpio-rcar.c                           |   60 +-
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c          |   90 +-
 drivers/gpu/drm/imx/dw_hdmi-imx.c                  |   13 +-
 drivers/gpu/drm/meson/meson_dw_hdmi.c              |   24 +-
 drivers/gpu/drm/rcar-du/Kconfig                    |    9 +-
 drivers/gpu/drm/rcar-du/Makefile                   |   10 +-
 drivers/gpu/drm/rcar-du/rcar_du_crtc.c             |   51 +-
 drivers/gpu/drm/rcar-du/rcar_du_drv.c              |   42 +-
 drivers/gpu/drm/rcar-du/rcar_du_drv.h              |    5 -
 drivers/gpu/drm/rcar-du/rcar_du_encoder.c          |  175 +-
 drivers/gpu/drm/rcar-du/rcar_du_encoder.h          |   12 -
 drivers/gpu/drm/rcar-du/rcar_du_kms.c              |   14 +-
 drivers/gpu/drm/rcar-du/rcar_du_lvdscon.c          |   93 -
 drivers/gpu/drm/rcar-du/rcar_du_lvdscon.h          |   24 -
 drivers/gpu/drm/rcar-du/rcar_du_lvdsenc.c          |  276 --
 drivers/gpu/drm/rcar-du/rcar_du_lvdsenc.h          |   64 -
 drivers/gpu/drm/rcar-du/rcar_du_of.c               |  322 ++
 drivers/gpu/drm/rcar-du/rcar_du_of.h               |   20 +
 .../gpu/drm/rcar-du/rcar_du_of_lvds_r8a7790.dts    |   76 +
 .../gpu/drm/rcar-du/rcar_du_of_lvds_r8a7791.dts    |   50 +
 .../gpu/drm/rcar-du/rcar_du_of_lvds_r8a7793.dts    |   50 +
 .../gpu/drm/rcar-du/rcar_du_of_lvds_r8a7795.dts    |   50 +
 .../gpu/drm/rcar-du/rcar_du_of_lvds_r8a7796.dts    |   50 +
 drivers/gpu/drm/rcar-du/rcar_du_plane.c            |    9 +-
 drivers/gpu/drm/rcar-du/rcar_du_vsp.h              |    2 -
 drivers/gpu/drm/rcar-du/rcar_dw_hdmi.c             |   14 +-
 drivers/gpu/drm/rcar-du/rcar_lvds.c                |  543 ++++
 drivers/gpu/drm/rcar-du/rcar_lvds_regs.h           |    6 +-
 drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c        |   13 +-
 drivers/gpu/drm/tilcdc/Kconfig                     |   11 -
 drivers/gpu/drm/tilcdc/Makefile                    |    3 -
 drivers/gpu/drm/tilcdc/tilcdc_slave_compat.c       |  270 --
 drivers/gpu/drm/tilcdc/tilcdc_slave_compat.dts     |   72 -
 drivers/gpu/drm/tilcdc/tilcdc_slave_compat.h       |   25 -
 drivers/i2c/busses/i2c-rcar.c                      |    4 +-
 drivers/input/keyboard/gpio_keys.c                 |  145 +-
 drivers/irqchip/irq-gic-v3.c                       |   20 +-
 drivers/irqchip/irq-gic.c                          |   44 +-
 drivers/irqchip/irq-renesas-intc-irqpin.c          |   40 +-
 drivers/irqchip/irq-renesas-irqc.c                 |   30 +-
 drivers/media/platform/Kconfig                     |    9 +
 drivers/media/platform/Makefile                    |    1 +
 drivers/media/platform/rcar-vin/rcar-dma.c         |  206 +-
 drivers/media/platform/rcar-vin/rcar-vin.h         |   10 +-
 drivers/media/platform/renesas-ceu.c               | 1673 ++++++++++
 drivers/media/platform/vsp1/vsp1_drm.c             |   21 +-
 drivers/media/platform/vsp1/vsp1_lif.c             |   12 +
 drivers/media/platform/vsp1/vsp1_regs.h            |    8 +-
 drivers/media/v4l2-core/v4l2-common.c              |   48 +
 drivers/mmc/host/renesas_sdhi_core.c               |    6 +-
 drivers/mmc/host/renesas_sdhi_internal_dmac.c      |   50 +-
 drivers/mmc/host/renesas_sdhi_sys_dmac.c           |   17 +-
 drivers/mmc/host/sh_mmcif.c                        |    8 -
 drivers/mmc/host/tmio_mmc_core.c                   |   66 +-
 drivers/net/ethernet/renesas/ravb.h                |    1 +
 drivers/net/ethernet/renesas/ravb_main.c           |   33 +-
 drivers/net/ethernet/renesas/sh_eth.c              |  241 +-
 drivers/net/ethernet/renesas/sh_eth.h              |   14 +-
 drivers/net/phy/micrel.c                           |   31 +
 drivers/of/Kconfig                                 |    1 +
 drivers/of/base.c                                  |    2 +-
 drivers/of/dynamic.c                               |  137 +-
 drivers/of/fdt.c                                   |   16 +-
 drivers/of/of_private.h                            |   22 +-
 drivers/of/overlay.c                               | 1171 ++++---
 drivers/of/resolver.c                              |    1 +
 drivers/of/unittest-data/Makefile                  |   43 +-
 drivers/of/unittest-data/overlay_0.dts             |   14 +
 drivers/of/unittest-data/overlay_1.dts             |   14 +
 drivers/of/unittest-data/overlay_10.dts            |   34 +
 drivers/of/unittest-data/overlay_11.dts            |   34 +
 drivers/of/unittest-data/overlay_12.dts            |   14 +
 drivers/of/unittest-data/overlay_13.dts            |   14 +
 drivers/of/unittest-data/overlay_15.dts            |   35 +
 drivers/of/unittest-data/overlay_2.dts             |   14 +
 drivers/of/unittest-data/overlay_3.dts             |   14 +
 drivers/of/unittest-data/overlay_4.dts             |   23 +
 drivers/of/unittest-data/overlay_5.dts             |   14 +
 drivers/of/unittest-data/overlay_6.dts             |   15 +
 drivers/of/unittest-data/overlay_7.dts             |   15 +
 drivers/of/unittest-data/overlay_8.dts             |   15 +
 drivers/of/unittest-data/overlay_9.dts             |   15 +
 drivers/of/unittest-data/tests-overlay.dtsi        |  213 --
 drivers/of/unittest.c                              |  369 +--
 drivers/pci/host/pci-rcar-gen2.c                   |    1 -
 drivers/pci/host/pcie-rcar.c                       |    2 +-
 drivers/phy/renesas/phy-rcar-gen3-usb2.c           |    4 +
 drivers/pinctrl/sh-pfc/Kconfig                     |   10 +
 drivers/pinctrl/sh-pfc/Makefile                    |    2 +
 drivers/pinctrl/sh-pfc/core.c                      |   12 +
 drivers/pinctrl/sh-pfc/pfc-r8a7790.c               |    8 +-
 drivers/pinctrl/sh-pfc/pfc-r8a7795-es1.c           |   82 +-
 drivers/pinctrl/sh-pfc/pfc-r8a7795.c               |  410 ++-
 drivers/pinctrl/sh-pfc/pfc-r8a7796.c               |  375 ++-
 drivers/pinctrl/sh-pfc/pfc-r8a77965.c              | 3243 ++++++++++++++++++++
 drivers/pinctrl/sh-pfc/pfc-r8a77970.c              |   98 +
 drivers/pinctrl/sh-pfc/pfc-r8a77980.c              | 2799 +++++++++++++++++
 drivers/pinctrl/sh-pfc/pfc-r8a77995.c              |  221 +-
 drivers/pinctrl/sh-pfc/pinctrl.c                   |    2 +-
 drivers/pinctrl/sh-pfc/sh_pfc.h                    |   15 +-
 drivers/pwm/pwm-rcar.c                             |   50 +-
 drivers/regulator/gpio-regulator.c                 |    1 +
 drivers/soc/renesas/Kconfig                        |   14 +-
 drivers/soc/renesas/Makefile                       |    2 +
 drivers/soc/renesas/r8a77965-sysc.c                |   37 +
 drivers/soc/renesas/r8a77970-sysc.c                |   12 +-
 drivers/soc/renesas/r8a77980-sysc.c                |   52 +
 drivers/soc/renesas/rcar-rst.c                     |   37 +-
 drivers/soc/renesas/rcar-sysc.c                    |    8 +-
 drivers/soc/renesas/rcar-sysc.h                    |    2 +
 drivers/soc/renesas/renesas-soc.c                  |   16 +
 drivers/spi/spi-rspi.c                             |    4 +-
 drivers/spi/spi-sh-msiof.c                         |    5 +-
 drivers/tty/serial/sh-sci.c                        |   57 +-
 drivers/usb/chipidea/host.c                        |    6 +-
 drivers/usb/core/hcd.c                             |    4 +-
 drivers/usb/host/Makefile                          |    2 +-
 drivers/usb/host/ehci-fsl.c                        |    2 +
 drivers/usb/host/ehci-platform.c                   |    4 +-
 drivers/usb/host/ehci-tegra.c                      |    1 +
 drivers/usb/host/ohci-omap.c                       |    1 +
 drivers/usb/host/ohci-platform.c                   |    4 +-
 drivers/usb/host/xhci-ext-caps.c                   |   90 +
 drivers/usb/host/xhci-ext-caps.h                   |    2 +
 drivers/usb/host/xhci-hub.c                        |    2 +-
 drivers/usb/host/xhci-pci.c                        |    5 +
 drivers/usb/host/xhci-plat.c                       |   32 +-
 drivers/usb/host/xhci-ring.c                       |   27 +-
 drivers/usb/host/xhci.c                            |  126 +-
 drivers/usb/host/xhci.h                            |    7 +-
 drivers/watchdog/renesas_wdt.c                     |   93 +-
 include/drm/bridge/dw_hdmi.h                       |   26 +-
 include/dt-bindings/clock/r8a77965-cpg-mssr.h      |   62 +
 include/dt-bindings/clock/r8a77980-cpg-mssr.h      |   51 +
 include/dt-bindings/input/gpio-keys.h              |   13 +
 include/dt-bindings/power/r8a77965-sysc.h          |   30 +
 include/dt-bindings/power/r8a77980-sysc.h          |   43 +
 include/linux/gpio_keys.h                          |    2 +
 include/linux/mfd/tmio.h                           |    1 -
 include/linux/of.h                                 |   19 +-
 include/linux/of_fdt.h                             |   13 +-
 include/linux/usb/hcd.h                            |    6 +
 include/media/drv-intf/renesas-ceu.h               |   26 +
 include/media/v4l2-common.h                        |   26 +
 sound/soc/sh/rcar/core.c                           |   18 +-
 sound/soc/sh/rcar/rsnd.h                           |   20 +
 sound/soc/sh/rcar/src.c                            |   22 +-
 sound/soc/sh/rcar/ssi.c                            |   16 +-
 247 files changed, 25330 insertions(+), 10101 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/renesas,lvds.txt
 create mode 100644 Documentation/devicetree/bindings/media/renesas,ceu.txt
 create mode 100644 arch/arm/boot/dts/r8a7790-stout.dts
 create mode 100644 arch/arm64/boot/dts/renesas/r8a77965-salvator-x.dts
 create mode 100644 arch/arm64/boot/dts/renesas/r8a77965-salvator-xs.dts
 create mode 100644 arch/arm64/boot/dts/renesas/r8a77965.dtsi
 create mode 100644 arch/arm64/boot/dts/renesas/r8a77980-condor.dts
 create mode 100644 arch/arm64/boot/dts/renesas/r8a77980.dtsi
 create mode 100644 drivers/clk/renesas/r8a77965-cpg-mssr.c
 create mode 100644 drivers/clk/renesas/r8a77980-cpg-mssr.c
 delete mode 100644 drivers/gpu/drm/rcar-du/rcar_du_lvdscon.c
 delete mode 100644 drivers/gpu/drm/rcar-du/rcar_du_lvdscon.h
 delete mode 100644 drivers/gpu/drm/rcar-du/rcar_du_lvdsenc.c
 delete mode 100644 drivers/gpu/drm/rcar-du/rcar_du_lvdsenc.h
 create mode 100644 drivers/gpu/drm/rcar-du/rcar_du_of.c
 create mode 100644 drivers/gpu/drm/rcar-du/rcar_du_of.h
 create mode 100644 drivers/gpu/drm/rcar-du/rcar_du_of_lvds_r8a7790.dts
 create mode 100644 drivers/gpu/drm/rcar-du/rcar_du_of_lvds_r8a7791.dts
 create mode 100644 drivers/gpu/drm/rcar-du/rcar_du_of_lvds_r8a7793.dts
 create mode 100644 drivers/gpu/drm/rcar-du/rcar_du_of_lvds_r8a7795.dts
 create mode 100644 drivers/gpu/drm/rcar-du/rcar_du_of_lvds_r8a7796.dts
 create mode 100644 drivers/gpu/drm/rcar-du/rcar_lvds.c
 delete mode 100644 drivers/gpu/drm/tilcdc/tilcdc_slave_compat.c
 delete mode 100644 drivers/gpu/drm/tilcdc/tilcdc_slave_compat.dts
 delete mode 100644 drivers/gpu/drm/tilcdc/tilcdc_slave_compat.h
 create mode 100644 drivers/media/platform/renesas-ceu.c
 create mode 100644 drivers/of/unittest-data/overlay_0.dts
 create mode 100644 drivers/of/unittest-data/overlay_1.dts
 create mode 100644 drivers/of/unittest-data/overlay_10.dts
 create mode 100644 drivers/of/unittest-data/overlay_11.dts
 create mode 100644 drivers/of/unittest-data/overlay_12.dts
 create mode 100644 drivers/of/unittest-data/overlay_13.dts
 create mode 100644 drivers/of/unittest-data/overlay_15.dts
 create mode 100644 drivers/of/unittest-data/overlay_2.dts
 create mode 100644 drivers/of/unittest-data/overlay_3.dts
 create mode 100644 drivers/of/unittest-data/overlay_4.dts
 create mode 100644 drivers/of/unittest-data/overlay_5.dts
 create mode 100644 drivers/of/unittest-data/overlay_6.dts
 create mode 100644 drivers/of/unittest-data/overlay_7.dts
 create mode 100644 drivers/of/unittest-data/overlay_8.dts
 create mode 100644 drivers/of/unittest-data/overlay_9.dts
 create mode 100644 drivers/pinctrl/sh-pfc/pfc-r8a77965.c
 create mode 100644 drivers/pinctrl/sh-pfc/pfc-r8a77980.c
 create mode 100644 drivers/soc/renesas/r8a77965-sysc.c
 create mode 100644 drivers/soc/renesas/r8a77980-sysc.c
 create mode 100644 drivers/usb/host/xhci-ext-caps.c
 create mode 100644 include/dt-bindings/clock/r8a77965-cpg-mssr.h
 create mode 100644 include/dt-bindings/clock/r8a77980-cpg-mssr.h
 create mode 100644 include/dt-bindings/input/gpio-keys.h
 create mode 100644 include/dt-bindings/power/r8a77965-sysc.h
 create mode 100644 include/dt-bindings/power/r8a77980-sysc.h
 create mode 100644 include/media/drv-intf/renesas-ceu.h
