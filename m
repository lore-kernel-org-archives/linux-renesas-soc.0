Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from smtp-4.sys.kth.se ([130.237.48.193]:40020 "EHLO
        smtp-4.sys.kth.se" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751415AbdKZAjg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 25 Nov 2017 19:39:36 -0500
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
To: linux-renesas-soc@vger.kernel.org
Cc: Kieran Bingham <kieran.bingham@ideasonboard.com>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 0/2] rcar-csi2: enable support for r8a77970
Date: Sun, 26 Nov 2017 01:39:16 +0100
Message-Id: <20171126003918.21976-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi,

This series adds Renesas r8a77970 (V3M) support to rcar-csi2. It is 
tested on V3M using the HDMI input connected to the adv748x on the V3M 
extension board. It depends on the series 'rcar-csi2: add Renesas R-Car 
MIPI CSI-2'.  

There are many different types of video sources and pipelines on the V3M 
and this is only tested with one of them as there are other none 
rcar-csi2 related issues in testing all of them. Therefor I do not wish 
to squash these changes into the series it depends on which adds the 
rcar-csi2 driver.

It's my firm belief that this is all that is needed to add CSI-2 support 
on V3M but it would be great if more pipelines where tested before this 
series is picked up. Therefor I post it here so other developers working 
on video capture on V3M can use this for CSI-2 support.

Niklas Söderlund (2):
  rcar-csi2: split Mbps calculation to separate function
  rcar-csi2: enable support for r8a77970

 .../bindings/media/renesas,rcar-csi2.txt           |   1 +
 drivers/media/platform/rcar-vin/rcar-csi2.c        | 126 ++++++++++++++++++---
 2 files changed, 114 insertions(+), 13 deletions(-)

-- 
2.15.0
