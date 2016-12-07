Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:35525 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752481AbcLGKbk (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 7 Dec 2016 05:31:40 -0500
From: Simon Horman <horms+renesas@verge.net.au>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, linux-i2c@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 0/2] i2c: sh_mobile: fallback enhancements
Date: Wed,  7 Dec 2016 11:31:27 +0100
Message-Id: <1481106689-22312-1-git-send-email-horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi,

this short series aims to improve the fallback compatibility strings
for the i2c-sh_mobile driver.

Simon Horman (2):
  i2c: sh_mobile: List rmobile fallback compatibility last
  i2c: sh_mobile: Add per-Generation fallback bindings

 Documentation/devicetree/bindings/i2c/i2c-sh_mobile.txt | 17 ++++++++++++++---
 drivers/i2c/busses/i2c-sh_mobile.c                      |  4 +++-
 2 files changed, 17 insertions(+), 4 deletions(-)

-- 
2.7.0.rc3.207.g0ac5344
