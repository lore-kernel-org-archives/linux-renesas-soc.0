Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from bin-mail-out-06.binero.net ([195.74.38.229]:17734 "EHLO
        bin-mail-out-06.binero.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1752606AbeDQU6L (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 17 Apr 2018 16:58:11 -0400
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
To: Eduardo Valentin <edubezval@gmail.com>, linux-pm@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 0/2] thermal: rcar_gen3_thermal: update constants for calculation of temperature
Date: Tue, 17 Apr 2018 22:57:45 +0200
Message-Id: <20180417205747.15492-1-niklas.soderlund@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

Hi,

This series updates the constants used to convert the register values to 
degrease. It is based on feedback from the hardware team communicated 
through BSP patches and updated datasheets. :-)

Hien Dang (1):
  thermal: rcar_gen3_thermal: Update calculation formula due to HW
    evaluation

Niklas Söderlund (1):
  thermal: rcar_gen3_thermal: update max temperature clamp

 drivers/thermal/rcar_gen3_thermal.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

-- 
2.17.0
