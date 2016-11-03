Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f44.google.com ([209.85.215.44]:35714 "EHLO
        mail-lf0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1758380AbcKCSEE (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 3 Nov 2016 14:04:04 -0400
Received: by mail-lf0-f44.google.com with SMTP id b14so45931747lfg.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 03 Nov 2016 11:04:03 -0700 (PDT)
From: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
To: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc: devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Vladimir Barinov <vladimir.barinov@cogentembedded.com>
Subject: [PATCH 0/3] arm64: renesas: enable H3ULCB board peripherals
Date: Thu,  3 Nov 2016 21:04:02 +0300
Message-Id: <1478196242-939-1-git-send-email-vladimir.barinov@cogentembedded.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello,

This adds the folowing:
- Update DT bindings documentation
- add R8A7795 SoC based H3ULCB board peripherals

Vladimir Barinov (3):
[1/3] dt: arm: shmobile: update H3ULCB board Documentation
[2/3] arm64: dts: h3ulcb: update header
[3/3] arm64: dts: h3ulcb: enable SDHI2

---
This patchset is against the 'kernel/git/horms/renesas.git' repo.

 Documentation/devicetree/bindings/arm/shmobile.txt | 2 +-
 arch/arm64/boot/dts/renesas/r8a7795-h3ulcb.dts     | 48 +++++++++++++++++++++++++
 2 files changed, 47 insertions(+), 2 deletions(-)
