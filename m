Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from bin-mail-out-06.binero.net ([195.74.38.229]:35721 "EHLO
        bin-mail-out-06.binero.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1752963AbeDQVBM (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 17 Apr 2018 17:01:12 -0400
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
To: Rob Herring <robh+dt@kernel.org>,
        Eduardo Valentin <edubezval@gmail.com>,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 0/2] thermal: rcar_gen3_thermal: add r8a77965 support
Date: Tue, 17 Apr 2018 23:00:43 +0200
Message-Id: <20180417210045.15798-1-niklas.soderlund@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

Hi,

This series adds DT documentation and driver support to the 
rcar-gen3-thermal driver for r8a77965.

Niklas Söderlund (2):
  dt-bindings: thermal: rcar-gen3-thermal: add r8a77965
  thermal: rcar_gen3_thermal: add r8a77965 support

 .../devicetree/bindings/thermal/rcar-gen3-thermal.txt          | 3 ++-
 drivers/thermal/rcar_gen3_thermal.c                            | 1 +
 2 files changed, 3 insertions(+), 1 deletion(-)

-- 
2.17.0
