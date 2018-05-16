Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from bin-mail-out-05.binero.net ([195.74.38.228]:43331 "EHLO
        bin-mail-out-05.binero.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1751309AbeEPCCC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 15 May 2018 22:02:02 -0400
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
To: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 0/7] arm64: dts: renesas: enable VIN, CSI-2 and ADV7482
Date: Wed, 16 May 2018 03:58:47 +0200
Message-Id: <20180516015854.19432-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Simon,

This series enable capture for H3, M3-W, M3-N Salvator-X and Salvator-XS 
boards. It also adds the VIN and CSI-2 nodes for V3M, but as the ADV7482 
is on the V3M expansion boards I have chosen not include that enablement 
in this series.

Patch 1-5/6 adds the VIN and CSI-2 for each SoC, patch 5/6 adds the 
ADV7482 to the common salvator-common.dtsi which is shared between all 
Salvator-{X,XS} boards. And finally patch 6/6 set the status of the VINs 
to okay.

The CSI-2 bindings are acked and in Sakaris branch for-4.18-6 [1]. All 
VIN bindings except r8a77965 is already in the media tree [2]. The 
r8a77965 compability string [3] have not yet been picked up but as it 
just building on the already accepted pattern I see little risk. If this 
troubles please disregard patch 4/6.

1. https://git.linuxtv.org/sailus/media_tree.git/
2. https://git.linuxtv.org/media_tree.git/
3. https://patchwork.linuxtv.org/patch/49476/

Kieran Bingham (1):
  arm64: dts: renesas: salvator-common: Add ADV7482 support

Niklas Söderlund (6):
  arm64: dts: renesas: r8a7795: add VIN and CSI-2 nodes
  arm64: dts: renesas: r8a7795-es1: add CSI-2 node
  arm64: dts: renesas: r8a7796: add VIN and CSI-2 nodes
  arm64: dts: renesas: r8a77965: add VIN and CSI-2 nodes
  arm64: dts: renesas: r8a77970: add VIN and CSI-2 nodes
  arm64: dts: renesas: salvator-common: enable VIN

 arch/arm64/boot/dts/renesas/r8a7795-es1.dtsi  | 143 +++++++
 arch/arm64/boot/dts/renesas/r8a7795.dtsi      | 389 ++++++++++++++++++
 arch/arm64/boot/dts/renesas/r8a7796.dtsi      | 367 +++++++++++++++++
 arch/arm64/boot/dts/renesas/r8a77965.dtsi     | 326 ++++++++++++++-
 arch/arm64/boot/dts/renesas/r8a77970.dtsi     | 152 +++++++
 .../boot/dts/renesas/salvator-common.dtsi     | 135 ++++++
 6 files changed, 1502 insertions(+), 10 deletions(-)

-- 
2.17.0
