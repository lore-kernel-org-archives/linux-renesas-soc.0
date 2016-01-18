Return-Path: <SRS0+ku8b=NS=gmail.com=magnus.damm@vergenet.net>
From: Magnus Damm <magnus.damm@gmail.com>
To: linux-renesas-soc@vger.kernel.org
Cc: horms+renesas@verge.net.au,Magnus Damm <magnus.damm@gmail.com>,laurent.pinchart+renesas@ideasonboard.com,geert+renesas@glider.be
Date: Mon, 18 Jan 2016 14:48:17 +0900
Message-Id: <20160118054817.22156.6531.sendpatchset@little-apple>
Subject: [PATCH/RFC 00/02] ARM: shmobile: r8a7795 Salvator-X IPMMU 4 GiB RAM test code
List-ID: <linux-renesas-soc.vger.kernel.org>

ARM: shmobile: r8a7795 Salvator-X IPMMU 4 GiB RAM test code

[PATCH/RFC 01/02] iommu/ipmmu-vmsa: Use 64-bit masks
[PATCH/RFC 02/02] arm64: dts: Salvator-X: Enable 4 GiB of RAM

This code simply enables 4 GiB of RAM on Salvator-X after
adjusting the IPMMU driver to tell the Linux driver model
that the device it is managing is able to do 64-bit bus
mastering.

Not for upstream merge. Patch 1/2 will be rolled into a larger
series for the IPMMU driver in the future. Patch 2/2 depends
on firmware updates, so the integration needs to be correctly
ordered to keep things smooth.

Not-Yet-Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
---

 Developed on top of renesas-drivers-2016-01-13-v4.4.

 arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts |   15 +++++++++++++++
 drivers/iommu/ipmmu-vmsa.c                         |    2 ++
 2 files changed, 17 insertions(+)
