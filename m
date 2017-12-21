Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relay1.mentorg.com ([192.94.38.131]:48086 "EHLO
        relay1.mentorg.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751418AbdLUPTH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 21 Dec 2017 10:19:07 -0500
From: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>
To: Simon Horman <horms@verge.net.au>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
CC: Bogdan Mirea <Bogdan-Stefan_Mirea@mentor.com>,
        <linux-renesas-soc@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH v2 0/2] arm64: dts: renesas: Remove renesas,no-ether-link property
Date: Thu, 21 Dec 2017 17:18:57 +0200
Message-ID: <1513869539-18803-1-git-send-email-vladimir_zapolskiy@mentor.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

The present change is a bug fix for AVB link iteratively up/down.

Steps to reproduce:
- start AVB TX stream (Using aplay via MSE),
- disconnect+reconnect the eth cable,
- after a reconnection the eth connection goes iteratively up/down
  without user interaction,
- this may heal after some seconds or even stay for minutes.

As the documentation specifies, the "renesas,no-ether-link" option
should be used when a board does not provide a proper AVB_LINK signal.
There is no need for this option enabled on RCAR H3/M3 Salvator-X/XS
and ULCB starter kits since the AVB_LINK is correctly handled by HW.

Choosing to keep or remove the "renesas,no-ether-link" option will
have impact on the code flow in the following ways:
- keeping this option enabled may lead to unexpected behavior since
  the RX & TX are enabled/disabled directly from adjust_link function
  without any HW interrogation,
- removing this option, the RX & TX will only be enabled/disabled after
  HW interrogation. The HW check is made through the LMON pin in PSR
  register which specifies AVB_LINK signal value (0 - at low level;
  1 - at high level).

In conclusion, the change is also a safety improvement because it
removes the "renesas,no-ether-link" option leading to a proper way
of detecting the link state based on HW interrogation and not on
software heuristic.

Note that DTS files for V3M Starter Kit, Draak and Eagle boards
contain the same property, the files are untouched due to unavailable
schematics to verify if the fix applies to these boards as well.

Changes from v1 to v2:
* per a request from Simon added Fixes tags to both changes,
  the specified commits generalize Salvator-X and ULCB dtsi files
  and the fixes should be applicable without a conflict, however
  similar but virtually different fixes can be spread into Salvator-X
  and ULCB board DTS files of older kernel revisions as well.

Bogdan Mirea (2):
  arm64: dts: renesas: salvator-x: Remove renesas,no-ether-link property
  arm64: dts: renesas: ulcb: Remove renesas,no-ether-link property

 arch/arm64/boot/dts/renesas/salvator-common.dtsi | 1 -
 arch/arm64/boot/dts/renesas/ulcb.dtsi            | 1 -
 2 files changed, 2 deletions(-)

-- 
2.8.1
