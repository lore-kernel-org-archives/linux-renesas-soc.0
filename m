Return-Path: <SRS0=QfU/=TR=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D826AC04AB4
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 17 May 2019 09:27:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B1E532082E
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 17 May 2019 09:27:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728383AbfEQJ1B (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 17 May 2019 05:27:01 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:59553 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728299AbfEQJ1B (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 17 May 2019 05:27:01 -0400
X-IronPort-AV: E=Sophos;i="5.60,479,1549897200"; 
   d="scan'208";a="16234967"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 17 May 2019 18:26:58 +0900
Received: from fabrizio-dev.ree.adwin.renesas.com (unknown [10.226.36.196])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id A9B6D40065B7;
        Fri, 17 May 2019 18:26:54 +0900 (JST)
From:   Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Simon Horman <horms@verge.net.au>
Cc:     Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Thierry Reding <treding@nvidia.com>,
        =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Jagan Teki <jagan@amarulasolutions.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>, xu_shunji@hoperun.com
Subject: [PATCH v3 0/2] Document HopeRun RZ/G2M boards
Date:   Fri, 17 May 2019 10:26:27 +0100
Message-Id: <1558085189-22061-1-git-send-email-fabrizio.castro@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Dear All,

this series aims at documenting the HiHope RZ/G2M platform from
HopeRun, and its corresponding expansion board.

V2->V3:
* Moved to vendor-prefixes.yaml
v1->v2:
* Applied Rob's comments

Thanks,
Fab

Fabrizio Castro (2):
  dt-bindings: Add vendor prefix for HopeRun
  dt-bindings: arm: renesas: Add HopeRun RZ/G2[M] boards

 Documentation/devicetree/bindings/arm/renesas.yaml     | 8 ++++++++
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 2 files changed, 10 insertions(+)

-- 
2.7.4

