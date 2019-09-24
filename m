Return-Path: <SRS0=VPgN=XT=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A3BCC432C1
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 24 Sep 2019 09:36:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 22C242146E
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 24 Sep 2019 09:36:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2393872AbfIXJgx (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 24 Sep 2019 05:36:53 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:42596 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391886AbfIXJgx (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 24 Sep 2019 05:36:53 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 2E33E25AF19;
        Tue, 24 Sep 2019 19:36:51 +1000 (AEST)
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 0F72F944431; Tue, 24 Sep 2019 11:36:49 +0200 (CEST)
From:   Simon Horman <horms+renesas@verge.net.au>
To:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Andy Gross <agross@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Yoshihiro Kaneko <ykaneko0929@gmail.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH v3 0/3] dt-bindings: bus: simple-pm-bus, renesas-bsc: convert bindings to json-schema
Date:   Tue, 24 Sep 2019 11:36:06 +0200
Message-Id: <20190924093609.22895-1-horms+renesas@verge.net.au>
X-Mailer: git-send-email 2.11.0
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Convert Simple Power-Managed Bus and Convert Renesas Bus State Controller
(BSC) bindings documentation to json-schema.

Based on v5.3.

Simon Horman (3):
  dt-bindings: bus: simple-pm-bus: convert bindings to json-schema
  dt-bindings: bus: renesas-bsc: convert bindings to json-schema
  arm64: dts: qcom: msm8996: Update simple-pm-bus node name to 'bus'

 .../devicetree/bindings/bus/renesas,bsc.txt        | 46 -------------
 .../devicetree/bindings/bus/renesas,bsc.yaml       | 60 +++++++++++++++++
 .../devicetree/bindings/bus/simple-pm-bus.txt      | 44 -------------
 .../devicetree/bindings/bus/simple-pm-bus.yaml     | 75 ++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/msm8996.dtsi              |  2 +-
 5 files changed, 136 insertions(+), 91 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/bus/renesas,bsc.txt
 create mode 100644 Documentation/devicetree/bindings/bus/renesas,bsc.yaml
 delete mode 100644 Documentation/devicetree/bindings/bus/simple-pm-bus.txt
 create mode 100644 Documentation/devicetree/bindings/bus/simple-pm-bus.yaml

-- 
2.11.0

