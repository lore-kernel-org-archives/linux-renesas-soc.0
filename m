Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor3.renesas.com ([210.160.252.173]:64852 "EHLO
        relmlie2.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1751843AbdH2KNh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 29 Aug 2017 06:13:37 -0400
From: Biju Das <biju.das@bp.renesas.com>
To: Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Chris Paterson <chris.paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Biju Das <biju.das@bp.renesas.com>
Subject: [PATCH v2 0/2] ARM: dts: iwg20d-q7: Add Chosen node and RTC support
Date: Tue, 29 Aug 2017 10:56:21 +0100
Message-Id: <1504000583-21996-1-git-send-email-biju.das@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello,

Resending this patches because of the previous merge issues. 

This series has been tested against renesas dev tag 
renesas-devel-20170828-v4.13-rc7.

Biju Das (2):
  ARM: dts: iwg20d-q7: Add chosen node
  ARM: dts: iwg20d-q7: Add RTC support

 arch/arm/boot/dts/r8a7743-iwg20d-q7.dts | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

-- 
1.9.1
