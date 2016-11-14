Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:33127 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752596AbcKNJDv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 14 Nov 2016 04:03:51 -0500
Date: Mon, 14 Nov 2016 10:03:44 +0100
From: Simon Horman <horms+renesas@verge.net.au>
To: ltsi-dev@lists.linuxfoundation.org
Cc: Hisao Munakata <hisao.munakata.vt@renesas.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [GIT/RFC PULL LTSI-4.9] Renesas SoCs and Drivers to next-20161028
Message-ID: <20161114090343.GA17137@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi,

** This series is for informational purposes only! **

This series is comprised of backports to v4.9-rc3 of the following
components to their standard as of next-20161028:

* gen3          (ARM64 SoC Integration)
* mach-shmobile (ARM32 SoC Integration)
* rcar-du       (driver)
* rcar-snd      (driver)
* vsp1          (driver)


It is intended as a dry-run for backporting components used
by Renesas SoCs from v4.10 and beyond to v4.9, an activity that
I anticipate carrying out in the event that the next LTSI release
is to be based on v4.9.

In posting this work I am not implying anything about
decisions on the base of the LTSI release will be.


I have tested for build regressions on a wide range of defconfigs
on a wide range of architectures.


There are 70 patches.

The following changes since commit a909d3e636995ba7c349e2ca5dbb528154d4ac30:

  Linux 4.9-rc3 (2016-10-29 13:52:02 -0700)

are available in the git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas-backport.git tags/backport/v4.9-rc3/snapshot-to-next-20161028-flattened

for you to fetch changes up to 881007870eeb7b93fef7408a0e5e6504848c0a5a:

  [media] v4l: vsp1: Add support for capture and output in HSV formats (2016-11-14 09:52:13 +0100)

----------------------------------------------------------------
LTSI-v4.9 Early Preparation for Renesas SoCs

Base:
* v4.9-rc3

Backports of the following components to their standard as of next-20161028:
* gen3          (ARM64 SoC Integration)
* mach-shmobile (ARM32 SoC Integration)
* rcar-du       (driver)
* rcar-snd      (driver)
* vsp1          (driver)

----------------------------------------------------------------
Chris Brandt (5):
      ARM: dts: r7s72100: add mmcif clock to device tree
      ARM: dts: r7s72100: add mmcif to device tree
      ARM: dts: r7s72100: add sdhi clock to device tree
      ARM: dts: r7s72100: add sdhi to device tree
      ARM: dts: rskrza1: add sdhi1 DT support

Chris Wilson (1):
      drm: Add reference counting to drm_atomic_state

Geert Uytterhoeven (14):
      arm64: dts: r8a7796: salvator-x: Populate EXTALR
      ARM: dts: r8a7790: Correct SCIFB reg properties to cover all registers
      ARM: dts: r8a7791: Correct SCIFB reg properties to cover all registers
      ARM: dts: r8a7793: Correct SCIFB reg properties to cover all registers
      ARM: dts: r8a7794: Correct SCIFB reg properties to cover all registers
      ARM: dts: r8a7794: Fix W=1 dtc warnings
      ARM: shmobile: Sort Kconfig selections
      ARM: shmobile: r8a7794/alt: Add board part number to DT bindings
      ARM: shmobile: r8a7793/gose: Add board part number to DT bindings
      ARM: dts: emev2: Remove skeleton.dtsi inclusion
      ARM: dts: r8a7778: Remove skeleton.dtsi inclusion
      ARM: dts: r8a7779: Remove skeleton.dtsi inclusion
      ARM: dts: r8a7740: Remove skeleton.dtsi inclusion
      ARM: dts: sh73a0: Remove skeleton.dtsi inclusion

Hans Verkuil (1):
      ARM: dts: koelsch: add HDMI input

Iyappan Subramanian (1):
      arm64: xgene: defconfig: Enable Standby GPIO

Kuninori Morimoto (18):
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
      ASoC: rsnd: depends on OF
      ASoC: rsnd: enable COMPILE_TEST
      ASoC: rsnd: remove "Gen2 only" comment
      ASoC: rsnd: rsnd_reg cleanup for SSIU
      ASoC: rsnd: fixup SCU_SYS_STATUSx access
      ASoC: rsnd: clear SSI_SYS_STATUSx every time
      ASoC: rsnd: enable SRC sync even FIN = FOUT

Laurent Pinchart (6):
      arm64: dts: r8a7795: salvator-x: Add DU LVDS output endpoint
      arm64: dts: r8a7795: Remove FCP SoC-specific compatible strings
      ARM: shmobile: Consolidate R8A7743 and R8A779[234] machine definitions
      ARM: dts: r8a7779: Fix DU reg property
      ARM: dts: r8a7779: marzen: Configure pinmuxing for the DU0 input clock
      [media] v4l: vsp1: Add support for capture and output in HSV formats

Magnus Damm (1):
      arm64: defconfig: Enable DRM DU and V4L2 FCP + VSP modules

Niklas Söderlund (1):
      ARM: shmobile: defconfig: Enable CONFIG_CGROUPS

Ricardo Ribalda Delgado (2):
      [media] videodev2.h Add HSV formats
      [media] videodev2.h Add HSV encoding

Sergei Shtylyov (5):
      ARM: dts: wheat: add DU support
      ARM: dts: r8a7792: add MSIOF clocks
      ARM: dts: r8a7792: add MSIOF support
      ARM: shmobile: r8a7743: basic SoC support
      ARM: shmobile: document SK-RZG1M board

Simon Horman (9):
      arm64: dts: r8a7796: add SDHI nodes
      arm64: dts: r8a7796: salvator-x: enable SDHI0 & 3
      arm64: dts: r8a7796: salvator-x: enable UHS for SDHI 0 & 3
      ARM: dts: r8a7791: set maximum frequency for SDHI clocks
      ARM: dts: koelsch: arm64: dts: r8a7795: salvator-x: enable UHS for SDHI 0, 1 & 3
      ARM: dts: r8a7794: set maximum frequency for SDHI clocks
      ARM: dts: alt: enable UHS for SDHI 0 & 1
      ARM: dts: gose: use generic pinctrl properties in SDHI nodes
      ARM: shmobile: select errata 798181 for SoCs with CA15 cores

Ulrich Hecht (1):
      ARM: dts: r8a7793: Enable VIN0-VIN2

William Towle (1):
      ARM: dts: lager: Add entries for VIN HDMI input support

Wolfram Sang (3):
      arm64: dts: r8a7795: salvator-x: enable UHS for SDHI 0 & 3
      arm64: dts: r8a7795: salvator: enable on-board eMMC
      arm64: dts: r8a7796: salvator: enable on board eMMC

 Documentation/devicetree/bindings/arm/shmobile.txt |   8 +-
 arch/arm/boot/dts/emev2.dtsi                       |   3 +-
 arch/arm/boot/dts/r7s72100-rskrza1.dts             |   5 +
 arch/arm/boot/dts/r7s72100.dtsi                    |  55 ++++++++
 arch/arm/boot/dts/r8a7740.dtsi                     |   4 +-
 arch/arm/boot/dts/r8a7778.dtsi                     |   4 +-
 arch/arm/boot/dts/r8a7779-marzen.dts               |   2 +-
 arch/arm/boot/dts/r8a7779.dtsi                     |   6 +-
 arch/arm/boot/dts/r8a7790-lager.dts                |  66 ++++++++-
 arch/arm/boot/dts/r8a7790.dtsi                     |   6 +-
 arch/arm/boot/dts/r8a7791-koelsch.dts              | 101 +++++++++++++-
 arch/arm/boot/dts/r8a7791.dtsi                     |   9 +-
 arch/arm/boot/dts/r8a7792-wheat.dts                | 126 +++++++++++++++++
 arch/arm/boot/dts/r8a7792.dtsi                     |  51 ++++++-
 arch/arm/boot/dts/r8a7793-gose.dts                 |  12 +-
 arch/arm/boot/dts/r8a7793.dtsi                     |  33 ++++-
 arch/arm/boot/dts/r8a7794-alt.dts                  |  22 ++-
 arch/arm/boot/dts/r8a7794.dtsi                     |  67 ++++-----
 arch/arm/boot/dts/sh73a0.dtsi                      |   4 +-
 arch/arm/configs/shmobile_defconfig                |   1 +
 arch/arm/mach-shmobile/Kconfig                     |  16 ++-
 arch/arm/mach-shmobile/Makefile                    |   3 -
 arch/arm/mach-shmobile/setup-r8a7792.c             |  35 -----
 arch/arm/mach-shmobile/setup-r8a7793.c             |  33 -----
 arch/arm/mach-shmobile/setup-r8a7794.c             |  33 -----
 arch/arm/mach-shmobile/setup-rcar-gen2.c           |  33 +++++
 arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts |  69 +++++++++-
 arch/arm64/boot/dts/renesas/r8a7795.dtsi           |  24 ++--
 arch/arm64/boot/dts/renesas/r8a7796-salvator-x.dts | 149 ++++++++++++++++++++
 arch/arm64/boot/dts/renesas/r8a7796.dtsi           |  40 ++++++
 arch/arm64/configs/defconfig                       |  15 +++
 drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c       |   3 +-
 drivers/gpu/drm/drm_atomic.c                       |  25 ++--
 drivers/gpu/drm/drm_atomic_helper.c                |  98 ++++----------
 drivers/gpu/drm/drm_fb_helper.c                    |   9 +-
 drivers/gpu/drm/exynos/exynos_drm_drv.c            |   3 +-
 drivers/gpu/drm/i915/i915_debugfs.c                |   5 +-
 drivers/gpu/drm/i915/intel_display.c               |  31 +++--
 drivers/gpu/drm/i915/intel_sprite.c                |   4 +-
 drivers/gpu/drm/mediatek/mtk_drm_drv.c             |   3 +-
 drivers/gpu/drm/msm/msm_atomic.c                   |   3 +-
 drivers/gpu/drm/omapdrm/omap_drv.c                 |   3 +-
 drivers/gpu/drm/rcar-du/rcar_du_kms.c              |   3 +-
 drivers/gpu/drm/sti/sti_drv.c                      |   3 +-
 drivers/gpu/drm/tegra/drm.c                        |   3 +-
 drivers/gpu/drm/tilcdc/tilcdc_drv.c                |   2 -
 drivers/gpu/drm/vc4/vc4_kms.c                      |   3 +-
 drivers/media/platform/vsp1/vsp1_pipe.c            |   8 ++
 drivers/media/platform/vsp1/vsp1_rwpf.c            |   2 +
 drivers/media/platform/vsp1/vsp1_video.c           |   5 +
 drivers/media/v4l2-core/v4l2-ioctl.c               |   2 +
 include/drm/drm_atomic.h                           |  31 ++++-
 include/drm/drm_plane.h                            |   1 -
 include/dt-bindings/clock/r7s72100-clock.h         |   7 +
 include/uapi/linux/videodev2.h                     |  36 ++++-
 sound/soc/sh/Kconfig                               |   3 +-
 sound/soc/sh/rcar/core.c                           | 141 +++++++++++++------
 sound/soc/sh/rcar/dma.c                            |  31 ++---
 sound/soc/sh/rcar/dvc.c                            |   2 -
 sound/soc/sh/rcar/gen.c                            |   8 ++
 sound/soc/sh/rcar/rsnd.h                           | 150 +++++++++++++--------
 sound/soc/sh/rcar/src.c                            |  13 +-
 sound/soc/sh/rcar/ssi.c                            |  19 +--
 sound/soc/sh/rcar/ssiu.c                           |  20 +++
 64 files changed, 1252 insertions(+), 463 deletions(-)
 delete mode 100644 arch/arm/mach-shmobile/setup-r8a7792.c
 delete mode 100644 arch/arm/mach-shmobile/setup-r8a7793.c
 delete mode 100644 arch/arm/mach-shmobile/setup-r8a7794.c
