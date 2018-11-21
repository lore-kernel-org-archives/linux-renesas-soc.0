Return-Path: <linux-i2c-owner@vger.kernel.org>
From: Simon Horman <horms+renesas@verge.net.au>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, linux-i2c@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 0/2] i2c: sh_mobile: add support for r8a77990 (R-Car E3)
Date: Wed, 21 Nov 2018 13:09:26 +0100
Message-Id: <20181121120928.25179-1-horms+renesas@verge.net.au>
Sender: linux-i2c-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Add support for the IIC code for the r8a77990 (R-Car E3).

It is not considered compatible with existing fallback bindings
due to the documented absence of automatic transmission registers.

These registers are currently not used by the driver and
thus the provides the same behaviour for "renesas,iic-r8a77990" and
"renesas,rcar-gen3-iic". The point of declaring incompatibility is
to allow for automatic transmission register support to be added to
"renesas,iic-r8a77990" and "renesas,rcar-gen3-iic" in future.

This series is split into two patches, one to update documentation and
another to update the driver. I have no objections to it being squashed
into a single patch if that is the maintainer's wish.

Simon Horman (2):
  i2c: sh_mobile: document support for r8a77990 (R-Car E3)
  i2c: sh_mobile: add support for r8a77990 (R-Car E3)

 Documentation/devicetree/bindings/i2c/i2c-sh_mobile.txt | 9 ++++++++-
 drivers/i2c/busses/i2c-sh_mobile.c                      | 1 +
 2 files changed, 9 insertions(+), 1 deletion(-)

-- 
2.11.0
