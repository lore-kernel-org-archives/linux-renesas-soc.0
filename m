Return-Path: <SRS0=8TCN=XL=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65BA9C4CECD
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 16 Sep 2019 15:35:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4722921852
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 16 Sep 2019 15:35:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389253AbfIPPfG (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 16 Sep 2019 11:35:06 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:40012 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389249AbfIPPfG (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 16 Sep 2019 11:35:06 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 430A325AECB;
        Tue, 17 Sep 2019 01:35:02 +1000 (AEST)
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 2BE04944494; Mon, 16 Sep 2019 17:35:00 +0200 (CEST)
From:   Simon Horman <horms+renesas@verge.net.au>
To:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Yoshihiro Kaneko <ykaneko0929@gmail.com>,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 0/2] dt-bindings: bus: simple-pm-bus, renesas-bsc: convert bindings to json-schema
Date:   Mon, 16 Sep 2019 17:33:55 +0200
Message-Id: <20190916153357.3880-1-horms+renesas@verge.net.au>
X-Mailer: git-send-email 2.11.0
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Convert Simple Power-Managed Bus and Convert Renesas Bus State Controller
(BSC) bindings documentation to json-schema.

Based on v5.3.

Simon Horman (2):
  dt-bindings: bus: simple-pm-bus: convert bindings to json-schema
  dt-bindings: bus: renesas-bsc: convert bindings to json-schema

 .../devicetree/bindings/bus/renesas,bsc.txt        | 46 ---------------
 .../devicetree/bindings/bus/renesas,bsc.yaml       | 57 ++++++++++++++++++
 .../devicetree/bindings/bus/simple-pm-bus.txt      | 44 --------------
 .../devicetree/bindings/bus/simple-pm-bus.yaml     | 68 ++++++++++++++++++++++
 4 files changed, 125 insertions(+), 90 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/bus/renesas,bsc.txt
 create mode 100644 Documentation/devicetree/bindings/bus/renesas,bsc.yaml
 delete mode 100644 Documentation/devicetree/bindings/bus/simple-pm-bus.txt
 create mode 100644 Documentation/devicetree/bindings/bus/simple-pm-bus.yaml

-- 
2.11.0

