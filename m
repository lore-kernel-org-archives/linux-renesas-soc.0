Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:39638 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753943AbdGJNdl (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 10 Jul 2017 09:33:41 -0400
Date: Mon, 10 Jul 2017 15:33:34 +0200
From: Simon Horman <horms@verge.net.au>
To: ltsi-dev@lists.linuxfoundation.org
Cc: Hisao Munakata <hisao.munakata.vt@renesas.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [GIT PULL LTSI-4.9] Renesas SoCs and Drivers to v4.12
Message-ID: <20170710133333.GC27613@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi,

This is a submission to LTSI-v4.9.

This series is comprised of backports to v4.9 of the following
components to their standard as of v4.12:

It is a follow up to early preparatory work the main difference being
a rebase onto v4.9.36. This is a follow-up to a similar submission
backporting Renesas SoCs and Drivers to v4.10. I plan to follow-up with
a backport to v4.12.

I have tested for build regressions on a wide range of defconfigs
on a wide range of architectures.

There are 286 patches.

This is based on a similar backports to v4.11 which is in turn based on v4.9.36.
That work was posted as "[GIT PULL LTSI-4.9] Renesas SoCs and Drivers to v4.11"
and is tagged as tags/backport/v4.9.36/snapshot-to-v4.11-flattened


The following changes since commit 338ec844533e7bb1120f88f83a3fcc1d9618eef7:

  drm: bridge: dw-hdmi: fix building without CONFIG_OF (2017-07-10 14:51:26 +0200)

are available in the git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas-backport.git tags/backport/v4.9.36/snapshot-to-v4.12-flattened

for you to fetch changes up to d2fa736133ef028cd05a34cbf7d6de8a063b5ab0:

  ARM: dts: r8a7791: Drop _clk suffix from external CAN clock node name (2017-07-10 15:08:06 +0200)

----------------------------------------------------------------
LTSI-v4.9 Preparation for Renesas SoCs (to v4.12)

Base:
* v4.9.36
* Similar backport of components for Renesas SoCs to v4.11

Backports of the following components to their standard as of v4.12:

* adv7511
* cpg
* dw-hdmi
* em-sti
* gen3
* i2c-rcar
* mach-shmobile
* phy-micrel
* phy-micrel
* phy-rcar-gen3-usb2
* ravb
* rcar-canfd
* rcar-dmac
* rcar-du
* rcar-rst
* rcar-snd
* renesas-soc-id
* sata-rcar
* sh-cmt
* sh-eth
* sh-mmcif
* sh-mobile-ceu-camera
* sh-mobile-sdhi
* sh-pfc
* sh-rtc
* sh-sci
* sh-timers
* sh-tmu
* simple-scu-card
* smsc911x
* smsc911x
* sysc
* usb3-peri
* vsp1
* wm8978
* xhci-plat
* xhci-rcar

----------------------------------------------------------------
AKASHI Takahiro (1):
      arm64: kdump: enable kdump in defconfig

Alan Stern (1):
      USB: xhci: fix lock-inversion problem

Andrew Bresticker (1):
      usb: xhci: plat: Enable async suspend/resume

Antoine Tenart (1):
      arm64: defconfig: enable the Safexcel crypto engine as a module

Arnd Bergmann (2):
      rtc: sh: mark PM functions as unused
      usb: host: xhci: remove #ifdef around PM functions

Arvind Yadav (1):
      ata: sata_rcar: Handle return value of clk_prepare_enable

Baolin Wang (1):
      usb: host: plat: Enable xHCI plat runtime PM

Chris Brandt (13):
      ARM: dts: r7s72100: update sdhi clock bindings
      ARM: dts: r7s72100: Add watchdog timer
      ARM: 8660/1: shmobile: r7s72100: Enable L2 cache
      mmc: sh_mmcif: Document r7s72100 DT bindings
      rtc: sh: add support for rza series
      dt-bindings: rtc: document the rtc-sh bindings
      ARM: dts: r7s72100: add power-domains to sdhi
      ARM: dts: r7s72100: fix ethernet clock parent
      ARM: dts: r7s72100: add rtc clock to device tree
      ARM: dts: r7s72100: add RTC_X clock inputs to device tree
      ARM: dts: r7s72100: add rtc to device tree
      ARM: dts: rskrza1: set rtc_x1 clock value
      ARM: dts: rskrza1: add rtc DT support

Dan Carpenter (1):
      drm: bridge: dw-hdmi: Add a missing break statement

David Cai (1):
      smsc911x: Adding support for Micochip LAN9250 Ethernet controller

Dien Pham (2):
      arm64: dts: r8a7796: Add I2C for DVFS device node
      arm64: dts: r8a7796: salvator-x: Add I2C for DVFS device support

Felipe Balbi (3):
      usb: host: xhci: extract xhci_slot_state_string()
      usb: host: xhci: add Slot and EP Context tracers
      usb: host: xhci: fix up Control Transfer TRB decoder

Geert Uytterhoeven (83):
      arm64: dts: r8a7795: Add Cortex-A53 CPU cores
      arm64: dts: r8a7795: Add Cortex-A53 PMU node
      arm64: dts: r8a7795: Remove unit-addresses and regs from integrated caches
      arm64: dts: r8a7796: Remove unit-address and reg from integrated cache
      arm64: dts: r8a7796: Add CA53 L2 cache-controller node
      arm64: dts: r8a7796: Add Cortex-A53 CPU cores
      arm64: dts: r8a7796: Add Cortex-A53 PMU node
      arm64: dts: h3ulcb: Drop superfluous status update for frequency override
      arm64: dts: r8a7795: salvator-x: Drop superfluous status updates for frequency overrides
      arm64: dts: m3ulcb: Drop superfluous status update for frequency override
      arm64: dts: r8a7796: salvator-x: Drop superfluous status update for frequency override
      arm64: dts: r8a7795: Add reset control properties
      arm64: dts: r8a7796: Add reset control properties
      clk: renesas: Add r8a7795 ES2.0 CPG Core Clock Definitions
      arm64: dts: r8a7795: salvator-x: Drop _clk suffix from X12 clock node name
      ARM: dts: r8a7743: Fix SCIFB0 dmas indentation
      ARM: dts: r8a7745: Fix SCIFB0 dmas indentation
      ARM: dts: r8a73a4: Remove unit-addresses and regs from integrated caches
      ARM: dts: r8a7743: Remove unit-address and reg from integrated cache
      ARM: dts: r8a7745: Remove unit-address and reg from integrated cache
      ARM: dts: r8a7790: Remove unit-addresses and regs from integrated caches
      ARM: dts: r8a7791: Remove unit-address and reg from integrated cache
      ARM: dts: r8a7792: Remove unit-address and reg from integrated cache
      ARM: dts: r8a7793: Remove unit-address and reg from integrated cache
      ARM: dts: r8a7794: Remove unit-address and reg from integrated cache
      ARM: dts: r8a73a4: Add INTC-SYS clock to device tree
      ARM: dts: r8a7790: Add INTC-SYS clock to device tree
      ARM: dts: r8a7791: Add INTC-SYS clock to device tree
      ARM: dts: r8a7792: Add INTC-SYS clock to device tree
      ARM: dts: r8a7794: Add INTC-SYS clock to device tree
      ARM: dts: r8a7793: Add INTC-SYS clock to device tree
      ARM: dts: porter: Always use status "okay" to enable devices
      ARM: dts: bockw: Drop superfluous status update for frequency override
      ARM: dts: marzen: Drop superfluous status update for frequency override
      ARM: dts: lager: Drop superfluous status update for frequency override
      ARM: dts: koelsch: Drop superfluous status updates for frequency overrides
      ARM: dts: porter: Drop superfluous status update for frequency override
      ARM: dts: gose: Drop superfluous status update for frequency override
      ARM: dts: alt: Drop superfluous status update for frequency override
      ARM: dts: silk: Drop superfluous status update for frequency override
      ARM: shmobile: Document RZ/G1H SoC DT binding
      ARM: shmobile: Document RZ/G1N SoC DT binding
      soc: renesas: Provide dummy rcar_rst_read_mode_pins() for compile-testing
      soc: renesas: Identify RZ/G1H
      soc: renesas: Identify RZ/G1N
      soc: renesas: Register SoC device early
      sh_eth: Use platform device for printing before register_netdev()
      sh_eth: Do not print an error message for probe deferral
      serial: sh-sci: Fix hang in sci_reset()
      serial: sh-sci: Fix late enablement of AUTORTS
      serial: sh-sci: Fix (AUTO)RTS in sci_init_pins()
      clk: renesas: r8a7795: Correct parent clock and sort order for Audio DMACs
      clk: renesas: r8a7795: Correct name of watchdog clock
      clk: renesas: r8a7796: Correct name of watchdog clock
      clk: renesas: r8a7795: Reformat core clock table
      clk: renesas: r8a7796: Reformat core clock table
      clk: renesas: rcar-gen3-cpg: Pass mode pins to rcar_gen3_cpg_init()
      clk: renesas: rcar-gen3: Add workaround for PLL0/2/4 errata on H3 ES1.0
      clk: renesas: cpg-mssr: Add support for fixing up clock tables
      clk: renesas: r8a7795: Add support for R-Car H3 ES2.0
      clk: renesas: rcar-gen3-cpg: Add support for RCLK on R-Car H3 ES2.0
      pinctrl: sh-pfc: r8a7795: Fix hscif2_clk_b and hscif4_ctrl
      pinctrl: sh-pfc: r8a7795: Restore sort order
      pinctrl: sh-pfc: Update info pointer after SoC-specific init
      pinctrl: sh-pfc: r8a7795: Add support for R-Car H3 ES2.0
      pinctrl: sh-pfc: r8a7795: Add SCIF support
      pinctrl: sh-pfc: r8a7795: Add SCIF_CLK support
      soc: renesas: rcar-sysc: Add support for fixing up power area tables
      soc: renesas: rcar-sysc: Add support for R-Car H3 ES2.0
      ARM: dts: r8a7743: Add reset control properties
      ARM: dts: r8a7745: Add reset control properties
      ARM: dts: r8a7794: Add DU1 clock to device tree
      ARM: dts: r8a7794: Correct clock of DU1
      ARM: dts: alt: Correct clock of DU1
      ARM: dts: silk: Correct clock of DU1
      ARM: dts: r8a7790: Correct parent of SSI[0-9] clocks
      ARM: dts: r8a7791: Correct parent of SSI[0-9] clocks
      ARM: dts: r8a7793: Correct parent of SSI[0-9] clocks
      ARM: dts: r8a7792: Correct Z clock
      ARM: dts: r8a7794: Add Z2 clock
      ARM: dts: koelsch: Correct clock frequency of X2 DU clock input
      ARM: dts: r8a7790: Drop _clk suffix from external CAN clock node name
      ARM: dts: r8a7791: Drop _clk suffix from external CAN clock node name

Geliang Tang (1):
      [media] sh_mobile_ceu_camera: use module_platform_driver

Gerd Hoffmann (1):
      arm64: set CONFIG_MMC_BCM2835=y in defconfig

Gregory CLEMENT (2):
      arm64: defconfig: enable MVNETA
      arm64: defconfig: enable I2C_PXA

Guoqing Zhang (4):
      usb: xhci: Add helper function xhci_set_power_on().
      usb: xhci: Add helper function xhci_disable_slot().
      usb: xhci: Expose xhci_start() function.
      usb: xhci: Add port test modes support for usb2.

Hans Verkuil (2):
      [media] videodev.h: add V4L2_CTRL_FLAG_MODIFY_LAYOUT
      [media] vsp1: set V4L2_CTRL_FLAG_MODIFY_LAYOUT for histogram controls

Hiroyuki Yokoyama (1):
      ASoC: rcar: enable PCM RATE untile 192000

Jacopo Mondi (2):
      drm: rcar-du: Make sure the VSP is initialized on platforms that need it
      ARM: dts: genmai: Enable rtc and rtc_x1 clock

Javier Martinez Canillas (1):
      ASoC: wm8978: Add OF device ID table

Joel Stanley (1):
      xhci: Do not halt the host until both HCD have disconnected their devices.

Johan Hovold (1):
      USB: host: xhci: use max-port define

Kazuya Mizuguchi (4):
      arm64: dts: r8a7795: Use rgmii-txid phy-mode for EthernetAVB
      arm64: dts: r8a7795: salvator-x: Fix EthernetAVB PHY timing
      arm64: dts: r8a7796: Use rgmii-txid phy-mode for EthernetAVB
      arm64: dts: r8a7796: salvator-x: Fix EthernetAVB PHY timing

Keita Kobayashi (2):
      arm64: dts: r8a7795: Add I2C for DVFS core to dtsi
      arm64: dts: r8a7795: salvator-x: Enable I2C for DVFS device

Khiem Nguyen (2):
      arm64: dts: r8a7795: Upgrade to PSCI v1.0 to support Suspend-to-RAM
      arm64: dts: r8a7796: Upgrade to PSCI v1.0 to support Suspend-to-RAM

Kieran Bingham (7):
      [media] v4l: vsp1: Fix format-info documentation
      [media] v4l: vsp1: Prevent multiple streamon race commencing pipeline early
      [media] v4l: vsp1: Remove redundant pipe->dl usage from drm
      [media] v4l: vsp1: Fix struct vsp1_drm documentation
      [media] v4l: vsp1: Register pipe with output WPF
      drm: bridge: dw-hdmi: Add support for custom PHY configuration
      drm: bridge: dw-hdmi: Remove device type from platform data

Koji Matsuoka (3):
      drm: rcar-du: Add Gen3 HDMI encoder support
      drm: rcar-du: Add DPLL support
      drm: rcar-du: Add HDMI outputs to R8A7795 device description

Krzysztof Kozlowski (2):
      arm64: defconfig: Enable video, DRM and LPASS drivers for Exynos5433 and Exynos7
      dt-bindings: net: sms911x: Add missing optional VDD regulators

Kuninori Morimoto (20):
      arm64: dts: r8a7795: Tidyup Audio-DMAC channel for DVC
      ARM: dts: r8a7790: Tidyup Audio-DMAC channel for DVC
      ARM: dts: r8a7791: Tidyup Audio-DMAC channel for DVC
      ARM: dts: r8a7793: Tidyup Audio-DMAC channel for DVC
      dmaengine: rcar-dmac: enable descriptor mode on 40bit
      rcar-dmac: fixup descriptor pointer for descriptor mode
      ASoC: rcar: ssi: don't set SSICR.CKDV = 000 with SSIWSR.CONT
      ASoC: rcar: remove rsnd_kctrl_remove()
      ASoC: rcar: fixup of_clk_add_provider() usage for multi clkout
      ASoC: rcar: call missing of_clk_del_provider() when remove
      ASoC: rsnd: tidyup src->convert_rate reset timing
      ASoC: rsnd: merge rsnd_kctrl_new_m/s/e into rsnd_kctrl_new()
      ASoC: rsnd: rsnd_mod_make_sure() is not under DEBUG
      ASoC: rsnd: enable clock-frequency for both 44.1kHz/48kHz
      ASoC: rsnd: don't use PDTA bit for 24bit on SSI
      ASoC: rsnd: don't call free_irq() on Parent SSI
      ASoC: rsnd: SSI PIO adjust to 24bit mode
      ASoC: rsnd: fixup parent_clk_name of AUDIO_CLKOUTx
      ASoC: simple-scu-card: use defined dev on probe()
      ASoC: simple-scu-card: add new simple_priv_to_card() macro

Laurent Pinchart (31):
      [media] v4l: vsp1: Fix RPF/WPF U/V order in 3-planar formats on Gen3
      [media] v4l: vsp1: Fix multi-line comment style
      [media] v4l: vsp1: Disable HSV formats on Gen3 hardware
      [media] v4l: vsp1: wpf: Implement rotation support
      [media] v4l: Add metadata buffer type and format
      [media] v4l: vsp1: Add histogram support
      [media] v4l: vsp1: Support histogram generators in pipeline configuration
      [media] v4l: vsp1: Fix HGO and HGT routing register addresses
      [media] v4l: Define a pixel format for the R-Car VSP1 1-D histogram engine
      [media] v4l: vsp1: Add HGO support
      drm: bridge: dw-hdmi: Remove unused functions
      drm: bridge: dw-hdmi: Move CSC configuration out of PHY code
      drm: bridge: dw-hdmi: Fix the PHY power down sequence
      drm: bridge: dw-hdmi: Fix the PHY power up sequence
      drm: bridge: dw-hdmi: Create PHY operations
      drm: bridge: dw-hdmi: Move the driver to a separate directory.
      dt-bindings: display: renesas: Add R-Car Gen3 HDMI TX DT bindings
      drm: bridge: dw-hdmi: Extract PHY interrupt setup to a function
      drm: rcar-du: Switch to encoder .atomic_mode_set() helper function
      drm: rcar-du: Handle event when disabling CRTCs
      drm: rcar-du: Clear handled event pointer in CRTC state
      drm: rcar-du: Use DRM core's atomic commit helper
      drm: rcar-du: Remove wait field from rcar_du_device structure
      drm: rcar-du: Document the vsps property in the DT bindings
      drm/panel: Constify device node argument to of_drm_find_panel()
      drm: rcar-du: Use the DRM panel API
      drm: Add data transmission order bus flag
      drm: rcar-du: Add support for LVDS mode selection
      drm: rcar-du: Replace manual bridge implementation with DRM bridge
      drm: rcar-du: Hardcode encoders types to DRM_MODE_ENCODER_NONE
      drm: rcar-du: Skip disabled outputs

Leonard Crestez (1):
      net: phy: micrel: Restore led_mode and clk_sel on resume

Lu Baolu (11):
      usb: xhci: clear EINT bit in status correctly
      usb: xhci: add xhci_log_ring trace events
      usb: xhci: remove xhci_dbg_ep_rings()
      usb: xhci: make several functions static
      usb: xhci: remove error messages for failed memory allocation
      usb: xhci: remove enq_updates and deq_updates from ring
      usb: xhci: remove ring debugging code
      usb: xhci: remove xhci_debug_trb()
      usb: xhci: remove xhci_dbg_ctx()
      usb: xhci: fix link trb decoding
      usb: xhci: refine xhci_decode_trb()

Magnus Damm (1):
      arm64: dts: r8a7795: Correct SATA device size to 2MiB

Marek Vasut (1):
      ASoC: rsnd: Fix possible NULL pointer dereference

Martin Blumenstingl (1):
      ARM64: defconfig: enable the leds-pwm driver and default-on trigger

Masaharu Hayakawa (1):
      mmc: tmio: always get number of taps

Mathias Nyman (4):
      xhci: Rework how we handle unresponsive or hoptlug removed hosts
      xhci: use correct flags for spin_lock_irqrestore() when setting port power
      usb: xhci: trace URB before giving it back instead of after
      xhci: Fix command ring stop regression in 4.11

Mauro Carvalho Chehab (1):
      [media] pixfmt-meta-vsp1-hgo.rst: remove spurious '-'

Neil Armstrong (7):
      drm: bridge: dw-hdmi: Enable CSC even for DVI
      drm: bridge: dw-hdmi: Switch to regmap for register access
      media: uapi: Add RGB and YUV bus formats for Synopsys HDMI TX Controller
      drm: bridge: dw-hdmi: Switch to V4L bus format and encodings
      drm: bridge: dw-hdmi: Move HPD handling to PHY operations
      drm: bridge: dw-hdmi: remove unused hdmi_bus_fmt_is_yuv420
      drm: bridge: dw-hdmi: fix input format/encoding from plat_data

Nickey Yang (2):
      drm/bridge: dw_hdmi: support i2c extended read mode
      drm: bridge: dw-hdmi: add HDMI vendor specific infoframe config

Nicolai Stange (5):
      clocksource: em_sti: Split clock prepare and enable steps
      clocksource: em_sti: Compute rate before registration
      clocksource: sh_cmt: Compute rate before registration again
      clockevents/drivers/sh_cmt: Set ->min_delta_ticks and ->max_delta_ticks
      clocksource: sh_tmu: Compute rate before registration again

Niklas Söderlund (3):
      arm64: dts: r8a7795: salvator-x: Set drive-strength for ravb pins
      [media] v4l: Define a pixel format for the R-Car VSP1 2-D histogram engine
      [media] v4l: vsp1: Add HGT support

Peter Chen (3):
      usb: host: xhci: using correct specification chapter reference for DCBAAP
      usb: host: xhci: delete sp_dma_buffers for scratchpad
      usb: host: xhci-ring: don't need to clear interrupt pending for MSI enabled hcd

Roger Quadros (1):
      usb: xhci: bInterval quirk for TI TUSB73x0

Romain Perier (2):
      drm: dw_hdmi: Don't rely on the status of the bridge for updating HPD
      drm: dw-hdmi: Implement the mode_fixup drm helper

Sergei Shtylyov (7):
      clk: renesas: r8a7795: Add IMR clocks
      clk: renesas: r8a7796: Add IMR clocks
      pinctrl: sh-pfc: r8a7791: Add missing HSCIF1 pinmux data
      pinctrl: sh-pfc: r8a7791: Add missing DVC_MUTE signal
      pinctrl: sh-pfc: r8a7791: Fix SCIF2 pinmux data
      pinctrl: sh-pfc: r8a7791: Fix IPSR comment typos
      pinctrl: sh-pfc: r8a7794: Swap ATA signals

Shailendra Verma (1):
      [media] v4l: vsp1: Clean up file handle in open() error path

Simon Horman (1):
      arm64: defconfig: Enable SH Mobile I2C controller

Takeshi Kihara (2):
      arm64: dts: r8a7796: Add Cortex-A57 CPU cores
      arm64: dts: r8a7796: Add Cortex-A57 PMU node

Thomas Petazzoni (1):
      arm64: defconfig: enable MVPP2

Ulrich Hecht (5):
      arm64: dts: r8a7796 dtsi: Add all HSCIF nodes
      arm64: dts: r8a7796: Add all SCIF nodes
      arm64: dts: r8a7796: Enable SCIF DMA
      arm64: dts: r8a7796: salvator-x: add SCIF1 (DEBUG1)
      arm64: dts: r8a7796: Enable HSCIF DMA

Vladimir Barinov (2):
      arm64: dts: h3ulcb: Update memory node to 4 GiB map
      arm64: dts: h3ulcb: Fix EthernetAVB PHY timing

Wolfram Sang (12):
      i2c: rcar: fix resume by always initializing registers before transfer
      i2c: rcar: clarify PM handling with more comments
      i2c: rcar: use correct length when unmapping DMA
      ASoC: rsnd: drop useles self-assignments
      ASoC: rsnd: check return value of init function
      mmc: tmio: ensure end of DMA and SD access are in sync
      mmc: host: tmio: use defines for CTL_STOP_INTERNAL_ACTION values
      mmc: host: tmio: fix minor typos in comments
      mmc: host: tmio: don't BUG on unsupported stop commands
      mmc: host: tmio: fill in response from auto cmd12
      mmc: tmio: always unmap DMA before waiting for interrupt
      drm: rcar-du: Don't open code of_device_get_match_data()

Yoshihiro Shimoda (10):
      phy: rcar-gen3-usb2: fix implementation for runtime PM
      usb: gadget: udc: renesas_usb3: add USB ID signal monitoring
      usb: gadget: udc: renesas_usb3: add extcon support
      usb: gadget: udc: renesas_usb3: add support for usb role swap
      usb: gadget: udc: renesas_usb3: fix pm_runtime functions calling
      usb: gadget: udc: renesas_usb3: fix deadlock by spinlock
      usb: gadget: udc: renesas_usb3: Fix PN_INT_ENA disabling timing
      usb: host: xhci-plat: enable clk in resume timing
      usb: host: xhci-plat: add resume_quirk()
      usb: host: xhci-plat: set resume_quirk() for R-Car controllers

Zach Brown (1):
      net/phy: micrel: configure intterupts after autoneg workaround

Zhengjun Xing (1):
      xhci: add slot and endpoint numbers to debug messages in handle_tx_event

kbuild test robot (1):
      ASoC: rsnd: fix semicolon.cocci warnings

 .../ABI/testing/sysfs-platform-renesas_usb3        |   15 +
 Documentation/devicetree/bindings/arm/shmobile.txt |    4 +
 .../bindings/display/bridge/renesas,dw-hdmi.txt    |   75 +
 .../devicetree/bindings/display/renesas,du.txt     |    3 +
 .../devicetree/bindings/mmc/renesas,mmcif.txt      |    8 +
 Documentation/devicetree/bindings/net/smsc911x.txt |    1 +
 Documentation/devicetree/bindings/rtc/rtc-sh.txt   |   28 +
 Documentation/media/uapi/v4l/buffer.rst            |    3 +
 Documentation/media/uapi/v4l/dev-meta.rst          |   58 +
 Documentation/media/uapi/v4l/devices.rst           |    1 +
 Documentation/media/uapi/v4l/meta-formats.rst      |   16 +
 .../media/uapi/v4l/pixfmt-meta-vsp1-hgo.rst        |  168 +
 .../media/uapi/v4l/pixfmt-meta-vsp1-hgt.rst        |  120 +
 Documentation/media/uapi/v4l/pixfmt.rst            |    1 +
 Documentation/media/uapi/v4l/vidioc-querycap.rst   |    3 +
 Documentation/media/videodev2.h.rst.exceptions     |    2 +
 MAINTAINERS                                        |    1 +
 arch/arm/boot/dts/r7s72100-genmai.dts              |    8 +
 arch/arm/boot/dts/r7s72100-rskrza1.dts             |    8 +
 arch/arm/boot/dts/r7s72100.dtsi                    |   65 +-
 arch/arm/boot/dts/r8a73a4.dtsi                     |   19 +-
 arch/arm/boot/dts/r8a7743.dtsi                     |   29 +-
 arch/arm/boot/dts/r8a7745.dtsi                     |   29 +-
 arch/arm/boot/dts/r8a7778-bockw.dts                |    1 -
 arch/arm/boot/dts/r8a7779-marzen.dts               |    1 -
 arch/arm/boot/dts/r8a7790-lager.dts                |    1 -
 arch/arm/boot/dts/r8a7790.dtsi                     |   28 +-
 arch/arm/boot/dts/r8a7791-koelsch.dts              |    4 +-
 arch/arm/boot/dts/r8a7791-porter.dts               |    5 +-
 arch/arm/boot/dts/r8a7791.dtsi                     |   25 +-
 arch/arm/boot/dts/r8a7792.dtsi                     |   25 +-
 arch/arm/boot/dts/r8a7793-gose.dts                 |    1 -
 arch/arm/boot/dts/r8a7793.dtsi                     |   25 +-
 arch/arm/boot/dts/r8a7794-alt.dts                  |    3 +-
 arch/arm/boot/dts/r8a7794-silk.dts                 |    3 +-
 arch/arm/boot/dts/r8a7794.dtsi                     |   30 +-
 arch/arm/mach-shmobile/setup-r7s72100.c            |    2 +
 arch/arm64/boot/dts/renesas/r8a7795-h3ulcb.dts     |   29 +-
 arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts |   39 +-
 arch/arm64/boot/dts/renesas/r8a7795.dtsi           |  181 +-
 arch/arm64/boot/dts/renesas/r8a7796-m3ulcb.dts     |    1 -
 arch/arm64/boot/dts/renesas/r8a7796-salvator-x.dts |   32 +-
 arch/arm64/boot/dts/renesas/r8a7796.dtsi           |  311 +-
 arch/arm64/configs/defconfig                       |   20 +
 drivers/ata/sata_rcar.c                            |   15 +-
 drivers/clk/renesas/r8a7795-cpg-mssr.c             |  221 +-
 drivers/clk/renesas/r8a7796-cpg-mssr.c             |   18 +-
 drivers/clk/renesas/rcar-gen3-cpg.c                |   64 +-
 drivers/clk/renesas/rcar-gen3-cpg.h                |    2 +-
 drivers/clk/renesas/renesas-cpg-mssr.c             |   50 +
 drivers/clk/renesas/renesas-cpg-mssr.h             |   22 +
 drivers/clocksource/em_sti.c                       |   46 +-
 drivers/clocksource/sh_cmt.c                       |   47 +-
 drivers/clocksource/sh_tmu.c                       |   26 +-
 drivers/dma/sh/rcar-dmac.c                         |   55 +-
 drivers/gpu/drm/bridge/Kconfig                     |   25 +-
 drivers/gpu/drm/bridge/Makefile                    |    4 +-
 drivers/gpu/drm/bridge/synopsys/Kconfig            |   23 +
 drivers/gpu/drm/bridge/synopsys/Makefile           |    5 +
 .../drm/bridge/{ => synopsys}/dw-hdmi-ahb-audio.c  |    0
 .../gpu/drm/bridge/{ => synopsys}/dw-hdmi-audio.h  |    0
 .../drm/bridge/{ => synopsys}/dw-hdmi-i2s-audio.c  |    0
 drivers/gpu/drm/bridge/{ => synopsys}/dw-hdmi.c    | 1030 ++--
 drivers/gpu/drm/bridge/{ => synopsys}/dw-hdmi.h    |    4 +
 drivers/gpu/drm/drm_panel.c                        |    2 +-
 drivers/gpu/drm/imx/dw_hdmi-imx.c                  |    2 -
 drivers/gpu/drm/rcar-du/Kconfig                    |   10 +-
 drivers/gpu/drm/rcar-du/Makefile                   |    6 +-
 drivers/gpu/drm/rcar-du/rcar_du_crtc.c             |   94 +-
 drivers/gpu/drm/rcar-du/rcar_du_crtc.h             |    4 +-
 drivers/gpu/drm/rcar-du/rcar_du_drv.c              |   32 +-
 drivers/gpu/drm/rcar-du/rcar_du_drv.h              |    8 +-
 drivers/gpu/drm/rcar-du/rcar_du_encoder.c          |  187 +-
 drivers/gpu/drm/rcar-du/rcar_du_encoder.h          |   14 +-
 drivers/gpu/drm/rcar-du/rcar_du_hdmienc.c          |  134 -
 drivers/gpu/drm/rcar-du/rcar_du_hdmienc.h          |   35 -
 drivers/gpu/drm/rcar-du/rcar_du_kms.c              |  143 +-
 drivers/gpu/drm/rcar-du/rcar_du_lvdscon.c          |   68 +-
 drivers/gpu/drm/rcar-du/rcar_du_lvdsenc.c          |   11 +-
 drivers/gpu/drm/rcar-du/rcar_du_lvdsenc.h          |   13 +
 drivers/gpu/drm/rcar-du/rcar_du_regs.h             |   23 +
 drivers/gpu/drm/rcar-du/rcar_du_vgacon.c           |   82 -
 drivers/gpu/drm/rcar-du/rcar_du_vgacon.h           |   23 -
 drivers/gpu/drm/rcar-du/rcar_du_vsp.h              |    2 +-
 drivers/gpu/drm/rcar-du/rcar_dw_hdmi.c             |  100 +
 drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c        |    1 -
 drivers/i2c/busses/i2c-rcar.c                      |   10 +-
 drivers/media/platform/Kconfig                     |    1 +
 .../platform/soc_camera/sh_mobile_ceu_camera.c     |   13 +-
 drivers/media/platform/vsp1/Makefile               |    1 +
 drivers/media/platform/vsp1/vsp1.h                 |    6 +
 drivers/media/platform/vsp1/vsp1_bru.c             |   27 +-
 drivers/media/platform/vsp1/vsp1_dl.c              |   27 +-
 drivers/media/platform/vsp1/vsp1_drm.c             |   42 +-
 drivers/media/platform/vsp1/vsp1_drm.h             |    2 +-
 drivers/media/platform/vsp1/vsp1_drv.c             |   82 +-
 drivers/media/platform/vsp1/vsp1_entity.c          |  163 +-
 drivers/media/platform/vsp1/vsp1_entity.h          |    8 +-
 drivers/media/platform/vsp1/vsp1_hgo.c             |  230 +
 drivers/media/platform/vsp1/vsp1_hgo.h             |   45 +
 drivers/media/platform/vsp1/vsp1_hgt.c             |  222 +
 drivers/media/platform/vsp1/vsp1_hgt.h             |   42 +
 drivers/media/platform/vsp1/vsp1_histo.c           |  646 +++
 drivers/media/platform/vsp1/vsp1_histo.h           |   84 +
 drivers/media/platform/vsp1/vsp1_hsit.c            |    3 +-
 drivers/media/platform/vsp1/vsp1_lif.c             |    6 +-
 drivers/media/platform/vsp1/vsp1_pipe.c            |   59 +-
 drivers/media/platform/vsp1/vsp1_pipe.h            |    9 +-
 drivers/media/platform/vsp1/vsp1_regs.h            |   33 +-
 drivers/media/platform/vsp1/vsp1_rpf.c             |   54 +-
 drivers/media/platform/vsp1/vsp1_rwpf.c            |   11 +-
 drivers/media/platform/vsp1/vsp1_rwpf.h            |    7 +-
 drivers/media/platform/vsp1/vsp1_sru.c             |    3 +-
 drivers/media/platform/vsp1/vsp1_uds.c             |    3 +-
 drivers/media/platform/vsp1/vsp1_video.c           |   85 +-
 drivers/media/platform/vsp1/vsp1_wpf.c             |  224 +-
 drivers/media/v4l2-core/v4l2-compat-ioctl32.c      |   19 +
 drivers/media/v4l2-core/v4l2-dev.c                 |   16 +-
 drivers/media/v4l2-core/v4l2-ioctl.c               |   36 +
 drivers/media/v4l2-core/videobuf2-v4l2.c           |    3 +
 drivers/mmc/host/tmio_mmc.h                        |   12 +-
 drivers/mmc/host/tmio_mmc_dma.c                    |   61 +-
 drivers/mmc/host/tmio_mmc_pio.c                    |   36 +-
 drivers/net/ethernet/renesas/sh_eth.c              |    3 +-
 drivers/net/ethernet/smsc/smsc911x.c               |   49 +-
 drivers/net/ethernet/smsc/smsc911x.h               |   19 +
 drivers/net/phy/micrel.c                           |   44 +-
 drivers/phy/phy-rcar-gen3-usb2.c                   |   31 +-
 drivers/pinctrl/sh-pfc/Makefile                    |    1 +
 drivers/pinctrl/sh-pfc/core.c                      |    3 +
 drivers/pinctrl/sh-pfc/pfc-r8a7791.c               |   18 +-
 drivers/pinctrl/sh-pfc/pfc-r8a7794.c               |   16 +-
 drivers/pinctrl/sh-pfc/pfc-r8a7795-es1.c           | 5705 ++++++++++++++++++++
 drivers/pinctrl/sh-pfc/pfc-r8a7795.c               | 4200 +++-----------
 drivers/pinctrl/sh-pfc/sh_pfc.h                    |    1 +
 drivers/rtc/Kconfig                                |    4 +-
 drivers/rtc/rtc-sh.c                               |   39 +-
 drivers/soc/renesas/r8a7795-sysc.c                 |   26 +-
 drivers/soc/renesas/rcar-sysc.c                    |   25 +-
 drivers/soc/renesas/rcar-sysc.h                    |   10 +
 drivers/soc/renesas/renesas-soc.c                  |   18 +-
 drivers/tty/serial/sh-sci.c                        |   33 +-
 drivers/usb/gadget/udc/Kconfig                     |    1 +
 drivers/usb/gadget/udc/renesas_usb3.c              |  166 +-
 drivers/usb/host/xhci-dbg.c                        |  308 +-
 drivers/usb/host/xhci-hub.c                        |  169 +-
 drivers/usb/host/xhci-mem.c                        |   35 +-
 drivers/usb/host/xhci-pci.c                        |    3 +
 drivers/usb/host/xhci-plat.c                       |   86 +-
 drivers/usb/host/xhci-plat.h                       |    1 +
 drivers/usb/host/xhci-rcar.c                       |   11 +
 drivers/usb/host/xhci-rcar.h                       |    6 +
 drivers/usb/host/xhci-ring.c                       |  286 +-
 drivers/usb/host/xhci-trace.h                      |  166 +
 drivers/usb/host/xhci.c                            |  234 +-
 drivers/usb/host/xhci.h                            |  331 +-
 include/drm/bridge/dw_hdmi.h                       |  101 +-
 include/drm/drm_connector.h                        |    4 +
 include/drm/drm_panel.h                            |    4 +-
 include/dt-bindings/clock/r7s72100-clock.h         |    9 +-
 include/dt-bindings/clock/r8a73a4-clock.h          |    1 +
 include/dt-bindings/clock/r8a7790-clock.h          |    1 +
 include/dt-bindings/clock/r8a7791-clock.h          |    1 +
 include/dt-bindings/clock/r8a7792-clock.h          |    2 +-
 include/dt-bindings/clock/r8a7793-clock.h          |    5 +-
 include/dt-bindings/clock/r8a7794-clock.h          |    2 +
 include/dt-bindings/clock/r8a7795-cpg-mssr.h       |    7 +
 include/dt-bindings/power/r8a7795-sysc.h           |    2 +-
 include/linux/soc/renesas/rcar-rst.h               |    5 +
 include/linux/usb/hcd.h                            |    1 +
 include/media/v4l2-ioctl.h                         |   17 +
 include/trace/events/v4l2.h                        |    1 +
 include/uapi/linux/media-bus-format.h              |   13 +-
 include/uapi/linux/videodev2.h                     |   18 +
 sound/soc/codecs/wm8978.c                          |    7 +
 sound/soc/generic/simple-scu-card.c                |   37 +-
 sound/soc/sh/rcar/adg.c                            |   79 +-
 sound/soc/sh/rcar/cmd.c                            |    1 +
 sound/soc/sh/rcar/core.c                           |  162 +-
 sound/soc/sh/rcar/dvc.c                            |   24 +-
 sound/soc/sh/rcar/gen.c                            |    1 +
 sound/soc/sh/rcar/rsnd.h                           |   57 +-
 sound/soc/sh/rcar/src.c                            |   15 +-
 sound/soc/sh/rcar/ssi.c                            |   27 +-
 sound/soc/sh/rcar/ssiu.c                           |    3 +-
 185 files changed, 13130 insertions(+), 5939 deletions(-)
 create mode 100644 Documentation/ABI/testing/sysfs-platform-renesas_usb3
 create mode 100644 Documentation/devicetree/bindings/display/bridge/renesas,dw-hdmi.txt
 create mode 100644 Documentation/devicetree/bindings/rtc/rtc-sh.txt
 create mode 100644 Documentation/media/uapi/v4l/dev-meta.rst
 create mode 100644 Documentation/media/uapi/v4l/meta-formats.rst
 create mode 100644 Documentation/media/uapi/v4l/pixfmt-meta-vsp1-hgo.rst
 create mode 100644 Documentation/media/uapi/v4l/pixfmt-meta-vsp1-hgt.rst
 create mode 100644 drivers/gpu/drm/bridge/synopsys/Kconfig
 create mode 100644 drivers/gpu/drm/bridge/synopsys/Makefile
 rename drivers/gpu/drm/bridge/{ => synopsys}/dw-hdmi-ahb-audio.c (100%)
 rename drivers/gpu/drm/bridge/{ => synopsys}/dw-hdmi-audio.h (100%)
 rename drivers/gpu/drm/bridge/{ => synopsys}/dw-hdmi-i2s-audio.c (100%)
 rename drivers/gpu/drm/bridge/{ => synopsys}/dw-hdmi.c (74%)
 rename drivers/gpu/drm/bridge/{ => synopsys}/dw-hdmi.h (99%)
 delete mode 100644 drivers/gpu/drm/rcar-du/rcar_du_hdmienc.c
 delete mode 100644 drivers/gpu/drm/rcar-du/rcar_du_hdmienc.h
 delete mode 100644 drivers/gpu/drm/rcar-du/rcar_du_vgacon.c
 delete mode 100644 drivers/gpu/drm/rcar-du/rcar_du_vgacon.h
 create mode 100644 drivers/gpu/drm/rcar-du/rcar_dw_hdmi.c
 create mode 100644 drivers/media/platform/vsp1/vsp1_hgo.c
 create mode 100644 drivers/media/platform/vsp1/vsp1_hgo.h
 create mode 100644 drivers/media/platform/vsp1/vsp1_hgt.c
 create mode 100644 drivers/media/platform/vsp1/vsp1_hgt.h
 create mode 100644 drivers/media/platform/vsp1/vsp1_histo.c
 create mode 100644 drivers/media/platform/vsp1/vsp1_histo.h
 create mode 100644 drivers/pinctrl/sh-pfc/pfc-r8a7795-es1.c
