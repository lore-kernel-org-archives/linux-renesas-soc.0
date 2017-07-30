Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from smtp-4.sys.kth.se ([130.237.48.193]:34315 "EHLO
        smtp-4.sys.kth.se" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754546AbdG3U5n (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 30 Jul 2017 16:57:43 -0400
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [RFC 0/5] arm64: dts: renesas: add VIN, CSI-2 and ADV7482 nodes
Date: Sun, 30 Jul 2017 22:56:46 +0200
Message-Id: <20170730205651.6478-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi,

This is a RFC for how I imagine the final DT for the video capture nodes 
will look. Since the DT file layout changed recently I wanted to post a 
RFC before I include these in my for-renesas-drivers branch.

These are not intended for Simons tree, the DT bindings are not accepted 
upstream. checkpatch will warn about missing compat strings if not run 
ontop a tree which contains the driver patches for Gen3 VIN, CSI-2 and 
ADV7482.

Please review and give some feedback if you don't think this should be 
included in renesas-drivers :-)

Kieran Bingham (1):
  arm64: dts: renesas: salvator-x: Add ADV7482 support

Niklas Söderlund (4):
  arm64: dts: r8a7795: add VIN and CSI nodes
  arm64: dts: r8a7795-es1: add CSI21
  arm64: dts: r8a7796: add VIN and CSI nodes
  arm64: dts: renesas: salvator: enable VIN

 arch/arm64/boot/dts/renesas/r8a7795-es1.dtsi     | 142 +++++++++
 arch/arm64/boot/dts/renesas/r8a7795.dtsi         | 378 +++++++++++++++++++++++
 arch/arm64/boot/dts/renesas/r8a7796.dtsi         | 356 +++++++++++++++++++++
 arch/arm64/boot/dts/renesas/salvator-common.dtsi | 135 ++++++++
 4 files changed, 1011 insertions(+)

-- 
2.13.3
